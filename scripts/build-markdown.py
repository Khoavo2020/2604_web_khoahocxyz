from __future__ import annotations

from html import escape
import json
from pathlib import Path
import re
import sys


ROOT = Path(__file__).resolve().parents[1]
CONTENT_ROOT = ROOT / "content"
ARTICLE_TEMPLATE_PATH = ROOT / "_templates" / "markdown-article.html"
CATEGORY_TEMPLATE_PATH = ROOT / "_templates" / "markdown-category.html"
SECTIONS_PATH = ROOT / "data" / "site-sections.json"


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def write_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def load_sections() -> dict[str, dict[str, str]]:
    items = json.loads(read_text(SECTIONS_PATH))
    return {item["slug"]: item for item in items}


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


def render_inline(text: str) -> str:
    text = escape(text)
    text = re.sub(r"`([^`]+)`", r"<code>\1</code>", text)
    text = re.sub(r"\*\*([^*]+)\*\*", r"<strong>\1</strong>", text)
    text = re.sub(r"\*([^*]+)\*", r"<em>\1</em>", text)
    text = re.sub(r"\[([^\]]+)\]\(([^)]+)\)", r'<a href="\2">\1</a>', text)
    return text


def render_markdown(markdown: str) -> str:
    lines = markdown.splitlines()
    html_parts: list[str] = []
    paragraph_lines: list[str] = []
    list_items: list[str] = []
    quote_lines: list[str] = []

    def flush_paragraph() -> None:
        if paragraph_lines:
            text = " ".join(line.strip() for line in paragraph_lines)
            html_parts.append(f"<p>{render_inline(text)}</p>")
            paragraph_lines.clear()

    def flush_list() -> None:
        if list_items:
            items = "".join(f"<li>{render_inline(item)}</li>" for item in list_items)
            html_parts.append(f"<ul>{items}</ul>")
            list_items.clear()

    def flush_quote() -> None:
        if quote_lines:
            text = " ".join(line.strip() for line in quote_lines)
            html_parts.append(f"<blockquote><p>{render_inline(text)}</p></blockquote>")
            quote_lines.clear()

    for raw_line in lines:
        line = raw_line.rstrip()
        stripped = line.strip()

        if not stripped:
            flush_paragraph()
            flush_list()
            flush_quote()
            continue

        if stripped.startswith("# "):
            flush_paragraph()
            flush_list()
            flush_quote()
            html_parts.append(f"<h2>{render_inline(stripped[2:])}</h2>")
            continue

        if stripped.startswith("## "):
            flush_paragraph()
            flush_list()
            flush_quote()
            html_parts.append(f"<h3>{render_inline(stripped[3:])}</h3>")
            continue

        if stripped.startswith("### "):
            flush_paragraph()
            flush_list()
            flush_quote()
            html_parts.append(f"<h4>{render_inline(stripped[4:])}</h4>")
            continue

        if stripped.startswith("- "):
            flush_paragraph()
            flush_quote()
            list_items.append(stripped[2:].strip())
            continue

        if stripped.startswith("> "):
            flush_paragraph()
            flush_list()
            quote_lines.append(stripped[2:].strip())
            continue

        if stripped == "---":
            flush_paragraph()
            flush_list()
            flush_quote()
            html_parts.append("<hr />")
            continue

        paragraph_lines.append(stripped)

    flush_paragraph()
    flush_list()
    flush_quote()
    return "\n".join(html_parts)


def root_prefix(output_path: Path) -> str:
    relative_path = output_path.relative_to(ROOT)
    return "../" * len(relative_path.parent.parts)


def resolve_asset(path_value: str, prefix: str) -> str:
    if not path_value:
        return ""
    if path_value.startswith(("http://", "https://", "/", "../", "./")):
        return path_value
    return f"{prefix}{path_value}"


def resolve_link(path_value: str, prefix: str) -> str:
    return resolve_asset(path_value, prefix)


