# Defined in - @ line 1
function dapp --description 'Point terminal to running webapp container'
  docker compose exec --user (id -u):(id -g) app bash $argv;
end
