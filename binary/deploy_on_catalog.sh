#!/bin/bash

count_files() {
  local files=$(ls -1 "$1")  
  local file_count=0
  local dir_count=0

  for f in $files; do
    if [[ -d "$1/$f" ]]; then 
      ((dir_count++))
      count_files "$1/$f"  
    else
      ((file_count++))
    fi
  done

  total_files=$((total_files+file_count))
  total_dirs=$((total_dirs+dir_count))
}


current_dir=$(pwd)
echo "Файли в поточному каталозі:"
ls -1 "$current_dir"


read -p "Введіть каталог (Enter для поточного каталогу): " user_dir
user_dir=${user_dir:-$current_dir}  


echo "Файли у каталозі $user_dir:"
ls -1 "$user_dir"


total_files=0
total_dirs=0
count_files "$user_dir"
echo "Кількість файлів: $total_files"
echo "Кількість каталогів: $total_dirs"


echo "Назви файлів у каталозі $user_dir:"
find "$user_dir" -maxdepth 1 -type f -printf "%f\n"

echo "Назви каталогів у каталозі $user_dir:"
find "$user_dir" -maxdepth 1 -type d -not -path "$user_dir" -printf "%f\n"
