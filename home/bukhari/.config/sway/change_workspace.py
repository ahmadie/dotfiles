import i3ipc
from functools import partial
import argparse
import sys

def change_workspace(num):
    workspace = ipc.get_tree().find_focused().workspace().num

    if num == 'q' and workspace < 10:
        ipc.command(f"workspace number {workspace + 10}")
    elif num == 'q' and workspace > 10:
        ipc.command(f"workspace number {workspace - 10}")
    if workspace > 10 and workspace == int(num) + 10:
        ipc.command(f"workspace number {int(num)}")
    elif workspace > 10:
        ipc.command(f"workspace number {int(num) + 10}")
    elif workspace == int(num):
        ipc.command(f"workspace number {int(num) + 10}")
    else:
        ipc.command(f"workspace number {int(num)}")

    ipc.main_quit()
    sys.exit(0)

if __name__ == "__main__":
    ipc = i3ipc.Connection()

    parser = argparse.ArgumentParser(
        description='Switch workspaces in both outputs')
    parser.add_argument('workspace', metavar='WORKSPACE_NUM',
                        help='Workspace number to which to switch')
    args = parser.parse_args()

    change_workspace(args.workspace)

    ipc.main()
