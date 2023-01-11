# Defined in - @ line 1
function ya --wraps='youtube-dl --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3' --description 'alias ya=youtube-dl --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3'
  youtube-dl --ignore-errors --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3 $argv;
end
