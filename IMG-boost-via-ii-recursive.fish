function convert_bild_recursive_jpg_max
    if test (count $argv) -ne 2
        echo "Usage: jpgmax_recursive <input_dir> <output_dir>"
        return 1
    end

    set input_dir $argv[1]
    set output_dir $argv[2]

    # Alle bmp-Dateien rekursiv finden
    find $input_dir -type f -name '*.bmp' | while read -l file
        # relativer Pfad zum input_dir
        set rel_path (string replace -r "^$input_dir/" "" $file)
        # neuer Zielpfad mit .jpg Endung
        set out_file "$output_dir/(string replace -r '\.bmp$' '.jpg' $rel_path)"
        # Zielordner erstellen
        mkdir -p (dirname $out_file)
        # convert ausführen
        convert $file -strip -colorspace sRGB -quality 100 $out_file
        echo "Converted: $file -> $out_file"
    end
end
