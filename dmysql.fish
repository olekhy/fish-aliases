# Defined in - @ line 0
function dmysql --description 'alias dmysql=docker compose exec --user 1000:1000 mysql fish'
	docker compose exec --user 1000:1000 mysql fish $argv;
end
