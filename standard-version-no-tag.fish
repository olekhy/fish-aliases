function standard-version-no-tag --wraps='docker run -w /sv -u1000:1000 -v ./:/sv -it --rm node:lts npx standard-version --bumpFiles web/package.json web/package-lock.json --skip.tag' --description 'alias standard-version-no-tag=docker run -w /sv -u1000:1000 -v ./:/sv -it --rm node:lts npx standard-version --bumpFiles web/package.json web/package-lock.json --skip.tag'
  docker run -w /sv -u1000:1000 -v ./:/sv -it --rm node:lts npx standard-version --bumpFiles web/package.json web/package-lock.json --skip.tag $argv; 
end
