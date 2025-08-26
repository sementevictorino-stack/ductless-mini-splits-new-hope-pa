# PowerShell script to update all HTML files for New Hope, PA
$workingDir = "c:\Users\alooma\Desktop\new-hope-ductless-mini-splits-main\ductless mini splits new hope pa"
Set-Location $workingDir

# Get all HTML files
$htmlFiles = Get-ChildItem -Path . -Name "*.html" -Recurse
Write-Host "Processing $($htmlFiles.Count) HTML files..."

foreach ($file in $htmlFiles) {
    Write-Host "Processing: $file"
    
    # Read the file content
    $content = Get-Content -Path $file -Raw -Encoding UTF8
    
    # Basic replacements for all files
    $content = $content -replace "Staten Island", "New Hope, PA"
    $content = $content -replace "SI Ductless Pro", "New Hope Ductless Pro"
    $content = $content -replace "statenislandductless\.com", "newhoppaductless.com"
    $content = $content -replace "info@statenislandductless\.com", "info@newhoppaductless.com"
    $content = $content -replace "123 Victory Blvd", "123 Main Street"
    $content = $content -replace "10301", "18938"
    $content = $content -replace ", NY", ", PA"
    $content = $content -replace "New York", "Pennsylvania"
    $content = $content -replace "Staten Island's", "New Hope's"
    $content = $content -replace "Staten Island residents", "New Hope residents"
    $content = $content -replace "Staten Island neighborhoods", "New Hope and Bucks County neighborhoods"
    $content = $content -replace "throughout Staten Island", "throughout New Hope and Bucks County"
    $content = $content -replace "across Staten Island", "across New Hope and Bucks County"
    $content = $content -replace "on Staten Island", "in New Hope and Bucks County"
    $content = $content -replace "all Staten Island", "all New Hope area"
    
    # Save the updated content
    Set-Content -Path $file -Value $content -Encoding UTF8
}

Write-Host "Bulk replacements completed!"
