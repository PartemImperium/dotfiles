{ pkgs, lib, config, ... }:
{
    programs.zsh = {
        plugins = [
            {# TODO: Add p10k instant prompt
                name = "powerlevel10k";
                src = pkgs.zsh-powerlevel10k;
                file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            }
            {
                name = "p10k-theme";
                src = ./p10k-theme;
                file = "p10k-theme.zsh";
            }
        ];
    };

    home.packages = [# Hack font with several font icon sets patched (used by p10k theme)
        (pkgs.nerdfonts.override { fonts = ["Hack"]; enableWindowsFonts = config.variables.system.isWsl; })
    ];
}
