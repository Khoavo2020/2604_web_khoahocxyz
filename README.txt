
data\tinh-hoa-nhan-loai\quotes


muc tinh-hoa-nhan-loai tôi có những file .txt line đầu là vietnamese line thứ 2 là english line 3 là tác giả (có thể có line empty ở giữa). những file này tôi export từ simplenote ra, vậy tôi nên tổ chức như thế nào ? ý tưởng của tôi là tôi sẽ sưu tầm liên tục trên simple note smartphone và lâu lâu tôi sẽ export ra và đẩy lên web. trang index mục này sẽ có những table 3 row cho 3 line trên. hãy code


#### Cách dùng tự động --> thêm mới file trích đẫn .txt
Mỗi lần bạn thêm/bớt file .txt, chỉ cần chạy:
powershell -ExecutionPolicy Bypass -File scripts\build-quotes-manifest.ps1

#### Cách dùng tự động
Cách tự động cập nhật khi thêm ebook
Chạy lại script:
powershell -ExecutionPolicy Bypass -File scripts\build-ebooks-manifest.ps1



#### color
f56a6a -> 00796b