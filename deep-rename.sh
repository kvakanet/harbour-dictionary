#!/bin/bash

find . -iname "*wunderfitz*" \( -not -path "./rpm/*" -and -not -path "./.git/*" \) -execdir bash -c 'file="{}"; new="${file//wunderfitz/dictionary}"; new="${new//Wunderfitz/Dictionary}"; mv -v "$file" "$new";' \;
mapfile -d $'\0' -t files < <(grep -R '[Ww]underfitz' --exclude "deep-rename.sh" --exclude-dir=rpm --exclude-dir=.git -lZ)
sed -i 's/Wunderfitz/Dictionary/g; s/wunderfitz/dictionary/g;' "${files[@]}"
