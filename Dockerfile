FROM dzub2/mysql56
ENV MYSQL_PASS dhXAwnA15I
RUN echo 1 2>&1;\
        service mysql start;\
        wget "https://download.jelastic.com/public.php?service=files&t=5040222e5cc43d91522ad0891f7051bd&download" -O /tmp/dump.sql 2>&1;\
        /usr/bin/mysql -uroot -pdhXAwnA15I -e "CREATE DATABASE magento;" 2>&1;\
        /usr/bin/mysql -uroot -pdhXAwnA15I magento < /tmp/dump.sql 2>&1;\
        /usr/bin/mysql -uroot -pdhXAwnA15I -e " GRANT ALL PRIVILEGES on *.* TO 'root'@'%' IDENTIFIED BY 'dhXAwnA15I' WITH GRANT OPTION;" 2>&1;\
        service mysql start;
