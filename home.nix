{ config, pkgs, ... }:
{
    programs = {
        home-manager.enable = true;
        bash = {
            enable = true;
            initExtra = ''
              . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
                export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
            '';
        };
    };

    home = {
        username = "marco";
        homeDirectory = "/home/marco";
        stateVersion = "23.11";
        file = {
            ".icons/Vimix-cursors".source = "${pkgs.vimix-cursors}/share/icons/Vimix-cursors";
        };
        sessionVariables = {
            EDITOR = "hx";
            XCURSOR_THEME = "Vimix-cursors";
        };
        shellAliases = {
            cfg-network = "nm-connection-editor";
            cfg-bluetooth = "overskride";
            img = "gthumb";
            vid = "vlc";
            remote = "remmina";
            usb = "udiskie";
        };  
        pointerCursor = {
            enable = true;
            gtk.enable = true;
            x11.enable = true;
            name = "Vimix-cursors";
            package = pkgs.vimix-cursors;
            size = 24;
        };
        packages = with pkgs; [
            nnn
            zathura
            age
            alacritty    
            neovim
            tree-sitter
            fd
            ripgrep
            fzf
            tmux
            openconnect
            (python312.withPackages(ps: with ps; [
                numpy
                matplotlib
                polars
            ]))
            python312Packages.pip
            cargo
            go
            nodejs_latest
            obsidian
            nixd
            clang-tools
            clang
            glibc
            ltex-ls
            overskride
            udiskie
            gthumb
            vlc
            lazygit
            pyright
            rust-analyzer
            vista-fonts
            zellij
            spotify
            helix
            nextcloud-client
            wezterm
            devenv
            prismlauncher
            qbittorrent
        ];
    };

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "x-scheme-handler/mailto" = ["userapp-Thunderbird-U9XWH2.desktop"];
            "message/rfc822" = ["userapp-Thunderbird-U9XWH2.desktop"];
            "x-scheme-handler/mid" = ["userapp-Thunderbird-U9XWH2.desktop"];
            "text/csv" = ["nvim.desktop"];
            "text/css" = ["nvim.desktop"];
            "text/javascript" = ["nvim.desktop"];
            "application/json" = ["nvim.desktop"];
            "text/plain" = ["nvim.desktop"];
            "text/xml" = ["nvim.desktop"];
            "text/application" = ["nvim.desktop"];
            "text/markdown" = ["nvim.desktop"];
            "application/pdf" = ["firefox.desktop"];
            "text/html" = ["firefox.desktop"];
        };
        associations.added = {
            "x-scheme-handler/mailto" = ["userapp-Thunderbird-U9XWH2.desktop"];
            "x-scheme-handler/mid" = ["userapp-Thunderbird-U9XWH2.desktop"];
            "text/csv" = ["nvim.desktop"];
            "text/css" = ["nvim.desktop"];
            "text/javascript" = ["nvim.desktop"];
            "application/json" = ["nvim.desktop"];
            "text/plain" = ["nvim.desktop"];
            "text/xml" = ["nvim.desktop"];
            "text/application" = ["nvim.desktop"];
            "text/markdown" = ["nvim.desktop"];
            "application/pdf" = ["firefox.desktop"];
            "text/html" = ["firefox.desktop"];
        };
    };

    gtk.gtk4 = {
        enable = true;

        cursorTheme.package = pkgs.vimix-cursors;
        cursorTheme.name = "vimix-cursors";

        theme.package = pkgs.kanagawa-gtk-theme;
        theme.name = "Kanagawa";
    };

    qt = {
        enable = true;
        platformTheme.name = "gtk4";
    };
}
