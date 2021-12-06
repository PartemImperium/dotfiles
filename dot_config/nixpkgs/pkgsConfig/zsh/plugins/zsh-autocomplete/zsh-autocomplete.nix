{ pkgs, lib, config, ... }:
{
    programs.zsh = {
        plugins = [
            {
                name = "zsh-autocomplete";
                file = "zsh-autocomplete.plugin.zsh";
                src = pkgs.fetchFromGitHub { 
                        owner = "marlonrichert"; 
                        repo = "zsh-autocomplete"; 
                        rev = "21.11.01";
                        sha256 = "0yn4991bcwy8jbrvyqm2vd4qrghcvl0xfz1hp5vkbspakblcm9hj";
                };
            }
        ];
        initExtra = lib.fileContents ./nix-keybind.patch.zsh;
    };
}
