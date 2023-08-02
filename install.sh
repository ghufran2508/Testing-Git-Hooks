#!/bin/sh

npm install

echo "import {Hello} from 'Hello'" | tee index.js >/dev/null


echo '#!/bin/sh

# Check for linting errors
eslint --format=stylish.js .

if [ "$?" -ne 0 ]; then
  echo "Linting errors found. Aborting push."
  exit 1
fi

# Continue with the push
exit 0' | tee .git/hooks/pre-push >/dev/null

chmod +x .git/hooks/pre-push

npm init @eslint/config
yes
yes
yes
yes
ayes
yes
yes
yes

echo "Done"
