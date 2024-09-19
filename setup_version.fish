function setup_version --wraps=---
  find ./ -name "*vendor*" -prune -o -name "*node_modules*" -prune  -o -name "main.php" -o -type f -name "composer.json" -o -type f -name "swagger.json" | grep -v node_modules | grep -v vendor |  xargs sed -i "s/$argv[1]/$argv[2]/"; 
end
