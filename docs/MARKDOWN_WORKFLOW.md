# Markdown First Workflow

## Mục tiêu

Chọn `Markdown first` làm workflow chính cho `khoahoc.xyz`.

Điều đó có nghĩa là:
- bài viết gốc được viết trong `content/`
- script build sẽ chuyển Markdown sang HTML
- HTML đầu ra là file publish lên GitHub Pages

## Vì sao chọn hướng này

- dễ viết nội dung hơn HTML
- dễ dùng với AI/Codex khi tạo hoặc chỉnh bài
- giảm lỗi do copy/paste HTML dài
- về sau dễ mở rộng sang build danh mục, RSS, sitemap hoặc search data

## Workflow hiện tại

1. Tạo bài viết `.md` trong `content/`
2. Điền front matter
3. Viết nội dung Markdown
4. Chạy script:

```powershell
python scripts/build-markdown.py
```

5. File HTML sẽ được sinh ra đúng `output_path` đã khai báo
6. Trang `index.html` của từng category chính cũng được cập nhật lại từ metadata trong `content/`

## Build một bài duy nhất

```powershell
python scripts/build-markdown.py content/tam-ly-hoc/thien-kien-xac-nhan.md
```

## Cấu trúc hiện tại cho toàn category

- `content/<category>/<slug>.md`: bài nguồn
- `assets/generated/covers/<category>/<slug>.svg`: ảnh cover
- `<category>/<slug>/index.html`: bài HTML đã build
- `<category>/index.html`: trang danh mục được build tự động

## Các field front matter đang hỗ trợ

- `title`: tiêu đề bài
- `description`: mô tả ngắn
- `section_title`: tên chuyên mục hiển thị ở header
- `section_link`: link quay về trang chuyên mục
- `header_subline`: dòng mô tả ngắn ở đầu trang
- `back_link_label`: nhãn link quay lại
- `hero_image`: ảnh đầu bài
- `output_path`: nơi xuất file HTML

## Markdown hiện đang hỗ trợ

- đoạn văn
- heading `#`, `##`, `###`
- danh sách `- item`
- trích dẫn `> text`
- `**bold**`, `*italic*`, `` `code` ``
- link `[text](url)`

## Quy ước nên dùng

- mỗi bài nên có 1 file Markdown riêng
- tên file dùng slug không dấu
- output nên là `section/slug/index.html`
- ảnh cover nên đặt trong `assets/generated/covers/<category>/`
- `section_link` và `hero_image` nên dùng đường dẫn tính từ root project

## Lưu ý hiện tại

- workflow đã tự động build cả bài viết và trang category
- chưa tự động sinh related posts
- chưa dùng markdown library bên ngoài để giữ setup đơn giản

## Hướng mở rộng tiếp theo

- tách menu/site config ra file dữ liệu riêng
- sinh sitemap và RSS
- thêm kiểm tra lỗi metadata trước khi build
