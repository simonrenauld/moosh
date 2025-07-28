#!/bin/bash

# List all modules in course 5, filter out section headers, and delete each module only once
php moosh.php -n=localhost course-modules-list 5 | \
awk -F',' '{print $1,$3}' | \
grep -v 'section' | \
while read moduleid modname; do
    if [[ "$moduleid" =~ ^[0-9]+$ ]]; then
        echo "Deleting module $moduleid ($modname)"
        php moosh.php -n=localhost module-delete $moduleid
    fi
done

