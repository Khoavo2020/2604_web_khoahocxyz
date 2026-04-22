(function() {
  var current = document.currentScript;
  var src = current && current.src ? current.src : '';
  window.siteSearchRoot = src ? src.replace(/assets\/js\/site-search-index\.js(?:\?.*)?$/, '') : '';
  window.siteSearchIndex = [
  {
    "title": "Góc nhìn",
    "description": "category-tbd",
    "href": "goc-nhin/index.html",
    "type": "category",
    "section": "Góc nhìn"
  },
  {
    "title": "Hải đảo tự thân 🏝️",
    "description": "Quay về nương tựa, \\n Hải đảo tự thân",
    "href": "goc-nhin/hai-dao-tu-than/index.html",
    "type": "article",
    "section": "Góc nhìn"
  },
  {
    "title": "Kinh phật giáo nguyên thủy",
    "description": "Nikaya",
    "href": "goc-nhin/kinh-phat-giao-nguyen-thuy/index.html",
    "type": "article",
    "section": "Góc nhìn"
  },
  {
    "title": "Lỡ đâu cả đời này không rực rỡ?",
    "description": "Thế giới này không dành cho những kẻ ngồi yên.",
    "href": "goc-nhin/neu-ca-doi-nay-khong-ruc-ro-thi-sao/index.html",
    "type": "article",
    "section": "Góc nhìn"
  },
  {
    "title": "Siêu dự báo",
    "description": "Sinh vật có não là để dự đoán tương lai",
    "href": "goc-nhin/sieu-du-bao/index.html",
    "type": "article",
    "section": "Góc nhìn"
  },
  {
    "title": "Trích diễm",
    "description": "Xuân lan thu cúc thành hư sự, Hạ thử đông hàn đoạt thiếu niên",
    "href": "goc-nhin/trich-diem/index.html",
    "type": "article",
    "section": "Góc nhìn"
  },
  {
    "title": "Tâm lý học đám đông với thần tượng âm nhạc",
    "description": "Tâm lý học đám đông với thần tượng âm nhạc (fandom) là hiện tượng cá nhân hòa mình vào tập thể, đánh mất nhận định riêng để hành động theo số đông",
    "href": "goc-nhin/tam-ly-hoc-dam-dong-voi-than-tuong-am-nhac/index.html",
    "type": "article",
    "section": "Góc nhìn"
  },
  {
    "title": "5W1H Framework",
    "description": "5W1H là một framework cực kỳ hữu ích để phân tích vấn đề và khơi gợi ý tưởng",
    "href": "khoa-hoc/5w1h-framework/index.html",
    "type": "article",
    "section": "Khoa học"
  },
  {
    "title": "Entropy trong đời sống thường ngày",
    "description": "Một khái niệm vật lý có thể giúp ta hiểu vì sao mọi thứ dễ bừa bộn hơn là ngăn nắp.",
    "href": "khoa-hoc/entropy-trong-doi-song/index.html",
    "type": "article",
    "section": "Khoa học"
  },
  {
    "title": "Giấc ngủ ảnh hưởng đến trí nhớ thế nào",
    "description": "Ngủ không chỉ để nghỉ mà còn để não bộ củng cố điều đã học.",
    "href": "khoa-hoc/giac-ngu-va-tri-nho/index.html",
    "type": "article",
    "section": "Khoa học"
  },
  {
    "title": "Hiệu ứng placebo là gì",
    "description": "Niềm tin có thể tạo ra thay đổi thật trong cảm nhận và hành vi.",
    "href": "khoa-hoc/placebo-la-gi/index.html",
    "type": "article",
    "section": "Khoa học"
  },
  {
    "title": "IQ trung bình và sự giàu có",
    "description": "Tương quan giữa giáo dục, năng lực nhận thức và sự thịnh vượng của một quốc gia.",
    "href": "khoa-hoc/iq-quoc-gia-va-su-giau-co/index.html",
    "type": "article",
    "section": "Khoa học"
  },
  {
    "title": "Khoa học",
    "description": "category-tbd",
    "href": "khoa-hoc/index.html",
    "type": "category",
    "section": "Khoa học"
  },
  {
    "title": "Ký ức không có thật",
    "description": "Vì sao trí nhớ dễ bị sai lệch và cách bạn tự kiểm chứng lại ký ức.",
    "href": "khoa-hoc/ky-uc-khong-co-that/index.html",
    "type": "article",
    "section": "Khoa học"
  },
  {
    "title": "Nobel y học 2016 autophagy (tự thực bào) 🧬",
    "description": "Bỏ ăn sáng giúp trẻ hoá, giảm viêm, giảm nguy cơ ung thư ở cấp độ tế bào",
    "href": "khoa-hoc/autophagy-tu-thuc-bao-nobel-y-hoc-2016/index.html",
    "type": "article",
    "section": "Khoa học"
  },
  {
    "title": "Tư duy thống kê cơ bản cho người mới",
    "description": "Một vài nguyên tắc đơn giản có thể giúp ta bớt cả tin trước những kết luận hấp dẫn.",
    "href": "khoa-hoc/tu-duy-thong-ke-co-ban/index.html",
    "type": "article",
    "section": "Khoa học"
  },
  {
    "title": "Vì sao bầu trời có màu xanh",
    "description": "Hiện tượng quen thuộc này là một bài học đẹp về ánh sáng và khí quyển.",
    "href": "khoa-hoc/bau-troi-mau-xanh/index.html",
    "type": "article",
    "section": "Khoa học"
  },
  {
    "title": "Chi phí cơ hội trong đời sống hằng ngày",
    "description": "Mỗi lựa chọn đều có một cái giá vô hình là thứ ta bỏ lỡ khi chọn phương án khác.",
    "href": "kinh-te-hoc/chi-phi-co-hoi-trong-doi-song/index.html",
    "type": "article",
    "section": "Kinh tế học"
  },
  {
    "title": "Cung và cầu là gì",
    "description": "Khái niệm cơ bản nhất của kinh tế học giúp giải thích giá cả và hành vi thị trường.",
    "href": "kinh-te-hoc/cung-cau-la-gi/index.html",
    "type": "article",
    "section": "Kinh tế học"
  },
  {
    "title": "Khan hiếm là điểm xuất phát của kinh tế học",
    "description": "Vì nguồn lực luôn có giới hạn nên lựa chọn và phân bổ trở nên quan trọng.",
    "href": "kinh-te-hoc/nguon-luc-khan-hiem/index.html",
    "type": "article",
    "section": "Kinh tế học"
  },
  {
    "title": "Khuyến khích ảnh hưởng đến hành vi ra sao",
    "description": "Con người phản ứng rất mạnh với cách phần thưởng và chi phí được thiết kế.",
    "href": "kinh-te-hoc/dong-luc-va-khuyen-khich/index.html",
    "type": "article",
    "section": "Kinh tế học"
  },
  {
    "title": "Kinh tế học",
    "description": "category-tbd",
    "href": "kinh-te-hoc/index.html",
    "type": "category",
    "section": "Kinh tế học"
  },
  {
    "title": "Lợi thế so sánh giúp hợp tác hiệu quả hơn",
    "description": "Không cần giỏi nhất mọi thứ, chỉ cần tương đối phù hợp hơn ở một việc nào đó.",
    "href": "kinh-te-hoc/loi-the-so-sanh/index.html",
    "type": "article",
    "section": "Kinh tế học"
  },
  {
    "title": "Những câu nói hay giúp ta dừng lại một nhịp",
    "description": "Có những câu ngắn nhưng đủ làm thay đổi nhịp suy nghĩ của cả một ngày.",
    "href": "tinh-hoa-nhan-loai/cau-noi-giup-dung-lai/index.html",
    "type": "article",
    "section": "Tinh hoa - nhân loại"
  },
  {
    "title": "Sống chậm để thấy rõ hơn",
    "description": "Chậm lại không phải để trì hoãn mà để quan sát kỹ hơn điều mình đang sống.",
    "href": "tinh-hoa-nhan-loai/song-cham-de-thay-ro/index.html",
    "type": "article",
    "section": "Tinh hoa - nhân loại"
  },
  {
    "title": "Tinh thần học suốt đời được nuôi bằng điều gì",
    "description": "Không phải chỉ bằng kỷ luật mà còn bằng niềm vui được hiểu thêm một chút về thế giới.",
    "href": "tinh-hoa-nhan-loai/tinh-than-hoc-suot-doi/index.html",
    "type": "article",
    "section": "Tinh hoa - nhân loại"
  },
  {
    "title": "Vì sao con người luôn tìm cái đẹp và cái sâu",
    "description": "Ta không chỉ cần sống sót mà còn cần những điều làm đời sống đáng sống hơn.",
    "href": "tinh-hoa-nhan-loai/dep-va-sau/index.html",
    "type": "article",
    "section": "Tinh hoa - nhân loại"
  },
  {
    "title": "Đọc sách để làm gì ngoài việc biết thêm",
    "description": "Một cuốn sách tốt không chỉ cho thông tin mà còn cho ta một cách nhìn khác về đời sống.",
    "href": "tinh-hoa-nhan-loai/doc-sach-de-lam-gi/index.html",
    "type": "article",
    "section": "Tinh hoa - nhân loại"
  },
  {
    "title": "Lịch âm dương",
    "description": "Trang lịch âm dương của khoahoc.xyz.",
    "href": "lich-am-duong/index.html",
    "type": "tool",
    "section": "Tiện ích"
  },
  {
    "title": "Cách xem phim 18 +, phim người lớn, phim xxx mới nhất",
    "description": "cách xem phim 18 +, phim người lớn, phim xxx mới nhất trên điện thoại",
    "href": "trend/cach-xem-phim-18-phim-nguoi-lon-phim-xxx-moi-nhat-tren-dien-thoai/index.html",
    "type": "article",
    "section": "Trend"
  },
  {
    "title": "Trend",
    "description": "category-tbd",
    "href": "trend/index.html",
    "type": "category",
    "section": "Trend"
  },
  {
    "title": "cách xem phim sex, cách xem phim người lớn 2026, phim 18 +",
    "description": "cách xem phim sex, cách xem phim người lớn 2026, phim 18 +",
    "href": "trend/cach-xem-phim-sex-phim-nguoi-lon-2026/index.html",
    "type": "article",
    "section": "Trend"
  },
  {
    "title": "Anh không tin trời cao",
    "description": "Anh không tin trời cao,",
    "href": "triet-hoc/01_sub_tho-nuoc-ngoai/anh-khong-tin-troi-cao/index.html",
    "type": "article",
    "section": "Triết học"
  },
  {
    "title": "Biết mình là điểm khởi đầu của triết học sống",
    "description": "Trước khi hỏi nên làm gì, có lẽ ta cần hiểu mình đang sống theo điều gì.",
    "href": "triet-hoc/biet-minh-la-dau/index.html",
    "type": "article",
    "section": "Triết học"
  },
  {
    "title": "Chủ nghĩa Khắc kỷ nhìn nghịch cảnh thế nào",
    "description": "Bình thản không đến từ việc tránh khó khăn mà từ cách ta đáp lại hoàn cảnh.",
    "href": "triet-hoc/chu-nghia-khac-ky/index.html",
    "type": "article",
    "section": "Triết học"
  },
  {
    "title": "Người con gái ở lầu hoa",
    "description": "Nhà nàng ở gốc cây mai trắng,",
    "href": "triet-hoc/01_sub_tho-viet-nam/nguoi-con-gai-o-lau-hoa/index.html",
    "type": "article",
    "section": "Triết học"
  },
  {
    "title": "Phương Tây",
    "description": "Logic, đạo đức học và những câu hỏi về tự do con người.",
    "href": "triet-hoc/01_sub_phuong-tay/index.html",
    "type": "subcategory",
    "section": "Triết học"
  },
  {
    "title": "Phương Đông",
    "description": "Đạo, vô vi, tu dưỡng và cách sống hài hòa với tự nhiên.",
    "href": "triet-hoc/01_sub_phuong-dong/index.html",
    "type": "subcategory",
    "section": "Triết học"
  },
  {
    "title": "Sống tối giản có phải là tự do hơn",
    "description": "Giảm bớt sở hữu không tự động đem lại tự do nhưng mở ra khả năng lựa chọn sáng suốt hơn.",
    "href": "triet-hoc/song-toi-gian-va-tu-do/index.html",
    "type": "article",
    "section": "Triết học"
  },
  {
    "title": "Thơ Việt Nam",
    "description": "Những bài thơ gợi mở về thân phận, tình yêu và thời gian.",
    "href": "triet-hoc/01_sub_tho-viet-nam/index.html",
    "type": "subcategory",
    "section": "Triết học"
  },
  {
    "title": "Thơ nước ngoài",
    "description": "Những bài thơ kinh điển mở rộng cảm thức về nhân sinh.",
    "href": "triet-hoc/01_sub_tho-nuoc-ngoai/index.html",
    "type": "subcategory",
    "section": "Triết học"
  },
  {
    "title": "Triết học",
    "description": "category-tbd",
    "href": "triet-hoc/index.html",
    "type": "category",
    "section": "Triết học"
  },
  {
    "title": "Triết học phương Tây - Phân tích, logic, duy lý",
    "description": "Triết học phương Tây lấy logic và duy lý làm nền tảng,",
    "href": "triet-hoc/01_sub_phuong-tay/phan-tich-logic-va-duy-ly/index.html",
    "type": "article",
    "section": "Triết học"
  },
  {
    "title": "Triết học phương Đông - sự hòa hợp giữa con người và thiên nhiên, đạo đức nhân sinh, và tâm linh",
    "description": "Nhìn nhận vũ trụ và con người trong một chỉnh thể thống nhất, không tách rời.",
    "href": "triet-hoc/01_sub_phuong-dong/phan-tich-logic-va-duy-ly/index.html",
    "type": "article",
    "section": "Triết học"
  },
  {
    "title": "Hiệu ứng halo trong đánh giá con người",
    "description": "Một ấn tượng tốt ở một mặt nào đó có thể lan sang mọi đánh giá còn lại.",
    "href": "tam-ly-hoc/hieu-ung-halo/index.html",
    "type": "article",
    "section": "Tâm lý học"
  },
  {
    "title": "Stress và khả năng phục hồi",
    "description": "Vấn đề không phải là không bao giờ stress mà là biết phục hồi sau áp lực.",
    "href": "tam-ly-hoc/stress-va-phuc-hoi/index.html",
    "type": "article",
    "section": "Tâm lý học"
  },
  {
    "title": "Thiên kiến xác nhận",
    "description": "Vì sao chúng ta thường ưu tiên thông tin củng cố niềm tin có sẵn.",
    "href": "tam-ly-hoc/thien-kien-xac-nhan/index.html",
    "type": "article",
    "section": "Tâm lý học"
  },
  {
    "title": "Tâm lý học",
    "description": "category-tbd",
    "href": "tam-ly-hoc/index.html",
    "type": "category",
    "section": "Tâm lý học"
  },
  {
    "title": "Vòng lặp thói quen",
    "description": "Thói quen bền vững thường được hình thành từ tín hiệu, hành động và phần thưởng.",
    "href": "tam-ly-hoc/vong-lap-thoi-quen/index.html",
    "type": "article",
    "section": "Tâm lý học"
  },
  {
    "title": "Động lực nội tại và cách học bền vững",
    "description": "Khi việc học gắn với ý nghĩa cá nhân, ta ít phụ thuộc hơn vào cảm hứng nhất thời.",
    "href": "tam-ly-hoc/dong-luc-noi-tai/index.html",
    "type": "article",
    "section": "Tâm lý học"
  },
  {
    "title": "Trang chủ",
    "description": "Điểm bắt đầu để khám phá toàn bộ nội dung trên khoahoc.xyz.",
    "href": "index.html",
    "type": "page",
    "section": "Tổng quan"
  },
  {
    "title": "Cách ghi chú để biến việc đọc thành tri thức của mình",
    "description": "Một cuốn sách chỉ thực sự ở lại khi ta biết đối thoại với nó bằng ghi chú.",
    "href": "tu-sach-nen-tang/cach-ghi-chu-khi-doc/index.html",
    "type": "article",
    "section": "Tủ sách - nền tảng"
  },
  {
    "title": "Một lộ trình sách nhập môn Khoa học",
    "description": "Nếu muốn bắt đầu đọc khoa học một cách có hệ thống, hãy đi từ trực giác đến khái niệm.",
    "href": "tu-sach-nen-tang/sach-nhap-mon-khoa-hoc/index.html",
    "type": "article",
    "section": "Tủ sách - nền tảng"
  },
  {
    "title": "Những hướng đọc tâm lý học nền tảng",
    "description": "Đọc tâm lý học không chỉ để hiểu người khác mà còn để bớt ngây thơ với chính mình.",
    "href": "tu-sach-nen-tang/sach-tam-ly-nen-doc/index.html",
    "type": "article",
    "section": "Tủ sách - nền tảng"
  },
  {
    "title": "Triết học cho người bận rộn",
    "description": "Không cần đọc dày ngay từ đầu; điều quan trọng là giữ được sợi dây liên hệ với các câu hỏi lớn.",
    "href": "tu-sach-nen-tang/triet-hoc-cho-nguoi-ban-ron/index.html",
    "type": "article",
    "section": "Tủ sách - nền tảng"
  },
  {
    "title": "Đọc sách kinh tế cho người mới bắt đầu",
    "description": "Điều quan trọng không phải đọc thật nhiều thuật ngữ mà là học cách nhìn thấy các đánh đổi.",
    "href": "tu-sach-nen-tang/doc-sach-kinh-te-cho-nguoi-moi/index.html",
    "type": "article",
    "section": "Tủ sách - nền tảng"
  },
  {
    "title": "Ghi chú như một bộ não thứ hai",
    "description": "Một hệ thống ghi chú tốt không chỉ lưu trữ mà còn giúp suy nghĩ lại và kết nối ý tưởng.",
    "href": "ung-dung-nang-suat/ghi-chu-thu-hai-nao/index.html",
    "type": "article",
    "section": "Ứng dụng - năng suất"
  },
  {
    "title": "Hệ thống ba danh sách để giảm quá tải",
    "description": "Tách việc phải làm thành ba lớp giúp đầu óc bớt hỗn loạn hơn rất nhiều.",
    "href": "ung-dung-nang-suat/he-thong-ba-danh-sach/index.html",
    "type": "article",
    "section": "Ứng dụng - năng suất"
  },
  {
    "title": "Pomodoro có thực sự hiệu quả không",
    "description": "Một kỹ thuật đơn giản nhưng hữu ích vì nó làm việc bắt đầu dễ hơn và nghỉ ngơi có chủ đích hơn.",
    "href": "ung-dung-nang-suat/pomodoro-co-thuc-su-hieu-qua/index.html",
    "type": "article",
    "section": "Ứng dụng - năng suất"
  },
  {
    "title": "Review tuần cá nhân để đi đường dài",
    "description": "Một buổi nhìn lại ngắn mỗi tuần có thể giúp bạn tránh trôi theo bận rộn mà quên mất hướng đi.",
    "href": "ung-dung-nang-suat/review-tuan-ca-nhan/index.html",
    "type": "article",
    "section": "Ứng dụng - năng suất"
  },
  {
    "title": "Thiết kế môi trường làm việc để bớt phân tâm",
    "description": "Môi trường xung quanh thường quyết định ta có giữ được nhịp làm việc hay không.",
    "href": "ung-dung-nang-suat/thiet-ke-moi-truong-lam-viec/index.html",
    "type": "article",
    "section": "Ứng dụng - năng suất"
  }
];
})();
