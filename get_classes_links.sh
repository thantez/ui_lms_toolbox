linecount=$(wc -l < "$1")
for ((i=1; i<=linecount; i++))
do
  link=$(sed -n "$i p" < "$1")
  curl $link | grep -P "https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)" -o | tail -1 >> "$2"

done
