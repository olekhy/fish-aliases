# Defined in - @ line 0
function dcl --description 'Clean up docker system'
	docker system prune --all --volumes --force $argv;
end
