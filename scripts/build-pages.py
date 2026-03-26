from __future__ import annotations

from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def write_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def root_prefix(path: Path) -> str:
    depth = len(path.parent.parts)
    return "../" * depth


def apply_template(template: str, values: dict[str, str]) -> str:
    result = template
    for key, value in values.items():
        result = result.replace(f"{{{{{key}}}}}", value)
    return result


def extract_first(pattern: str, text: str, default: str = "") -> str:
    match = re.search(pattern, text, re.DOTALL | re.IGNORECASE)
    return match.group(1).strip() if match else default


def extract_posts_block(text: str) -> str:
    posts = extract_first(r'<div class="cover-list">(.*?)</div>', text, "").strip()
    if posts:
        return posts
    return extract_first(r'<div class="posts">(.*?)</div>', text, "").strip()


def extract_header_tagline(text: str) -> str:
    return extract_first(r'<p class="header-subline">(.*?)</p>', text, "").strip()


def extract_main_title_desc(text: str) -> tuple[str, str]:
    title = extract_first(r"<header class=\"main\">.*?<h2>(.*?)</h2>", text, "")
    desc = extract_first(r"<header class=\"main\">.*?<p>(.*?)</p>", text, "")
    return title, desc


def extract_article_fields(text: str) -> dict[str, str]:
    title = extract_first(r"<header class=\"main\">.*?<h2>(.*?)</h2>", text, "")
    desc = extract_first(r"<header class=\"main\">.*?<p>(.*?)</p>", text, "")
    hero = extract_first(r'<span class="image main"><img src="(.*?)"', text, "")
    body_section = extract_first(r"</header>(.*?)</section>", text, "")
    paragraphs = re.findall(r"<p>.*?</p>", body_section, re.DOTALL | re.IGNORECASE)
    body = "\n".join(paragraphs).strip()
    keypoints = extract_first(r"(<ul>.*?</ul>)", body_section, "").strip()
    related = extract_first(r'<div class="posts">(.*?)</div>', text, "").strip()
    return {
        "title": title,
        "desc": desc,
        "hero": hero,
        "body": body,
        "keypoints": keypoints,
        "related": related,
    }


def transform_posts(posts_html: str) -> str:
    pattern = r'<article>(.*?)</article>'
    def replace_article(match):
        content = match.group(1)
        href_match = re.search(r'<a href="([^"]*)"[^>]*class="image"', content)
        href = href_match.group(1) if href_match else ''
        img_match = re.search(r'<img src="([^"]*)"', content)
        img_src = img_match.group(1) if img_match else ''
        title_match = re.search(r'<h3>\s*(?:<a [^>]*>)?(.*?)(?:</a>)?\s*</h3>', content, re.DOTALL)
        title = title_match.group(1).strip() if title_match else ''
        p_match = re.search(r'<p>(.*?)</p>', content)
        desc = p_match.group(1) if p_match else ''
        new_article = f'''<article>
<h3><a href="{href}">{title}</a></h3>
<div class="cover-item-body">
<a href="{href}" class="image"><img src="{img_src}" alt=""></a>
<p>{desc}</p>
</div>
</article>'''
        return new_article
    return re.sub(pattern, replace_article, posts_html, flags=re.DOTALL)


