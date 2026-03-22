# AGENTS.md

## Project summary

`khoahoc.xyz` là một static website theo mô hình `knowledge hub + sản phẩm`.

Các nhóm giá trị chính:
- `Content`: bài viết, giải thích khái niệm, tóm tắt sách, ghi chú học tập
- `Authority`: xây uy tín qua chất lượng biên tập và định hướng học thuật
- `Product`: khóa học, app, ebook, landing page sản phẩm
- `Community / Inspiration`: câu trích dẫn, tinh hoa nhân loại, tài nguyên truyền cảm hứng

## Current stack

- Static HTML/CSS/JS
- GitHub Pages for hosting
- Templates trong `_templates/`
- Build scripts trong `scripts/`
- Một phần nội dung có thể được sinh từ Markdown hoặc data source

## Working principles for Codex

- Ưu tiên thay đổi qua template và script nếu có nhiều page dùng chung.
- Không tự ý đổi cấu trúc URL hoặc đổi tên thư mục nếu chưa thật cần thiết.
- Giữ giao diện đơn giản, đọc tốt trên mobile, phù hợp site tri thức.
- Khi thêm trang mới, cần giữ consistency với menu, header, footer và style chung.
- Khi sửa nội dung tiếng Việt, ưu tiên UTF-8 chuẩn và tránh lỗi encoding.
- Nếu có nhiều hướng triển khai, ưu tiên hướng ít phức tạp nhất và dễ bảo trì trên GitHub Pages.

## Content architecture

Các nhóm trang chính hiện tại:
- Home
- Khoa học phổ thông
- Kinh tế học
- Tâm lý học
- Triết học
- Tinh hoa nhân loại
- Tủ sách nền tảng
- Ứng dụng năng suất

Các trang con có thể mở rộng:
- `triet-hoc/phuong-dong`
- `triet-hoc/phuong-tay`
- `triet-hoc/tho-viet-nam`
- `triet-hoc/tho-nuoc-ngoai`
- `tu-sach-nen-tang/sach-*`

## Cấu trúc hình ảnh

- `images/` - Chỉ chứa hình ảnh dùng chung (category thumbnails, banners, etc.)
- `[category]/[article]/image/` - Hình ảnh của từng bài viết cụ thể
  - `thumb.jpg` - Thumbnail cho danh sách bài viết
  - `cover.jpg` - Ảnh cover cho trang bài viết chi tiết
  - Các ảnh khác nếu cần

## Definition of good output

Một thay đổi được xem là tốt khi:
- đúng mục tiêu kinh doanh và biên tập của site
- dễ đọc với người dùng phổ thông
- không làm vỡ cấu trúc build hiện tại
- không tạo thêm thao tác thủ công lặp lại
- dễ tiếp tục mở rộng bằng template/script

## Preferred deliverables

Khi làm việc trong repo này, ưu tiên các đầu ra sau:
- file tài liệu rõ mục tiêu trước khi code lớn
- template sạch, tái sử dụng được
- script build nhỏ, dễ đọc, ít phụ thuộc
- cấu trúc thư mục nhất quán
- checklist hoặc roadmap ngắn cho bước tiếp theo

