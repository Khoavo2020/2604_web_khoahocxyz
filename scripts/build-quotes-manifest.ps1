$ErrorActionPreference = 'Stop'

$quotesDir = Join-Path $PSScriptRoot '..\data\tinh-hoa-nhan-loai\quotes'
$manifestPath = Join-Path $quotesDir 'manifest.json'

$files = Get-ChildItem -Path $quotesDir -Filter *.txt -File |
    Where-Object { $_.Name -ne 'manifest.json' } |
    Sort-Object Name |
    ForEach-Object { $_.Name }

$files | ConvertTo-Json -Depth 1 | Set-Content -Path $manifestPath -Encoding UTF8

Write-Host "Updated manifest with $($files.Count) files."
