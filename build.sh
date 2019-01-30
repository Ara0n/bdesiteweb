for i in "src/pages/"*; do
	n="`echo $i | cut -d '/' -f 3`"
	cat src/template/head.html | sed s/__ID_PAGE__/`echo $n | cut -d '.' -f 1` > /var/www/bde-infossible.tk/html/$n
	cat $i src/template/foot.html >> /var/www/bde-infossible.tk/html/$n
done
cp src/assets/* /var/www/bde-infossible.tk/html/assets
lessc src/styles/styles.less /var/www/bde-infossible.tk/html/res/styles.css