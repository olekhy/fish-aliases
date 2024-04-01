function dwebns --wraps='docker compose exec --user (id -u):(id -g) web npm start' --description 'alias dwebns=docker compose exec --user (id -u):(id -g) web npm start'
  docker compose exec --user (id -u):(id -g) web npm start $argv; 
end
