FROM mariadb:10.3

ADD init.sql.gz /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD kmsDb#1234
ENV MYSQL_DATABASE kms_admin

CMD ["--character_set_server=utf8", "--lower_case_table_names=1"]
