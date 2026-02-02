function IMG-png-to-bmp
    for f in *.png
        set out (string replace -r '\.png$' '.bmp' $f)
        convert "$f" bmp3:"$out"
        echo "✔ $f → $out"
    end
end

