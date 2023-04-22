import i3ipc
from functools import partial
import argparse
import sys
import time

def next_workspace(next):

    for window in ipc.get_tree():
        if window.focused:
            prev_window = window

    # print(prev_window.ipc_data)
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

    for window in ipc.get_tree():
        if window.focused:
            next_window = window


    # print(next_window.ipc_data)
    # print(prev_window.rect.x, prev_window.rect.y, prev_window.deco_rect.x, prev_window.deco_rect.y)
    # print(next_window.rect.x, next_window.rect.y, next_window.deco_rect.x, next_window.deco_rect.y)

    # print('prev', prev_window.id, 'next', next_window.id)
    if prev_window.rect.x == next_window.rect.x and \
        prev_window.rect.y == next_window.rect.y and \
        prev_window.rect.width == next_window.rect.width and \
        prev_window.rect.height == next_window.rect.height:
        
        prev_workspace = ipc.get_tree().find_focused().workspace().num
        next_workspace = prev_workspace + num

        if abs(num) == 1:
            if (prev_workspace > 10 and prev_workspace < 20) and (next_workspace > 19 or next_workspace < 11):
                return
            if (prev_workspace > 0 and prev_workspace < 10) and (next_workspace > 9 or next_workspace < 1):
                return
        if abs(num) == 10:
            if next_workspace > 19:
                return
        ipc.command(f"move container to workspace number {next_workspace}")
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
