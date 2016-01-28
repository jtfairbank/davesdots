Sublime Text Setup
===============================================================================

Settings
------------------------------------------------------------
Open `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/` and copy / paste the
contents of `sublimetext/prefs/*` into that folder.

Note: you might need to re-select the Monokai font after installing plugins below (I don't think it is a default).

Key Bindings
------------------------------------------------------------
Open `Sublime Text -> Preferences -> Key Bindings - User` and copy / paste the
contents of `sublimetext/prefs/Default (OSX).sublime-keymap` into that file
and save it.

Snippets
------------------------------------------------------------
Copy the `snippets` directory to `~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/`, then restart Sublime Text.

Plugins and File Types
------------------------------------------------------------
Install the Package Control plugin with the instructions from:
https://packagecontrol.io/installation

Install the following Plugins / File Types using Package Control.  The command
to do so is `Shift-Apple-P -> Package Control: Install Package` and then search
for the package name.

  * Handlebars
  * MarkdownEditing
  * SCSS

Always use Package Control to install other Sublime Text packages.
