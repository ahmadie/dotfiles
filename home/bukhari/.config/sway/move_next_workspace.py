import i3ipc
from functools import partial
import argparse
import sys

def next_workspace(num):

    for window in ipc.get_tree():
        if window.focused:
            prev_window = window

    if abs(num) == 10 and num > 0:
        ipc.command("focus up")
    elif abs(num) == 10 and num < 0:
        ipc.command("focus down")
    elif abs(num) == 1 and num < 0:
        ipc.command("focus left")
    elif abs(num) == 1 and num > 0:
        ipc.command("focus right")

    for window in ipc.get_tree():
        if window.focused:
            next_window = window

    print('prev', prev_window.id, 'next', next_window.id)
    if prev_window.id == next_window.id and abs(num) == 1:
        workspace = ipc.get_tree().find_focused().workspace().num
        next = workspace + num
        if next > 0 and next <= 20:
            ipc.command(f"workspace number {workspace + num}")

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
