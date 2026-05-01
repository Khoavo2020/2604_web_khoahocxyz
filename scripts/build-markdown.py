from __future__ import annotations

from html import escape
import json
import os
from pathlib import Path
import re
import subprocess
import sys


ROOT = Path(__file__).resolve().parents[1]
CONTENT_ROOT = ROOT / "content"
ARTICLE_TEMPLATE_PATH = ROOT / "_templates" / "markdown-article.html"
CATEGORY_TEMPLATE_PATH = ROOT / "_templates" / "markdown-category.html"
SECTIONS_PATH = ROOT / "data" / "site-sections.json"
HOME_PAGE_PATH = ROOT / "index.html"
IMAGE_EXTENSIONS = {".svg", ".jpg", ".jpeg", ".png", ".webp", ".gif"}
HOMEPAGE_SECTION_CONFIG = [
    {"slug": "goc-nhin", "title": "Góc nhìn", "link": "goc-nhin/index.html"},
    {"slug": "trend", "title": "Trend", "link": "trend/index.html"},
    {"slug": "khoa-hoc", "link": "khoa-hoc/index.html"},
    {"slug": "kinh-te-hoc", "link": "kinh-te-hoc/index.html"},
    {"slug": "tam-ly-hoc", "link": "tam-ly-hoc/index.html"},
    {"slug": "triet-hoc", "link": "triet-hoc/index.html"},
]
CATEGORY_CHILD_PAGES = {
    "triet-hoc": [
        {
            "slug": "01_sub_phuong-dong",
            "title": "Phương Đông",
            "description": "Đạo, vô vi, tu dưỡng và cách sống hài hòa với tự nhiên.",
            "href": "triet-hoc/01_sub_phuong-dong/index.html",
        },
        {
            "slug": "01_sub_phuong-tay",
            "title": "Phương Tây",
            "description": "Logic, đạo đức học và những câu hỏi về tự do con người.",
            "href": "triet-hoc/01_sub_phuong-tay/index.html",
        },
        {
            "slug": "01_sub_tho-viet-nam",
            "title": "Thơ Việt Nam",
            "description": "",
            "href": "triet-hoc/01_sub_tho-viet-nam/index.html",
        },
        {
            "slug": "01_sub_tho-nuoc-ngoai",
            "title": "Thơ nước ngoài",
            "description": "",
            "href": "triet-hoc/01_sub_tho-nuoc-ngoai/index.html",
        },
    ]
}


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
    # Support explicit <br> or <br/> tags
    text = text.replace("&lt;br&gt;", "<br />").replace("&lt;br/&gt;", "<br />")
    text = re.sub(r"`([^`]+)`", r"<code>\1</code>", text)
    text = re.sub(r"\*\*([^*]+)\*\*", r"<strong>\1</strong>", text)
    text = re.sub(r"\*([^*]+)\*", r"<em>\1</em>", text)
    text = re.sub(r"\[([^\]]+)\]\s*\(([^)]+)\)", r'<a href="\2">\1</a>', text)
    return text


def indent_block(text: str, level: int) -> str:
    prefix = "\t" * level
    lines = text.splitlines()
    res = []
    in_pre = False
    for line in lines:
        if "<pre" in line:
            res.append(f"{prefix}{line}")
            if "</pre>" not in line:
                in_pre = True
            continue
            
        if in_pre:
            if "</pre>" in line:
                res.append(f"{prefix}{line}")
                in_pre = False
            else:
                res.append(line)
        else:
            res.append(f"{prefix}{line}" if line else "")
    return "\n".join(res)


def render_markdown(markdown: str) -> str:
    lines = markdown.splitlines()
    html_parts: list[str] = []
    paragraph_lines: list[str] = []
    list_items: list[str] = []
    quote_lines: list[str] = []
    
    in_code_block = False
    code_lines: list[str] = []
    code_lang = ""

    def flush_paragraph() -> None:
        if paragraph_lines:
            text = "<br />".join(render_inline(line.strip()) for line in paragraph_lines)
            html_parts.append(f'<p class="markdown-paragraph">{text}</p>')
            paragraph_lines.clear()

    def flush_list() -> None:
        if list_items:
            items = "".join(f"<li>{render_inline(item)}</li>" for item in list_items)
            html_parts.append(f"<ul>{items}</ul>")
            list_items.clear()

    def flush_quote() -> None:
        if quote_lines:
            text = "<br />".join(render_inline(line.strip()) for line in quote_lines)
            html_parts.append(f"<blockquote><p>{text}</p></blockquote>")
            quote_lines.clear()

    for raw_line in lines:
        line = raw_line.rstrip()
        stripped = line.strip()

        # Handle Code Blocks
        if stripped.startswith("```"):
            if in_code_block:
                # Escape code content but don't use render_inline
                html_parts.append(f'<pre><code class="language-{code_lang}">')
                html_parts.extend([escape(l) for l in code_lines])
                html_parts.append('</code></pre>')
                code_lines = []
                in_code_block = False
                code_lang = ""
            else:
                flush_paragraph()
                flush_list()
                flush_quote()
                in_code_block = True
                code_lang = stripped[3:].strip()
            continue

        if in_code_block:
            code_lines.append(raw_line)
            continue

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


