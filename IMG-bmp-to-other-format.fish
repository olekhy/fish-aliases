function IMG-bmp-to-other-format
    if test (count $argv) -ne 1
        echo "Usage: IMG-bmp-to-other-format <directory>"
        return 1
    end

    set dir $argv[1]

    # Alle .bmp Dateien rekursiv finden
    for input_file in (find $dir -type f -name '*.bmp')
        set output_file (string replace -r '\.bmp$' '.png' $input_file)
        echo "Converting: $input_file -> $output_file"
        convert $input_file $output_file
    end
end

