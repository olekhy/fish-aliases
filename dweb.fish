# Defined in - @ line 1
function dweb --description 'Point current terminal to web app container shell'
  docker compose exec -u(id -u):(id -g) web bash $argv;
end
