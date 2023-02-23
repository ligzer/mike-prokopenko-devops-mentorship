# Home task for aws mentorship

![This logo created with dall-e 2](./images/DALL-E-aws-logo.png)

##

## ***
### How to protect master branch on your local machine

1. Create file ``.git/hooks/pre-commit``
```text
#!/bin/sh
# .git/hooks/pre-commit

branch="$(git rev-parse --abbrev-ref HEAD)"

if [ "$branch" = "main" ]; then
  echo "You can't commit directly to master branch"
  exit 1
fi

```
2. make it executable
```shell
chmod +x .git/hooks/pre-commit
```
3. Enjoy