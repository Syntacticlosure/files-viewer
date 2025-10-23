# Codebase Analysis: files-viewer

This document provides a summary of the `files-viewer` Racket project, a tool designed to be integrated into the DrRacket IDE.

## High-Level Summary

The project is a DrRacket tool that adds a file explorer panel to the IDE. This allows users to browse the filesystem, open files into DrRacket tabs, and perform common file and version control operations directly within the editor. The tool is configurable and aims to provide a seamless file management experience for Racket developers.

## Architecture

The codebase is split into two main parts:

1.  `tool.rkt`: The main entry point and integration layer with the DrRacket tool API. It's responsible for creating the UI, managing state, and connecting UI events to backend logic and DrRacket's frame.
2.  `private/`: A directory containing various modules that encapsulate the core logic and GUI components of the file viewer. This promotes modularity and separation of concerns.

---

## Component Breakdown

### `tool.rkt` - The Integrator

-   **DrRacket Integration**: Uses `drracket:get/extend:extend-unit-frame` to add a custom panel to the DrRacket window.
-   **Preference Management**: Defines and manages all user-configurable settings using `preferences:set-default`, such as the default directory, UI behavior, and external command configurations.
-   **UI Composition**: Assembles the main UI by creating a `my-horizontal-dragable%` panel and populating it with the `dir-control%` (for breadcrumbs) and the `directory-list%` (for the file tree).
-   **State Management**: Manages the application's state, including the current directory (`main-directory`), auto-refresh status, and panel visibility (`is-show`).
-   **Event Handling**: Orchestrates the interactions between different components. It handles callbacks from the popup menu, file list selection, and directory navigation, and translates them into actions like changing directories or opening files.
-   **File System Monitoring**: Instantiates `fschange%` and a `timer%` to periodically check for and react to external changes in the displayed directories when auto-refresh is enabled.

### `private/` Directory - Core Components

-   **`main.rkt`**: Acts as a facade, simply aggregating and re-providing all exports from the other modules in the `private` directory for easy consumption by `tool.rkt`.

-   **GUI and UI Helpers:**
    -   `gui-helpers.rkt`: The heart of the file display.
        -   `directory-list%`: A `hierarchical-list%` subclass that displays the file and directory tree. It handles file filtering, searching (by typing), icon display, and recursive updates.
        -   `my-horizontal-dragable%`: A custom panel that allows the user to resize the file viewer relative to the definitions/interactions panels.
    -   `dir-control.rkt`: Implements `dir-control%`, a custom canvas widget that displays the current path as a series of clickable breadcrumb segments.
    -   `color-scheme.rkt`: A mixin (`color-scheme-mixin`) that allows GUI components to adapt to DrRacket's current color scheme by listening for preference changes.
    -   `popup-menu.rkt`: Defines `files-popup-menu%`, the right-click context menu. It also includes the implementation for managing "Workspaces" (saved directory shortcuts) and other extra settings dialogs.

-   **Dialogs and User Interaction:**
    -   `file-filters.rkt`: Provides the `filter-dialog` for setting rules about which files to show or hide.
    -   `rename-dialog.rkt`: A simple dialog (`rename-dialog%`) for renaming files/directories.
    -   `path-helpers.rkt`:
        -   `new-file-dialog`: A dialog for creating new files or directories. It includes buttons for creating standard files like `.gitignore` and `info.rkt`.
        -   `instruction-dialog%`: A helper dialog used by `new-file-dialog` to gather information for generating an `info.rkt` file.
    -   `terminal.rkt`:
        -   `terminal%`: A basic frame with a text editor to display the output of shell commands (like git).
        -   `git-commit%`: A dialog to get a commit message from the user before running `git push`.

-   **File System and Logic:**
    -   `fschange.rkt`: Implements `fschange%`, a class that monitors a set of directories for changes using `filesystem-change-evt`. It runs in a separate thread to avoid blocking the GUI.
    -   `path-helpers.rkt`: Contains various utility functions for file operations, such as `delete-file-and-directory`, `paths-common-prefix` (for finding a common ancestor directory), and `process/safe` for running external commands.
    -   `contents.rkt`: Stores constant strings for the default content of newly created files like `.gitignore` and a boilerplate `tool.rkt`.
