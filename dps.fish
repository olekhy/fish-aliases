# Defined in - @ line 0
function dps --description 'List running containers'
	docker compose ps $argv;
end
