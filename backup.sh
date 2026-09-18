brew bundle dump --force

git add .
git commit -m "backup $(date)"
git push
