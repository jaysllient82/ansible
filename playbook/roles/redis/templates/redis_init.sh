#!/usr/bin/expect
set time 30
spawn /tmp/{{ redis_package_version }}/utils/install_server.sh
expect {
  "Please select the redis port for this instance:" { send "{{ redis_port }}\r"; exp_continue }
  "Please select the redis config file name" { send "{{ redis_conf_path }}\r"; exp_continue }
  "Please select the redis log file name" { send "{{ redis_log_path }}\r"; exp_continue }
  "Please select the data directory for this instance " { send "{{ redis_data_path }}\r"; exp_continue }
  "Please select the redis executable path" { send "/usr/local/bin/redis-server\r"; exp_continue }
  "Is this ok?" { send "\r" }

}
expect eof
exit

