@echo off
git init
git remote remove origin
git remote add origin https://github.com/MCERQUA/ECHO1.git
git branch -M main
git add .
git commit -m "Update"
git push -u origin main --force
pause