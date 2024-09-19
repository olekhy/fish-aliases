function standard-version --wraps='docker run -w /sv -u1000:1000 -v ./:/sv -it --rm node:lts npx standard-version --bumpFiles web/package.json web/package-lock.json' --description 'alias standard-version=docker run -w /sv -u1000:1000 -v ./:/sv -it --rm node:lts npx standard-version --bumpFiles web/package.json web/package-lock.json'
  docker run -w /sv -u1000:1000 -v ./:/sv -it --rm node:lts npx standard-version --bumpFiles web/package.json web/package-lock.json $argv; 
end
