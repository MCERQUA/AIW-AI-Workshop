# Save this as update-structure.ps1 in your project root
$output = "project-structure.md"

# Header
@"
# Project Structure
Last updated: $(Get-Date -Format "yyyy-MM-dd HH:mm")

## Directory Structure
"@ | Out-File $output

# Main directory structure with sizes
Get-ChildItem -Recurse | Where-Object { 
    $_.FullName -notmatch 'node_modules|\.git|\.next|\.cache|dist|bolt-output' 
} | ForEach-Object {
    $indent = "  " * ($_.FullName.Split([IO.Path]::DirectorySeparatorChar).Count - 2)
    $size = if ($_.Length) { "$($_.Length) bytes" } else { "directory" }
    "$indent$($_.Name) ($size)" | Add-Content $output
}

Write-Host "Project structure has been updated in $output"
