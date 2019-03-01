# logstash_test
for test logstash separately even there already have a logstash 

1. run the ansible book to duplicate all the file we need to /admin folder
2. cp the script and set enviroment file 
3. source the enviroment.


check enviroment logstash_test

[root]# which logstash_test
alias logstash_test='/bin/bash /admin/script/logstash_pipeline_test.sh'
	/bin/bash

Run "logstash_test" command
syntax: logstash_test logstash.conf

what the command will do:
    1. check config format
    2. run logstash and output the result to console
    3. click "Enter" to kill the process

example:
logstash_test query_db.conf

```text
[root@tng2088 conf.d]# logstash_test query_db.conf
query_db.conf is a valid file
please check logstash log file to make sure the process running without any error
Sending Logstash logs to /var/log/logstash_test which is now configured via log4j2.properties
[2019-03-01T11:33:48,992][WARN ][logstash.config.source.multilocal] Ignoring the 'pipelines.yml' file because modules or command line options are specified
[2019-03-01T11:33:49,004][INFO ][logstash.runner          ] Starting Logstash {"logstash.version"=>"6.6.0"}
[2019-03-01T11:33:53,282][INFO ][logstash.pipeline        ] Starting pipeline {:pipeline_id=>"main", "pipeline.workers"=>4, "pipeline.batch.size"=>125, "pipeline.batch.delay"=>50}
[2019-03-01T11:33:53,289][INFO ][logstash.filters.jdbcstatic] derby.system.home is: /root
[2019-03-01T11:33:54,604][INFO ][logstash.filters.jdbc.readwritedatabase] loader host_info, fetched 3479 records in: 0.302 seconds
[2019-03-01T11:33:54,734][INFO ][logstash.filters.jdbc.readwritedatabase] loader host_info, saved fetched records to import file in: 0.129 seconds
[2019-03-01T11:33:55,118][INFO ][logstash.filters.jdbc.readwritedatabase] loader host_info, imported all fetched records in: 0.383 seconds
[2019-03-01T11:33:55,119][INFO ][logstash.filters.jdbcstatic] Scheduler operations: Scheduled for: these minutes in the hour [5];these seconds in the minute [0]
[2019-03-01T11:33:55,119][INFO ][logstash.filters.jdbcstatic] Scheduler scan for work frequency is: 2.5
[2019-03-01T11:33:55,743][INFO ][logstash.pipeline        ] Pipeline started successfully {:pipeline_id=>"main", :thread=>"#<Thread:0x44e60268@/usr/share/logstash/logstash-core/lib/logstash/pipeline.rb:157 sleep>"}
[2019-03-01T11:33:55,744][INFO ][logstash.inputs.http     ] Starting http input listener {:address=>"0.0.0.0:8851", :ssl=>"false"}
[2019-03-01T11:33:55,755][INFO ][logstash.agent           ] Pipelines running {:count=>1, :running_pipelines=>[:main], :non_running_pipelines=>[]}
[2019-03-01T11:33:55,818][INFO ][logstash.agent           ] Successfully started Logstash API endpoint {:port=>9600}
Press ENTER to kill logstash testing process{
    "@timestamp" => 2019-03-01T03:34:17.630Z,
       "headers" => {
           "request_path" => "/",
        "http_user_agent" => "curl/7.29.0",
         "content_length" => "21",
           "http_version" => "HTTP/1.1",
           "content_type" => "application/json",
         "request_method" => "POST",
              "http_host" => "localhost:8851",
            "http_accept" => "*/*"
    },
      "@version" => "1"
}
```


