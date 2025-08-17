function FS-files-mirror
    # Argument: Verzeichnis (optional, default ist aktuelles Verzeichnis)
    set dir (test (count $argv) -gt 0; and echo $argv[1]; or echo .)

    # Finde alle Dateien mit Nummern im Namen (nur .jpg Dateien)
    set files (ls $dir | grep -E '^[0-9]+\.jpg$' | sort -n)

    if test -z "$files"
        echo "Keine nummerierten .jpg Dateien gefunden"
        return 1
    end

    # Finde die höchste Nummer
    set max_num 0
    for file in $files
        set num (string match -r '^[0-9]+' $file)
        if test $num -gt $max_num
            set max_num $num
        end
    end

    # Kopiere Dateien in umgekehrter Reihenfolge mit neuer Nummer
    set new_num (math $max_num + 1)
    for file in (echo $files | tac)
        set current_num (string match -r '^[0-9]+' $file)
        set new_name (printf "%05d.jpg" $new_num)
        cp "$dir/$file" "$dir/$new_name"
        echo "Kopiert: $file -> $new_name"
        set new_num (math $new_num + 1)
    end
end
