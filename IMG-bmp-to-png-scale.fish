function IMG-bmp-to-png-scale
    if test (count $argv) -lt 2
        echo "❌ Usage: IMG-bmp-to-png-scale <input.bmp> <resolution: hd|fhd|2k|4k>"
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

    # Ziel-Seitenverhältnis
    set -l target_aspect (math "$width / $height")

    set -l filter "scale=if(gt(a\\,$target_aspect)\\,$width\\,-1):if(gt(a\\,$target_aspect)\\,-1\\,$height)"

    set -l cmd ffmpeg -hide_banner -v warning -y -i "$input" -vf "$filter" "$output"

    printf '▶ %s\n' (string escape -- $cmd)
    $cmd

    echo "✅ Converted: $input → $output"
end
