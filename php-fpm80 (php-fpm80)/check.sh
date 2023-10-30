
################################################################################
# Author: Stefan Lousberg
# Contact: stefan.lousberg@owasp.org
################################################################################
#!/usr/bin/env bash

PHP_FPM80_STATUS=$(systemctl is-active php-fpm80)

if [ "$PHP_FPM80_STATUS" == "active" ]; then
    echo "php-fpm80 is running"
    exit 0
else
    echo "php-fpm80 is not running"
    exit 1
fi
