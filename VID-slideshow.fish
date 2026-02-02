function VID-slideshow --description 'Erstellt eine Slideshow aus Bildern'
    set -l fps_in 2.8
    set -l fps_out 124
    set -l pattern "*.jpg"
    set -l output "slideshow-pfs-$fps_in.mp4"

    read --prompt-str "Input pattern [$pattern]: " user_pattern
    if test -n "$user_pattern"
        set pattern "$user_pattern"
    end

    read --prompt-str "Input framerate (frames per image) [$fps_in]: " user_fps_in
    if test -n "$user_fps_in"
        set fps_in "$user_fps_in"
    end

    read --prompt-str "Output framerate (smoothness) [$fps_out]: " user_fps_out
    if test -n "$user_fps_out"
        set fps_out "$user_fps_out"
    end

    set output "slideshow-pfs-$fps_in.mp4"

    read --prompt-str "Output filename [$output]: " user_output
    if test -n "$user_output"
        set output "$user_output"
    end

    echo "Erstelle Slideshow mit:"
    echo "  Eingabemuster: $pattern"
    echo "  Framerate:     $fps_in -> $fps_out"
    echo "  Datei:         $output"

    ffmpeg -framerate $fps_in -pattern_type glob -i "$pattern" \
        -crf 0 -c:v libx264 -r $fps_out -pix_fmt yuv444p -preset veryslow "$output"
end

