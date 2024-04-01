function a2dll --wraps='echo "$1" >> dll' --wraps='echo "$1" >> dll; cat dll' --wraps='echo "$1" >> dll && cat dll' --wraps='echo "$1" >> dll | tee' --wraps='echo "$1" >> dll | tee cat dll' --wraps=echo --wraps='echo $1 >> dll' --wraps='$1 >> dll' --wraps='echo "$1" >> dll; cat dll;' --description 'alias a2dll=echo "$1" >> dll'
  echo "$1" >> dll $argv; 
end
