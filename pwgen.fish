function pwgen --wraps='openssl rand -base64 12' --description 'alias pwgen=openssl rand -base64 12'
  openssl rand -base64 12 $argv; 
end
