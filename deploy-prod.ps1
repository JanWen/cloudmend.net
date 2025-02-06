hugo build --config .\config-prod.toml
ssh cloudmend.net "rm -rf /var/www/cloudmend/prod"
scp -r ./public cloudmend.net:/var/www/cloudmend/prod
ssh cloudmend.net "chown -R cloudmend:webgroup /var/www/cloudmend/prod && chmod -R 750 /var/www/cloudmend/prod && systemctl restart nginx"