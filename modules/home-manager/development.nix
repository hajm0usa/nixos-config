{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Python
    (python313.withPackages (
      ps: with ps; [
        numpy
        pandas
        matplotlib

        django
        djangorestframework
        fastapi
        fastapi-cli

        python-lsp-server
        ipython
        jupyter

        black
        ruff
        isort
        mypy
        flake8
      ]
    ))
    pyright
    uv

    # Javascript
    nodejs
    bun

    # Rust
    rustc
    cargo

    # Go
    delve
    go
    gopls
    go-blueprint
    gore

    # Nix
    alejandra
    deadnix
    nixfmt-rfc-style
    nil
    statix
    nix-init

    # C
    gnumake
    cmake
    clang-tools
    gcc
    bear
    meson
    ninja
    pkg-config

    # Assembly
    nasm

    # Lua
    stylua

    yaml-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
    nodePackages.javascript-typescript-langserver
    nodePackages.bash-language-server
    nodePackages.prettier
    nodePackages.stylelint
    nodePackages.js-beautify
    fish-lsp
    tree-sitter
    html-tidy
    jq

    cartero

    pandoc

    gnome-builder

    # CLI tools
    direnv
    glow
    httpie
    iftop
    iotop
    sqlite
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
