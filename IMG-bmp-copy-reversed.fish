function FS-bmp-copy-reversed
    if test (count $argv) -ne 2
        echo "❌ Usage: FS-bmp-copy-reversed <START> <END>"
        return 1
    end

    set SUFFIX ".bmp"
    set START_RAW $argv[1]
    set END_RAW $argv[2]

    set PAD_WIDTH (string length -- $START_RAW)

    # Entferne führende Nullen sicher mit math
    set START (math "0 + $START_RAW")
    set END (math "0 + $END_RAW")

    set NEW_BASE (math "$END + 1")

    for i in (seq -r $END $START)
        set offset (math "$END - $i")
        set new_index (math "$NEW_BASE + $offset")

        set src (printf "%0${PAD_WIDTH}d%s" $i $SUFFIX)
        set dest (printf "%0${PAD_WIDTH}d%s" $new_index $SUFFIX)

        if test -f "$src"
            echo "📄 Kopiere $src → $dest"
            cp "$src" "$dest"
        else
            echo "⚠️  WARNUNG: Datei nicht gefunden: $src"
        end
    end
end

