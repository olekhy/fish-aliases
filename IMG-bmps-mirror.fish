function IMG-bmps-mirror
    set dryrun 0

    for arg in $argv
        if test "$arg" = "--dry-run"
            set dryrun 1
        end
    end

    # Alle BMP-Dateien im aktuellen Verzeichnis (keine Pfade)
    set files (find . -maxdepth 1 -type f -iname '*.bmp' | sort | xargs -n1 basename)

    if test (count $files) -eq 0
        echo "❌ Keine .bmp-Dateien gefunden."
        return 1
    end

    # Beispiel: erste Datei, um Länge zu bestimmen
    set first_file $files[1]
    # Entferne .bmp
    set base_name (string replace -r '\.bmp$' '' $first_file)
    # Anzahl der Stellen (Länge)
    set length (string length $base_name)

    # Alle Nummern extrahieren (mit führenden Nullen)
    set numbers
    for f in $files
        set num (string replace -r '\.bmp$' '' $f)
        set numbers $numbers $num
    end

    # Maximaler numerischer Wert (ohne führende Nullen)
    set max_num (math (printf "%s\n" $numbers | sed 's/^0*//' | sort -n | tail -1))

    echo "📂 Dateien erkannt: "(count $files)
    echo "🔢 Max-Wert: $max_num"
    echo "🔁 Erstelle gespiegelte Kopien …"

    # Spiegel-Indizes von max_num-1 runter bis 1
    for i in (seq (math $max_num - 1) -1 1)
        # Quelle: i mit führenden Nullen auf Länge $length
        set src_num (printf "%0*d" $length $i)
        set src "$src_num.bmp"

        # Ziel: berechne Zielindex (max_num + 1 + (max_num - i))
        set dest_index (math $max_num + 1 + (math $max_num - $i))
        set dest_num (printf "%0*d" $length $dest_index)
        set dest "$dest_num.bmp"

        if test -f $src
            if test $dryrun -eq 1
                echo "[dry-run] Kopiere $src → $dest"
            else
                echo "📄 Kopiere $src → $dest"
                cp $src $dest
            end
        else
            echo "⚠️  WARNUNG: Datei nicht gefunden: $src"
        end
    end

    if test $dryrun -eq 1
        echo "✅ [dry-run] Spiegelung abgeschlossen."
    else
        echo "✅ Spiegelung abgeschlossen."
    end
end

