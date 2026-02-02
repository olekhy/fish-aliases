function IMG-bmp-to-jpg-max-recursive
    if test (count $argv) -ne 1
        echo "Usage: IMG-bmp-to-jpg-max-recursive <directory>"
        echo "Example: IMG-recursive-convert ./bilder"
        return 1
    end

    set dir $argv[1]

    # Alle Dateien mit typischen Bildendungen finden (hier bmp als Quelle)
    for input_file in (find $dir -type f -iname '*.bmp')
        set output_file (string replace -r '\.bmp$' ".jpg" $input_file)
        echo "Converting: $input_file -> $output_file"
        convert $input_file -strip -colorspace sRGB -quality 100 $output_file
    end
end

