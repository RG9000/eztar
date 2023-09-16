# EZTAR
A simple tool to make it easier to tar up log files on customer machines for use in creating support tickets

## USAGE
Simply run ./eztar.sh from the cloned directory. Follow the prompts to build up the tar file.

## CONFIGURATION
Edit the config.sh file to add log files to be tracked by the application

```
"1,testlog1,/var/log/logtest/testlogfile1-DATE.log"
```

Increment the value in the left most value.
In the middle value, put a human readable name for the log.
Then enter the log's file path. Use DATE to denote a date in the format YYYYMMDD.
