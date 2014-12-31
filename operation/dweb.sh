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
echo step 1 - backup database to $backup_file
sqlite3 $project_name/db/production.sqlite3 .dump > $backup_file
echo step 2 - retrieve new source
rm -rf new_$project_name
git clone http://github.com/TerryZH/$project_name.git new_$project_name
if [ $? -eq 0 ];
then
echo step 3 - clean old source
rm -rf $project_name
mv new_$project_name $project_name
echo step 4 - restore database from $backup_file
sqlite3 $project_name/db/production.sqlite3 ".read $backup_file"
echo step 5 - start the server
cd $project_name/
git checkout production
if [ "$1" != "" ];
then
git reset --soft $1
git status
fi
rake db:migrate
rake assets:precompile
SECRET_KEY_BASE= rails server -e production -b 127.0.0.1 -p 8000 -P tmp/pids/production.pid
cd ..
else
echo cannot retrieve new source, prlease retry
fi
fi