def article_section_key(source_path: Path) -> str:
    parts = source_path.relative_to(CONTENT_ROOT).parts
    if len(parts) > 2:
        return "/".join(parts[:2])
    return parts[0]


def article_image_dir(source_path: Path) -> Path:
    parts = source_path.relative_to(CONTENT_ROOT).parts
    category_slug = parts[0]
    if len(parts) > 2 and parts[1].startswith("01_sub_"):
        return CONTENT_ROOT / category_slug / parts[1] / "01_images"
    return CONTENT_ROOT / category_slug / "01_images"


def get_child_page(section_key: str) -> tuple[str, dict[str, str]] | None:
    if "/" not in section_key:
        return None

    parent_slug, child_slug = section_key.split("/", 1)
    for child in CATEGORY_CHILD_PAGES.get(parent_slug, []):
        if child["slug"] == child_slug:
            return parent_slug, child

    return None


def find_content_image(source_path: Path) -> str:
    images_dir = article_image_dir(source_path)
    if not images_dir.exists():
        return ""

    candidates = sorted(images_dir.glob(f"{source_path.stem}.*"))
    for candidate in candidates:
        if candidate.suffix.lower() in IMAGE_EXTENSIONS:
            return candidate.relative_to(ROOT).as_posix()
    return ""


def ensure_generated_cover(source_path: Path) -> str:
    subprocess.run(
        [sys.executable, str(ROOT / "scripts" / "generate-covers.py"), str(source_path.relative_to(ROOT))],
        check=True,
        cwd=ROOT,
    )
    return find_content_image(source_path)


def resolve_article_image(source_path: Path, metadata: dict[str, str]) -> str:
    hero_image = metadata.get("hero_image", "").strip()
    if hero_image.startswith(("http://", "https://")):
        return hero_image

    if hero_image and hero_image != "-":
        hero_path = ROOT / hero_image
        if hero_path.exists():
            return hero_image.replace("\\", "/")

    content_image = find_content_image(source_path)
    if content_image:
        return content_image

    if hero_image == "-":
        return ensure_generated_cover(source_path)

    return ""


def derive_description(markdown_body: str) -> str:
    for block in re.split(r"\n\s*\n", markdown_body.strip()):
        line = " ".join(part.strip() for part in block.splitlines() if part.strip())
        if not line:
            continue
        if line.startswith(("#", ">", "- ")):
            continue
        text = re.sub(r"\[([^\]]+)\]\(([^)]+)\)", r"\1", line)
        text = re.sub(r"`([^`]+)`", r"\1", text)
        text = re.sub(r"\*\*([^*]+)\*\*", r"\1", text)
        text = re.sub(r"\*([^*]+)\*", r"\1", text)
        text = re.sub(r"\s+", " ", text).strip()
        if not text:
            continue

        match = re.search(r"^(.+?[.!?…])(?:\s|$)", text)
        return match.group(1).strip() if match else text
    return ""


