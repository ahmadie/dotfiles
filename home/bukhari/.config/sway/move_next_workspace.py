import i3ipc
from functools import partial
import argparse
import sys
import time

def get_tree_position(tree):
    """Return (parent_id, child_index) for the focused window."""
    focused = tree.find_focused()
    if not focused:
        return (None, None)
    parent = focused.parent
    if not parent:
        return (None, None)
    for i, child in enumerate(parent.nodes + parent.floating_nodes):
        if child.id == focused.id:
            return (parent.id, i)
    return (parent.id, None)

def next_workspace(next):

    prev_parent_id, prev_index = get_tree_position(ipc.get_tree())

    setup = "vertical" # or horizontal

    num = int(next)

    if setup == "vertical":
        if abs(num) == 10 and num > 0:
            ipc.command("move up")
        elif abs(num) == 10 and num < 0:
            ipc.command("move down")
        elif abs(num) == 1 and num < 0:
            ipc.command("move left")
        elif abs(num) == 1 and num > 0:
            ipc.command("move right")
    else:
        # for horizontal setup
        if abs(num) == 10 and num > 0:
            ipc.command("move right")
        elif abs(num) == 10 and num < 0:
            ipc.command("move left")
        elif abs(num) == 1 and num < 0:
            ipc.command("move down")
        elif abs(num) == 1 and num > 0:
            ipc.command("move up")

    next_parent_id, next_index = get_tree_position(ipc.get_tree())

    # If parent or index changed, the container moved within the workspace
    if prev_parent_id != next_parent_id or prev_index != next_index:
        ipc.main_quit()
        sys.exit(0)
        return

    # Container didn't move — it's at the edge, move to next workspace
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
