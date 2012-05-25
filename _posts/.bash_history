pushd Lab/a
pushd Lab/
pushd Lab
rm -rf libclodo-jekyll
git clone git://github.com/methodx/libclodo-jekyll.git
pushd libclodo-jekyll
git remote add original git://github.com/vills/libclodo-jekyll.git
git push git@github.com:methodx/libclodo-jekyll.git
git fetch upstream
git fetch git://github.com/vills/libclodo-jekyll.git
git merge git://github.com/vills/libclodo-jekyll.git/master
git merge upstream/master
cp 2012-05-25-cloudstorage.md 2012-05-24-cloudstorage.md
vim .gitignore
vim .git/config
git add _posts/2012-05-24-cloudstorage.md
git fetch original
git merge original/master
mv 2012-05-24-cloudstorage.md 2012-05-24-cyberduck.md
pushd ../Web/aylium
pushd ../../
pushd posts
./newvim new.sh
./new.sh Git-update-fork
ls -la
vim new.sh
mv 2012-05-13-Aylium-second-renaissance.markdown 2012-05-13-Aylium-second-renaissance.md
mv 2012-05-19-Music-cbl-hydroponic-garden.markdown 2012-05-19-Music-cbl-hydroponic-garden.md
./new.sh test
rm 2012-05-24-test.md
pushd Web/aylium
cd
pushd Lab/libclodo-jekyll
ls
git remote -v
pushd ~/Web/aylium
ls -al
less ../_plugins/url_encode.rb
less ../_plugins/categories_links.rb
less 2012-05-24-cyberduck.md
vim add.sh
./add.sh testpost
rm 2012-05-24-testpost.md
pushd ../
pushd _posts
git del add.sh
git rem add.sh
git --help
pushd ../../../
git add .
git commit -a
git push
mc
rake deploy\

rake build
rake deploy
pushd ../../Lab/libclodo-jekyll/_posts
vim 2012-05-24
vim 2012-05-24-cyberduck.md
