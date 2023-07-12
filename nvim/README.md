# NvChad

NvChad docs for setup and help: <https://nvchad.com/docs/quickstart/install>

## Setup

1. Install neovim and ripgrep

    ```shell
    brew install neovim
    brew install ripgrep
    ```

1. Clone the NvChad repository into nvim configuration

    ```shell
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    ```

1. Copy custom configuration files

    ```shell
    cp -R nvim/custom ~/.config/nvim/lua
    ```

