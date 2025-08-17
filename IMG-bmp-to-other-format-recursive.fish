function IMG-bmp-to-other-format-recursive
    if test (count $argv) -ne 2
        echo "Usage: IMG-bmp-to-other-format-recursive <input_dir> <output_dir>"
        return 1
    end

    set input_dir $argv[1]
    set output_dir $argv[2]

    find $input_dir -type f -name '*.bmp' | while read -l file
        set rel_path (string replace -r "^$input_dir/" "" $file)
        set out_file "$output_dir/(string replace -r '\.bmp$' '.png' $rel_path)"
        mkdir -p (dirname $out_file)
        convert $file $out_file
        echo "Converted $file to $out_file"
    end
end
