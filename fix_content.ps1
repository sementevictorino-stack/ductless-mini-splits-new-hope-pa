# PowerShell script to fix specific issues from the bulk replacement
$workingDir = "c:\Users\alooma\Desktop\new-hope-ductless-mini-splits-main\ductless mini splits new hope pa"
Set-Location $workingDir

# Get all HTML files
$htmlFiles = Get-ChildItem -Path . -Name "*.html" -Recurse
Write-Host "Fixing issues in $($htmlFiles.Count) HTML files..."

foreach ($file in $htmlFiles) {
    Write-Host "Fixing: $file"
    
    # Read the file content
    $content = Get-Content -Path $file -Raw -Encoding UTF8
    
    # Fix specific issues
    $content = $content -replace "New Hope, PA Ductless Mini Splits", "New Hope PA Ductless Mini Splits"
    $content = $content -replace "New Hope, PA, PA", "New Hope, PA"
    $content = $content -replace "addressLocality"": ""New Hope, PA""", "addressLocality"": ""New Hope"""
    $content = $content -replace "addressRegion"": ""NY""", "addressRegion"": ""PA"""
    $content = $content -replace "New Hope, PA's", "New Hope's"
    $content = $content -replace "New Hope, PA residents", "New Hope residents"
    $content = $content -replace "New Hope, PA neighborhoods", "New Hope neighborhoods"
    $content = $content -replace "New Hope, PA area", "New Hope area"
    $content = $content -replace "New Hope Ductless Pro", "New Hope Ductless Pro"
    $content = $content -replace "zip codes", "zip code areas"
    $content = $content -replace "winter storm", "Pennsylvania winter storm"
    $content = $content -replace "summer heat wave", "Pennsylvania summer heat wave"
    
    # Save the updated content
    Set-Content -Path $file -Value $content -Encoding UTF8
}

Write-Host "Fixes completed!"
