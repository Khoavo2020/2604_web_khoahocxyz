hosting: GitHub

Markdown -> build -> HTML5/css/js -> GitHub Pages

mục tiêu của web khoahoc.xyz
thiết kết heo mô hình “knowledge hub + sản phẩm”, tức là:

Content → thu hút người đọc (bài viết, kiến thức)
Authority → xây uy tín (triết học, tâm lý, khoa học)
Product → bán khóa học, app
Community / Inspiration → câu cách ngôn, trí tuệ



page:
* Home : Khoahoc.xyz

* Khoa học phổ thông
* Kinh tế học
* Tâm lý học
* Triết học

* Tinh hoa - nhân loại
* Tủ sách - nền tảng
* Ứng dụng - năng suất 


sub page
* Tủ sách - nền tảng
    + Sách khoa học phổ thông
    + Sách kinh tế học
    + Sách tâm lý học
    + Sách triết học

* Triết học
    + Triết học phương đông
    + Triết học phương tây
    + Thơ việt nam
    + Thơ nước ngoài


## Cấu trúc thư mục và hình ảnh

### Hình ảnh
- `images/` - Chỉ chứa hình ảnh dùng chung (category thumbnails, banners, etc.)
- `[category]/[article]/image/` - Hình ảnh của từng bài viết cụ thể
  - `thumb.jpg` - Thumbnail cho danh sách bài viết
  - `cover.jpg` - Ảnh cover cho trang bài viết chi tiết
  - Các ảnh khác nếu cần

### Ví dụ cấu trúc:
```
khoa-hoc-pho-thong/
├── index.html
├── ky-uc-khong-co-that/
│   ├── image/
│   │   ├── thumb.jpg
│   │   └── cover.jpg
│   └── ky-uc-khong-co-that.html
└── iq-quoc-gia-va-su-giau-co/
    ├── image/
    │   ├── thumb.jpg
    │   └── cover.jpg
    └── iq-quoc-gia-va-su-giau-co.html
```
 

