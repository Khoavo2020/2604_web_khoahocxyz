$ErrorActionPreference = 'Stop'

$files = Get-ChildItem -Recurse -Filter *.html -File | ForEach-Object { $_.FullName }

foreach ($file in $files) {
    $content = Get-Content -Raw $file
    $pattern = '(<a[^>]*class="logo"[^>]*>)([\s\S]*?)(</a>)'
    $replacement = '$1<strong>Khoahoc</strong>.xyz$3'
    $content = [regex]::Replace($content, $pattern, $replacement, 1)
    Set-Content -Path $file -Value $content -Encoding UTF8
}

Write-Host "Reset logo text in $($files.Count) HTML files." 
