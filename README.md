# khoahoc.xyz

Website `khoahoc.xyz` được xây theo hướng `knowledge hub + sản phẩm`.

Mục tiêu của dự án:
- Xuất bản nội dung nền tảng về khoa học, kinh tế học, tâm lý học, triết học.
- Xây dựng uy tín học thuật và phong cách biên tập riêng.
- Từng bước phát triển sản phẩm số như khóa học, app, ebook.
- Tạo một nơi tập hợp tri thức, cảm hứng và tài nguyên học tập lâu dài.

Tech direction hiện tại:
- Hosting: GitHub Pages
- Nguồn nội dung chính: Markdown trong `content/`
- Output: HTML/CSS/JS tĩnh
- Build scripts: `scripts/`

## Cấu trúc chính
- `scripts/`   : script build và script hỗ trợ cập nhật hàng loạt

- `_templates/`: template dùng để build page/article
- `assets/`    : CSS, JS, font, giao diện chung, image dùng chung
- `content/`            : nguồn bài viết Markdown
- `data/`      : dữ liệu tĩnh, manifest, nguồn nội dung phụ trợ
- `docs/`               : tài liệu định hướng dự án

- `index.html` : trang chủ

- `goc-nhin/`  : chuyên mục góc nhìn, xu hướng
- `khoa-hoc/`: chuyên mục Khoa học
- `kinh-te-hoc/`        : chuyên mục kinh tế học

- `tam-ly-hoc/`         : chuyên mục tâm lý học
- `tinh-hoa-nhan-loai/` : câu cách ngôn, trích dẫn, cảm hứng
- `triet-hoc/`          : chuyên mục triết học và các nhánh con
- `tu-sach-nen-tang/`   : thư mục tủ sách và phân loại sách
- `ung-dung-nang-suat/` : app, công cụ, năng suất

## Tài liệu nên đọc trước khi làm tiếp

- [docs/PROJECT_BRIEF.md](/c:/Users/me/Downloads/2603w3_web/khoahoc.xyz/docs/PROJECT_BRIEF.md)
- [docs/ROADMAP.md](/c:/Users/me/Downloads/2603w3_web/khoahoc.xyz/docs/ROADMAP.md)
- [docs/CODEX_WORKFLOW.md](/c:/Users/me/Downloads/2603w3_web/khoahoc.xyz/docs/CODEX_WORKFLOW.md)
- [docs/MARKDOWN_WORKFLOW.md](/c:/Users/me/Downloads/2603w3_web/khoahoc.xyz/docs/MARKDOWN_WORKFLOW.md)
- [docs/CONTENT_STYLE_GUIDE.md](/c:/Users/me/Downloads/2603w3_web/khoahoc.xyz/docs/CONTENT_STYLE_GUIDE.md)
- [AGENTS.md](/c:/Users/me/Downloads/2603w3_web/khoahoc.xyz/AGENTS.md)

## Cách làm việc đề xuất

1. Viết ý tưởng và yêu cầu vào `docs/ROADMAP.md` hoặc `note.md`.
2. Khi bắt đầu một việc lớn, cập nhật lại mục tiêu trong `docs/PROJECT_BRIEF.md`.
3. Khi nhờ Codex, mô tả rõ:
   - đang sửa trang nào
   - mục tiêu thay đổi là gì
   - có muốn sửa template/build script hay không
4. Sau khi sửa giao diện hoặc nội dung hàng loạt, chạy lại script build phù hợp.

## Lệnh build Markdown

Build toàn bộ bài Markdown:

```powershell
python scripts/build-markdown.py
```

Build một bài duy nhất:

```powershell
python scripts/build-markdown.py content/tam-ly-hoc/thien-kien-xac-nhan.md
```

## Nguyên tắc của dự án

- Ưu tiên đơn giản, dễ bảo trì, phù hợp GitHub Pages.
- Nội dung là trung tâm, giao diện phục vụ việc đọc và học.
- Tên thư mục và URL nên ngắn, không dấu, ổn định.
- Thay đổi lớn nên làm qua template hoặc script, tránh sửa tay quá nhiều file.
