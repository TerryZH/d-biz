debug=false
backup_dir=../ddup-bak

if $debug;
then
  echo debug mode on, normal path will be ignored
else
  if [ "$1" != "" ];
  then
    target=$1
    if [ -d $target ];
    then
      pushd $target/
      backup_dir=$backup_dir-$target
      echo de-duping $target, please find the duplicate files in $backup_dir
      mkdir $backup_dir
      for i in *
      do
        for j in *
        do
          if [ "$i" != "$j" ];
          then
            echo comparing "$i" and "$j"
            diff "$i" "$j"
            if [ $? -eq 0 ];
            then
              echo "$i" and "$j" are the same, deleting "$j"
              mv "$j" $backup_dir/
            else
              echo "$i" and "$j" are different, keeping both
            fi
          else
            echo skipping comparing the same file "$j"
          fi
        done
      done
      popd
    else
      echo $target is not a valid directory
    fi
  else
    echo ddup $target_dir
  fi
fi