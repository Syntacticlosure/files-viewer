# files-viewer: An Integrated File Explorer for DrRacket

![files-viewer screenshot](https://user-images.githubusercontent.com/22510026/43937527-cf6141a8-9c90-11e8-9277-9d6e20b12e8b.png)

`files-viewer` is a tool that adds a file explorer panel to the DrRacket IDE, providing a seamless way to navigate and manage your project files without leaving the editor.

This project is distributed under the same licenses as Racket (MIT/Apache 2.0). Contributions, issues, and pull requests are welcome!

## Features

- **File System Navigation**: Browse directories and files in a hierarchical tree view.
- **DrRacket Integration**: Double-click a file to open it directly in a DrRacket tab.
- **File Operations**: Create, rename, and delete files and directories from the context menu.
- **Configurable Filtering**: Hide or show files based on patterns (e.g., hide dotfiles or backup files).
- **Git Integration**: Perform basic `git pull` and `git push` operations from the UI.
- **Workspace Management**: Save and quickly switch between frequently used directories.
- **Auto-Refresh**: Automatically updates the view when files are changed externally.

## Installation

You can install `files-viewer` in two ways:

1.  **From the command line** using `raco`:
    ```sh
    raco pkg install files-viewer
    ```
2.  **From the DrRacket UI**:
    - Navigate to `File` > `Package Manager...`.
    - Search for `files-viewer` and click "Install".

After installation, restart DrRacket.

## Usage

- **Open a file**: Double-click it in the file explorer panel.
- **Access actions**: Right-click anywhere in the panel to open the context menu, which contains all major features (Git, New, Delete, etc.).
- **Toggle visibility**: To show or hide the panel, go to `View` > `Show the File Manager`.

## Changelog

- **v1.0**:
    - The project repository has been moved.
    - Fixed a build warning.
    - Added an experimental feature to change the working directory on DrRacket startup.
- **v0.0.46**:
    - Added a dialog for entering commit messages before pushing.
    - Implemented a template generator for `info.rkt` files.
    - Set default terminal launcher commands for Windows and macOS (resolves #23).
- **v0.0.45**: Added basic Git integration with `git pull` and `git push` buttons in the context menu.
- **v0.0.44**: Binary files are no longer opened by default. This can be configured in the settings.

---

For more detailed information, please see the official [documentation](https://docs.racket-lang.org/files-viewer/).

