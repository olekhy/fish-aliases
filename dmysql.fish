# Defined in - @ line 0
function dmysql --description 'alias dmysql=docker compose exec --user (id -u):(id -g) mysql fish'
	docker compose exec --user (id -u):(id -g) mysql fish $argv;
end
