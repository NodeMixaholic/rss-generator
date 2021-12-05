posttemplate=$(cat "post-template.xml.dontchange")
fname=$1
read -p "Enter post title: " rssposttitle
read -p "Enter post author email: " rsspostauthor
read -p "Press ENTER to use nano to enter post contents..."
randomfn="/tmp/post-content-$RANDOM"
nano $randomfn
rsspostcontent=$(cat $randomfn)

echo A1
rsspostdate=$(date -R)
echo A2
postfinal=$(echo "${posttemplate/post-title/$rssposttitle}")
echo A3
postfinal=$(echo "${postfinal/post-author/$rsspostauthor}")
echo A4
postfinal=$(echo "${postfinal/post-content/$rsspostcontent}")
echo A5
postfinal=$(echo "${postfinal/post-date/$rsspostdate}")

oldcontent=$(cat $fname)
echo "${oldcontent/'</channel>'/$postfinal}" > $fname

echo Done.
echo Note that to use this post script in the future, you must specify a filename
echo Example:
echo "./post.sh $1"
