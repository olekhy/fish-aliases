# Defined in - @ line 0
function duplog --description 'Start docker services and point the output to current terminal'
	docker compose up $argv;
end
