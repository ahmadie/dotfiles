#!/usr/bin/env sh
# requires jq

# stick_to="name"  	# stick to the workspace
stick_to="output"	# stick to the screen

initial=$(
	swaymsg -t get_workspaces |
	jq -r ".[] | select(.focused == true) | .$stick_to"
)

py_script=$(cat <<EOF
import sys
from numpy import roll

s, w = [], []
for l in sys.stdin.readlines():
	screen, workspace =  l.strip().split(':')
	s.append(screen)
	w.append(workspace)

for line in zip(s, roll(s, 1), roll(w, 1), roll(w, 2)):
	print(':'.join(line))
EOF
)

IFS=:
swaymsg -t get_outputs |
jq -r '.[] | select(.active == true) | "\(.name):\(.current_workspace)"' |
/usr/bin/env python3 -c "$py_script" |
while read -r screen_dst screen_src workspace_to_move workspace_to_restore
do
	swaymsg -- workspace --no-auto-back-and-forth "$workspace_to_move"
	swaymsg move workspace to output "$screen_dst"
	swaymsg focus output "$screen_src"
	swaymsg -- workspace --no-auto-back-and-forth "$workspace_to_restore"
	echo "moved $workspace_to_move to $screen_dst"
	echo "and restored $screen_src to $workspace_to_restore"
done

if [ $stick_to = "output" ]
then
	swaymsg focus output $initial
else
	swaymsg workspace $initial
fi
