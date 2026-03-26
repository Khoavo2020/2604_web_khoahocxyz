from __future__ import annotations

from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CONTENT_ROOT = ROOT / "content"


SECTIONS = {
    "khoa-hoc": {
        "title": "Khoa học",
        "tagline": "Giải thích thế giới bằng những ý tưởng đơn giản, rõ ràng và có thể kiểm chứng.",
        "focus": [
            "đi từ hiện tượng quen thuộc đến nguyên lý nền tảng",
            "giữ cách giải thích ngắn gọn và dễ hình dung",
            "khuyến khích người đọc đặt thêm câu hỏi sau khi hiểu điều cơ bản",
        ],
        "opener": "Khoa học có giá trị ở chỗ nó biến những điều tưởng như xa vời thành điều ai cũng có thể hiểu và áp dụng.",
    },
    "kinh-te-hoc": {
        "title": "Kinh tế học",
        "tagline": "Tư duy kinh tế để hiểu lựa chọn, nguồn lực và những đánh đổi mỗi ngày.",
        "focus": [
            "nhìn rõ cái giá của mỗi lựa chọn",
            "phân biệt trực giác hấp dẫn với phân tích có cấu trúc",
            "áp dụng tư duy kinh tế vào quyết định cá nhân",
        ],
        "opener": "Kinh tế học không chỉ nói về tiền bạc. Nó là cách nhìn vào lựa chọn, ưu tiên và đánh đổi trong đời sống hằng ngày.",
    },
    "tam-ly-hoc": {
        "title": "Tâm lý học",
        "tagline": "Hiểu bản thân và hành vi con người bằng góc nhìn tâm lý học ứng dụng.",
        "focus": [
            "nhận diện cơ chế tâm lý đang vận hành",
            "tách cảm xúc nhất thời khỏi quan sát dài hạn",
            "dùng hiểu biết tâm lý để sống tỉnh táo hơn",
        ],
        "opener": "Tâm lý học giúp ta nhìn rõ hơn cách con người suy nghĩ, phản ứng và tự kể câu chuyện về chính mình.",
    },
    "triet-hoc": {
        "title": "Triết học",
        "tagline": "Những câu hỏi lớn về ý nghĩa, tự do, trách nhiệm và cách sống.",
        "focus": [
            "đặt lại những câu hỏi tưởng đã quen",
            "xây một cách sống có chủ đích hơn",
            "học cách chấp nhận sự phức tạp mà không buông xuôi",
        ],
        "opener": "Triết học hữu ích nhất khi nó đi cùng đời sống thực, chứ không chỉ nằm trên trang sách như một cuộc tranh luận trừu tượng.",
    },
    "tinh-hoa-nhan-loai": {
        "title": "Tinh hoa - nhân loại",
        "tagline": "Những ý tưởng đẹp, câu nói sâu sắc và bài học bền vững từ nhiều thời đại.",
        "focus": [
            "giữ cho tâm trí còn chỗ đứng của sự suy ngẫm",
            "nhắc lại những giá trị bền hơn nhịp gấp gáp",
            "biến cảm hứng thành chất liệu sống hằng ngày",
        ],
        "opener": "Tinh hoa - nhân loại thường nằm trong những ý tưởng cô đọng nhưng đủ sức làm ta dừng lại và suy nghĩ khác đi.",
    },
    "tu-sach-nen-tang": {
        "title": "Tủ sách - nền tảng",
        "tagline": "Sách hay là chiếc cầu nối từ hứng thú nhất thời sang năng lực học tập bền vững.",
        "focus": [
            "chọn tài liệu theo trình tự hợp lý",
            "đọc để hiểu và ghi nhớ chứ không chỉ đọc cho xong",
            "xây một con đường tự học có thể duy trì lâu dài",
        ],
        "opener": "Một tủ sách nền tảng tốt không nhằm làm ta đọc nhiều hơn bằng mọi giá mà giúp ta đọc đúng thứ cần thiết vào đúng lúc.",
    },
    "ung-dung-nang-suat": {
        "title": "Ứng dụng - năng suất",
        "tagline": "Công cụ, hệ thống và nguyên tắc giúp làm việc hiệu quả mà không kiệt sức.",
        "focus": [
            "thiết kế môi trường làm việc tốt hơn",
            "giảm ma sát khi bắt đầu việc quan trọng",
            "đưa việc xem lại và điều chỉnh vào hệ thống hằng tuần",
        ],
        "opener": "Năng suất bền vững không đến từ việc ép mình liên tục mà từ hệ thống đủ rõ để làm điều quan trọng một cách đều đặn.",
    },
}


