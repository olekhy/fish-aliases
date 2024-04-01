function ddog --wraps='docker -qa | xargs docker stop | xargs docker rm' --wraps='docker ps -qa | xargs docker stop | xargs docker rm' --description 'alias ddog=docker ps -qa | xargs docker stop | xargs docker rm'
  docker ps -qa | xargs docker stop | xargs docker rm $argv; 
end
