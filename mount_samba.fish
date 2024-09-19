function mount_samba
    # Check if the first argument is provided
    if test (count $argv) -eq 0
        echo "Usage: mount_samba mount|unmount"
        return
    end

    # Check if the first argument is 'mount'
    if test $argv[1] = "mount"
        # Prompt for username, password, and mount point
        read -P "Enter username: " username
        read -sP "Enter password: " password
        read -P "Enter mount point (e.g., /mnt/samba): " mount_point
        
        set server_ip "192.168.188.166"
        set share_name "video-2"
        
        # Create the mount point if it doesn't exist
        if test ! -d $mount_point
            sudo mkdir -p $mount_point
        end
        
        # Mount the Samba share
        sudo mount -t cifs -o username=$username,password=$password //$server_ip/$share_name $mount_point
        
        if test $status -eq 0
            echo "Successfully mounted //$server_ip/$share_name at $mount_point"
        else
            echo "Failed to mount the Samba share"
        end

    # Check if the first argument is 'unmount'
    else if test $argv[1] = "unmount"
        # Prompt for mount point
        read -P "Enter mount point (e.g., /mnt/samba): " mount_point

        # Unmount the share
        sudo umount $mount_point
        
        if test $status -eq 0
            echo "Successfully unmounted $mount_point"
        else
            echo "Failed to unmount $mount_point"
        end

    else
        echo "Usage: mount_samba mount|unmount"
    end
end
