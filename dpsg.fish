function dpsg --wraps='docker ps -a' --description 'alias dpsg=docker ps -a'
  docker ps -a $argv; 
end
