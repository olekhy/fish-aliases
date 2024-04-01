function vdlpl --wraps=yt-dlp\ -f\ \'best/bestvideo+bestaudio\'\ -o\ \'\%\(creator\)s.\%\(webpage_url_basename\)s.\%\(ext\)s\'\ -ia\ \ \ -P\  --wraps='yt-dlp -f "best/bestvideo+bestaudio" -o "%(creator)s.%(webpage_url_basename)s.%(ext)s" -ia $1  -P $2' --wraps='yt-dlp -f "best/bestvideo+bestaudio" -o "%(creator)s.%(webpage_url_basename)s.%(ext)s" -i' --description 'alias vdlpl=yt-dlp -f "best/bestvideo+bestaudio" -o "%(creator)s.%(webpage_url_basename)s.%(ext)s" -i'
  yt-dlp -f "best/bestvideo+bestaudio" -o "%(creator)s.%(webpage_url_basename)s.%(ext)s" -i $argv; 
end
