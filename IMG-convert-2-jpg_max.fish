function convert_bild_jpg_max
    convert $argv[1] -strip -colorspace sRGB -quality 100 $argv[2]
end
