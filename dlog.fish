# Defined in - @ line 1
function dlog --description 'Printout logs from container'
	docker compose logs --tail 10 -f $argv;
end
