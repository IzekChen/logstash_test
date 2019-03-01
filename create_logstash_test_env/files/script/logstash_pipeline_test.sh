#!/bin/bash


logstash_bin=/usr/share/logstash/bin/logstash
path_data=/admin/logstash/lib/logstash
path_settings=/admin/logstash/etc/logstash
default_config=/admin/logstash/etc/logstash/pipeline/main/conf.d/default.conf


if [ "$1" == "-h" ] || [ "$1" == "default" ] || [ -z "$1" ]; then
    echo "Usage:"
    echo " [-d] or [default]: to run default config test"
    echo " you can supply pipeline config file or directory to run the test"
    echo " for example:"
    echo "       -  ./logstash_pipeline_test.sh /admin/logstash/etc/logstash/pipeline/main/conf.d/default.conf"
    echo "       -  ./logstash_pipeline_test.sh /admin/logstash/etc/logstash/pipeline/main/conf.d/*.conf"
    exit 0

else
    case $parameter in
         default )
	    $logstash_bin --path.data $path_data --path.settings $path_settings -f $default_config &
	    echo $! > /tmp/logstash_pipeline_test_pid.file
	    echo "please check logstash log file to make sure the process running without any error"
	    sleep 30
	    ;;

         * )	
    	    if [[ -d $1 ]]; then
	        echo "$1 is a valid folder"
	        $logstash_bin --path.data $path_data --path.settings $path_settings -f $1 &
	        echo $! > /tmp/logstash_pipeline_test_pid.file
                echo "please check logstash log file to make sure the process running without any error"
                sleep 30
	    elif [[ -f $1 ]]; then
    	        echo "$1 is a valid file"
	        $logstash_bin --path.data $path_data --path.settings $path_settings -f $1 &
                echo $! > /tmp/logstash_pipeline_test_pid.file
                echo "please check logstash log file to make sure the process running without any error"
                sleep 30
	    else
	        echo "$1 is not valid file or directory"
	        exit 1
	    fi	 
	    ;;
    esac
    read -n 1 -s -r -p "Press ENTER to kill logstash testing process"
    kill $(cat /tmp/logstash_pipeline_test_pid.file)
fi
