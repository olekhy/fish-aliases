function FS-fix-extension
    set dir (pwd)

    # Hilfe prüfen
    if test (count $argv) -ge 1
        if test $argv[1] = "-h" -o $argv[1] = "--help"
            echo "FS-fix-extension - Korrigiert Dateiendungen anhand des MIME-Typs"
            echo ""
            echo "Usage:"
            echo "  FS-fix-extension [DIRECTORY]"
            echo ""
            echo "Arguments:"
            echo "  DIRECTORY     Das Verzeichnis, das durchsucht werden soll (Standard: aktuelles Verzeichnis)."
            return
        end
        set dir $argv[1]
    end

    # MIME -> Extension Mapping als "Paar-Liste"
    set mime_map \
        "image/jpeg .jpg" \
        "image/png .png" \
        "image/gif .gif" \
        "image/bmp .bmp" \
        "image/x-ms-bmp .bmp" \
        "video/mp4 .mp4" \
        "video/webm .webm" \
        "video/x-matroska .mkv" \
        "video/x-msvideo .avi" \
        "text/plain .txt" \
        "application/pdf .pdf"

    # Dateien finden und umbenennen
    for f in (find $dir -type f)
        set mime (file --mime-type -b "$f")
        set ext ""

        # Mapping durchsuchen
        for pair in $mime_map
            set key (echo $pair | awk '{print $1}')
            set val (echo $pair | awk '{print $2}')
            if test "$mime" = "$key"
                set ext $val
                break
            end
        end

        if test -z "$ext"
            echo "Skip: $f ($mime)" >&2
            continue
        end

        set base (string replace -r '\.[^.]*$' '' "$f")
        set new "$base$ext"

        if test "$f" != "$new"
            echo "Renaming: $f → $new"
            mv -- "$f" "$new"
        end
    end
end

