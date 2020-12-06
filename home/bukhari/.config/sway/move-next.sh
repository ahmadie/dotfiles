wsNext=$(( $( swaymsg -t get_workspaces | jq '.[] | select(.focused).num' ) + $1))
swaymsg move container to workspace number $wsNext
swaymsg workspace number $wsNext