def collect_article_data(source_path: Path, sections: dict[str, dict[str, str]]) -> dict[str, str]:
    metadata, markdown_body = parse_front_matter(read_text(source_path))
    category_slug = source_path.relative_to(CONTENT_ROOT).parts[0]
    section_key = article_section_key(source_path)
    section = sections.get(
        category_slug,
        {
            "title": metadata.get("section_title", category_slug.replace("-", " ").title()),
            "tagline": metadata.get("header_subline", ""),
        },
    )

    title = metadata["title"]
    explicit_description = metadata.get("description", "").strip()
    description = explicit_description or derive_description(markdown_body)
    section_title = metadata.get("section_title", section["title"])
    section_link = metadata.get("section_link", f"{category_slug}/index.html")
    header_subline = metadata.get("header_subline", section["tagline"])
    back_link_label = metadata.get("back_link_label", f"â€¢ {section_title}")
    hero_image = resolve_article_image(source_path, metadata)
    parent_title = ""
    parent_link = ""
    child_page = get_child_page(section_key)

    if child_page:
        parent_slug, child = child_page
        parent_section = sections.get(parent_slug, {})
        parent_title = parent_section.get("title", parent_slug.replace("-", " ").title())
        parent_link = f"{parent_slug}/index.html"
        section_title = child["title"]
        section_link = child["href"]
        if not metadata.get("header_subline"):
            header_subline = child["description"]

    output_rel = metadata.get("output_path")
    if output_rel:
        # Replace <default> placeholder with the file's slug (filename without extension)
        file_slug = source_path.stem
        output_rel = output_rel.replace("<default>", file_slug)
        output_path = ROOT / output_rel
    else:
        output_path = ROOT / source_path.relative_to(CONTENT_ROOT).with_suffix("") / "index.html"

    author = metadata.get("author", "").strip()
    update_date = metadata.get("update_date", "").strip()
    title_sub = metadata.get("title_sub", "").strip()

    return {
        "title": title,
        "title_sub": title_sub,
        "description": description,
        "display_description": explicit_description,
        "category_slug": category_slug,
        "section_key": section_key,
        "output_path": str(output_path.relative_to(ROOT)).replace("\\", "/"),
        "hero_image": hero_image,
        "section_title": section_title,
        "section_link": section_link,
        "header_subline": header_subline,
        "parent_title": parent_title,
        "parent_link": parent_link,
        "back_link_label": back_link_label,
        "author": author,
        "update_date": update_date,
        "markdown_body": markdown_body,
    }


def build_article(source_path: Path, sections: dict[str, dict[str, str]]) -> dict[str, str]:
    article = collect_article_data(source_path, sections)
    title = article["title"]
    title_sub = article.get("title_sub", "")
    description = article["description"]
    display_description = article["display_description"]
    section_title = article["section_title"]
    header_subline = article["header_subline"]
    back_link_label = article["back_link_label"]
    hero_image = article["hero_image"]
    parent_title = article["parent_title"]
    parent_link = article["parent_link"]
    output_path = ROOT / article["output_path"]

    article_body = render_markdown(article["markdown_body"])
    prefix = root_prefix(output_path)
    hero_src = resolve_asset(hero_image, prefix)
    hero_block = (
        f'<span class="image main"><img src="{hero_src}" alt="" /></span>'
        if hero_src
        else ""
    )
    description_block = f"<p>{escape(display_description)}</p>" if display_description else ""
    title_sub_block = f'<p class="article-title-sub"><i>{escape(title_sub)}</i></p>' if title_sub else ""
    section_href = resolve_link(article["section_link"], prefix)
    parent_href = resolve_link(parent_link, prefix) if parent_link else ""
    breadcrumb_parts = [f'<a href="{prefix}index.html"><strong>&#x1F3E0;</strong></a>']

    if parent_title and parent_href:
        breadcrumb_parts.append(f'<a href="{parent_href}"><strong>{escape(parent_title)}</strong></a>')

    breadcrumb_parts.append(f'<a href="{section_href}"><strong>{escape(section_title)}</strong></a>')
    article_header_block = (
        '<header id="header">'
        f'<div class="logo">{" &raquo; ".join(breadcrumb_parts)}</div>'
        '<ul class="icons">'
        '<li><a href="https://facebook.com/KhoaHoc.xyz" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>'
        '<li><a href="https://www.youtube.com/@chieusangmoi5363" class="icon brands fa-youtube"><span class="label">YouTube</span></a></li>'
        '</ul>'
        '</header>'
    )

    author = article.get("author", "")
    update_date = article.get("update_date", "")
    section_href = resolve_link(article["section_link"], prefix)
    back_link_label = article["back_link_label"]

    footer_info = []
    if author:
        footer_info.append(f'<span class="author">{escape(author)}</span>')
    if update_date:
        calendar_link = f"{prefix}lich-am-duong/index.html"
        footer_info.append(f'<span class="date"><a href="{calendar_link}">{escape(update_date)}</a></span>')
    
    info_html = f'<div class="info">{" | ".join(footer_info)}</div>' if footer_info else ""
    back_link_html = f'<div class="back-link"><a href="{section_href}">{escape(back_link_label)}</a></div>'
    
    article_footer_block = f'<div class="article-footer">{back_link_html}{info_html}</div>'

    template = read_text(ARTICLE_TEMPLATE_PATH)
    values = {
        "PAGE_TITLE": title,
        "PAGE_TITLE_SUB_BLOCK": indent_block(title_sub_block, 6) if title_sub_block else "",
        "PAGE_DESCRIPTION": description,
        "PAGE_DESCRIPTION_BLOCK": indent_block(description_block, 6) if description_block else "",
        "SECTION_TITLE": section_title,
        "SECTION_LINK": section_href,
        "HEADER_SUBLINE": header_subline,
        "BACK_LINK_LABEL": back_link_label,
        "HERO_BLOCK": indent_block(hero_block, 6) if hero_block else "",
        "ARTICLE_BODY": indent_block(article_body, 6),
        "ARTICLE_FOOTER": indent_block(article_footer_block, 6) if article_footer_block else "",
        "ROOT_PREFIX": prefix,
        "ARTICLE_HEADER_BLOCK": indent_block(article_header_block, 5),
    }

    html = template
    for key, value in values.items():
        html = html.replace(f"{{{{{key}}}}}", value)

    write_text(output_path, html)
    return {key: value for key, value in article.items() if key != "markdown_body"}


