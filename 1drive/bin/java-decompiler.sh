#!/bin/bash
# https://stackoverflow.com/questions/28389006/how-to-decompile-to-java-files-intellij-idea
#
if [ $# -lt 2 ]; then
   echo "Usage: java-decompiler.sh /path/to/src/classes.jar /path/to/dest/java.jar"
   exit 1
fi
java -cp "/Applications/IntelliJ IDEA CE.app/Contents/plugins/java-decompiler/lib/java-decompiler.jar" org.jetbrains.java.decompiler.main.decompiler.ConsoleDecompiler -hdc=0 -dgs=1 -rsy=1 -rbr=1 -lit=1 -nls=1 -mpm=60 "$1" "$2"

