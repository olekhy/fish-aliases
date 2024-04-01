# Defined in - @ line 1
function glances --description 'Glances system information'
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host --network host -it docker.io/nicolargo/glances $argv;
end
