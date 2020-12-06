import i3ipc
from functools import partial
import argparse
import sys

def next_workspace(num):

    for window in ipc.get_tree():
        if window.focused:
            prev_window = window

    setup = "vertical" # or horizontal

    if setup == "vertical":
        if abs(num) == 10 and num > 0:
            ipc.command("focus up")
        elif abs(num) == 10 and num < 0:
            ipc.command("focus down")
        elif abs(num) == 1 and num < 0:
            ipc.command("focus left")
        elif abs(num) == 1 and num > 0:
            ipc.command("focus right")
    else:
        # for horizontal setup
        if abs(num) == 10 and num > 0:
            ipc.command("focus right")
        elif abs(num) == 10 and num < 0:
            ipc.command("focus left")
        elif abs(num) == 1 and num < 0:
            ipc.command("focus down")
        elif abs(num) == 1 and num > 0:
            ipc.command("focus up")

    for window in ipc.get_tree():
        if window.focused:
            next_window = window

    if prev_window.id == next_window.id and abs(num) == 1:
        prev_workspace = ipc.get_tree().find_focused().workspace().num
        next_workspace = prev_workspace + num
        if next_workspace == 10 and prev_workspace == 11:
            return
        if next_workspace == 11 and prev_workspace == 10:
            return
        if next_workspace > 0 and next_workspace <= 20:
            ipc.command(f"workspace number {next_workspace}")

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
