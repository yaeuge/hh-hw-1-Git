#!/usr/bin/env sh

# HH school, Git -- Run homework tasks

sh hw_1.sh
sh hw_2.sh
sh push_to_github.sh

echo
echo 'Создаю корневой репозиторий...'
git init
git submodule add https://github.com/yaeuge/repoA
git submodule add https://github.com/yaeuge/repoB
git submodule add https://github.com/yaeuge/frontik-no-testing
git submodule add https://github.com/yaeuge/frontik-testing
git add .
git commit -m "Команды для выполнения домашнего задания по Git"

git remote add origin https://github.com/yaeuge/hh-hw-1-Git.git
git push -fu origin master
