# Defined in - @ line 1
function dapi --wraps='docker compose exec --user 1000:1000 api bash' --description 'alias dapi docker compose exec --user 1000:1000 api bash'
  docker compose exec --user 1000:1000 api bash $argv;
end
