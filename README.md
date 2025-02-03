# Don't Starve Together Dediserver

## TODO
- default cluster folder
- specify MODs
- add default `frp` settings


## Quick Start
1. build images
    ```bash
    $ docker build -t dst_server .
    ```

2. create cluster folder

3. specify MODs

4. run server at host (maybe a PC or VPS)
    ```bash
    $ docker compose up -d
    ```

5. allow ports on host

6. connect server
    - press `~` on game menu (no login required)
    - execute `c_connect("${HOST}", ${PORT})` on console
        - ${HOST}: the host's ipv4 address
        - ${PORT}: the dst's port, default to `11000`.

7. enjoy the game

