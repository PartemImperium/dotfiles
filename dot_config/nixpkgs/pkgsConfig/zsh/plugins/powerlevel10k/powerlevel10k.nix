{ pkgs, ... }:
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
}