def render_post_card(article: dict[str, str], category_index_path: Path) -> str:
    output_path = ROOT / article["output_path"]
    href = output_path.relative_to(category_index_path.parent).as_posix()
    prefix = root_prefix(category_index_path)
    image_src = resolve_asset(article["hero_image"], prefix)
    image_block = f'<a href="{href}" class="image"><img src="{image_src}" alt=""></a>' if image_src else ""
    return (
        "<article>"
        f'<h3><a href="{href}">{escape(article["title"])}</a></h3>'
        '<div class="cover-item-body">'
        f"{image_block}"
        f"<p>{escape(article['description'])}</p>"
        "</div>"
        "</article>"
    )


def render_child_page_cards(parent_slug: str, category_index_path: Path) -> str:
    child_pages = CATEGORY_CHILD_PAGES.get(parent_slug, [])
    if not child_pages:
        return ""

    cards: list[str] = []
    for child in child_pages:
        href = os.path.relpath(ROOT / child["href"], category_index_path.parent).replace("\\", "/")
        cards.append(
            "<article class=\"category-child-card\">"
            f"<a href=\"{href}\">{escape(child['title'])}</a>"
            "</article>"
        )

    return (
        '<div class="category-children-block">'
        '<div class="category-child-grid">'
        + "".join(cards)
        + "</div>"
        "</div>"
    )


def build_category_header(
    prefix: str,
    title: str,
    tagline: str,
    link_href: str,
    parent_title: str = "",
    parent_link_href: str = "",
) -> str:
    breadcrumb_parts = [f'<a href="{prefix}index.html"><strong>&#x1F3E0;</strong></a>']

    if parent_title and parent_link_href:
        breadcrumb_parts.append(f'<a href="{parent_link_href}"><strong>{escape(parent_title)}</strong></a>')

    breadcrumb_parts.append(f'<a href="{link_href}"><strong>{escape(title)}</strong></a>')

    return (
        '<header id="header">'
        f'<div class="logo">{" &raquo; ".join(breadcrumb_parts)} &raquo; {escape(tagline)}</div>'
        '<ul class="icons">'
        '<li><a href="https://facebook.com/KhoaHoc.xyz" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>'
        '<li><a href="https://www.youtube.com/@chieusangmoi5363" class="icon brands fa-youtube"><span class="label">YouTube</span></a></li>'
        "</ul>"
        "</header>"
    )


