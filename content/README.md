# Content Source

Thư mục này là `source of truth` cho workflow `Markdown first`.

Nguyên tắc:
- Viết bài gốc trong `content/`
- Chạy script build để sinh HTML ra website
- Không sửa tay file HTML đã được sinh ra, trừ khi bạn đang debug tạm thời

Ví dụ cấu trúc:

```text
content/
  tam-ly-hoc/
    thien-kien-xac-nhan.md
```

Front matter tối thiểu:

```md
---
title: Tiêu đề bài viết
description: Mô tả ngắn
section_title: Tâm lý học
section_link: tam-ly-hoc/index.html
hero_image: assets/generated/covers/tam-ly-hoc/thien-kien-xac-nhan.svg
output_path: tam-ly-hoc/thien-kien-xac-nhan/index.html
---
```

Gợi ý cấu trúc chuẩn:

- bài nguồn: `content/<category>/<slug>.md`
- cover: `assets/generated/covers/<category>/<slug>.svg`
- output: `<category>/<slug>/index.html`

Khi chạy `python scripts/build-markdown.py`, script sẽ:
- build tất cả bài Markdown sang HTML
- đồng thời build lại `index.html` cho từng category chính

Cover SVG có thể regenerate bằng:

```powershell
python scripts/generate-covers.py
```

Hướng dẫn chi tiết nằm trong `docs/COVER_WORKFLOW.md`.
