function aptupgradeable --wraps="apt list --upgradable 2> /dev/null | awk '{print $1}' | grep -vi listing |sed 's/\/.\*//' | xargs sudo apt install -y" --description alias aptupgradeable="apt list --upgradable 2> /dev/null | awk '{print $1}' | grep -vi listing | sed 's/\/.*//' | xargs sudo apt install -y"
  apt list --upgradable 2> /dev/null | awk '{print $1}' | grep -vi listing | sed 's/\/.*//' | xargs sudo apt install -y $argv; 
end