def build_category_pages(articles: list[dict[str, str]], sections: dict[str, dict[str, str]]) -> list[Path]:
    template = read_text(CATEGORY_TEMPLATE_PATH)
    built_paths: list[Path] = []

    for slug, section in sections.items():
        category_index_path = ROOT / slug / "index.html"
        prefix = root_prefix(category_index_path)
        section_articles = [article for article in articles if article["section_key"] == slug]
        posts_html = "\n".join(render_post_card(article, category_index_path) for article in section_articles)
        children_block = render_child_page_cards(slug, category_index_path)
        header_html = section.get("header_html", "").replace("__ROOT_PREFIX__", prefix)
        if header_html:
            header_block = header_html
            header_subline_block = ""
        else:
            header_block = build_category_header(prefix, section["title"], section["tagline"], "./index.html")
            header_subline_block = f'<p class="header-subline">{section["tagline"]}</p>'
        values = {
            "CATEGORY_TITLE": section["title"],
            "CATEGORY_TAGLINE": section["tagline"],
            "CATEGORY_DESCRIPTION": section["description"],
            "CATEGORY_POSTS": posts_html,
            "CATEGORY_CHILDREN_BLOCK": children_block,
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


def build_subcategory_pages(articles: list[dict[str, str]], sections: dict[str, dict[str, str]]) -> list[Path]:
    template = read_text(CATEGORY_TEMPLATE_PATH)
    built_paths: list[Path] = []

    for parent_slug, child_pages in CATEGORY_CHILD_PAGES.items():
        for child in child_pages:
            section_key = f"{parent_slug}/{child['slug']}"
            child_articles = [article for article in articles if article["section_key"] == section_key]
            if not child_articles:
                continue

            category_index_path = ROOT / child["href"]
            prefix = root_prefix(category_index_path)
            posts_html = "\n".join(render_post_card(article, category_index_path) for article in child_articles)
            parent_title = sections.get(parent_slug, {}).get("title", parent_slug.replace("-", " ").title())
            header_block = build_category_header(
                prefix,
                child["title"],
                child["description"],
                "./index.html",
                parent_title=parent_title,
                parent_link_href=f"{prefix}{parent_slug}/index.html",
            )
            values = {
                "CATEGORY_TITLE": child["title"],
                "CATEGORY_TAGLINE": child["description"],
                "CATEGORY_DESCRIPTION": child["description"],
                "CATEGORY_POSTS": posts_html,
                "CATEGORY_CHILDREN_BLOCK": "",
                "ROOT_PREFIX": prefix,
                "HEADER_BLOCK": header_block,
                "HEADER_SUBLINE_BLOCK": "",
            }

            html = template
            for key, value in values.items():
                html = html.replace(f"{{{{{key}}}}}", value)

            write_text(category_index_path, html)
            built_paths.append(category_index_path)

    return built_paths


def build_homepage_payload(articles: list[dict[str, str]], sections: dict[str, dict[str, str]]) -> dict[str, object]:
    payload_sections: list[dict[str, object]] = []

    for config in HOMEPAGE_SECTION_CONFIG:
        slug = config["slug"]
        section = sections.get(slug, {})
        section_articles = [
            {
                "title": article["title"],
                "description": article["description"],
                "href": article["output_path"],
                "image": article["hero_image"],
            }
            for article in articles
            if article["category_slug"] == slug
        ]
        section_articles.sort(key=lambda item: item["href"])

        payload_sections.append(
            {
                "slug": slug,
                "title": config.get("title", section.get("title", slug.replace("-", " ").title())),
                "link": config["link"],
                "articles": section_articles,
            }
        )

    return {"sections": payload_sections}


def write_homepage_payload(articles: list[dict[str, str]], sections: dict[str, dict[str, str]]) -> None:
    html = read_text(HOME_PAGE_PATH)
    payload = json.dumps(build_homepage_payload(articles, sections), ensure_ascii=False, indent=2)
    pattern = r'(<script id="homepage-sections-data" type="application/json">)(.*?)(</script>)'

    def replace(match: re.Match[str]) -> str:
        return f"{match.group(1)}\n{payload}\n\t\t\t{match.group(3)}"

    updated_html, count = re.subn(pattern, replace, html, count=1, flags=re.DOTALL)
    if count != 1:
        raise ValueError("Could not find homepage data script tag in index.html")
    write_text(HOME_PAGE_PATH, updated_html)


def iter_markdown_files() -> list[Path]:
    return sorted(path for path in CONTENT_ROOT.rglob("*.md") if path.name.lower() != "readme.md")


def main() -> None:
    sections = load_sections()
    target = sys.argv[1] if len(sys.argv) > 1 else "all"
    all_sources = iter_markdown_files()

    if target == "all":
        sources = all_sources
    else:
        source = Path(target)
        if not source.is_absolute():
            source = ROOT / source
        sources = [source]

    if not sources:
        raise SystemExit("No markdown files found in content/")

    articles = [build_article(source, sections) for source in sources]
    built_paths = [ROOT / article["output_path"] for article in articles]
    all_articles = articles if target == "all" else [collect_article_data(source, sections) for source in all_sources]
    category_paths = build_category_pages(all_articles, sections)
    subcategory_paths = build_subcategory_pages(all_articles, sections)
    write_homepage_payload(all_articles, sections)

    for path in built_paths:
        print(f"Built: {path.relative_to(ROOT)}")
    for path in category_paths:
        print(f"Built: {path.relative_to(ROOT)}")
    for path in subcategory_paths:
        print(f"Built: {path.relative_to(ROOT)}")
    print(f"Built: {HOME_PAGE_PATH.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
