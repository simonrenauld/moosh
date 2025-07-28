#!/bin/bash

MOOSH="docker exec moodle moosh -n -p /opt/bitnami/moodle"
COURSE="5"

echo "Starting Module 1 - Core Python setup..."

# Add new sections (these work correctly)
echo "Adding new sections..."
$MOOSH section-config-set $COURSE 6 name "Welcome & Introduction"
$MOOSH section-config-set $COURSE 7 name "Session 1.1: Python Basics"
$MOOSH section-config-set $COURSE 8 name "Session 1.2: Modules and Packages"
$MOOSH section-config-set $COURSE 9 name "Session 1.3: Data Structures"
$MOOSH section-config-set $COURSE 10 name "Session 1.4: Advanced Data Structures"
$MOOSH section-config-set $COURSE 11 name "Session 1.5: Conditions and Loops"
$MOOSH section-config-set $COURSE 12 name "Session 1.6: Functions"
$MOOSH section-config-set $COURSE 13 name "Session 1.7: Dates and Times"

# Add activities with correct syntax
echo "Adding activities..."
$MOOSH activity-add page $COURSE
$MOOSH activity-add page $COURSE

# Add labels with correct syntax
echo "Adding practice labels..."
$MOOSH label-create --section=7 --text="🧑‍⚕️ Practice: Create patient profiles and calculate BMI" $COURSE
$MOOSH label-create --section=8 --text="📚 Essential libraries: datetime, math, json, csv for healthcare" $COURSE

echo "✅ Module 1 setup completed!"
echo "🌐 Check your course at: http://localhost:8081/course/view.php?id=5"
