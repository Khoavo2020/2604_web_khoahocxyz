$ErrorActionPreference = 'Stop'

function Get-HeaderTitle([string]$path) {
    $norm = $path.Replace('/', '\')

    if ($norm -match '(^|\\)index\.html$') { return '' }

    if ($norm -match 'khoa-hoc-pho-thong') { return 'Khoa học phổ thông' }
    if ($norm -match 'kinh-te-hoc') { return 'Kinh tế học' }
    if ($norm -match 'tam-ly-hoc') { return 'Tâm lý học' }
    if ($norm -match 'ung-dung-nang-suat') { return 'Ứng dụng - Năng suất' }
    if ($norm -match 'tinh-hoa-nhan-loai') { return 'Tinh hoa - nhân loại' }

    if ($norm -match 'triet-hoc\\phuong-dong') { return 'Phương Đông' }
    if ($norm -match 'triet-hoc\\phuong-tay') { return 'Phương Tây' }
    if ($norm -match 'triet-hoc\\tho-viet-nam') { return 'Thơ Việt Nam' }
    if ($norm -match 'triet-hoc\\tho-nuoc-ngoai') { return 'Thơ nước ngoài' }
    if ($norm -match 'triet-hoc') { return 'Triết học' }

    if ($norm -match 'tu-sach-nen-tang\\sach-khoa-hoc-pho-thong') { return 'Sách khoa học phổ thông' }
    if ($norm -match 'tu-sach-nen-tang\\sach-kinh-te-hoc') { return 'Sách kinh tế học' }
    if ($norm -match 'tu-sach-nen-tang\\sach-tam-ly-hoc') { return 'Sách tâm lý học' }
    if ($norm -match 'tu-sach-nen-tang\\sach-triet-hoc') { return 'Sách triết học' }
    if ($norm -match 'tu-sach-nen-tang\\sach-xyz') { return 'Sách chọn lọc' }
    if ($norm -match 'tu-sach-nen-tang') { return 'Tủ sách nền tảng' }

    if ($norm -match 'templates\\generic\.html') { return 'Bài viết' }
    if ($norm -match 'templates\\elements\.html') { return 'Nút bấm, bảng biểu' }

    return 'Khoahoc'
}

$files = Get-ChildItem -Recurse -Filter *.html -File | ForEach-Object { $_.FullName }

foreach ($file in $files) {
    $content = Get-Content -Raw $file

    if ($file -match '(^|\\)index\.html$') {
        $replacement = '<strong>Khoahoc</strong>.xyz'
    } else {
        $title = Get-HeaderTitle $file
        if (-not $title) { $title = 'Khoahoc' }
        $replacement = "<strong>$title</strong>"
    }

    $pattern = '(<a[^>]*class="logo"[^>]*>)([\s\S]*?)(</a>)'
    $content = [regex]::Replace($content, $pattern, "`$1$replacement`$3", 1)

    Set-Content -Path $file -Value $content -Encoding UTF8
}

Write-Host "Updated logo text for $($files.Count) HTML files." 
