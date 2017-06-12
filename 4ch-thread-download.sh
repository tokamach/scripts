#!/bin/bash

board="$(printf -- '%s' "${1:?}" | cut -d '/' -f4)"
thread="$(printf -- '%s' "${1:?}" | cut -d '/' -f6)"
wget -qO- "https://a.4cdn.org/${board}/thread/${thread}.json" | jq -r '
.posts
| map(select(.tim != null))
| map((.tim | tostring) + .ext)
| map("https://i.4cdn.org/'"${board}"'/"+.)[]
' | xargs wget -U 'Mozilla/5.0' -nv
