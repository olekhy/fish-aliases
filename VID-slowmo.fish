function VID-slowmo --argument-names ext
    # Standardwerte setzen
    set -l ext (string lower (string trim -- $ext))
    if test -z "$ext"
        set ext bmp
    end

    # Zufallsname generieren (passt du ggf. an deine Funktion an)
    set -l prefix (TXT-random-name)

    # CPU-Kerne zählen
    set -l cpu_q (grep -c 'processor' /proc/cpuinfo)
    set -l threads $cpu_q

    # Default-Werte
    set -l pts 4
    set -l framerate 60
    set -l video_format webm
    set -l file_name "$prefix-$pts-$framerate.$video_format"

    # Anzeige der Defaults
    echo "Defaults:
      Threads:        $threads
      File extension: $ext
      PTS:            $pts
      Framerate:      $framerate
      Filename:       $file_name
    "

    # User-Abfrage
    read --prompt-str "Defaults setzen? [Y/n] " def
    set def (string lower (string trim -- $def))

    if test "$def" = "n"
        read --prompt-str "Threads [$threads]: " input_threads
        if test -n "$input_threads"
            set threads $input_threads
        end

        read --prompt-str "PTS [$pts]: " input_pts
        if test -n "$input_pts"
            set pts $input_pts
        end

        read --prompt-str "Framerate [$framerate]: " input_fr
        if test -n "$input_fr"
            set framerate $input_fr
        end

	set file_name "$prefix-$pts-$framerate.$video_format"

        read --prompt-str "Output filename [$file_name]: " input_fn
        if test -n "$input_fn"
            set file_name $input_fn
        end

	echo "New defaults:
           Threads:        $threads
           File extension: $ext
           PTS:            $pts
           Framerate:      $framerate
           Filename:       $file_name
         "
    end

    # ffmpeg Argumente setzen
    set -l setpts "setpts=$pts*PTS,minterpolate='mi_mode=mci:mc_mode=aobmc:vsbmc=1:fps=$framerate'"
    set -l mp4_codec -f mp4 -vcodec libx264
    #set -l mp4_codec -f mp4 -vcodec h264_nvenc
    # Video erstellen
    set -l cmd ffmpeg -hide_banner -v warning -framerate $framerate \
        -pattern_type glob -i "*.$ext" \
        -vf $setpts \
        $mp4_codec \
        -b:v 12M \
        -preset faster \
        -pix_fmt yuva420p \
        -movflags +faststart \
        -threads $threads \
        "$file_name"
    echo $cmd
    
    $cmd
end

