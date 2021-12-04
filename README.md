DB_USER=
DB_PASS=

if getting auth error for `mySQL` when using version > 8

`mysql> ALTER USER 'user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_new_password';`
`mysql> FLUSH PRIVILEGES;`
