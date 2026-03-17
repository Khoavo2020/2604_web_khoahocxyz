$ErrorActionPreference = 'Stop'

$articleTemplate = @"
<!DOCTYPE HTML>

<html>
	<head>
		<title>{{TITLE}} - Khoahoc.xyz</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
		<header id="header">
			<a href="{{HEADER_LINK}}" class="logo"><strong>{{HEADER_TEXT}}</strong></a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h1>{{TITLE}}</h1>
										<p>{{DESC}}</p>
									</header>

									<span class="image main"><img src="{{IMAGE}}" alt="" /></span>

									<p>{{BODY1}}</p>
									<p>{{BODY2}}</p>

									<ul>
										<li>{{POINT1}}</li>
										<li>{{POINT2}}</li>
										<li>{{POINT3}}</li>
									</ul>
								</section>

								<section>
									<header class="major">
										<h3>Xem thêm </h3>
									</header>
									<div class="posts">
										<article>
											<a href="{{BACK_LINK}}" class="image"><img src="{{BACK_IMAGE}}" alt="" /></a>
											<h3>{{BACK_TITLE}}</h3>
											<p>{{BACK_DESC}}</p>
											<ul class="actions">
												<li><a href="{{BACK_LINK}}" class="button">Quay về mục</a></li>
											</ul>
										</article>
										<article>
											<a href="../tu-sach-nen-tang/index.html" class="image"><img src="../images/pic05.jpg" alt="" /></a>
											<h3>Tủ sách nền tảng</h3>
											<p>Ebook chọn lọc để đọc sâu và thực hành.</p>
											<ul class="actions">
												<li><a href="../tu-sach-nen-tang/index.html" class="button">Xem sách</a></li>
											</ul>
										</article>
									</div>
								</section>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="../index.html">🏠 Khoahoc.xyz</a></li>
									</ul>
								</nav>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">Copyright &copy; <a href="https://facebook.com/KhoaHoc.xyz">Khoahoc.xyz</a></p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>

	</body>
</html>
"@

