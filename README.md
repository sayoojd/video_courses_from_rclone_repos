# Video Courses from Rclone Repos

A blazingly fast, TUI-based (Terminal User Interface) media manager designed specifically to stream video courses seamlessly from cloud storage (Google Drive, OneDrive, S3, SFTP, etc.) directly to your local machine using `rclone` and `mpv`.

## Why This Exists

If you have massive video courses stored on cloud remotes (like Google Drive), downloading them manually or using FUSE mounts (like `macFUSE`) is slow, buggy, and cumbersome. 

This CLI bridges the gap natively:
- **No FUSE Required**: It uses `rclone serve http` to spawn instantaneous, localized HTTP streams without touching your system's kernel drivers.
- **Flawless Auto-Play**: It intelligently parses course directories, separates videos from PDFs/TXTs, and hands a pristine playlist to `mpv`.
- **Zero-Latency Transitions**: By utilizing `mpv`'s `--prefetch-playlist=yes` alongside `rclone`'s aggressive `--vfs-read-ahead 128M` memory buffering, the transition between videos is absolutely instant.
- **Smart Progress Tracking**: It maintains an internal database to track exactly what video you were on and resumes seamlessly.
- **Instant Folder Navigation**: It features a persistent folder cache so navigating through cloud directories feels as fast as navigating local folders.

## Prerequisites

1. **Python 3.x**
2. **rclone**: Installed and configured with your remote (`rclone config`).
3. **mpv**: The minimalist video player (e.g. `brew install mpv` on macOS).

## Setup & Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/sayoojd/video_courses_from_rclone_repos.git
   cd video_courses_from_rclone_repos
   ```
2. Make the script executable:
   ```bash
   chmod +x courses
   ```
3. Move or symlink the script to your PATH:
   ```bash
   mkdir -p ~/.courses-cli/bin
   cp courses ~/.courses-cli/bin/
   
   # Add this to your ~/.zshrc or ~/.bashrc:
   export PATH="$HOME/.courses-cli/bin:$PATH"
   ```

## Usage

Simply run:
```bash
courses
```

### Adding a Course
1. Select `[+] Add a New Course`
2. Enter the name of the course (e.g., `100 Days of Python`)
3. Enter the `rclone` path (e.g., `my_drive:Path/To/Course`). (You can also enter SSH/SFTP paths here if you configured one in rclone!)

### Navigation
- Use your **Arrow Keys** to navigate menus.
- **Enter** to select.
- From the course menu, you can instantly hit `▶ Resume Session` to pick up exactly where you left off.
- If there is a supplementary document next in line, it intelligently splits the menu into a `Play Next Video` button and a `Next Document` button.
- In `mpv`, use `>` and `<` on your keyboard to jump between the Next and Previous video in the folder seamlessly.
