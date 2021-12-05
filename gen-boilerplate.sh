read -p "Enter filename [feed.xml]: " fname
fname=${fname:-"feed.xml"}

bptemplate=$(cat "template.xml.dontchange")

read -p "Enter channel title: " rsschanneltitle
read -p "Enter the main url for your site: " rssmainpage
read -p "Enter channel description: " rsschanneldescription
read -p "Enter channel language [en-us]: " rsschannellang
rsschannellang=${rsschannellang:-"en-us"}

bpfinal=$(echo "${bptemplate/rss-channel-lang/$rsschannellang}")
bpfinal=$(echo "${bpfinal/rss-channel-title/$rsschanneltitle}")
bpfinal=$(echo "${bpfinal/rss-channel-description/$rsschanneldescription}")
bpfinal=$(echo "${bpfinal/rss-mainpage/$rssmainpage}")

echo $bpfinal > $fname

echo Done generating boilerplate, now making first post...
./post.sh $fname
