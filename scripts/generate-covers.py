from __future__ import annotations

import argparse
from html import escape
import json
from pathlib import Path
import re


ROOT = Path(__file__).resolve().parents[1]
CONTENT_ROOT = ROOT / "content"
SECTIONS_PATH = ROOT / "data" / "site-sections.json"
GENERATED_TEMPLATE_ROOT = ROOT / "assets" / "generated" / "covers"

SITE_NAME = "khoahoc.xyz"
TITLE_X = 56
TITLE_FILL = "#ffffff"
TITLE_MAX_WIDTH = 900
LABEL_FONT = "Arial, Helvetica, 'DejaVu Sans', 'Liberation Sans', sans-serif"
TITLE_FONT = "Calibri, 'Times New Roman', 'DejaVu Serif', 'Liberation Serif', serif"


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def write_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8", newline="\n")


def parse_front_matter(raw: str) -> tuple[dict[str, str], str]:
    if not raw.startswith("---\n"):
        raise ValueError("Markdown file must start with front matter delimited by ---")

    parts = raw.split("---\n", 2)
    if len(parts) < 3:
        raise ValueError("Invalid front matter block")

    front_matter = parts[1]
    body = parts[2].lstrip("\n")
    metadata: dict[str, str] = {}

    for line in front_matter.splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        if ":" not in line:
            raise ValueError(f"Invalid front matter line: {line}")
        key, value = line.split(":", 1)
        metadata[key.strip()] = value.strip()

    return metadata, body


def load_sections() -> dict[str, dict[str, str]]:
    items = json.loads(read_text(SECTIONS_PATH))
    return {item["slug"]: item for item in items}


def iter_markdown_files() -> list[Path]:
    return sorted(path for path in CONTENT_ROOT.rglob("*.md") if path.name.lower() != "readme.md")


def char_width_ratio(char: str) -> float:
    if char == " ":
        return 0.33
    if char in ".,:;!'`|":
        return 0.28
    if char in "ilItfjr()[]{}":
        return 0.38
    if char in "mwMW@%&QGOD":
        return 0.9
    if ord(char) > 127:
        return 0.68
    if char.isupper():
        return 0.72
    return 0.58


def estimate_text_width(text: str, font_size: int) -> float:
    return sum(char_width_ratio(char) * font_size for char in text)


def wrap_words(title: str, font_size: int, max_width: int) -> list[str]:
    words = title.split()
    if not words:
        return []

    lines: list[str] = []
    current = words[0]

    for word in words[1:]:
        candidate = f"{current} {word}"
        if estimate_text_width(candidate, font_size) <= max_width:
            current = candidate
        else:
            lines.append(current)
            current = word

    lines.append(current)
    return lines


def choose_title_layout(title: str) -> tuple[int, list[str], int, int]:
    for font_size in [34, 32, 30, 28, 26]:
        lines = wrap_words(title, font_size, TITLE_MAX_WIDTH)
        if len(lines) <= 3:
            return font_size, lines, 150, 40

    lines = wrap_words(title, 26, TITLE_MAX_WIDTH)
    if len(lines) > 4:
        lines = [" ".join(lines[:2]).strip(), " ".join(lines[2:]).strip()]
    return 26, lines, 146, 36


def render_title_lines(title: str) -> str:
    font_size, lines, start_y, line_height = choose_title_layout(title)
    rendered_lines = []
    for index, line in enumerate(lines):
        y = start_y + (index * line_height)
        rendered_lines.append(
            f'  <text x="{TITLE_X}" y="{y}" fill="{TITLE_FILL}" '
            f'font-size="{font_size}" font-family="{TITLE_FONT}">{escape(line)}</text>'
        )
    return "\n".join(rendered_lines)


def resolve_cover_path(source_path: Path) -> Path:
    parts = source_path.relative_to(CONTENT_ROOT).parts
    category_slug = parts[0]
    if len(parts) > 2 and parts[1].startswith("01_sub_"):
        return CONTENT_ROOT / category_slug / parts[1] / "01_images" / f"{source_path.stem}.svg"
    return CONTENT_ROOT / category_slug / "01_images" / f"{source_path.stem}.svg"


def replace_text_node_content(svg: str, index: int, text: str) -> str:
    matches = list(re.finditer(r"<text\b[^>]*>.*?</text>", svg, flags=re.DOTALL))
    if len(matches) <= index:
        raise ValueError("SVG template does not have enough <text> nodes.")

    match = matches[index]
    opening = re.match(r"<text\b[^>]*>", match.group(0), flags=re.DOTALL)
    if not opening:
        raise ValueError("Invalid <text> node in SVG template.")
    replacement = f"{opening.group(0)}{escape(text)}</text>"
    return f"{svg[:match.start()]}{replacement}{svg[match.end():]}"


def replace_title_node(svg: str, title: str) -> str:
    matches = list(re.finditer(r"<text\b[^>]*>.*?</text>", svg, flags=re.DOTALL))
    if len(matches) < 3:
        raise ValueError("SVG template does not have enough <text> nodes.")
    match = matches[2]
    replacement = render_title_lines(title)
    return f"{svg[:match.start()]}{replacement}{svg[match.end():]}"


def build_cover(source_path: Path, sections: dict[str, dict[str, str]]) -> Path:
    metadata, _ = parse_front_matter(read_text(source_path))
    category_slug = source_path.relative_to(CONTENT_ROOT).parts[0]
    section = sections[category_slug]

    title = metadata["title"]
    section_title = metadata.get("section_title", section["title"])
    template_path = GENERATED_TEMPLATE_ROOT / category_slug / "_img_template.svg"
    cover_path = resolve_cover_path(source_path)

    if not template_path.exists():
        raise FileNotFoundError(f"Missing cover template for category: {category_slug}")

    svg = read_text(template_path)
    svg = replace_text_node_content(svg, 0, SITE_NAME)
    svg = replace_text_node_content(svg, 1, section_title)
    svg = replace_title_node(svg, title)
    write_text(cover_path, svg)
    return cover_path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate SVG covers from Markdown front matter.")
    parser.add_argument("sources", nargs="*", help="Markdown file(s) under content/. Leave empty to build all.")
    parser.add_argument(
        "--category",
        action="append",
        default=[],
        help="Only build covers for the given category slug. Can be used multiple times.",
    )
    return parser.parse_args()


def resolve_sources(args: argparse.Namespace) -> list[Path]:
    if args.sources:
        resolved = []
        for source in args.sources:
            path = Path(source)
            if not path.is_absolute():
                path = ROOT / path
            resolved.append(path)
        return resolved

    sources = iter_markdown_files()
    if args.category:
        allowed = set(args.category)
        sources = [path for path in sources if path.relative_to(CONTENT_ROOT).parts[0] in allowed]
    return sources


def main() -> None:
    args = parse_args()
    sections = load_sections()
    sources = resolve_sources(args)

    if not sources:
        raise SystemExit("No markdown files selected.")

    for source in sources:
        built_path = build_cover(source, sections)
        print(f"Built: {built_path.relative_to(ROOT).as_posix()}")


if __name__ == "__main__":
    main()
