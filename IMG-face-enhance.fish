function IMG-face-enhance
    # Parameter: Verzeichnis, Dateiendung, Fidelity (optional)
    set IN_DIR $argv[1]
    set EXTENSION $argv[2]

    # Default fidelity = 0.8
    if test (count $argv) -ge 3
        set FIDELITY $argv[3]
    else
        set FIDELITY 0.8
    end

    if test -z "$IN_DIR" -o -z "$EXTENSION"
        echo "Usage: IMG-face-enhance <input_dir> <extension> [fidelity]"
        return 1
    end

    # Virtualenv aktivieren
    source /home/it/i/dev/olekhy/photo-realistica/CodeFormer/venv/bin/activate.fish

    # Ausgabe-Ordner
    set OUT_DIR "$IN_DIR-face-enhanced"
    mkdir -p $OUT_DIR

    # Bilder verarbeiten, Stück für Stück, um GPU-Speicher zu schonen
    for img in (find $IN_DIR -type f -name "*.$EXTENSION")
        echo "Processing $img ..."
        python /home/it/i/dev/olekhy/photo-realistica/CodeFormer/inference_codeformer.py \
            --input_path $img \
            --output_path $OUT_DIR \
            --fidelity $FIDELITY
    end
end

