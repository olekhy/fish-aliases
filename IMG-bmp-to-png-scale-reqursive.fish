function FS-bmp-to-png-recursive
    if test (count $argv) -lt 1
        echo "❌ Usage: FS-bmp-to-png-recursive <resolution: hd|fhd|2k|4k> [path]"
        return 1
    end

    set res $argv[1]
    set search_path "."
    if test (count $argv) -ge 2
        set search_path $argv[2]
    end

    switch $res
        case hd
            set width 1280
            set height 720
        case fhd
            set width 1920
            set height 1080
        case 2k
            set width 2560
            set height 1440
        case 4k
            set width 3840
            set height 2160
        case '*'
            echo "❌ Unknown resolution preset: $res"
            return 1
    end

    for img in (find $search_path -type f -iname '*.bmp')
        set output (string replace -r '\.bmp$' '.png' -- $img)
        echo "🎞️  Converting $img → $output"
        ffmpeg -y -i $img -vf "scale='if(gt(a,{$width}/{$height}),{$width},-1)':'if(gt(a,{$width}/{$height}),-1,{$height})'" $output
    end

    echo "✅ All .bmp files in '$search_path' converted to $res resolution."
end


