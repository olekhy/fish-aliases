# Defined in - @ line 1
function dweb --wraps='docker compose exec -u1000:1000 web bash' --description 'alias dweb=docker compose exec -u1000:1000 web bash'
  docker compose exec -u1000:1000 web bash $argv;
end
