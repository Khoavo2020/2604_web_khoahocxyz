$ErrorActionPreference = 'Stop'

$menuRoot = @"
<nav id="menu">
	<header class="major">
		<h2>Menu</h2>
	</header>
	<ul>
		<li><a href="index.html">🏠 Khóa học</a></li>
		<li><a href="khoa-hoc-pho-thong/index.html">🔭 Khoa học phổ thông</a></li>
		<li><a href="kinh-te-hoc/index.html">💰 Kinh tế học</a></li>
		<li><a href="tam-ly-hoc/index.html">🧠 Tâm lý học</a></li>
		<li>
			<span class="opener">🏛 Triết học</span>
			<ul>
				<li><a href="triet-hoc/index.html">Tổng quan triết học</a></li>
				<li><a href="triet-hoc/phuong-dong/index.html">Phương Đông</a></li>
				<li><a href="triet-hoc/phuong-tay/index.html">Phương Tây</a></li>
				<li><a href="triet-hoc/tho-viet-nam/index.html">Thơ Việt Nam</a></li>
				<li><a href="triet-hoc/tho-nuoc-ngoai/index.html">Thơ nước ngoài</a></li>
			</ul>
		</li>
		<li><a href="tinh-hoa-nhan-loai/index.html">🧭 Tinh hoa - nhân loại</a></li>
		<li>
			<span class="opener">📚 Tủ sách - nền tảng</span>
			<ul>
				<li><a href="tu-sach-nen-tang/index.html">Tổng quan tủ sách</a></li>
				<li><a href="tu-sach-nen-tang/sach-khoa-hoc-pho-thong/index.html">Sách khoa học phổ thông</a></li>
				<li><a href="tu-sach-nen-tang/sach-kinh-te-hoc/index.html">Sách kinh tế học</a></li>
				<li><a href="tu-sach-nen-tang/sach-tam-ly-hoc/index.html">Sách tâm lý học</a></li>
				<li><a href="tu-sach-nen-tang/sach-triet-hoc/index.html">Sách triết học</a></li>
				<li><a href="tu-sach-nen-tang/sach-xyz/index.html">Sách chọn lọc</a></li>
			</ul>
		</li>
		<li><a href="ung-dung-nang-suat/index.html">📱 Ứng dụng - năng suất</a></li>
		<li><a href="templates/generic.html">bài viết</a></li>
		<li><a href="templates/elements.html">nút bấm, bảng biểu</a></li>
	</ul>
</nav>
"@

$menuLevel1 = @"
<nav id="menu">
	<header class="major">
		<h2>Menu</h2>
	</header>
	<ul>
		<li><a href="../index.html">🏠 Khóa học</a></li>
		<li><a href="../khoa-hoc-pho-thong/index.html">🔭 Khoa học phổ thông</a></li>
		<li><a href="../kinh-te-hoc/index.html">💰 Kinh tế học</a></li>
		<li><a href="../tam-ly-hoc/index.html">🧠 Tâm lý học</a></li>
		<li>
			<span class="opener">🏛 Triết học</span>
			<ul>
				<li><a href="../triet-hoc/index.html">Tổng quan triết học</a></li>
				<li><a href="../triet-hoc/phuong-dong/index.html">Phương Đông</a></li>
				<li><a href="../triet-hoc/phuong-tay/index.html">Phương Tây</a></li>
				<li><a href="../triet-hoc/tho-viet-nam/index.html">Thơ Việt Nam</a></li>
				<li><a href="../triet-hoc/tho-nuoc-ngoai/index.html">Thơ nước ngoài</a></li>
			</ul>
		</li>
		<li><a href="../tinh-hoa-nhan-loai/index.html">🧭 Tinh hoa - nhân loại</a></li>
		<li>
			<span class="opener">📚 Tủ sách - nền tảng</span>
			<ul>
				<li><a href="../tu-sach-nen-tang/index.html">Tổng quan tủ sách</a></li>
				<li><a href="../tu-sach-nen-tang/sach-khoa-hoc-pho-thong/index.html">Sách khoa học phổ thông</a></li>
				<li><a href="../tu-sach-nen-tang/sach-kinh-te-hoc/index.html">Sách kinh tế học</a></li>
				<li><a href="../tu-sach-nen-tang/sach-tam-ly-hoc/index.html">Sách tâm lý học</a></li>
				<li><a href="../tu-sach-nen-tang/sach-triet-hoc/index.html">Sách triết học</a></li>
				<li><a href="../tu-sach-nen-tang/sach-xyz/index.html">Sách chọn lọc</a></li>
			</ul>
		</li>
		<li><a href="../ung-dung-nang-suat/index.html">📱 Ứng dụng - năng suất</a></li>
		<li><a href="../templates/generic.html">bài viết</a></li>
		<li><a href="../templates/elements.html">nút bấm, bảng biểu</a></li>
	</ul>
</nav>
"@

$menuLevel2 = @"
<nav id="menu">
	<header class="major">
		<h2>Menu</h2>
	</header>
	<ul>
		<li><a href="../../index.html">🏠 Khóa học</a></li>
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
		<li><a href="../../templates/generic.html">bài viết</a></li>
		<li><a href="../../templates/elements.html">nút bấm, bảng biểu</a></li>
	</ul>
</nav>
"@

$rootFiles = @('index.html')
$level1Files = @()
$level2Files = @()

$level1Files += Get-ChildItem -Path 'khoa-hoc-pho-thong' -Filter *.html -File | ForEach-Object { $_.FullName }
$level1Files += Get-ChildItem -Path 'kinh-te-hoc' -Filter *.html -File | ForEach-Object { $_.FullName }
$level1Files += Get-ChildItem -Path 'tam-ly-hoc' -Filter *.html -File | ForEach-Object { $_.FullName }
$level1Files += Get-ChildItem -Path 'triet-hoc' -Filter *.html -File | ForEach-Object { $_.FullName }
$level1Files += Get-ChildItem -Path 'ung-dung-nang-suat' -Filter *.html -File | ForEach-Object { $_.FullName }
$level1Files += Get-ChildItem -Path 'tinh-hoa-nhan-loai' -Filter *.html -File | ForEach-Object { $_.FullName }
$level1Files += Get-ChildItem -Path 'tu-sach-nen-tang' -Filter *.html -File | ForEach-Object { $_.FullName }
$level1Files += Get-ChildItem -Path 'templates' -Filter *.html -File | ForEach-Object { $_.FullName }

$level2Files += Get-ChildItem -Path 'tu-sach-nen-tang' -Filter *.html -Recurse -File | Where-Object { $_.FullName -match 'sach-' } | ForEach-Object { $_.FullName }
$level2Files += Get-ChildItem -Path 'triet-hoc' -Filter *.html -Recurse -File | Where-Object { $_.FullName -match 'phuong-|tho-' } | ForEach-Object { $_.FullName }

function Update-Menu([string]$filePath, [string]$menuHtml) {
    $content = Get-Content -Raw $filePath
    if ($content -match '<nav id="menu">') {
        $updated = [regex]::Replace($content, '<nav id="menu">[\s\S]*?</nav>', $menuHtml)
        Set-Content -Path $filePath -Value $updated -Encoding UTF8
    }
}

foreach ($file in $rootFiles) { Update-Menu $file $menuRoot }
foreach ($file in $level1Files) { Update-Menu $file $menuLevel1 }
foreach ($file in $level2Files) { Update-Menu $file $menuLevel2 }

Write-Host "Menus updated. Root: $($rootFiles.Count), level1: $($level1Files.Count), level2: $($level2Files.Count)." 