def build_categories() -> None:
    template_category = read_text(ROOT / "_templates" / "category.html")
    template_quotes = read_text(ROOT / "_templates" / "quotes.html")
    template_library = read_text(ROOT / "_templates" / "library.html")
    template_library_category = read_text(ROOT / "_templates" / "library-category.html")

    categories = [
        ("standard", "goc-nhin/index.html"),
        ("standard", "khoa-hoc/index.html"),
        ("standard", "kinh-te-hoc/index.html"),
        ("standard", "tam-ly-hoc/index.html"),
        ("standard", "ung-dung-nang-suat/index.html"),
        ("standard", "triet-hoc/index.html"),
        ("standard", "triet-hoc/phuong-dong/index.html"),
        ("standard", "triet-hoc/phuong-tay/index.html"),
        ("standard", "triet-hoc/tho-viet-nam/index.html"),
        ("standard", "triet-hoc/tho-nuoc-ngoai/index.html"),
        ("quotes", "tinh-hoa-nhan-loai/index.html"),
        ("library", "tu-sach-nen-tang/index.html"),
        ("library-category", "tu-sach-nen-tang/sach-khoa-hoc/index.html"),
        ("library-category", "tu-sach-nen-tang/sach-kinh-te-hoc/index.html"),
        ("library-category", "tu-sach-nen-tang/sach-tam-ly-hoc/index.html"),
        ("library-category", "tu-sach-nen-tang/sach-triet-hoc/index.html"),
        ("library-category", "tu-sach-nen-tang/sach-xyz/index.html"),
    ]

    for kind, rel_path in categories:
        path = ROOT / rel_path
        html = read_text(path)
        title, desc = extract_main_title_desc(html)
        tagline = extract_header_tagline(html) or desc
        posts = extract_posts_block(html)
        if not title or not posts:
            # Preserve pages whose header/content is managed by another workflow.
            print(f"Skipped: {path.relative_to(ROOT)}")
            continue
        posts = transform_posts(posts)
        prefix = root_prefix(path.relative_to(ROOT))
        values = {
            "ROOT_PREFIX": prefix,
            "CATEGORY_TITLE": title,
            "CATEGORY_DESC": desc,
            "CATEGORY_TAGLINE": tagline,
            "CATEGORY_HERO": "",
            "CATEGORY_POSTS": posts,
            "CATEGORY_ID": path.parent.name,
        }

        if kind == "quotes":
            template = template_quotes
        elif kind == "library":
            template = template_library
        elif kind == "library-category":
            template = template_library_category
        else:
            template = template_category

        content = apply_template(template, values)
        write_text(path, content)


def build_articles() -> None:
    template_article = read_text(ROOT / "_templates" / "article.html")

    articles = [
        "khoa-hoc/ky-uc-khong-co-that.html",
        "khoa-hoc/iq-quoc-gia-va-su-giau-co.html",
        "kinh-te-hoc/chi-phi-co-hoi.html",
        "kinh-te-hoc/loi-the-so-sanh.html",
        "tam-ly-hoc/vong-lap-thoi-quen.html",
        "tam-ly-hoc/thien-kien-xac-nhan.html",
        "ung-dung-nang-suat/quan-ly-nang-luong.html",
        "ung-dung-nang-suat/he-thong-3-danh-sach.html",
        "triet-hoc/phuong-dong/dao-va-vo-vi.html",
        "triet-hoc/phuong-dong/thuc-hanh-tinh-tao.html",
        "triet-hoc/phuong-tay/duy-ly-va-khoa-hoc.html",
        "triet-hoc/phuong-tay/hien-sinh-va-trach-nhiem.html",
        "triet-hoc/tho-viet-nam/tho-va-than-phan.html",
        "triet-hoc/tho-viet-nam/thoi-gian-ky-uc.html",
        "triet-hoc/tho-nuoc-ngoai/tinh-yeu-va-than-phan.html",
        "triet-hoc/tho-nuoc-ngoai/tuong-trung-va-tieng-vang.html",
    ]

    for rel_path in articles:
        path = ROOT / rel_path
        html = read_text(path)
        fields = extract_article_fields(html)
        prefix = root_prefix(path.relative_to(ROOT))

        category_link = "index.html"
        category_name = extract_first(r'<header id="header">.*?<strong>(.*?)</strong>', html, "")
        category_tagline = extract_header_tagline(html)

        values = {
            "ROOT_PREFIX": prefix,
            "ARTICLE_TITLE": fields["title"],
            "ARTICLE_DESC": fields["desc"],
            "ARTICLE_HERO": fields["hero"],
            "ARTICLE_BODY": fields["body"],
            "ARTICLE_KEYPOINTS": fields["keypoints"],
            "CATEGORY_LINK": category_link,
            "CATEGORY_NAME": category_name,
            "CATEGORY_TAGLINE": category_tagline,
            "RELATED_BLOCKS": fields["related"],
        }

        content = apply_template(template_article, values)
        write_text(path, content)


def main() -> None:
    target = sys.argv[1] if len(sys.argv) > 1 else "all"
    if target in ("all", "categories"):
        build_categories()
    if target in ("all", "articles"):
        build_articles()


if __name__ == "__main__":
    main()
