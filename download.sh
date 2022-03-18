dir=`dirname "$0"`/resources
mkdir -p $dir
if [ ! -f $dir/genome ]; then
    wget -O $dir/genome https://mycuhk-my.sharepoint.com/:u:/g/personal/1155104476_link_cuhk_edu_hk/ESQmt6QKdlhOpIMPt4TH_GgBzzl4ZQ9ERpqV1KmldE6qDw?download=1
fi
if [ ! -f $dir/libio ]; then
    wget -O $dir/libio https://mycuhk-my.sharepoint.com/:u:/g/personal/1155104476_link_cuhk_edu_hk/Edm0PekKZkJIvI6d6XMxaYABTLq9cGh6jYx1LEulHaRSfg?download=1
fi
if [ ! -f $dir/covid_osm ]; then
    wget -O $dir/covid_osm https://mycuhk-my.sharepoint.com/:u:/g/personal/1155104476_link_cuhk_edu_hk/EccJ9x9OiO1BhTMktQTT-McBG-Nxg-PBA0zwRFaRwSlERw?download=1
fi