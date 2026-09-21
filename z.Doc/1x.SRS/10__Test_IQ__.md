
#### page “Test IQ”
| Nhóm             | Độ tuổi |
| ---------------  | ------: |
| 🧒 *Trẻ em*     |    < 12 |
| 🧑 *Thiếu niên* |   13–17 |
| 👨 *Người lớn*  |     18+ |

ref:
https://testiq.vn/

| Loại                         | Đo gì?                        | Ví dụ dạng câu hỏi                             |
| ---------------------------- | ----------------------------- | ---------------------------------------------- |
| **Verbal Reasoning**         | Suy luận bằng ngôn ngữ        | Từ đồng nghĩa, quan hệ từ, hoàn thành câu      |
| **Numerical Reasoning**      | Tư duy số học                 | Dãy số, quy luật số, phép tính                 |
| **Logical Reasoning**        | Logic                         | Suy luận, điều kiện, quan hệ                   |
| **Abstract Reasoning**       | Nhận dạng quy luật trừu tượng | Hình ảnh, ma trận, pattern                     |
| **Spatial Reasoning**        | Tư duy không gian             | Xoay hình, hình 3D, gấp giấy                   |
| **Visual/Pattern Reasoning** | Nhận biết pattern             | Chọn hình còn thiếu                            |
| **Working Memory**           | Trí nhớ làm việc              | Nhớ chuỗi số/hình và thao tác với chúng        |
| **Processing Speed**         | Tốc độ xử lý                  | Tìm ký hiệu, matching trong thời gian giới hạn |

Trong các bài IQ online phổ thông, phần Abstract/Logical/Pattern Reasoning thường được sử dụng nhiều vì ít phụ thuộc vào ngôn ngữ.

---

ung-dung-nang-suat/01_sub_iq-test/
```
01_sub_iq-test/
│
├── index.html
│
├── data/
│   └── tests.json
│
├── js/
│   └── iq-test.js
│
├── css/
│   └── iq-test.css
│
└── 01_images/
```

tests.json
```
tests
├── mixed-iq
├── logical
├── pattern
├── numerical
├── spatial
└── verbal
```

Age chỉ là metadata của test, ví dụ:
tests.json
{
  "tests": [
    {
      "id": "child-mixed-01",
      "title": "IQ Test – Trẻ em",
      "ageGroup": "child",
      "ageRange": "<12",
      "category": "mixed",
      "questionCount": 20,
      "timeLimit": 900,
      "description": "Bài test tư duy tổng hợp dành cho trẻ em dưới 12 tuổi."
    },
    {
      "id": "teen-mixed-01",
      "title": "IQ Test – Thiếu niên",
      "ageGroup": "teen",
      "ageRange": "13-17",
      "category": "mixed",
      "questionCount": 25,
      "timeLimit": 1200,
      "description": "Bài test tư duy tổng hợp dành cho thiếu niên từ 13 đến 17 tuổi."
    },
    {
      "id": "adult-mixed-01",
      "title": "IQ Test – Người lớn",
      "ageGroup": "adult",
      "ageRange": "18+",
      "category": "mixed",
      "questionCount": 30,
      "timeLimit": 1500,
      "description": "Bài test tư duy tổng hợp dành cho người lớn từ 18 tuổi."
    }
  ]
}

---

vi dụ cấu trúc taxonomy
```
IQ Test
│
├── 🧒 Trẻ em (<12)
│   ├── Mixed IQ
│   ├── Logic
│   ├── Pattern
│   ├── Numerical
│   └── Spatial
│
├── 🧑 Thiếu niên (13–17)
│   ├── Mixed IQ
│   ├── Logic
│   ├── Pattern
│   ├── Numerical
│   └── Spatial
│
└── 👨 Người lớn (18+)
    ├── Mixed IQ
    ├── Logic
    ├── Pattern
    ├── Numerical
    └── Spatial
```