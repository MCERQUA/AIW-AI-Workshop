@echo off
setlocal EnableDelayedExpansion

:: Check if config file exists
set "config_file=git_config.txt"
if not exist %config_file% (
    echo First time setup...
    echo Please enter your GitHub repository URL:
    set /p github_url=
    echo !github_url!> %config_file%
    echo Configuration saved to %config_file%
) else (
    :: Read the URL from config file
    set /p github_url=<%config_file%
)

:: Initialize git if needed
if not exist .git (
    git init
)

:: Update remote origin
git remote remove origin
git remote add origin !github_url!

:: Update main branch
git branch -M main
git add .
git commit -m "Update: %date% %time%"
git push -u origin main --force

echo Repository updated successfully!
pause