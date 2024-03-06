$rootFilePath = "C:\atomic-temp\"

# Create 100 empty files
1..100 | ForEach-Object {
    $fileName = "EmptyFile$_"  # Naming convention: EmptyFile1, EmptyFile2, ...
    $filePath = Join-Path -Path $rootFilePath -ChildPath $fileName  # Construct full path
    
    New-Item -ItemType File -Path $filePath -Force  # Create empty file
    Write-Host "Created file: $fileName"
}

# Delete the 100 files
Get-ChildItem -Path $rootFilePath -Filter "EmptyFile*" | Remove-Item -Force
Write-Host "Deleted all empty files."