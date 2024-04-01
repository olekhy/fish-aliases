# Defined in - @ line 1
function dappc --description 'Point terminal to composer command in running php webapp container'
  docker compose exec --user (id -u):(id -g) app composer $argv;
end
