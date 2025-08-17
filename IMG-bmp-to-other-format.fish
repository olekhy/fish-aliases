function IMG-bmp-to-other-format
    if test (count $argv) -ne 1
        echo "Usage: IMG-bmp-to-other-format <file.bmp>"
        return 1
    end

    set input_file $argv[1]
    set output_file (string replace -r '\.bmp$' '.png' $input_file)
    convert $input_file $output_file
    echo "Converted $input_file to $output_file"
end