def build_article(source_path: Path, sections: dict[str, dict[str, str]]) -> dict[str, str]:
    metadata, markdown_body = parse_front_matter(read_text(source_path))
    category_slug = source_path.relative_to(CONTENT_ROOT).parts[0]
    section = sections[category_slug]

    title = metadata["title"]
    description = metadata.get("description", "")
    section_title = metadata.get("section_title", section["title"])
    section_link = metadata.get("section_link", f"{category_slug}/index.html")
    header_subline = metadata.get("header_subline", section["tagline"])
    back_link_label = metadata.get("back_link_label", f"Quay ve {section_title}")
    hero_image = metadata.get("hero_image", "")

    output_rel = metadata.get("output_path")
    if output_rel:
        output_path = ROOT / output_rel
    else:
        output_path = ROOT / source_path.relative_to(CONTENT_ROOT).with_suffix("") / "index.html"

    article_body = render_markdown(markdown_body)
    prefix = root_prefix(output_path)
    hero_src = resolve_asset(hero_image, prefix)
    hero_block = (
        f'<span class="image main"><img src="{hero_src}" alt="" style="width: 50%;" /></span>'
        if hero_src
        else ""
    )
    section_href = resolve_link(section_link, prefix)
    article_header_block = (
        '<header id="header">'
        f'<div class="logo"><a href="{prefix}index.html"><strong>&#x1F3E0;</strong></a> » '
        f'<a href="{section_href}"><strong>{escape(section_title)}</strong></a></div>'
        '<ul class="icons">'
        '<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>'
        '<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>'
        '<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>'
        '</ul>'
        '</header>'
    )

    template = read_text(ARTICLE_TEMPLATE_PATH)
    values = {
        "PAGE_TITLE": title,
        "PAGE_DESCRIPTION": description,
        "SECTION_TITLE": section_title,
        "SECTION_LINK": section_href,
        "HEADER_SUBLINE": header_subline,
        "BACK_LINK_LABEL": back_link_label,
        "HERO_BLOCK": hero_block,
        "ARTICLE_BODY": article_body,
        "ROOT_PREFIX": prefix,
        "ARTICLE_HEADER_BLOCK": article_header_block,
    }

    html = template
    for key, value in values.items():
        html = html.replace(f"{{{{{key}}}}}", value)

    write_text(output_path, html)
    return {
        "title": title,
        "description": description,
        "category_slug": category_slug,
        "output_path": str(output_path.relative_to(ROOT)).replace("\\", "/"),
        "hero_image": hero_image,
    }


def render_post_card(article: dict[str, str], category_index_path: Path) -> str:
    output_path = ROOT / article["output_path"]
    href = output_path.relative_to(category_index_path.parent).as_posix()
    prefix = root_prefix(category_index_path)
    image_src = resolve_asset(article["hero_image"], prefix)
    return (
        "<article>"
        f'<h3><a href="{href}">{escape(article["title"])}</a></h3>'
        f'<a href="{href}" class="image"><img src="{image_src}" alt="" style="width: 20%;"></a>'
        f"<p>{escape(article['description'])}</p>"
        "</article>"
    )


def build_category_pages(articles: list[dict[str, str]], sections: dict[str, dict[str, str]]) -> list[Path]:
    template = read_text(CATEGORY_TEMPLATE_PATH)
    built_paths: list[Path] = []

    for slug, section in sections.items():
        category_index_path = ROOT / slug / "index.html"
        prefix = root_prefix(category_index_path)
        section_articles = [article for article in articles if article["category_slug"] == slug]
        posts_html = "\n".join(render_post_card(article, category_index_path) for article in section_articles)
        header_html = section.get("header_html", "").replace("__ROOT_PREFIX__", prefix)
        if header_html:
            header_block = header_html
            header_subline_block = ""
        else:
            header_block = (
                '<header id="header">'
                f'<a href="{prefix}index.html" class="logo"><strong>Khoahoc</strong>.xyz</a>'
                '<ul class="icons">'
                '<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>'
                '<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>'
                '<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>'
                '</ul>'
                '</header>'
            )
            header_subline_block = f'<p class="header-subline">{section["tagline"]}</p>'
        values = {
            "CATEGORY_TITLE": section["title"],
            "CATEGORY_TAGLINE": section["tagline"],
            "CATEGORY_DESCRIPTION": section["description"],
            "CATEGORY_POSTS": posts_html,
            "ROOT_PREFIX": prefix,
            "HEADER_BLOCK": header_block,
            "HEADER_SUBLINE_BLOCK": header_subline_block,
        }

        html = template
        for key, value in values.items():
            html = html.replace(f"{{{{{key}}}}}", value)

        write_text(category_index_path, html)
        built_paths.append(category_index_path)

    return built_paths


def iter_markdown_files() -> list[Path]:
    return sorted(path for path in CONTENT_ROOT.rglob("*.md") if path.name.lower() != "readme.md")


def main() -> None:
    sections = load_sections()
    target = sys.argv[1] if len(sys.argv) > 1 else "all"

    if target == "all":
        sources = iter_markdown_files()
    else:
        source = Path(target)
        if not source.is_absolute():
            source = ROOT / source
        sources = [source]

    if not sources:
        raise SystemExit("No markdown files found in content/")

    articles = [build_article(source, sections) for source in sources]
    built_paths = [ROOT / article["output_path"] for article in articles]
    category_paths = build_category_pages(articles, sections)

    for path in built_paths:
        print(f"Built: {path.relative_to(ROOT)}")
    if target == "all":
        for path in category_paths:
            print(f"Built: {path.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
