#!/usr/bin/env ash
# from https://askubuntu.com/questions/27314/script-to-display-all-terminal-colors
# for x in {0..8}; do 
#     for i in {30..37}; do 
# 		for a in {40..47}; do 
#             echo -en "$EINS \033[$x;$i;$a""m\\\033[$x;$i;$a""m\033[0;37;40m "
#         done
#         echo -en "\033[0m"
# 		echo
# 	done
# done

# POSIX version without bash'isms
i=0; m=8 # while [ $i -le $m ]
for i in 0 1 4 5 7 8; do
	j=30; n=37
	while [ $j -le $n ]; do
		k=40; o=47
		while [ $k -le $o ]; do
		    echo -en "$EINS \033[$i;$j;$k""m\\\033[$i;$j;$k""m\033[0;37;40m "
			k=$(($k + 1))
		done
		j=$(($j + 1))
	    echo -en "\033[0m"
		echo
	done
	i=$(($i + 1))
done

echo ""


#
#   This file echoes a bunch of color codes to the 
#   terminal to demonstrate what's available.  Each 
#   line is the color code of one foreground color,
#   out of 17 (default + 16 escapes), followed by a 
#   test use of that color on all nine background 
#   colors (default + 8 escapes).
#

T='gM0'   # The test text

echo -e "\n                 40m     41m     42m     43m\
     44m     45m     46m     47m";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
  done
  echo;
done
echo


exit 0
######################################################################
color and text formatting
ESC[#(;#)m there can be multiple text formatting sequence numbers separated by a ; and ending with an m where
the # is of the following values:

attributes (2, 3, 6 skipped?)
0	normal display
1	bold
4	underline (mono only)
5	blink on
7	reverse video on
8	nondisplayed (invisible)
foreground colors
30	black
31	red
32	green
33	yellow
34	blue
35	magenta
36	cyan
37	white
background colors
40	black
41	red
42	green
43	yellow
44	blue
45	magenta
46	cyan
47	white