$articles = @(
    @{ Path = 'khoa-hoc-pho-thong\ky-uc-khong-co-that.html'; Title = 'Ký ức không có thật'; Desc = 'Vì sao trí nhớ dễ bị sai lệch và cách bạn tự kiểm chứng lại ký ức.'; Image = '../assets/images/khoa-hoc-pho-thong/ky-uc-khong-co-that/thumb.jpg'; Body1 = 'Trí nhớ không phải là một chiếc máy ghi âm. Mỗi lần ta nhớ lại, câu chuyện được tái dựng từ nhiều mảnh ghép rời rạc.'; Body2 = 'Điều này giúp ta linh hoạt và sáng tạo, nhưng cũng khiến ta dễ tin vào những chi tiết chưa từng xảy ra.'; Point1 = 'Ký ức chịu ảnh hưởng mạnh từ cảm xúc và bối cảnh.'; Point2 = 'Càng kể lại nhiều lần, ký ức càng dễ bị “chỉnh sửa”.'; Point3 = 'Ghi chép và đối chiếu nguồn giúp ký ức đáng tin hơn.'; BackLink = 'index.html'; BackImage = '../images/pic01.jpg'; BackTitle = 'Khoa học phổ thông'; BackDesc = 'Quay về danh mục để đọc thêm bài viết.' },
    @{ Path = 'khoa-hoc-pho-thong\iq-quoc-gia-va-su-giau-co.html'; Title = 'IQ trung bình và sự giàu có'; Desc = 'Tương quan giữa giáo dục, năng lực nhận thức và sự thịnh vượng của một quốc gia.'; Image = '../assets/images/khoa-hoc-pho-thong/iq-quoc-gia-va-su-giau-co/thumb.jpg'; Body1 = 'Chỉ số IQ trung bình không nói lên tất cả, nhưng nó phản ánh chất lượng dinh dưỡng, giáo dục và môi trường học tập.'; Body2 = 'Một xã hội đầu tư vào kỹ năng nhận thức thường tạo ra năng suất cao và khả năng đổi mới bền vững.'; Point1 = 'IQ cao không tự động tạo ra thịnh vượng nếu thiếu thể chế tốt.'; Point2 = 'Giáo dục nền tảng là đòn bẩy quan trọng nhất.'; Point3 = 'Sự giàu có bền vững đến từ năng lực học tập dài hạn.'; BackLink = 'index.html'; BackImage = '../images/pic02.jpg'; BackTitle = 'Khoa học phổ thông'; BackDesc = 'Danh mục khoa học cho người đọc bận rộn.' },

    @{ Path = 'kinh-te-hoc\chi-phi-co-hoi.html'; Title = 'Chi phí cơ hội: quyết định nhỏ, hệ quả lớn'; Desc = 'Hiểu rõ cái “giá” phải trả khi chọn một phương án thay vì phương án khác.'; Image = '../images/pic02.jpg'; Body1 = 'Mỗi lựa chọn đều có một khoản chi phí ẩn: thứ bạn bỏ qua khi chọn một hướng đi.'; Body2 = 'Nhìn thấy chi phí cơ hội giúp ra quyết định tỉnh táo hơn, đặc biệt khi nguồn lực có hạn.'; Point1 = 'Chi phí cơ hội không chỉ là tiền, mà còn là thời gian và năng lượng.'; Point2 = 'So sánh lợi ích ròng giúp tránh quyết định cảm tính.'; Point3 = 'Viết ra 2–3 phương án giúp thấy rõ cái được và cái mất.'; BackLink = 'index.html'; BackImage = '../images/pic02.jpg'; BackTitle = 'Kinh tế học'; BackDesc = 'Quay về danh mục kinh tế học.' },
    @{ Path = 'kinh-te-hoc\loi-the-so-sanh.html'; Title = 'Lợi thế so sánh và sức mạnh hợp tác'; Desc = 'Vì sao các bên chuyên môn hóa đúng chỗ sẽ tạo ra tổng giá trị lớn hơn.'; Image = '../images/pic05.jpg'; Body1 = 'Lợi thế so sánh cho thấy: ngay cả khi một người giỏi hơn ở mọi thứ, hợp tác vẫn có lợi.'; Body2 = 'Chuyên môn hóa giúp giảm chi phí và tăng chất lượng, tạo ra giá trị chung.'; Point1 = 'Hợp tác hiệu quả dựa trên phân công tối ưu.'; Point2 = 'Tập trung vào thế mạnh giúp tăng năng suất.'; Point3 = 'Trao đổi công bằng giữ cho hệ thống bền vững.'; BackLink = 'index.html'; BackImage = '../images/pic05.jpg'; BackTitle = 'Kinh tế học'; BackDesc = 'Quay về danh mục kinh tế học.' },

    @{ Path = 'tam-ly-hoc\vong-lap-thoi-quen.html'; Title = 'Vòng lặp thói quen và cách thay đổi'; Desc = 'Nhận diện tín hiệu – hành động – phần thưởng để tạo thói quen bền vững.'; Image = '../images/pic03.jpg'; Body1 = 'Thói quen hoạt động như một vòng lặp. Khi bạn hiểu cấu trúc, bạn có thể thay đổi nó.'; Body2 = 'Chỉ cần điều chỉnh một mắt xích nhỏ, hành vi mới sẽ xuất hiện ổn định hơn.'; Point1 = 'Tín hiệu càng rõ, hành động càng dễ bắt đầu.'; Point2 = 'Phần thưởng cần nhanh và đủ hấp dẫn.'; Point3 = 'Ghi nhận tiến bộ giúp duy trì động lực.'; BackLink = 'index.html'; BackImage = '../images/pic03.jpg'; BackTitle = 'Tâm lý học'; BackDesc = 'Quay về danh mục tâm lý học.' },
    @{ Path = 'tam-ly-hoc\thien-kien-xac-nhan.html'; Title = 'Thiên kiến xác nhận'; Desc = 'Vì sao ta thường chỉ tìm bằng chứng củng cố niềm tin có sẵn.'; Image = '../images/pic08.jpg'; Body1 = 'Não bộ thích sự chắc chắn nên ta có xu hướng tìm thứ đồng ý với mình.'; Body2 = 'Nhận diện thiên kiến giúp ta mở rộng góc nhìn và ra quyết định cân bằng hơn.'; Point1 = 'Luôn đặt câu hỏi: điều gì có thể khiến mình sai?'; Point2 = 'Đọc nguồn trái chiều để kiểm tra lập luận.'; Point3 = 'Tách dữ kiện khỏi cảm xúc khi đánh giá.'; BackLink = 'index.html'; BackImage = '../images/pic08.jpg'; BackTitle = 'Tâm lý học'; BackDesc = 'Quay về danh mục tâm lý học.' },

    @{ Path = 'ung-dung-nang-suat\quan-ly-nang-luong.html'; Title = 'Quản lý năng lượng thay vì thời gian'; Desc = 'Làm việc theo nhịp độ sinh học để duy trì hiệu suất bền vững.'; Image = '../images/pic10.jpg'; Body1 = 'Hiệu suất cao nhất xảy ra khi năng lượng ở đỉnh. Không phải giờ nào cũng giống nhau.'; Body2 = 'Chọn việc quan trọng cho khung giờ mạnh nhất sẽ tạo ra kết quả khác biệt.'; Point1 = 'Theo dõi nhịp tỉnh táo trong ngày.'; Point2 = 'Ưu tiên việc khó vào buổi sáng hoặc lúc tập trung nhất.'; Point3 = 'Nghỉ ngắn giúp phục hồi nhanh hơn.'; BackLink = 'index.html'; BackImage = '../images/pic08.jpg'; BackTitle = 'Ứng dụng - Năng suất'; BackDesc = 'Quay về danh mục năng suất.' },
    @{ Path = 'ung-dung-nang-suat\he-thong-3-danh-sach.html'; Title = 'Hệ thống 3 danh sách'; Desc = 'Giữ việc quan trọng ở đúng chỗ để không bị chìm trong việc vặt.'; Image = '../images/pic08.jpg'; Body1 = 'Ba danh sách: Việc quan trọng, Việc đang làm, Việc sau này.'; Body2 = 'Cách này giúp bạn tập trung vào ít việc có tác động lớn.'; Point1 = 'Giới hạn số việc đang làm để tránh quá tải.'; Point2 = 'Tách việc dài hạn để giảm áp lực tâm lý.'; Point3 = 'Mỗi ngày chỉ chọn 1–3 ưu tiên chính.'; BackLink = 'index.html'; BackImage = '../images/pic10.jpg'; BackTitle = 'Ứng dụng - Năng suất'; BackDesc = 'Quay về danh mục năng suất.' }
)

