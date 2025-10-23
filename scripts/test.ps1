# This script reinstalls the files-viewer package for testing.

# Uninstall the existing package to ensure a clean install.
Write-Host "Uninstalling files-viewer..."
raco pkg remove files-viewer

# Install the package from the current directory.
Write-Host "Installing files-viewer from the current directory..."
raco pkg install .\..\files-viewer

Write-Host "Installation complete."
