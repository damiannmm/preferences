# https://forum.sublimetext.com/t/make-st3-exit-if-the-last-tab-is-closed/55795/2
import sublime
import sublime_plugin


def plugin_loaded():
    """
    When the plugin loads (such as on startup), create an empty tab in any
    window that's empty.
    """
    for window in sublime.windows():
        if not window.views():
            sublime.set_timeout(lambda: window.run_command("new_file"))


class NewWindowListener(sublime_plugin.EventListener):
    """
    When a new window is opened, create an empty tab in it.
    """
    def on_post_window_command(self, winddow, command, args):
        if command == "new_window":
            sublime.active_window().run_command("new_file")
