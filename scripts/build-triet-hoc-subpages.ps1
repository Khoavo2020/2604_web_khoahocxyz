$ErrorActionPreference = 'Stop'

$indexTemplate = @"
<!DOCTYPE HTML>

<html>
	<head>
		<title>{{TITLE}} - Khoahoc.xyz</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
		<header id="header">
			<a href="../../index.html" class="logo"><strong>Khoahoc</strong>.xyz</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h2>{{TITLE}}</h2>
										<p>{{DESC}}</p>
									</header>

									<div class="posts">
{{POSTS}}
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
										<li><a href="../../index.html">🏠 Khoahoc.xyz</a></li>
										<li><a href="../../khoa-hoc-pho-thong/index.html">🔭 Khoa học phổ thông</a></li>
										<li><a href="../../kinh-te-hoc/index.html">💰 Kinh tế học</a></li>
										<li><a href="../../tam-ly-hoc/index.html">🧠 Tâm lý học</a></li>
										<li>
											<span class="opener">🏛 Triết học</span>
											<ul>
												<li><a href="../../triet-hoc/index.html">Tổng quan triết học</a></li>
												<li><a href="../../triet-hoc/phuong-dong/index.html">Phương Đông</a></li>
												<li><a href="../../triet-hoc/phuong-tay/index.html">Phương Tây</a></li>
												<li><a href="../../triet-hoc/tho-viet-nam/index.html">Thơ Việt Nam</a></li>
												<li><a href="../../triet-hoc/tho-nuoc-ngoai/index.html">Thơ nước ngoài</a></li>
											</ul>
										</li>
										<li><a href="../../tinh-hoa-nhan-loai/index.html">🧭 Tinh hoa - nhân loại</a></li>
										<li>
											<span class="opener">📚 Tủ sách - nền tảng</span>
											<ul>
												<li><a href="../../tu-sach-nen-tang/index.html">Tổng quan tủ sách</a></li>
												<li><a href="../../tu-sach-nen-tang/sach-khoa-hoc-pho-thong/index.html">Sách khoa học phổ thông</a></li>
												<li><a href="../../tu-sach-nen-tang/sach-kinh-te-hoc/index.html">Sách kinh tế học</a></li>
												<li><a href="../../tu-sach-nen-tang/sach-tam-ly-hoc/index.html">Sách tâm lý học</a></li>
												<li><a href="../../tu-sach-nen-tang/sach-triet-hoc/index.html">Sách triết học</a></li>
												<li><a href="../../tu-sach-nen-tang/sach-xyz/index.html">Sách chọn lọc</a></li>
											</ul>
										</li>
										<li><a href="../../ung-dung-nang-suat/index.html">📱 Ứng dụng - năng suất</a></li>


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
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../../assets/js/browser.min.js"></script>
			<script src="../../assets/js/breakpoints.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<script src="../../assets/js/main.js"></script>

	</body>
</html>
"@

$articleTemplate = @"
<!DOCTYPE HTML>

<html>
	<head>
		<title>{{TITLE}} - Khoahoc.xyz</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
		<header id="header">
			<a href="index.html" class="logo"><strong>{{HEADER_TEXT}}</strong></a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Content -->
								<section>
									<header class="main">
										<h2>{{TITLE}}</h2>
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
											<a href="index.html" class="image"><img src="../../images/pic04.jpg" alt="" /></a>
											<h3>{{BACK_TITLE}}</h3>
											<p>{{BACK_DESC}}</p>
											<ul class="actions">
												<li><a href="index.html" class="button">Quay về mục</a></li>
											</ul>
										</article>
										<article>
											<a href="../../tinh-hoa-nhan-loai/index.html" class="image"><img src="../../images/pic06.jpg" alt="" /></a>
											<h3>Tinh hoa - nhân loại</h3>
											<p>Trích dẫn ngắn gọn để chiêm nghiệm sâu hơn.</p>
											<ul class="actions">
												<li><a href="../../tinh-hoa-nhan-loai/index.html" class="button">Xem trích dẫn</a></li>
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
										<li><a href="../../index.html">🏠 Khoahoc.xyz</a></li>
										<li><a href="../../khoa-hoc-pho-thong/index.html">🔭 Khoa học phổ thông</a></li>
										<li><a href="../../kinh-te-hoc/index.html">💰 Kinh tế học</a></li>
										<li><a href="../../tam-ly-hoc/index.html">🧠 Tâm lý học</a></li>
										<li>
											<span class="opener">🏛 Triết học</span>
											<ul>
												<li><a href="../../triet-hoc/index.html">Tổng quan triết học</a></li>
												<li><a href="../../triet-hoc/phuong-dong/index.html">Phương Đông</a></li>
												<li><a href="../../triet-hoc/phuong-tay/index.html">Phương Tây</a></li>
												<li><a href="../../triet-hoc/tho-viet-nam/index.html">Thơ Việt Nam</a></li>
												<li><a href="../../triet-hoc/tho-nuoc-ngoai/index.html">Thơ nước ngoài</a></li>
											</ul>
										</li>
										<li><a href="../../tinh-hoa-nhan-loai/index.html">🧭 Tinh hoa - nhân loại</a></li>
										<li>
											<span class="opener">📚 Tủ sách - nền tảng</span>
											<ul>
												<li><a href="../../tu-sach-nen-tang/index.html">Tổng quan tủ sách</a></li>
												<li><a href="../../tu-sach-nen-tang/sach-khoa-hoc-pho-thong/index.html">Sách khoa học phổ thông</a></li>
												<li><a href="../../tu-sach-nen-tang/sach-kinh-te-hoc/index.html">Sách kinh tế học</a></li>
												<li><a href="../../tu-sach-nen-tang/sach-tam-ly-hoc/index.html">Sách tâm lý học</a></li>
												<li><a href="../../tu-sach-nen-tang/sach-triet-hoc/index.html">Sách triết học</a></li>
												<li><a href="../../tu-sach-nen-tang/sach-xyz/index.html">Sách chọn lọc</a></li>
											</ul>
										</li>
										<li><a href="../../ung-dung-nang-suat/index.html">📱 Ứng dụng - năng suất</a></li>


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
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../../assets/js/browser.min.js"></script>
			<script src="../../assets/js/breakpoints.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<script src="../../assets/js/main.js"></script>

	</body>
