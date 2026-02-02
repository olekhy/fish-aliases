function VID-slideshow-i --description 'Erstellt eine Slideshow aus Bildern'
    ffmpeg -f concat -safe 0 -i file_list.txt -vsync vfr -c:v libx264 -crf 0 \
	    -preset veryslow -pix_fmt yuv444p slideshow-i.mp4

end

