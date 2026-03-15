$ErrorActionPreference = 'Stop'

$root = Join-Path $PSScriptRoot '..\assets\ebooks'
$manifestPath = Join-Path $root 'manifest.json'

$categoryTitles = @{
    'sach-khoa-hoc-pho-thong' = 'Sách khoa học phổ thông'
    'sach-kinh-te-hoc' = 'Sách kinh tế học'
    'sach-tam-ly-hoc' = 'Sách tâm lý học'
    'sach-triet-hoc' = 'Sách triết học'
    'sach-xyz' = 'Sách chọn lọc'
}

$categories = @()

Get-ChildItem -Path $root -Directory | Sort-Object Name | ForEach-Object {
    $catId = $_.Name
    $title = $categoryTitles[$catId]
    if (-not $title) { $title = $catId }

    $items = @(
        Get-ChildItem -Path $_.FullName -File |
            Sort-Object Name |
            ForEach-Object {
                [ordered]@{
                    file = $_.Name
                    ext = $_.Extension.TrimStart('.')
                    size = $_.Length
                }
            }
    )

    $categories += [ordered]@{
        id = $catId
        title = $title
        items = $items
    }
}

$manifest = [ordered]@{
    generatedAt = (Get-Date).ToString('s')
    categories = $categories
}

$manifest | ConvertTo-Json -Depth 6 | Set-Content -Path $manifestPath -Encoding UTF8

Write-Host "Updated manifest with $($categories.Count) categories."
