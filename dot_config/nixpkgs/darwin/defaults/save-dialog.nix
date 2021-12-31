{ pkgs, lib, config, ... }:
{
    targets.darwin.defaults = {
        NSGlobalDomain = {
            NSDocumentSaveNewDocumentsToCloud = false;

            NSNavPanelExpandedStateForSaveMode = true;
            NSNavPanelExpandedStateForSaveMode2 = true;
        };
    };
}
