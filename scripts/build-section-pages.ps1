$ErrorActionPreference = 'Stop'

$pages = @()

$pages += @{ Path = 'index.html'; Content = @"
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Khoahoc.xyz</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.html" class="logo"><strong>Khoahoc</strong>.xyz</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h2>Học sâu, hiểu rõ, sống tỉnh táo</h2>
											<p>Kho nội dung nền tảng cho tư duy dài hạn.</p>
										</header>
										<p>Mỗi mục được biên tập ngắn gọn, dễ theo dõi và có thể áp dụng ngay.</p>
										<ul class="actions">
											<li><a href="tu-sach-nen-tang/index.html" class="button big">Khám phá tủ sách</a></li>
										</ul>
									</div>
									<span class="image object">
										<img src="images/pic10.jpg" alt="" />
									</span>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Các mục chính</h2>
									</header>
									<div class="posts">
										<article>
											<a href="khoa-hoc-pho-thong/index.html" class="image"><img src="images/pic01.jpg" alt="" /></a>
											<h3>Khoa học phổ thông</h3>
											<p>Bài viết ngắn gọn giúp bạn hiểu nhanh các khái niệm quan trọng.</p>
											<ul class="actions">
												<li><a href="khoa-hoc-pho-thong/index.html" class="button">Xem mục</a></li>
											</ul>
										</article>
										<article>
											<a href="kinh-te-hoc/index.html" class="image"><img src="images/pic02.jpg" alt="" /></a>
											<h3>Kinh tế học</h3>
											<p>Khung tư duy về lựa chọn, thị trường và hệ quả dài hạn.</p>
											<ul class="actions">
												<li><a href="kinh-te-hoc/index.html" class="button">Xem mục</a></li>
											</ul>
										</article>
										<article>
											<a href="tam-ly-hoc/index.html" class="image"><img src="images/pic03.jpg" alt="" /></a>
											<h3>Tâm lý học</h3>
											<p>Hiểu hành vi con người và các thiên kiến trong quyết định.</p>
											<ul class="actions">
												<li><a href="tam-ly-hoc/index.html" class="button">Xem mục</a></li>
											</ul>
										</article>
										<article>
											<a href="triet-hoc/index.html" class="image"><img src="images/pic04.jpg" alt="" /></a>
											<h3>Triết học</h3>
											<p>Những câu hỏi nền tảng về ý nghĩa, đạo đức và lối sống.</p>
											<ul class="actions">
												<li><a href="triet-hoc/index.html" class="button">Xem mục</a></li>
											</ul>
										</article>
										<article>
											<a href="tinh-hoa-nhan-loai/index.html" class="image"><img src="images/pic06.jpg" alt="" /></a>
											<h3>Tinh hoa - Nhân loại</h3>
											<p>Trích dẫn chọn lọc để nuôi dưỡng tư duy dài hạn.</p>
											<ul class="actions">
												<li><a href="tinh-hoa-nhan-loai/index.html" class="button">Xem mục</a></li>
											</ul>
										</article>
										<article>
											<a href="tu-sach-nen-tang/index.html" class="image"><img src="images/pic05.jpg" alt="" /></a>
											<h3>Tủ sách nền tảng</h3>
											<p>Kho ebook phân loại theo chủ đề để học sâu.</p>
											<ul class="actions">
												<li><a href="tu-sach-nen-tang/index.html" class="button">Xem mục</a></li>
											</ul>
										</article>
										<article>
											<a href="ung-dung-nang-suat/index.html" class="image"><img src="images/pic08.jpg" alt="" /></a>
											<h3>Ứng dụng - Năng suất</h3>
											<p>Công cụ và hệ thống làm việc hiệu quả.</p>
											<ul class="actions">
												<li><a href="ung-dung-nang-suat/index.html" class="button">Xem mục</a></li>
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
										<li><a href="index.html">🏠 Khoahoc.xyz</a></li>
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
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>
"@ }

$pages += @{ Path = 'khoa-hoc-pho-thong\index.html'; Content = @"
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Khoa học phổ thông - Khoahoc.xyz</title>
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
									<a href="../index.html" class="logo"><strong>Khoahoc</strong>.xyz</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h1>Khoa học phổ thông</h1>
										<p>Hiệu ứng Matthew: Internet làm người thông minh thông minh hơn và người ngu ngu hơn</p>
									</header>

									<div class="posts">
										<article>
											<a href="ky-uc-khong-co-that.html" class="image">
												<img src="../assets/images/khoa-hoc-pho-thong/ky-uc-khong-co-that/thumb.jpg" alt="" />
											</a>
											<h3>Ký ức không có thật</h3>
											<p>Trí nhớ có thể bị “điều chỉnh” mỗi lần bạn kể lại.</p>
											<ul class="actions">
												<li><a href="ky-uc-khong-co-that.html" class="button">Đọc thêm</a></li>
											</ul>
										</article>
										<article>
											<a href="iq-quoc-gia-va-su-giau-co.html" class="image">
												<img src="../assets/images/khoa-hoc-pho-thong/iq-quoc-gia-va-su-giau-co/thumb.jpg" alt="" />
											</a>
											<h3>IQ trung bình và sự giàu có</h3>
											<p>Mối liên hệ giữa giáo dục, năng lực nhận thức và thịnh vượng.</p>
											<ul class="actions">
												<li><a href="iq-quoc-gia-va-su-giau-co.html" class="button">Đọc thêm</a></li>
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
"@ }

$pages += @{ Path = 'kinh-te-hoc\index.html'; Content = @"
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Kinh tế học - Khoahoc.xyz</title>
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
									<a href="../index.html" class="logo"><strong>Khoahoc</strong>.xyz</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h1>Kinh tế học</h1>
										<p>Kinh tế học giải đáp những câu hỏi về cách xã hội vận hành</p>
									</header>

									<div class="posts">
										<article>
											<a href="chi-phi-co-hoi.html" class="image"><img src="../images/pic02.jpg" alt="" /></a>
											<h3>Chi phí cơ hội</h3>
											<p>Nhìn rõ cái được và cái mất trong mỗi lựa chọn.</p>
											<ul class="actions">
												<li><a href="chi-phi-co-hoi.html" class="button">Đọc thêm</a></li>
											</ul>
										</article>
										<article>
											<a href="loi-the-so-sanh.html" class="image"><img src="../images/pic05.jpg" alt="" /></a>
											<h3>Lợi thế so sánh</h3>
											<p>Vì sao hợp tác và chuyên môn hóa tạo ra giá trị chung.</p>
											<ul class="actions">
												<li><a href="loi-the-so-sanh.html" class="button">Đọc thêm</a></li>
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
"@ }

$pages += @{ Path = 'tam-ly-hoc\index.html'; Content = @"
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Tâm lý học - Khoahoc.xyz</title>
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
									<a href="../index.html" class="logo"><strong>Khoahoc</strong>.xyz</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h1>Tâm lý học</h1>
										<p>Tâm lý học giải đáp những câu hỏi về hành vi của con người</p>
									</header>

									<div class="posts">
										<article>
											<a href="vong-lap-thoi-quen.html" class="image"><img src="../images/pic03.jpg" alt="" /></a>
											<h3>Vòng lặp thói quen</h3>
											<p>Nhận diện tín hiệu – hành động – phần thưởng để thay đổi.</p>
											<ul class="actions">
												<li><a href="vong-lap-thoi-quen.html" class="button">Đọc thêm</a></li>
											</ul>
										</article>
										<article>
											<a href="thien-kien-xac-nhan.html" class="image"><img src="../images/pic08.jpg" alt="" /></a>
											<h3>Thiên kiến xác nhận</h3>
											<p>Vì sao ta dễ chỉ tin vào điều củng cố niềm tin sẵn có.</p>
											<ul class="actions">
												<li><a href="thien-kien-xac-nhan.html" class="button">Đọc thêm</a></li>
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
"@ }

$pages += @{ Path = 'triet-hoc\index.html'; Content = @"
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Triết học - Khoahoc.xyz</title>
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
									<a href="../index.html" class="logo"><strong>Khoahoc</strong>.xyz</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h1>Triết học</h1>
										<p>Triết học giải đáp những câu hỏi về ý nghĩa của sự tồn tại</p>
									</header>

									<div class="posts">
										<article>
											<a href="phuong-dong/index.html" class="image"><img src="../images/pic04.jpg" alt="" /></a>
											<h3>Phương Đông</h3>
											<p>Đạo, vô vi và lối sống hài hòa với tự nhiên.</p>
											<ul class="actions">
												<li><a href="phuong-dong/index.html" class="button">Xem mục</a></li>
											</ul>
										</article>
										<article>
											<a href="phuong-tay/index.html" class="image"><img src="../images/pic01.jpg" alt="" /></a>
											<h3>Phương Tây</h3>
											<p>Logic, hiện sinh và tư duy phản biện.</p>
											<ul class="actions">
												<li><a href="phuong-tay/index.html" class="button">Xem mục</a></li>
											</ul>
										</article>
										<article>
											<a href="tho-viet-nam/index.html" class="image"><img src="../images/pic07.jpg" alt="" /></a>
											<h3>Thơ Việt Nam</h3>
											<p>Cảm thức nhân sinh qua thơ ca Việt.</p>
											<ul class="actions">
												<li><a href="tho-viet-nam/index.html" class="button">Xem mục</a></li>
											</ul>
										</article>
										<article>
											<a href="tho-nuoc-ngoai/index.html" class="image"><img src="../images/pic09.jpg" alt="" /></a>
											<h3>Thơ nước ngoài</h3>
											<p>Gợi mở cảm xúc và tư tưởng từ văn học thế giới.</p>
											<ul class="actions">
												<li><a href="tho-nuoc-ngoai/index.html" class="button">Xem mục</a></li>
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
"@ }

$pages += @{ Path = 'ung-dung-nang-suat\index.html'; Content = @"
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Ứng dụng - Năng suất - Khoahoc.xyz</title>
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
									<a href="../index.html" class="logo"><strong>Khoahoc</strong>.xyz</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h1>Ứng dụng - Năng suất</h1>
										<p>Thời gian là tất cả những gì bạn có</p>
									</header>

									<div class="posts">
										<article>
											<a href="quan-ly-nang-luong.html" class="image"><img src="../images/pic10.jpg" alt="" /></a>
											<h3>Quản lý năng lượng</h3>
											<p>Tập trung vào nhịp sinh học để làm việc bền vững.</p>
											<ul class="actions">
												<li><a href="quan-ly-nang-luong.html" class="button">Đọc thêm</a></li>
											</ul>
										</article>
										<article>
											<a href="he-thong-3-danh-sach.html" class="image"><img src="../images/pic08.jpg" alt="" /></a>
											<h3>Hệ thống 3 danh sách</h3>
											<p>Giữ việc quan trọng ở đúng chỗ để không bị quá tải.</p>
											<ul class="actions">
												<li><a href="he-thong-3-danh-sach.html" class="button">Đọc thêm</a></li>
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
"@ }

foreach ($page in $pages) {
    $dir = Split-Path -Parent $page.Path
    if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }
    Set-Content -Path $page.Path -Value $page.Content -Encoding UTF8
}

Write-Host "Updated $($pages.Count) section pages." 
