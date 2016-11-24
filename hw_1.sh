#!/usr/bin/env sh

# HH school, Git -- Task 1

echo
echo '*********************'
echo '***** Задание 1 *****'
echo '*********************'
echo

echo '01. create repo (repo A)'
mkdir repoA
cd repoA
git init

echo
echo '02. repo A: create 1st commit with some files (file A, file B)'
echo -e "Aline1\nAline2\nAline3" > fileA
echo -e "Bline1\nBline2" > fileB
git add .
git commit -m "1st commit"

echo
echo '03. repo A: create branch branch1 from master'
git branch branch1
git branch # show branches

echo
echo '04. clone the current repo (repo B)'
cd ..
# другое имя origin, чтобы origin'ом, всё-таки, впоследствии
# стал репозиторий на гитхабе
git clone --origin originA -- repoA repoB
cd repoB

echo
echo '05. repo B, branch1: create 2nd commit containing new file (file C)'
git checkout -t originA/branch1
echo -e "Cline1\nCline2\nCline3" > fileC
git add .
git commit -m "2nd commit"

echo
echo '06. repo B: push changes to repo A'
git push originA branch1

echo
echo '07. repo A, branch1: modify line#1 in file C and commit'
cd ../repoA
git checkout branch1
sed 's/Cline1/Cline1 version A/' -i fileC
git add .
git commit -m "3rd commit: line#1 in file C changed (version A)"

echo
echo '08. repo B, branch1: modify line#1 in file C and commit'
cd ../repoB
sed 's/Cline1/Cline1 version B/' -i fileC
git add .
git commit -m "3rd commit: line#1 in file C changed (version B)"

echo
echo '09. repo B, branch1: fetch changes from repo A'
git pull # or `git fetch; git merge originA/branch1`

echo
echo "10. repo B, branch1: merge in repoA's branch1 (resolve conflict)"
echo '******** fileC before ********'
cat fileC
sed '1,5d' -i fileC
sed '1s/^/Cline1 corrected!\n/' -i fileC
echo '******** fileC after  ********'
cat fileC
echo '********     end      ********'
git commit -a -m "fileC resolved"

echo
echo '11. repo A: add repoB as new remote'
cd ../repoA
git remote add remoteB ../repoB

echo
echo "12. repo A, branch1: merge in repoB's branch1"
git fetch remoteB
git merge remoteB/branch1
