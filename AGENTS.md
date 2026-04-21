# AI Agent Instructions - khoahoc.xyz

### Project summary
### Goal:
`khoahoc.xyz` là một static website theo mô hình `knowledge hub + sản phẩm`

### Core Value:
- `Content`: bài viết, giải thích khái niệm, tóm tắt sách, ghi chú học tập
- `Authority`: xây uy tín qua chất lượng biên tập và định hướng học thuật
- `Product`: khóa học, app, ebook, landing page sản phẩm
- `Community / Inspiration`: câu trích dẫn, tinh hoa nhân loại, tài nguyên truyền cảm hứng

### Current stack

- Static HTML/CSS/JS
- GitHub Pages for hosting
- Markdown-first workflow với source trong `content/`
- Templates trong `_templates/`
- Build scripts trong `scripts/`
- Một phần nội dung có thể được sinh từ Markdown hoặc data source

### Working principles for Codex

- Ưu tiên thay đổi qua template và script nếu có nhiều page dùng chung.
- Không tự ý đổi cấu trúc URL hoặc đổi tên thư mục nếu chưa thật cần thiết.
- Giữ giao diện đơn giản, đọc tốt trên mobile, phù hợp site tri thức.
- Khi thêm trang mới, cần giữ consistency với menu, header, footer và style chung.
- `goc-nhin` là một chuyên mục hợp lệ trong cấu trúc site, nhưng để giữ menu tối giản thì không thêm `goc-nhin` vào sidebar/menu chung; chỉ hiển thị nó như một section trên trang chủ, trừ khi user yêu cầu khác.
- Khi sửa nội dung tiếng Việt, ưu tiên UTF-8 chuẩn và tránh lỗi encoding.
- Nếu có nhiều hướng triển khai, ưu tiên hướng ít phức tạp nhất và dễ bảo trì trên GitHub Pages.

### Encoding safety

- Tất cả file văn bản trong repo phải được đọc và ghi bằng `UTF-8`.
- Khi dùng PowerShell để đọc file có tiếng Việt, luôn dùng `Get-Content -Encoding UTF8`.
- Khi dùng PowerShell để ghi file có tiếng Việt, không dùng cách mặc định; chỉ ghi bằng API chỉ rõ UTF-8 như `[System.IO.File]::WriteAllText(..., [System.Text.UTF8Encoding]::new($false))`.
- Ưu tiên sửa file bằng `apply_patch` hoặc script Python có `encoding="utf-8"`.
- Không dùng chuỗi đã mojibake làm nguồn copy để tạo lại template/script.
- Sau khi sửa template hoặc build script có tiếng Việt, phải kiểm tra lại output generated trước khi kết thúc.

### Content architecture

Các nhóm trang chính hiện tại:
- Home xyz
- Khoa học
- Kinh tế học
- Tâm lý học
- Triết học
- Tinh hoa - nhân loại
- Tủ sách - nền tảng
- Ứng dụng năng suất

Các trang con có thể mở rộng:
- `goc-nhin`
- `triet-hoc/01_sub_phuong-dong`
- `triet-hoc/01_sub_phuong-tay`
- `triet-hoc/01_sub_tho-viet-nam`
- `triet-hoc/01_sub_tho-nuoc-ngoai`
- `tu-sach-nen-tang/sach-khoa-hoc`
- `tu-sach-nen-tang/sach-kinh-te-hoc`
- `tu-sach-nen-tang/sach-tam-ly-hoc`
- `tu-sach-nen-tang/sach-triet-hoc`
- `tu-sach-nen-tang/sach-xyz`

### Cấu trúc hình ảnh

- `assets/images/` - Chỉ chứa hình ảnh dùng chung (category thumbnails, banners, etc.)
- `content/[category]/01_images/[article].jpg` - Hình ảnh của từng bài viết cụ thể

### Definition of good output

Một thay đổi được xem là tốt khi:
- đúng mục tiêu kinh doanh và biên tập của site
- dễ đọc với người dùng phổ thông
- không làm vỡ cấu trúc build hiện tại
- không tạo thêm thao tác thủ công lặp lại
- dễ tiếp tục mở rộng bằng template/script

### Preferred deliverables

Khi làm việc trong repo này, ưu tiên các đầu ra sau:
- file tài liệu rõ mục tiêu trước khi code lớn
- template sạch, tái sử dụng được
- script build nhỏ, dễ đọc, ít phụ thuộc
- cấu trúc thư mục nhất quán
- checklist hoặc roadmap ngắn cho bước tiếp theo
