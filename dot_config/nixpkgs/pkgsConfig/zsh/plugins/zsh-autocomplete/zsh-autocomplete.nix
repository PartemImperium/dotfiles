{ pkgs, ... }:
{
    programs.zsh = {
        plugins = [
            {
                name = "zsh-autocomplete";
                file = "git-it-on.plugin.zsh";
                src = pkgs.fetchFromGitHub { 
                        owner = "marlonrichert"; 
                        repo = "zsh-autocomplete"; 
                        rev = "21.11.01";
                        sha256 = "0yn4991bcwy8jbrvyqm2vd4qrghcvl0xfz1hp5vkbspakblcm9hj";
                };
            }
        ];
        initExtra = ''bindkey "''${key[Up]}" up-line-or-search'';
    };
}