ARTICLES = {
    "khoa-hoc": [
        ("bau-troi-mau-xanh", "Vì sao bầu trời có màu xanh", "Hiện tượng quen thuộc này là một bài học đẹp về ánh sáng và khí quyển."),
        ("giac-ngu-va-tri-nho", "Giấc ngủ ảnh hưởng đến trí nhớ thế nào", "Ngủ không chỉ để nghỉ mà còn để não bộ củng cố điều đã học."),
        ("placebo-la-gi", "Hiệu ứng placebo là gì", "Niềm tin có thể tạo ra thay đổi thật trong cảm nhận và hành vi."),
        ("entropy-trong-doi-song", "Entropy trong đời sống thường ngày", "Một khái niệm vật lý có thể giúp ta hiểu vì sao mọi thứ dễ bừa bộn hơn là ngăn nắp."),
        ("tu-duy-thong-ke-co-ban", "Tư duy thống kê cơ bản cho người mới", "Một vài nguyên tắc đơn giản có thể giúp ta bớt cả tin trước những kết luận hấp dẫn."),
    ],
    "kinh-te-hoc": [
        ("chi-phi-co-hoi-trong-doi-song", "Chi phí cơ hội trong đời sống hằng ngày", "Mỗi lựa chọn đều có một cái giá vô hình là thứ ta bỏ lỡ khi chọn phương án khác."),
        ("cung-cau-la-gi", "Cung và cầu là gì", "Khái niệm cơ bản nhất của kinh tế học giúp giải thích giá cả và hành vi thị trường."),
        ("loi-the-so-sanh", "Lợi thế so sánh giúp hợp tác hiệu quả hơn", "Không cần giỏi nhất mọi thứ, chỉ cần tương đối phù hợp hơn ở một việc nào đó."),
        ("dong-luc-va-khuyen-khich", "Khuyến khích ảnh hưởng đến hành vi ra sao", "Con người phản ứng rất mạnh với cách phần thưởng và chi phí được thiết kế."),
        ("nguon-luc-khan-hiem", "Khan hiếm là điểm xuất phát của kinh tế học", "Vì nguồn lực luôn có giới hạn nên lựa chọn và phân bổ trở nên quan trọng."),
    ],
    "tam-ly-hoc": [
        ("thien-kien-xac-nhan", "Thiên kiến xác nhận", "Vì sao chúng ta thường ưu tiên thông tin củng cố niềm tin có sẵn."),
        ("vong-lap-thoi-quen", "Vòng lặp thói quen", "Thói quen bền vững thường được hình thành từ tín hiệu, hành động và phần thưởng."),
        ("hieu-ung-halo", "Hiệu ứng halo trong đánh giá con người", "Một ấn tượng tốt ở một mặt nào đó có thể lan sang mọi đánh giá còn lại."),
        ("stress-va-phuc-hoi", "Stress và khả năng phục hồi", "Vấn đề không phải là không bao giờ stress mà là biết phục hồi sau áp lực."),
        ("dong-luc-noi-tai", "Động lực nội tại và cách học bền vững", "Khi việc học gắn với ý nghĩa cá nhân, ta ít phụ thuộc hơn vào cảm hứng nhất thời."),
    ],
    "triet-hoc": [
        ("biet-minh-la-dau", "Biết mình là điểm khởi đầu của triết học sống", "Trước khi hỏi nên làm gì, có lẽ ta cần hiểu mình đang sống theo điều gì."),
        ("chu-nghia-khac-ky", "Chủ nghĩa Khắc kỷ nhìn nghịch cảnh thế nào", "Bình thản không đến từ việc tránh khó khăn mà từ cách ta đáp lại hoàn cảnh."),
        ("dao-va-hanh-dong", "Đạo và hành động không gượng ép", "Có những lúc tiến bộ đến từ sự đúng nhịp hơn là từ cố sức hơn."),
        ("y-nghia-va-trach-nhiem", "Ý nghĩa thường đi cùng trách nhiệm", "Điều làm đời sống sâu sắc hơn cũng thường đòi hỏi ta trưởng thành hơn."),
        ("song-toi-gian-va-tu-do", "Sống tối giản có phải là tự do hơn", "Giảm bớt sở hữu không tự động đem lại tự do nhưng mở ra khả năng lựa chọn sáng suốt hơn."),
    ],
    "tinh-hoa-nhan-loai": [
        ("doc-sach-de-lam-gi", "Đọc sách để làm gì ngoài việc biết thêm", "Một cuốn sách tốt không chỉ cho thông tin mà còn cho ta một cách nhìn khác về đời sống."),
        ("cau-noi-giup-dung-lai", "Những câu nói hay giúp ta dừng lại một nhịp", "Có những câu ngắn nhưng đủ làm thay đổi nhịp suy nghĩ của cả một ngày."),
        ("tinh-than-hoc-suot-doi", "Tinh thần học suốt đời được nuôi bằng điều gì", "Không phải chỉ bằng kỷ luật mà còn bằng niềm vui được hiểu thêm một chút về thế giới."),
        ("dep-va-sau", "Vì sao con người luôn tìm cái đẹp và cái sâu", "Ta không chỉ cần sống sót mà còn cần những điều làm đời sống đáng sống hơn."),
        ("song-cham-de-thay-ro", "Sống chậm để thấy rõ hơn", "Chậm lại không phải để trì hoãn mà để quan sát kỹ hơn điều mình đang sống."),
    ],
    "tu-sach-nen-tang": [
        ("sach-nhap-mon-khoa-hoc", "Một lộ trình sách nhập môn Khoa học", "Nếu muốn bắt đầu đọc khoa học một cách có hệ thống, hãy đi từ trực giác đến khái niệm."),
        ("doc-sach-kinh-te-cho-nguoi-moi", "Đọc sách kinh tế cho người mới bắt đầu", "Điều quan trọng không phải đọc thật nhiều thuật ngữ mà là học cách nhìn thấy các đánh đổi."),
        ("sach-tam-ly-nen-doc", "Những hướng đọc tâm lý học nền tảng", "Đọc tâm lý học không chỉ để hiểu người khác mà còn để bớt ngây thơ với chính mình."),
        ("triet-hoc-cho-nguoi-ban-ron", "Triết học cho người bận rộn", "Không cần đọc dày ngay từ đầu; điều quan trọng là giữ được sợi dây liên hệ với các câu hỏi lớn."),
        ("cach-ghi-chu-khi-doc", "Cách ghi chú để biến việc đọc thành tri thức của mình", "Một cuốn sách chỉ thực sự ở lại khi ta biết đối thoại với nó bằng ghi chú."),
    ],
    "ung-dung-nang-suat": [
        ("pomodoro-co-thuc-su-hieu-qua", "Pomodoro có thực sự hiệu quả không", "Một kỹ thuật đơn giản nhưng hữu ích vì nó làm việc bắt đầu dễ hơn và nghỉ ngơi có chủ đích hơn."),
        ("he-thong-ba-danh-sach", "Hệ thống ba danh sách để giảm quá tải", "Tách việc phải làm thành ba lớp giúp đầu óc bớt hỗn loạn hơn rất nhiều."),
        ("ghi-chu-thu-hai-nao", "Ghi chú như một bộ não thứ hai", "Một hệ thống ghi chú tốt không chỉ lưu trữ mà còn giúp suy nghĩ lại và kết nối ý tưởng."),
        ("thiet-ke-moi-truong-lam-viec", "Thiết kế môi trường làm việc để bớt phân tâm", "Môi trường xung quanh thường quyết định ta có giữ được nhịp làm việc hay không."),
        ("review-tuan-ca-nhan", "Review tuần cá nhân để đi đường dài", "Một buổi nhìn lại ngắn mỗi tuần có thể giúp bạn tránh trôi theo bận rộn mà quên mất hướng đi."),
    ],
}


