function FS-files-mirror-recursive
    if test (count $argv) -eq 0
        echo "❌ Bitte gib ein Verzeichnis an!"
        return 1
    end

    set basedir $argv[1]

    if not test -d $basedir
        echo "❌ '$basedir' ist kein gültiges Verzeichnis!"
        return 1
    end

    for dir in (find $basedir -type d)
        set numbers ()
        set extensions ()

        for file in (find $dir -maxdepth 1 -type f)
            set fname (basename $file)

            # Extrahiere Dateierweiterung
            set ext (string match -r '\.[^.]+$' $fname)
            if test -n "$ext"
                if not contains $ext $extensions
                    set extensions $extensions $ext
                end
            end

            # Extrahiere Zahlen aus Dateinamen
            for num in (string match -r -a '\d+' $fname)
                set numbers $numbers $num
            end
        end

        # Wenn mehr als eine Extension: ignorieren
        if test (count $extensions) -eq 1 -a (count $numbers) -gt 0
            set sorted (printf "%s\n" $numbers | sort -n)
            set min $sorted[1]
            set max $sorted[-1]
            echo "📂 $dir"
            echo "   🔢 min: $min | max: $max"
            echo "   📦 extension: $extensions[1]"
	    #FS-files-mirror $dir $min $max $extensions[1]
	    bash -c '
	    echo Sart copying...
SUFFIX="'$extensions[1]'"

START_RAW="'$min'"  # z. B. 005380
END_RAW="'$max'"    # z. B. 005400
echo $SUFFIX $START_RAW $END_RAW

# Erkenne Padding-Länge (z. B. 6 Stellen)
PAD_WIDTH=${#START_RAW}

# Entferne führende Nullen sicher mit 10# (vermeidet Oktal)
START=$((10#$START_RAW))
END=$((10#$END_RAW))

# Neue Dateinamen starten nach dem höchsten Wert
NEW_BASE=$((END + 1))

echo $NEW_BASE $START $END

for ((i=END; i>=START; i--)); do
    offset=$((END - i))
    new_index=$((NEW_BASE + offset))

    src='$dir'/$(printf "%0${PAD_WIDTH}d" "$i")$SUFFIX
    dest='$dir'/$(printf "%0${PAD_WIDTH}d" "$new_index")$SUFFIX
    #echo Try to copy: "$src -> $dest"
    if [[ -f "$src" ]]; then
        echo Kopiere: "$src -> $dest"
        cp "$src" "$dest" 
	#    else
	#    echo "WARNUNG: Datei nicht gefunden: $src"
    fi
done
'
        else if test (count $extensions) -gt 1
            echo "⚠️  $dir hat mehrere Dateitypen: "(string join ", " $extensions)" – wird übersprungen."
        end
    end
end


