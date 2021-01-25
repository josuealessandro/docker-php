echo $DOCUMENT_ROOT
sed -ri -e "s!/var/www/html!$DOCUMENT_ROOT!g" /etc/apache2/sites-available/*.conf
sed -ri -e "s!/var/www/!$DOCUMENT_ROOT!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

service apache2 start
tail -f /var/log/apache2/error.log