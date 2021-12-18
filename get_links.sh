#!/bin/bash

rm -fr cookie.txt group_page.html dup_links.txt

curl -sSL -c cookie.txt --request POST 'http://lms.ui.ac.ir/login' --header 'Content-Type: application/x-www-form-urlencoded' --data-urlencode "username=$1" --data-urlencode "password=$2" --data-urlencode 'submit=' --data-urlencode 'member=' --data-urlencode 'return_url=' -o /dev/null

curl -b cookie.txt --location --request GET "http://lms.ui.ac.ir/group/$3" -o group_page.html

content_id=$(cat group_page.html | grep -P "content_id\/\' \+ [0-9]{4,5}" -o | tail -1 | grep -P "[0-9]{4,5}" -o)

for ((i=1; i<=10; i++))
do
  curl -b cookie.txt --location --request POST "http://lms.ui.ac.ir/widget/index/content_id/$content_id" --header 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'format=html' --data-urlencode "subject=group_$3" --data-urlencode 'search=' --data-urlencode "page=$i" | grep -P 'href="/jaam/joinrecording.*"' -o | grep -P '"/.*" ' -o | tr -d '"' >> dup_links.txt
done

sed -e 's/^/http:\/\/lms.ui.ac.ir/' dup_links.txt | sed 's/[[:blank:]]*$//' | awk '!seen[$0]++' > $4

rm -fr cookie.txt group_page.html
