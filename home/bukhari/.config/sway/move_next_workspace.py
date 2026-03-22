import i3ipc
import argparse
import sys

def is_at_edge(tree, direction):
    """Check if focused window is at the edge of its parent in the given direction.
    Only considers it 'at edge' when the direction aligns with the parent layout:
    - splith/tabbed: left/right can be at edge
    - splitv/stacking: up/down can be at edge
    - orthogonal directions always return False (not at edge → do local move)"""
    focused = tree.find_focused()
    if not focused or not focused.parent:
        return True
    parent = focused.parent
    siblings = parent.nodes
    if not siblings:
        return True

    layout = parent.layout
    # Check if direction aligns with parent layout
    horizontal_layouts = ('splith', 'tabbed')
    vertical_layouts = ('splitv', 'stacking')

    if direction in ('left', 'right') and layout not in horizontal_layouts:
        return False  # orthogonal — always do local move
    if direction in ('up', 'down') and layout not in vertical_layouts:
        return False  # orthogonal — always do local move

    if direction in ('left', 'up'):
        return siblings[0].id == focused.id
    else:  # right, down
        return siblings[-1].id == focused.id

def next_workspace(next):

    setup = "vertical" # or horizontal

    num = int(next)

    # Determine the move direction
    if setup == "vertical":
        if abs(num) == 10 and num > 0:
            direction = "up"
        elif abs(num) == 10 and num < 0:
            direction = "down"
        elif abs(num) == 1 and num < 0:
            direction = "left"
        else:
            direction = "right"
    else:
        if abs(num) == 10 and num > 0:
            direction = "right"
        elif abs(num) == 10 and num < 0:
            direction = "left"
        elif abs(num) == 1 and num < 0:
            direction = "down"
        else:
            direction = "up"

    # If not at edge, move within the layout and stop
    if not is_at_edge(ipc.get_tree(), direction):
        ipc.command(f"move {direction}")
        ipc.main_quit()
        sys.exit(0)
        return

    # At the edge — move to next workspace
    prev_workspace = ipc.get_tree().find_focused().workspace().num
    next_ws = prev_workspace + num

    if abs(num) == 1:
        if (prev_workspace > 10 and prev_workspace < 20) and (next_ws > 19 or next_ws < 11):
            return
        if (prev_workspace > 0 and prev_workspace < 10) and (next_ws > 9 or next_ws < 1):
            return
    if abs(num) == 10:
        if next_ws > 19:
            return
    ipc.command(f"move container to workspace number {next_ws}")
    ipc.command(f"workspace number {next_ws}")

    ipc.main_quit()
    sys.exit(0)

if __name__ == "__main__":
    ipc = i3ipc.Connection()

    parser = argparse.ArgumentParser(
        description='Switch to next workspace by num')
    parser.add_argument('num', metavar='NEXT_NUM', type=int,
                        help='specifiy next workspace, use minus no. to go to left')
    args = parser.parse_args()

    next_workspace(args.num)

    ipc.main()
