#!/bin/bash

MOOSH="docker exec moodle moosh -n -p /opt/bitnami/moodle"
COURSE="5"

echo "🔧 UPDATING SECTION NAMES VIA SQL"
echo "================================"

# Update all section names directly in database
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🎯 Python Academy Overview - J&J D4U Initiative' WHERE course = $COURSE AND section = 1;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '📖 Welcome & Introduction' WHERE course = $COURSE AND section = 6;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🐍 Session 1.1: Python Basics for Healthcare' WHERE course = $COURSE AND section = 7;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '📦 Session 1.2: Modules and Packages' WHERE course = $COURSE AND section = 8;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🗂️ Session 1.3: Data Structures' WHERE course = $COURSE AND section = 9;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🏥 Session 1.4: Advanced Data Structures' WHERE course = $COURSE AND section = 10;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🔍 Session 1.5: Conditions and Loops' WHERE course = $COURSE AND section = 11;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '⚡ Session 1.6: Functions' WHERE course = $COURSE AND section = 12;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '⏰ Session 1.7: Dates and Times' WHERE course = $COURSE AND section = 13;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '📝 Session 1.8: Regular Expressions' WHERE course = $COURSE AND section = 14;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🏗️ Session 1.9: Classes' WHERE course = $COURSE AND section = 15;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🎭 Session 1.10: Decorators' WHERE course = $COURSE AND section = 16;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🛠️ Session 1.11: Virtual Environments' WHERE course = $COURSE AND section = 17;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🛡️ Session 1.12: Exception Handling' WHERE course = $COURSE AND section = 18;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🔒 Session 1.13: Context Managers' WHERE course = $COURSE AND section = 19;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🔄 Session 1.14: Iterators and Generators' WHERE course = $COURSE AND section = 20;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '📄 Session 1.15: String Processing' WHERE course = $COURSE AND section = 21;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🌐 Session 1.16: APIs and JSON' WHERE course = $COURSE AND section = 22;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '📋 Module Assessment' WHERE course = $COURSE AND section = 23;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🏆 Capstone Project' WHERE course = $COURSE AND section = 24;"
$MOOSH sql-run "UPDATE mdl_course_sections SET name = '🚀 Next Steps: PySpark Preparation' WHERE course = $COURSE AND section = 25;"

echo "✅ Section names updated in database"

# Verify the changes
echo ""
echo "🔍 Verifying section names:"
$MOOSH sql-run "SELECT section, name FROM mdl_course_sections WHERE course = $COURSE ORDER BY section;"

# Clear Moodle cache
echo ""
echo "🧹 Clearing Moodle cache..."
$MOOSH cache-purge

echo ""
echo "✅ Complete! Please refresh your browser: http://localhost:8081/course/view.php?id=5"
echo "   Use Ctrl+F5 to force refresh and clear browser cache"
