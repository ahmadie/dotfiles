import i3ipc
from functools import partial
import argparse
import sys

def move_container(num):
    workspace = ipc.get_tree().find_focused().workspace().num

    if workspace == num:
        next = num + 10
    else:
        next = num

    ipc.command("unmark ___last" + str(workspace % 10))
    ipc.command(f"move container to workspace number {next}")
    ipc.command(f"workspace number {next}")

    ipc.main_quit()
    sys.exit(0)

if __name__ == "__main__":
    ipc = i3ipc.Connection()

    parser = argparse.ArgumentParser(
        description='Switch workspaces in both outputs')
    parser.add_argument('workspace', metavar='WORKSPACE_NUM', type=int,
                        help='Workspace number to which to switch')
    args = parser.parse_args()

    move_container(args.workspace)

    ipc.main()

