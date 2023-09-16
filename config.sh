#!/bin/sh

declare -a log_files

# follow the below pattern to add log files 
log_files=(
    "1,testlog1,/var/log/logtest/testlogfile1-DATE.log"
    "2,testlog2,/var/log/logtest/testlogfile2-DATE.log"
    "3,testlog3,/var/log/logtest/testlogfile3.log"
)
