function dapic --wraps='docker compose exec --user (id -u):(d -g) api composer ' --wraps='docker compose exec --user (id -u):(id -g) api composer ' --description 'alias dapic=docker compose exec --user (id -u):(id -g) api composer '
  docker compose exec --user (id -u):(id -g) api composer  $argv; 
end
