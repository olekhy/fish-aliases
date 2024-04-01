# Defined in - @ line 0
function dclean --description 'Cleanup docker system'
	docker system prune --all --volumes --force $argv;
end
