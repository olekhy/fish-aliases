function FS-bmp-to-png-scale
    if test (count $argv) -lt 2
        echo "❌ Usage: FS-bmp-to-png-scale <input.bmp> <resolution: hd|fhd|2k|4k>"
        return 1
    end

    set input $argv[1]
    set res $argv[2]

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

    set output (string replace -r '\.bmp$' '.png' -- $input)

    ffmpeg -y -i $input -vf "scale='if(gt(a,{$width}/{$height}),{$width},-1)':'if(gt(a,{$width}/{$height}),-1,{$height})'" $output
    echo "✅ Converted: $input → $output"
end
