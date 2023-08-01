Yes, it is possible to check for linting when you push a commit to GitHub. You can do this by using a **git hook**. A git hook is a script that runs automatically when you run a specific command, such as `git push`.

To check for linting, you would create a git hook that runs a linter on your code. If the linter finds any errors, the git hook would abort the push.

Here is an example of a git hook that checks for linting:

```
#!/bin/sh

# Check for linting errors
linters=(flake8 eslint)
for linter in "${linters[@]}"; do
  if ! command -v "${linter}" >/dev/null; then
    echo "Skipping linting for ${linter}: command not found"
    continue
  fi

  output=$("${linter}" --format=quiet --ignore=E501 "$@")
  if [ -n "${output}" ]; then
    echo "Linting errors found for ${linter}:"
    echo "${output}"
    exit 1
  fi
done

# Continue with the push
exit 0
```

This git hook will run the `flake8` and `eslint` linters on your code. If either linter finds any errors, the git hook will abort the push.

You can save this script as `pre-push` in your repository's `.git/hooks` directory. Then, when you run `git push`, the `pre-push` script will run and check for linting errors.

For more information on git hooks, you can refer to the official documentation: https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks.
