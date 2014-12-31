debug=false

project_name="d-biz"
pushd $project_name/
version=`git log --oneline | sed -n -e '1p' | awk '{print $1}'`
branch=`git status | sed -n -e '1p' | awk '{print $3}'`
popd
backup_file=backup/$project_name-$branch-$version-$(date +%Y%m%d%H%M%S).sql

if $debug;
then
echo debug mode on, normal path will be ignored
echo $backup_file
else
echo sync master and production branches
echo step 1 - backup database to $backup_file
sqlite3 $project_name/db/production.sqlite3 .dump > $backup_file
echo Step 2 - switch to local production branch and make sure it is clean
cd $project_name/
git checkout production
git reset --hard
git clean -xdf
git checkout --
echo Step 3 - local production \<- remote production
git pull origin production
echo Step 4 - local production \<- remote master
git pull origin master
echo Step 5 - local production -\> remote production
git push origin production
git checkout $branch
cd ..
echo step 6 - restore database from $backup_file
sqlite3 $project_name/db/production.sqlite3 ".read $backup_file"
fi
