# Defined in - @ line 1
function xa --wraps='yt-dlp -x --audio-format mp3 --audio-quality 0 ' --description 'alias xa=yt-dlp -x --audio-format mp3 --audio-quality 0 '
  yt-dlp -x --audio-format mp3 --audio-quality 0  $argv;
end
