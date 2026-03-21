# Codex Workflow

## Mục tiêu của file này

Giúp chủ dự án và Codex làm việc với nhau rõ ràng, ít hiểu nhầm, và tiết kiệm thời gian.

## Cách ra yêu cầu tốt cho Codex

Mỗi khi nhờ Codex, nên nói ngắn gọn theo mẫu:

```md
Bối cảnh:
- Tôi đang sửa trang/chuyên mục nào?

Mục tiêu:
- Tôi muốn kết quả cuối cùng là gì?

Phạm vi:
- Chỉ sửa 1 file, 1 thư mục hay toàn bộ template?

Ràng buộc:
- Có cần giữ nguyên giao diện cũ không?
- Có được sửa script build không?
- Có cần tương thích GitHub Pages không?
```

## Ví dụ yêu cầu tốt

```md
Hãy chuẩn hóa chuyên mục `khoa-hoc-pho-thong`.
Mục tiêu là làm giao diện danh mục dễ đọc hơn nhưng vẫn giữ style chung.
Bạn được phép sửa template nếu cần, nhưng không đổi URL hiện tại.
Sau khi sửa, hãy nói rõ file nào là nơi cần chỉnh về sau.
```

## Khi nào nên yêu cầu Codex sửa template

Hãy yêu cầu sửa template khi:
- nhiều page đang giống nhau
- bạn phải copy/paste cùng một thay đổi nhiều lần
- menu, header, footer hoặc layout dùng chung đang lặp lại

## Khi nào nên yêu cầu Codex sửa từng page

Hãy sửa từng page riêng khi:
- trang đó có nội dung đặc thù
- bạn đang thử nghiệm một mẫu mới
- thay đổi chưa đủ chắc để áp vào toàn site

## Quy tắc làm việc an toàn

- Trước khi sửa lớn, hãy nói rõ “được phép sửa template/script hay không”.
- Nếu repo đang dang dở, ưu tiên sửa nhỏ và có thể kiểm chứng.
- Sau mỗi thay đổi lớn, nên kiểm tra lại page được ảnh hưởng.

## Kỳ vọng đầu ra từ Codex

Một đầu ra tốt nên có:
- code hoặc file tài liệu đã được tạo/sửa
- giải thích ngắn gọn đã thay đổi gì
- nếu có rủi ro, nêu rõ rủi ro
- nếu chưa kiểm tra được, nói rõ chưa kiểm tra được

