#!/usr/bin/expect
set time 30
spawn /usr/local/postgresql/bin/psql
expect {
  "postgres=#" { send "ALTER USER postgres WITH PASSWORD '{{ postgresql_password }}';\r"; exp_continue }
  "ALTER USER postgres WITH PASSWORD" { send "quit;\r" }
}
expect eof
exit