foreach ($article in $articles) {
    $content = $articleTemplate
    $content = $content.Replace('{{TITLE}}', $article.Title)
    $content = $content.Replace('{{DESC}}', $article.Desc)
    $content = $content.Replace('{{IMAGE}}', $article.Image)
    $content = $content.Replace('{{BODY1}}', $article.Body1)
    $content = $content.Replace('{{BODY2}}', $article.Body2)
    $content = $content.Replace('{{POINT1}}', $article.Point1)
    $content = $content.Replace('{{POINT2}}', $article.Point2)
    $content = $content.Replace('{{POINT3}}', $article.Point3)
    $content = $content.Replace('{{BACK_LINK}}', $article.BackLink)
    $content = $content.Replace('{{BACK_IMAGE}}', $article.BackImage)
    $content = $content.Replace('{{BACK_TITLE}}', $article.BackTitle)
    $content = $content.Replace('{{BACK_DESC}}', $article.BackDesc)
    $content = $content.Replace('{{HEADER_LINK}}', $article.BackLink)
    $content = $content.Replace('{{HEADER_TEXT}}', $article.BackTitle)

    $dir = Split-Path -Parent $article.Path
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }
    Set-Content -Path $article.Path -Value $content -Encoding UTF8
}

Write-Host "Generated $($articles.Count) article pages."
