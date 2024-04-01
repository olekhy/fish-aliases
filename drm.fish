# Defined in - @ line 1
function drm --description='Stop and remove all docker containers'
  docker ps -aq | tee | xargs docker stop | xargs docker rm && docker network ls | tee | awk '{print $2}' | grep -v ID | grep -v none | grep -v host | grep -v bridge | tee | xargs docker network rm $argv;
end
