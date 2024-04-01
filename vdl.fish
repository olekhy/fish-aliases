function vdl --wraps=yt-dlp\ -f\ \'best/bestvideo+bestaudio\'\ -i\ -o\ \'\%\(creator\)s.\%\(webpage_url_basename\)s.\%\(ext\)s\' --wraps='yt-dlp -f "best/bestvideo+bestaudio" -i -o "%(creator)s.%(webpage_url_basename)s.%(ext)s"' --description 'alias vdl=yt-dlp -f "best/bestvideo+bestaudio" -i -o "%(creator)s.%(webpage_url_basename)s.%(ext)s"'
  yt-dlp -f "best/bestvideo+bestaudio" -i -o "%(creator)s.%(webpage_url_basename)s.%(ext)s" $argv; 
end
