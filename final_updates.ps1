# PowerShell script for final location-specific updates
$workingDir = "c:\Users\alooma\Desktop\new-hope-ductless-mini-splits-main\ductless mini splits new hope pa"
Set-Location $workingDir

# Get all HTML files
$htmlFiles = Get-ChildItem -Path . -Name "*.html" -Recurse
Write-Host "Final location updates for $($htmlFiles.Count) HTML files..."

foreach ($file in $htmlFiles) {
    Write-Host "Final updates: $file"
    
    # Read the file content
    $content = Get-Content -Path $file -Raw -Encoding UTF8
    
    # Replace specific location references
    $content = $content -replace "St\. George", "New Hope"
    $content = $content -replace "Stapleton", "Doylestown" 
    $content = $content -replace "Port Richmond", "Lambertville"
    $content = $content -replace "Tottenville", "Yardley"
    $content = $content -replace "Great Kills", "Newtown"
    $content = $content -replace "New Brighton", "Chalfont"
    $content = $content -replace "West Brighton", "Quakertown"
    $content = $content -replace "South Beach", "Perkasie"
    $content = $content -replace "Rosebank", "Solebury"
    $content = $content -replace "Castleton Corners", "Upper Makefield"
    $content = $content -replace "Bay Terrace", "Richboro"
    $content = $content -replace "New Dorp", "Sellersville"
    $content = $content -replace "Oakwood", "Buckingham"
    $content = $content -replace "Eltingville", "Warrington"
    $content = $content -replace "Pleasant Plains", "Warminster"
    $content = $content -replace "Richmond Valley", "Ivyland"
    $content = $content -replace "Charleston", "Plumstead"
    $content = $content -replace "Clifton", "Bedminster"
    $content = $content -replace "Dongan Hills", "Hilltown"
    $content = $content -replace "Grant City", "Franconia"
    $content = $content -replace "Mariners Harbor", "East Rockhill"
    $content = $content -replace "Willowbrook", "West Rockhill"
    
    # Update zip codes to PA zip codes
    $content = $content -replace "10302", "18901"  # Doylestown
    $content = $content -replace "10304", "08530"  # Lambertville area
    $content = $content -replace "10307", "19067"  # Yardley
    $content = $content -replace "10308", "18940"  # Newtown
    $content = $content -replace "10310", "18914"  # Chalfont
    $content = $content -replace "10305", "18951"  # Quakertown
    $content = $content -replace "10306", "18944"  # Perkasie
    $content = $content -replace "10309", "18960"  # Sellersville
    $content = $content -replace "10311", "18915"  # Buckingham
    $content = $content -replace "10312", "18976"  # Warrington
    $content = $content -replace "10313", "18974"  # Warminster
    $content = $content -replace "10314", "18954"  # Richboro
    
    # Geographic references
    $content = $content -replace "New York Harbor", "Delaware River"
    $content = $content -replace "waterfront", "riverside"
    $content = $content -replace "island", "county"
    $content = $content -replace "ferry terminal", "arts district"
    $content = $content -replace "brownstones", "colonial homes"
    $content = $content -replace "Victorian homes", "historic homes"
    
    # Business and geographic area updates
    $content = $content -replace "downtown St\. George", "downtown New Hope"
    $content = $content -replace "historic New Hope homes", "historic colonial homes"
    $content = $content -replace "New Hope developments", "modern developments"
    
    # Save the updated content
    Set-Content -Path $file -Value $content -Encoding UTF8
}

Write-Host "Final location updates completed!"
