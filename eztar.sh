#!/bin/sh

source ./config.sh

# Prepare an array just for the select command, extracting the second element of each tuple
select_options=()
for tuple in "${log_files[@]}"; do
    IFS=',' read -ra PARTS <<< "$tuple"
    select_options+=("${PARTS[1]}")
done
select_options+=("Continue")

selected_logs=()

# Today's date in the specified format

read -p "Enter the date for the logs you want in the format YYYYMMDD, T for today, or Y for yesterday: " selected_date

if [[ $selected_date == "T" ]]; then
    today=$(date '+%Y%m%d')
elif [[ $selected_date == "Y" ]]; then
    today=$(date -d "yesterday" '+%Y%m%d')
else
    today=$selected_date   
fi

# Display the menu using select
PS3='Please enter your choice: '
while true; do
    select opt in "${select_options[@]}"; do

        if [[ "$opt" == "Continue" ]]; then
            break 2
        fi
        # Find the matching log file
        for tuple in "${log_files[@]}"; do
            IFS=',' read -ra PARTS <<< "$tuple"
            if [[ "$opt" == "${PARTS[1]}" ]]; then
                log_path="${PARTS[2]}"
                
                # Replace DATE with today's date if needed
                log_path=${log_path//DATE/$today}
                
                echo "Selected log file path: $log_path"
                selected_logs+=("$log_path")
                
                break
            fi
        done
        
        # Exit the loop
        break
    done
done

read -p "Enter a name for the exported tar file: " file_name

tar -czf "${file_name}.tar.gz" "${selected_logs[@]}"
