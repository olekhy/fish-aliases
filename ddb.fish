# Defined in - @ line 0
function ddb --description 'Point terminal to running db container'
	docker compose exec --user (id -u):(id -g) db bash $argv;
end
