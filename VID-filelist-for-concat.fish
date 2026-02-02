function VID-filelist-for-concat
    if test "$argv[1]" = "--help"
        echo "VID_filelist_for_concat <duration> <extensions...>"
        echo "Erstellt file_list.txt für FFmpeg concat und erzeugt MP4-Video."
        echo "Erforderlich: Dauer pro Bild in Sekunden."
        echo "Erforderlich: Mindestens eine Extension, z.B.: *.png *.jpg *.bmp"
        return
    end

    if test (count $argv) -lt 2
        echo "⚠ Usage: VID_filelist_for-concat <duration> <extensions...>"
        return
    end

    # Dauer setzen
    set duration $argv[1]

    # Extensions ab dem zweiten Argument
    set exts $argv[2..-1]

    # Dateien sammeln
    set files
    for ext in $exts
        for f in $ext
            if test -f $f
                set files $files $f
            end
        end
    end

    if test (count $files) -eq 0
        echo "⚠ Keine Dateien gefunden für: $exts"
        return
    end

    # Sortieren numerisch
    set files (printf "%s\n" $files | sort -V)

    # file_list.txt erstellen
    set output "file_list.txt"
    echo "" > $output
    for f in $files
        echo "file '$f'" >> $output
        echo "duration $duration" >> $output
    end

    # Letztes Bild anhängen
    set last $files[-1]
    echo "file '$last'" >> $output

    # Video erstellen
    set output_video "output_high_quality_"$duration"s.mp4"

    echo "Starte FFmpeg..."
    ffmpeg -f concat -safe 0 -i $output -vsync vfr -c:v libx264 -crf 0 -preset veryslow -pix_fmt yuv444p $output_video

    echo "✅ Video erstellt: $output_video"
end

