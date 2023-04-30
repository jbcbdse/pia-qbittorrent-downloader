## Description

This is a docker stack using Private Internet Access as a VPN and qBittorrent as a downloader with a web interface. Downloads will be stored to a network drive mounted using cifs.

To ensure that qBittorrent listens on the port from PIA, a script is run on startup that waits a few seconds for PIA to write the port number to a file.