ssh cloudmend.net "rm -rf /var/www/cloudmend/testing"
scp -r ./public cloudmend.net:/var/www/cloudmend/testing
ssh cloudmend.net "chown -R cloudmend:webgroup /var/www/cloudmend/testing && chmod -R 750 /var/www/cloudmend/testing && systemctl restart nginx"