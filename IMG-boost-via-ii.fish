function IMG-boost-via-ii

    set input_dir $argv[1]
    set output_dir $argv[2]
    set ext $argv[3]
    set scale $argv[4]

    if not test -d $input_dir
        echo "❌ Input-Verzeichnis existiert nicht"
        return 1
    end

    if not test -d $output_dir
        mkdir -p $output_dir
    end

    source /home/it/i/dev/olekhy/photo-realistica/Real-ESRGAN/venv/bin/activate.fish

    # Bash-Block für das eigentliche Parallel-Skript
    bash -c "
    find '$input_dir' -type f \\( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.bmp' \\) \
    | parallel -j 1 --bar --will-cite '
        input=\"{}\"
        input_dir=\"$input_dir\"
        output_dir=\"$output_dir\"

        rel_path=\"\${input#\$input_dir/}\"
        output=\"\$output_dir/\$rel_path\"

        mkdir -p \"\$(dirname \"\$output\")\"
#-dn 1..3 3 max rauschen entfernen
# -n realesr-general-x4v3
# -n RealESRGAN_x2plus
        python /home/it/i/dev/olekhy/photo-realistica/Real-ESRGAN/inference_realesrgan.py \
            -i \"\$input\" \
            -o \"\$output\" \
            -n realesr-general-x4v3 \
            --tile 32 \
            -s '$scale' \
            -dn 1 \
            --ext \"$ext\" \
            --suffix \"\"
    '
    "
end
