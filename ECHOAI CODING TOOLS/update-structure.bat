@echo off
echo # Project Structure > project-structure.md
echo Last updated: %date% %time% >> project-structure.md
echo. >> project-structure.md
echo ## Directory Structure >> project-structure.md

dir /s /b /a:-h > temp.txt

for /f "tokens=*" %%a in (temp.txt) do (
    echo %%a >> project-structure.md
)

del temp.txt
echo Project structure has been updated in project-structure.md
pause