#!/usr/bin/env sh

# HH school, Git -- Task 2

echo
echo '*********************'
echo '***** Задание 2 *****'
echo '*********************'
echo

git clone https://github.com/hhru/frontik frontik-testing
git clone frontik-testing frontik-no-testing



echo
echo 'Фильтрую репозиторий frontik-testing...'
cd frontik-testing

echo 'Создаю ветки из удалённых...'
# Для всех удалённых веток (из списка `git branch -r`)
# если удалённая ветка не 'origin/master' (т.к. она уже создана)
# создать ветку из удалённой и отсечь громоздкий вывод
git branch -r | while read remote; do
	[ "$remote" != 'origin/master' ] && git checkout -t "$remote" &> /dev/null
done

# Синхронизировать информацию о ветках во втором репозитории
cd ../frontik-no-testing
git fetch
cd ../frontik-testing

git remote rm origin

echo 'Удаляю всё, кроме frontik/testing...'
git filter-branch --prune-empty --subdirectory-filter 'frontik/testing' -- --all



echo
echo 'Фильтрую репозиторий frontik-no-testing...'
cd ../frontik-no-testing

echo 'Создаю ветки из удалённых...'
git branch -r | while read remote; do
	[ "$remote" != 'origin/master' ] && git checkout -t "$remote" &> /dev/null
done

echo 'Удаляю frontik/testing...'
git remote rm origin
git filter-branch --prune-empty --index-filter 'git rm --cached --ignore-unmatch --quiet -r frontik/testing' -- --all
