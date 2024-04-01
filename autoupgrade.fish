function autoupgrade --wraps=apt\ list\ --upgradable\ 2\>\ /dev/null\ \|\ awk\ \'\{print\ \}\'\ \|\ grep\ -vi\ listing\ \|\ sed\ \'s/\\/.\*//\'\ \|\ xargs\ sudo\ apt\ install\ -y --description alias\ autoupgrade=apt\ list\ --upgradable\ 2\>\ /dev/null\ \|\ awk\ \'\{print\ \}\'\ \|\ grep\ -vi\ listing\ \|\ sed\ \'s/\\/.\*//\'\ \|\ xargs\ sudo\ apt\ install\ -y
  apt list --upgradable 2> /dev/null | awk '{print }' | grep -vi listing | sed 's/\/.*//' | xargs sudo apt install -y $argv; 
end
