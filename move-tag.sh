#!/bin/bash
# Return date of tag. (To use in another alias)
tag-date = "!git show $1 | awk '{ if ($1 == \"Date:\") { print substr($0, index($0,$3)) }}' | tail -2 | head -1 #"

# Show tag message
tag-message = "!git show $1 | awk -v capture=0 '{ if(capture) message=message\"\\n\"$0}; BEGIN {message=\"\"}; { if ($1 == \"Date:\" && length(message)==0 ) {capture=1}; if ($1 == \"commit\" ) {capture=0}  }; END { print message }' | sed '$ d' | cat -s #"

### Move tag. Use: git tagm <tagname> <newcommit>
tagm = "!GIT_TAG_MESSAGE=$(git tag-message $1) && GIT_COMMITTER_DATE=$(git tag-date $1) && git tag-message $1 && git tag -d $1 && git tag -a $1 $2 -m \"$GIT_TAG_MESSAGE\" #"

### Move pushed tag. Use: git tagmp <tagname> <newcommit>
tagmp = "!git tagm $1 $2 && git push --delete origin $1 && git push origin $1 #"