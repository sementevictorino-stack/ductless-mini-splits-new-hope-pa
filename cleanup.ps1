# PowerShell script for final cleanup and consistency fixes
$workingDir = "c:\Users\alooma\Desktop\new-hope-ductless-mini-splits-main\ductless mini splits new hope pa"
Set-Location $workingDir

# Get all HTML files
$htmlFiles = Get-ChildItem -Path . -Name "*.html" -Recurse
Write-Host "Final cleanup for $($htmlFiles.Count) HTML files..."

foreach ($file in $htmlFiles) {
    Write-Host "Cleanup: $file"
    
    # Read the file content
    $content = Get-Content -Path $file -Raw -Encoding UTF8
    
    # Fix title inconsistencies - remove duplicate location names
    $content = $content -replace "Doylestown New Hope, PA", "Doylestown PA"
    $content = $content -replace "Lambertville New Hope, PA", "Lambertville PA" 
    $content = $content -replace "Yardley New Hope, PA", "Yardley PA"
    $content = $content -replace "Newtown New Hope, PA", "Newtown PA"
    $content = $content -replace "Chalfont New Hope, PA", "Chalfont PA"
    $content = $content -replace "Quakertown New Hope, PA", "Quakertown PA"
    $content = $content -replace "Perkasie New Hope, PA", "Perkasie PA"
    
    # Fix zip code inconsistencies
    $content = $content -replace "08530", "08530"  # Lambertville (NJ border)
    $content = $content -replace "456 Broad Street", "456 Main Street"
    
    # Fix remaining geographic references
    $content = $content -replace "New Hope, PA area", "New Hope area"
    $content = $content -replace "in New Hope, PA\.", "in New Hope, PA."
    $content = $content -replace "throughout New Hope, PA", "throughout New Hope and Bucks County"
    
    # Fix business name consistency
    $content = $content -replace "New Hope PA Ductless Mini Splits - ", "New Hope PA Ductless Mini Splits - "
    
    # Save the updated content
    Set-Content -Path $file -Value $content -Encoding UTF8
}

Write-Host "Final cleanup completed!"
