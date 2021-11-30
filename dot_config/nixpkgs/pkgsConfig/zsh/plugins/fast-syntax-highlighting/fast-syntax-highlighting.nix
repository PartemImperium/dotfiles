{ pkgs, ... }:
{
    programs.zsh = {
        plugins = [
            {
                name = "fast-syntax-highlighting";
                file = "fast-syntax-highlighting.plugin.zsh";
                src = pkgs.fetchFromGitHub { 
                        owner = "zdharma-continuum"; 
                        repo = "fast-syntax-highlighting"; 
                        rev = "v1.55";
                        sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
                };
            }
        ];
    };
}
