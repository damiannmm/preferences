# http://stackoverflow.com/a/16954135/3949230
import sublime
import sublime_plugin

class ColonInsertCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        region_name = "original_cursors"
        view = self.view
        view.add_regions(region_name, view.sel())
        view.run_command("move_to", {"extend": False, "to": "eol"})
        view.run_command("insert", {"characters": ":"})
        view.sel().clear()
        cursors = view.get_regions(region_name)
        for cursor in cursors:
            view.sel().add(sublime.Region(cursor.b, cursor.b))
        view.erase_regions(region_name)
