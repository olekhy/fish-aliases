function IMG-resizing
     if test (count $argv) -ge 1
        if test $argv[1] = "--help" -o $argv[1] = "-h"
            echo "IMG-resizing - verkleinert/vergrößert Bilder rekursiv im aktuellen Ordner"
            echo ""
            echo "Nutzung:"
            echo "  IMG-resizing [EXT] [RESIZE]"
            echo ""
            echo "Parameter:"
            echo "  EXT     Dateiendung (z.B. bmp, jpg, png) - Default: bmp"
            echo "  RESIZE  Größe in Prozent                 - Default: 50"
            echo ""
            echo "Beispiele:"
            echo "  IMG-resizing           # alle .bmp auf 50%"
            echo "  IMG-resizing jpg       # alle .jpg auf 50%"
            echo "  IMG-resizing png 25    # alle .png auf 25%"
            return 0
        end
    end
    # Defaults: EXT=bmp, RESIZE=50
    set EXT bmp
    set RESIZE 50

    if test (count $argv) -ge 1
        set EXT $argv[1]
    end
    if test (count $argv) -ge 2
        set RESIZE $argv[2]
    end

    if not type -q convert
        echo "Fehler: 'convert' (ImageMagick) nicht gefunden."
        return 127
    end

    echo "🔍 Suche rekursiv nach *.$EXT und skaliere auf $RESIZE% …"

    # Rekursiv, case-insensitive, null-getrennt (robust bei Leerzeichen)
    find . -type f -iname "*.$EXT" -print0 | while read -lz f
        echo "→ Verarbeite: $f"
        set tmp "$f.rz"
        if convert "$f" -resize "$RESIZE%" "$tmp"
            # Original ersetzen
            mv -f "$tmp" "$f"
        else
            echo "   ❌ Fehler bei: $f"
            rm -f "$tmp"
        end
    end

    echo "✅ Fertig."
end