def build_markdown(category_slug: str, slug: str, title: str, description: str) -> str:
    section = SECTIONS[category_slug]
    lines = [
        "---",
        f"title: {title}",
        f"description: {description}",
        f"section_title: {section['title']}",
        f"section_link: {category_slug}/index.html",
        f"header_subline: {section['tagline']}",
        f"back_link_label: • {section['title']}",
        f"hero_image: content/{category_slug}/_images/{slug}.svg",
        f"output_path: {category_slug}/{slug}/index.html",
        "---",
        "",
        section["opener"],
        "",
        description,
        "",
        "## Góc nhìn chính",
        "",
        f"{title} gợi ý rằng điều quan trọng không chỉ nằm ở thông tin bề mặt mà còn ở cách ta diễn giải và áp dụng nó vào đời sống.",
        "",
        "## Ba ý nên nhớ",
        "",
    ]

    for item in section["focus"]:
        lines.append(f"- {item}")

    lines.extend(
        [
            "",
            "## Gợi ý áp dụng",
            "",
            "Thay vì cố nhớ mọi chi tiết ngay lập tức, hãy giữ lại một ý chính, một ví dụ gần gũi và một hành động nhỏ có thể thử ngay trong tuần này.",
            "",
            "> Học tốt không bắt đầu từ việc biết thật nhiều, mà từ việc hiểu rõ thêm một điều và sống khác đi một chút.",
            "",
            "## Kết luận",
            "",
            "Khi đọc về chủ đề này, mục tiêu không phải là có ngay câu trả lời cuối cùng mà là nhìn thế giới và chính mình sáng rõ hơn từng chút một.",
            "",
        ]
    )
    return "\n".join(lines)


def main() -> None:
    for category_slug, articles in ARTICLES.items():
        for slug, title, description in articles:
            path = CONTENT_ROOT / category_slug / f"{slug}.md"
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(build_markdown(category_slug, slug, title, description), encoding="utf-8", newline="\n")
            print(f"Repaired: {path.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
