posttemplate=$(cat "post-template.xml.dontchange")
fname=$1
read -p "Enter post title: " rssposttitle
read -p "Enter post author: " rsspostauthor
read -p "Press ENTER to use nano to enter post contents..."
randomfn="/tmp/post-content-$RANDOM"
nano $randomfn
rsspostcontent=$(cat $randomfn)

postfinal=$(echo "${posttemplate/post-title/$rssposttitle}")
postfinal=$(echo "${postfinal/post-author/$rsspostauthor}")
postfinal=$(echo "${postfinal/post-content/$rsspostcontent}")

oldcontent=$(cat $fname)
echo "${oldcontent/'</rss>'/$postfinal}" > $fname

echo Done.
echo Note that to use this post script in the future, you must specify a filename
echo Example:
echo "./post.sh $1"
