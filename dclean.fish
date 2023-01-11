# Defined in - @ line 0
function dclean --description 'alias dclean=docker system prune --all --volumes --force'
	docker system prune --all --volumes --force $argv;
end
