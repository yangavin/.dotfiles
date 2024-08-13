brew bundle dump --describe --force

git add .
git commit -m "backup $(date)"
git push
