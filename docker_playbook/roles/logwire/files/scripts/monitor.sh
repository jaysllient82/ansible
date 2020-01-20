while true
do
  java_openfiles=`ps -ef | grep java | awk '{print $2}' | sed '2d' | xargs -n1 -I {} lsof -p {} | wc -l`
  cat << EOF | curl --data-binary @- http://pushgateway:9091/metrics/job/logwire
      # TYPE java_openfiles gauge
      # HELP java_openfiles lsof -p <pid>
      java_openfiles{app="java_monitor"} $java_openfiles
EOF

  java_threads=`ps -ef | grep java | awk '{print $2}' | sed '2d' | xargs -n1 -I {} ps -T -p {} | wc -l`
  cat << EOF | curl --data-binary @- http://pushgateway:9091/metrics/job/logwire
      # TYPE java_threads gauge
      # HELP java_threads ps -T -p <pid>
      java_threads{app="java_monitor"} $java_threads
EOF

  process_uptime=`date +%s`
  cat << EOF | curl --data-binary @- http://pushgateway:9091/metrics/job/logwire
      # TYPE process_uptime counter
      # HELP process_uptime from script "date +%s"
      process_uptime{app="java_monitor"} $process_uptime
EOF
  sleep 15

done

