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




