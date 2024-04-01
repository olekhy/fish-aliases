function db --wraps='docker compose build --parallel --force-rm --no-cache --pull --progress=plain ' --description 'alias db=docker compose build --parallel --force-rm --no-cache --pull --progress=plain '
  docker compose build --parallel --force-rm --no-cache --pull --progress=plain  $argv; 
end
