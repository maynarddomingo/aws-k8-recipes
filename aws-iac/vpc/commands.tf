  git add .
  git config --global user.email "nricoyan@gmail.com"
  git config --global user.name "nricoyan"
  git commit -m "IAM fixes"
  git push origin main

---------------------------------------------------
Errors: exceeds GitHub's file size limit of 100.00 MB
  git config pull.rebase true
  git commit -m "change description"
  git filter-branch -f --index-filter 'git rm --cached -r --ignore-unmatch .terraform/'
  git push --set-upstream origin main

---------------------------------------------------
Fix out of date/time issue
sed -i "16i \"$(curl -s ifconfig.me)/32\" " iam.tf && terraform fmt
