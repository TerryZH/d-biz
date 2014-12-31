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
sqlite3 $project_name/db/production.sqlite3 .dump > $backup_file
cd $project_name/
rails console -e production
cd ..
fi