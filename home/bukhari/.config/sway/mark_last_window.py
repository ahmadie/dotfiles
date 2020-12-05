import i3ipc
from functools import partial

def on_window_focus(ipc, event):
    global prev_focused
    global prev_workspace

    focused = event.container
    workspace = ipc.get_tree().find_focused().workspace().num

    ipc.get_tree().find_focused().workspace().num
    if workspace % 10 != prev_workspace % 10:
        ipc.command("unmark [__last]" + str(prev_workspace % 10))
        prev_focused.command("mark --add ___last" + str(prev_workspace % 10))
        print('prev_workspace', prev_workspace, 'prev_focused', prev_focused.id)

        prev_focused = focused
        prev_workspace = workspace


if __name__ == "__main__":
    ipc = i3ipc.Connection()
    prev_focused = None
    prev_workspace = ipc.get_tree().find_focused().workspace().num

    for window in ipc.get_tree():
        if window.focused:
            prev_focused = window

    ipc.on("window::focus", partial(on_window_focus))
    ipc.main()
