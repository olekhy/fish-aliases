# Defined in - @ line 0
function dup --description 'Start docker containers in detached mode'
	docker compose up -d $argv;
end
