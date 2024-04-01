# Defined in - @ line 1
function dapi  --description 'Point terminal to running api container'
  docker compose exec --user (id -u):(id -g) api bash $argv;
end
