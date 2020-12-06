import i3ipc
from functools import partial
import argparse
import sys

def change_workspace(num):
    workspace = ipc.get_tree().find_focused().workspace().num

    if workspace == num:
        ipc.command(f"workspace number {num + 10}")
    elif workspace == num + 10:
        ipc.command(f"workspace number {num}")
    else:
        ipc.command(f"workspace number {num}")
        ipc.command(f"workspace number {num + 10}")
        ipc.command("[con_mark=___last%d] focus" % num)

    ipc.main_quit()
    sys.exit(0)

if __name__ == "__main__":
    ipc = i3ipc.Connection()

    parser = argparse.ArgumentParser(
        description='Switch workspaces in both outputs')
    parser.add_argument('workspace', metavar='WORKSPACE_NUM', type=int,
                        help='Workspace number to which to switch')
    args = parser.parse_args()

    change_workspace(args.workspace)

    ipc.main()
