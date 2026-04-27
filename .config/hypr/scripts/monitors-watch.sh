#!/usr/bin/env python3
"""Listen on Hyprland's IPC socket and re-run monitors.sh on hotplug.

Started once via `exec-once` from hyprland.conf. Also runs the layout
script immediately so the initial arrangement is correct.
"""
import os
import socket
import subprocess
from pathlib import Path

LAYOUT = Path.home() / ".config/hypr/scripts/monitors.sh"


def apply():
    subprocess.run([str(LAYOUT)], check=False)


def main():
    apply()  # initial layout

    runtime = os.environ["XDG_RUNTIME_DIR"]
    sig = os.environ["HYPRLAND_INSTANCE_SIGNATURE"]
    sock_path = f"{runtime}/hypr/{sig}/.socket2.sock"

    s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    s.connect(sock_path)
    buf = b""
    while True:
        chunk = s.recv(4096)
        if not chunk:
            break
        buf += chunk
        while b"\n" in buf:
            line, buf = buf.split(b"\n", 1)
            event = line.decode(errors="replace").split(">>", 1)[0]
            if event in ("monitoradded", "monitorremoved", "monitoraddedv2"):
                apply()


if __name__ == "__main__":
    main()
