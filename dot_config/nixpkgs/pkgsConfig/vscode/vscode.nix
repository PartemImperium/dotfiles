{ pkgs, lib, config, ... }:
with lib;
let 
    cfg = config.pkgsConfig.vscode;
in
{# Text editor on steroids
    options.pkgsConfig.vscode = {
        enable = mkEnableOption "vscode";

        package = mkOption {
            type = types.package;
            default = pkgs.vscode;
        };
    };
    config = mkIf cfg.enable {
        programs.vscode = {
            enable = true;
            package = cfg.package;

            userSettings = {
                "editor.renderWhitespace" = "all";
                "editor.bracketPairColorization.enabled" = true;

                # Minimap Scrollbar settings
                "editor.minimap.enabled" = true;
                "editor.minimap.maxColumn" = 60;
                "editor.minimap.showSlider" = "always";

                # Terminal settings
                "terminal.external.osxExec" = "${pkgs.alacritty}/Applications/Alacritty.app";
                "terminal.external.linuxExec" = "${pkgs.alacritty}/bin/alacritty";
                "terminal.integrated.fontFamily" = config.pkgsConfig.shared.terminal.font;
                "terminal.integrated.scrollback" = config.pkgsConfig.shared.terminal.lineBufferSize;
            };
        };

        # Install shell script to show the expression to add all current extensions with nix
        home.packages = [ pkgs.update-nix-vsc-ext ];
    };
}
    #TODO: https://marketplace.visualstudio.com/items?itemName=pflannery.vscode-versionlens
    #TODO: https://marketplace.visualstudio.com/items?itemName=quicktype.quicktype
    #TODO: https://marketplace.visualstudio.com/items?itemName=jesschadwick.nuget-reverse-package-search
    #TODO: https://marketplace.visualstudio.com/items?itemName=jmrog.vscode-nuget-package-manager
    #TODO: https://marketplace.visualstudio.com/items?itemName=tintoy.msbuild-project-tools
    #TODO: https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one
    #TODO: https://marketplace.visualstudio.com/items?itemName=codezombiech.gitignore
    #TODO: https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker
    #TODO: https://marketplace.visualstudio.com/items?itemName=kreativ-software.csharpextensions
    #TODO: https://marketplace.visualstudio.com/items?itemName=Fudge.auto-using
    #TODO: https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-complete-tag
    #TODO: https://marketplace.visualstudio.com/items?itemName=schneiderpat.aspnet-helper
    #TODO: https://marketplace.visualstudio.com/items?itemName=adrianwilczynski.asp-net-core-switcher
    #TODO: https://marketplace.visualstudio.com/items?itemName=formulahendry.dotnet
    #TODO: https://marketplace.visualstudio.com/items?itemName=adrianwilczynski.asp-net-core-snippet-pack
    #TODO: https://marketplace.visualstudio.com/items?itemName=adrianwilczynski.add-reference