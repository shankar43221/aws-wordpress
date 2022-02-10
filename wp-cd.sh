#!/bin/bash
rm -f wp-$pkg.zip
aws s3 cp s3://artifact-storage-devops/php-apps/wp-$pkg.zip .
ssh root@172.31.38.111 'rm -fr /var/www/html/*'
ssh root@172.31.38.111 'rm -fr /tmp/php/'
ssh root@172.31.38.111 'mkdir /tmp/php'
scp wp-$pkg.zip root@172.31.38.111:/tmp/php
ssh root@172.31.38.111 'unzip /tmp/php/wp-*.zip'
ssh root@172.31.38.111 'rm -f tmp/php/wp*.zip'
ssh root@172.31.38.111 'cp -r /tmp/php/* /var/www/html/'
ssh root@172.31.38.111 'rm -fr /tmp/php/'
