#!/usr/bin/env sh

# Originally taked from
# [visionmedia/git-extras](https://github.com/visionmedia/git-extras)
# (MIT License).

user="$*"

test -z "$user" && echo "user name required." 1>&2 && exit 1

count=`git log --oneline --pretty="format: %an" | grep "$user" | wc -l`
test $count -eq 0 && echo "$user did not contribute." && exit 1
git shortlog | grep "$user (" -A $count
