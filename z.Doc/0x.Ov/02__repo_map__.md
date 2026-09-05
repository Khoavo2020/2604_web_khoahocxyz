# Repository Map - khoahoc.xyz

## 1. Category Structure

The public content taxonomy is organized into main categories and optional subcategories.

| Main category | Public path | Subcategories or related pages |
| --- | --- | --- |
| Home | `home-xyz/` | `01_sub_goc-nhin`, `01_sub_lich-su`, `01_sub_trend`, `01_sub_y-hoc-suc-khoe` |
| Science | `khoa-hoc/` | Article pages |
| Economics | `kinh-te-hoc/` | Article pages |
| Psychology | `tam-ly-hoc/` | Article pages |
| Philosophy | `triet-hoc/` | `01_sub_phuong-dong`, `01_sub_phuong-tay`, `01_sub_tho-viet-nam`, `01_sub_tho-nuoc-ngoai` |
| Inspiration | `tinh-hoa-nhan-loai/` | Quotes and human knowledge |
| Foundation Library | `tu-sach-nen-tang/` | `01_sub_sach-khoa-hoc`, `01_sub_sach-kinh-te-hoc`, `01_sub_sach-tam-ly-hoc`, `01_sub_sach-triet-hoc`, `01_sub_sach-xyz` |
| Productivity and Applications | `ung-dung-nang-suat/` | `01_sub_app-nang-suat`, `01_sub_dau-tu-chung-khoan`, `01_sub_giao-duc-steam`, `01_sub_giao-duc-tieng-anh` |

### Subcategory paths

```text
home-xyz/
├── 01_sub_goc-nhin/
├── 01_sub_lich-su/
├── 01_sub_trend/
└── 01_sub_y-hoc-suc-khoe/

triet-hoc/
├── 01_sub_phuong-dong/
├── 01_sub_phuong-tay/
├── 01_sub_tho-viet-nam/
└── 01_sub_tho-nuoc-ngoai/

tu-sach-nen-tang/
├── 01_sub_sach-khoa-hoc/
├── 01_sub_sach-kinh-te-hoc/
├── 01_sub_sach-tam-ly-hoc/
├── 01_sub_sach-triet-hoc/
└── 01_sub_sach-xyz/

ung-dung-nang-suat/
├── 01_sub_app-nang-suat/
├── 01_sub_dau-tu-chung-khoan/
├── 01_sub_giao-duc-steam/
└── 01_sub_giao-duc-tieng-anh/
```

### Source-to-output convention

```text
content/<category>/<slug>.md
        |
        +--> assets/generated/covers/<category>/<slug>.*
        |
        +--> <category>/<slug>/index.html
```

`content/` is the source of truth. Root-level category directories contain generated pages or maintained static pages.

## 2. Repository Tree

```text
khoahoc.xyz/
├── _templates/                 # HTML templates
├── assets/                     # CSS, JS, fonts, shared images, generated covers
├── content/                    # Markdown source and article images
│   ├── home-xyz/
│   ├── khoa-hoc/
│   ├── kinh-te-hoc/
│   ├── tam-ly-hoc/
│   ├── tinh-hoa-nhan-loai/
│   ├── triet-hoc/
│   ├── tu-sach-nen-tang/
│   └── ung-dung-nang-suat/
├── data/                       # Section metadata and content manifests
├── scripts/                    # Build and content utility scripts
├── z.Doc/                      # Technical documentation
│   ├── 0x.Ov/                  # Overview and repository map
│   ├── 1x.SRS/                 # Software requirements
│   ├── 2x.SAD/                 # Software architecture
│   ├── 4x.EnvSetup/            # Environment and build setup
│   ├── 5x.Smoke_test/          # Smoke tests and demos
│   └── 6x.Dev_guide/           # Developer workflow
├── index.html                  # Website home page
└── <category>/<article>/       # Generated static output
```

## 3. Important Path Rules

- Use lowercase, unaccented slugs for URLs and directory names.
- Keep article source under `content/`; do not treat generated HTML as the authoring source.
- Keep shared images under `assets/images/` and article-specific images under the relevant content category.
- Preserve special static sections such as `lich-am-duong/` when running the Markdown build.
- Keep section metadata in `data/site-sections.json`; update the build mapping when a new generated category is introduced.