</html>
"@

$subPages = @(
    @{ Folder = 'triet-hoc\phuong-dong'; Title = 'Triết học phương Đông'; Desc = 'Đạo, vô vi, tu dưỡng và cách sống hài hòa với tự nhiên.'; Posts = @(
        @{ File = 'dao-va-vo-vi.html'; Title = 'Đạo và vô vi'; Desc = 'Sống thuận theo tự nhiên nhưng vẫn chủ động hành động đúng lúc.'; Image = '../../images/pic04.jpg'; Body1 = 'Vô vi không phải là không làm, mà là làm đúng nhịp, đúng lúc.'; Body2 = 'Tư tưởng Đạo nhấn mạnh sự mềm dẻo, giản lược và thuận theo tự nhiên.'; Point1 = 'Giữ tâm trí tĩnh để thấy việc cần làm.'; Point2 = 'Ưu tiên hành động ít nhưng hiệu quả.'; Point3 = 'Sự mềm dẻo tạo ra sức mạnh bền vững.' },
        @{ File = 'thuc-hanh-tinh-tao.html'; Title = 'Thực hành tỉnh táo'; Desc = 'Quan sát tâm trí để sống hiện diện và sáng suốt.'; Image = '../../images/pic07.jpg'; Body1 = 'Tỉnh táo giúp bạn nhìn rõ cảm xúc trước khi phản ứng.'; Body2 = 'Sự hiện diện tạo ra khoảng trống để lựa chọn tốt hơn.'; Point1 = 'Thở chậm giúp đưa tâm trí về hiện tại.'; Point2 = 'Quan sát thay vì phán xét.'; Point3 = 'Ghi nhận giúp duy trì thói quen.' }
    ) },
    @{ Folder = 'triet-hoc\phuong-tay'; Title = 'Triết học phương Tây'; Desc = 'Logic, đạo đức học và những câu hỏi về tự do con người.'; Posts = @(
        @{ File = 'duy-ly-va-khoa-hoc.html'; Title = 'Duy lý và khoa học'; Desc = 'Tư duy logic đã mở đường cho khoa học hiện đại.'; Image = '../../images/pic01.jpg'; Body1 = 'Duy lý yêu cầu lập luận rõ ràng và bằng chứng kiểm chứng.'; Body2 = 'Tinh thần hoài nghi giúp khoa học liên tục tiến bộ.'; Point1 = 'Đặt câu hỏi đúng là nửa chặng đường.'; Point2 = 'Bằng chứng mạnh hơn trực giác.'; Point3 = 'Logic giúp giảm lỗi suy nghĩ.' },
        @{ File = 'hien-sinh-va-trach-nhiem.html'; Title = 'Hiện sinh và trách nhiệm'; Desc = 'Tự do đi cùng trách nhiệm và ý nghĩa do ta tự tạo.'; Image = '../../images/pic06.jpg'; Body1 = 'Hiện sinh đặt con người trước câu hỏi: sống để làm gì?'; Body2 = 'Không có sẵn ý nghĩa, ta phải tự kiến tạo.'; Point1 = 'Tự do luôn đi kèm lựa chọn khó.'; Point2 = 'Trách nhiệm là phần không thể tách rời.'; Point3 = 'Chấp nhận bất định để sống thật.' }
    ) },
    @{ Folder = 'triet-hoc\tho-viet-nam'; Title = 'Thơ Việt Nam'; Desc = 'Những bài thơ gợi mở về thân phận, tình yêu và thời gian.'; Posts = @(
        @{ File = 'tho-va-than-phan.html'; Title = 'Thơ và thân phận'; Desc = 'Những tiếng nói chạm vào nỗi cô đơn và khát vọng.'; Image = '../../images/pic07.jpg'; Body1 = 'Thơ Việt thường dung dị nhưng sâu sắc, chạm vào phần người nhất.'; Body2 = 'Từ tình quê đến thân phận, thơ mở ra không gian suy tưởng.'; Point1 = 'Ngôn ngữ giản dị tạo độ vang dài.'; Point2 = 'Hình ảnh giàu tính gợi mở.'; Point3 = 'Thơ là nơi trú ẩn của cảm xúc.' },
        @{ File = 'thoi-gian-ky-uc.html'; Title = 'Thời gian và ký ức'; Desc = 'Thơ lưu giữ những mảnh ký ức mong manh.'; Image = '../../images/pic09.jpg'; Body1 = 'Ký ức trong thơ là chiếc cầu nối giữa quá khứ và hiện tại.'; Body2 = 'Những hình ảnh nhỏ bé có thể mang sức nặng lớn.'; Point1 = 'Thời gian làm đẹp và cũng làm mờ.'; Point2 = 'Thơ giữ lại điều tưởng đã mất.'; Point3 = 'Ký ức giúp ta hiểu mình hơn.' }
    ) },
    @{ Folder = 'triet-hoc\tho-nuoc-ngoai'; Title = 'Thơ nước ngoài'; Desc = 'Những bài thơ kinh điển mở rộng cảm thức về nhân sinh.'; Posts = @(
        @{ File = 'tuong-trung-va-tieng-vang.html'; Title = 'Tượng trưng và tiếng vang'; Desc = 'Ngôn ngữ gợi mở giúp thơ vượt khỏi biên giới.'; Image = '../../images/pic02.jpg'; Body1 = 'Thơ tượng trưng không nói thẳng, mà gợi một không gian cảm xúc.'; Body2 = 'Đó là nơi người đọc trở thành đồng tác giả.'; Point1 = 'Ẩn dụ tạo chiều sâu.'; Point2 = 'Âm điệu dẫn dắt cảm xúc.'; Point3 = 'Khoảng lặng làm nên dư âm.' },
        @{ File = 'tinh-yeu-va-than-phan.html'; Title = 'Tình yêu và thân phận'; Desc = 'Những dòng thơ về yêu thương và sự mong manh.'; Image = '../../images/pic08.jpg'; Body1 = 'Thơ tình không chỉ nói về tình yêu mà còn về sự tồn tại.'; Body2 = 'Cảm xúc cá nhân trở thành tiếng nói chung.'; Point1 = 'Yêu là cách ta nhận ra giá trị sống.'; Point2 = 'Sự mong manh tạo nên vẻ đẹp.'; Point3 = 'Tình yêu là ký ức sống động nhất.' }
    ) }
)

