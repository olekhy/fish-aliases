# Defined in - @ line 0
function ddo --description 'Shutdown running containers'
	docker compose down $argv;
end
