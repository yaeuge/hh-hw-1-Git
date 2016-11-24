#!/usr/bin/env sh

cd repoA
git remote add origin https://github.com/yaeuge/repoA.git
git push -f --all origin

cd ../repoB
git remote add origin https://github.com/yaeuge/repoB.git
git push -f --all origin

cd ../frontik-testing
git remote add origin https://github.com/yaeuge/frontik-testing.git
git push -f --all origin

cd ../frontik-no-testing
git remote add origin https://github.com/yaeuge/frontik-no-testing.git
git push -f --all origin