foreach ($page in $subPages) {
    $postBlocks = @()
    foreach ($post in $page.Posts) {
        $postBlocks += ('
<article>
	<a href="{0}" class="image"><img src="{1}" alt="" /></a>
	<h3>{2}</h3>
	<p>{3}</p>
	<ul class="actions">
		<li><a href="{0}" class="button">Đọc thêm</a></li>
	</ul>
</article>
' -f $post.File, $post.Image, $post.Title, $post.Desc)
    }

    $postsHtml = ($postBlocks -join "")
    $indexContent = $indexTemplate.Replace('{{TITLE}}', $page.Title).Replace('{{DESC}}', $page.Desc).Replace('{{POSTS}}', $postsHtml)
    $indexContent = $indexContent.Replace('{{HEADER_TEXT}}', $page.Title)
    $indexPath = Join-Path $page.Folder 'index.html'
    Set-Content -Path $indexPath -Value $indexContent -Encoding UTF8

    foreach ($post in $page.Posts) {
        $articleContent = $articleTemplate
        $articleContent = $articleContent.Replace('{{TITLE}}', $post.Title)
        $articleContent = $articleContent.Replace('{{DESC}}', $post.Desc)
        $articleContent = $articleContent.Replace('{{IMAGE}}', $post.Image)
        $articleContent = $articleContent.Replace('{{BODY1}}', $post.Body1)
        $articleContent = $articleContent.Replace('{{BODY2}}', $post.Body2)
        $articleContent = $articleContent.Replace('{{POINT1}}', $post.Point1)
        $articleContent = $articleContent.Replace('{{POINT2}}', $post.Point2)
        $articleContent = $articleContent.Replace('{{POINT3}}', $post.Point3)
        $articleContent = $articleContent.Replace('{{BACK_TITLE}}', $page.Title)
        $articleContent = $articleContent.Replace('{{BACK_DESC}}', $page.Desc)
        $articleContent = $articleContent.Replace('{{HEADER_TEXT}}', $page.Title)

        $articlePath = Join-Path $page.Folder $post.File
        Set-Content -Path $articlePath -Value $articleContent -Encoding UTF8
    }
}

Write-Host "Generated triet-hoc subpages and articles." 
