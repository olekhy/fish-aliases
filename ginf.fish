function ginf --description 'Display git info in projects recursive'
  bash -c 'for d in $(find ./ -name ".git"); do echo -e "\e[0;32m" $(basename $(dirname $d)) "\e[0m" "\n" $(cd $(dirname $PWD/$d); git status; cd ..) | grep -v "working tree clean"; done' $argv; 
end
