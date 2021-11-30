{ pkgs, ... }:
{
    programs.zsh = {
        plugins = [
            {
                name = "git-it-on";
                file = "git-it-on.plugin.zsh";
                src = pkgs.fetchFromGitHub { 
                        owner = "peterhurford"; 
                        repo = "git-it-on.zsh"; 
                        rev = "6495b09d3bf60a103f45e1e39ce904ae3cf18cf0";
                        sha256 = "0n802j7amkaj8rzh57iin6gzapaff4aiaihrpcj4c5mzvxkwiq7v";
                };
            }
        ];
    };
}
