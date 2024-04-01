function gen_port_num --description 'Genearate number (4 length) from given path'
	set inode_number stat -c '%i' "$PWD"
	echo 0x(echo -n "$inode_number" | sha1sum | cut -c 1-8) % 10000 | math | xargs printf 4%04d
end
