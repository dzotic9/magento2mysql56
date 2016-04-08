FROM dzub2/mysql56
ENV MYSQL_PASS dhXAwnA15I
RUN service mysql start;\
        wget "https://raw.githubusercontent.com/dzotic9/magento2mysql56/master/dump.sql" -O /tmp/dump.sql 2>&1;\
        /usr/bin/mysql -uroot -pdhXAwnA15I -e "CREATE DATABASE magento;" 2>&1;\
        /usr/bin/mysql -uroot -pdhXAwnA15I magento < /tmp/dump.sql 2>&1;\
        /usr/bin/mysql -uroot -pdhXAwnA15I -e " GRANT ALL PRIVILEGES on *.* TO 'root'@'%' IDENTIFIED BY 'dhXAwnA15I' WITH GRANT OPTION;" 2>&1;\
        service mysql start;
