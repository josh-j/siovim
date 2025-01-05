{
  lib,
  config,
  ...
}: {
  imports = [
    ./base16.nix
    ./catppuccin.nix
    ./gruvbox.nix
    ./onedark.nix
    ./oxocarbon.nix
    ./rose-pine.nix
  ];
  options = {
    colorschemes.enable = lib.mkEnableOption "Enable colorschemes module";
  };
  config = lib.mkIf config.colorschemes.enable {
    base16.enable = lib.mkDefault false;
    catppuccin.enable = lib.mkDefault true;
    gruvbox.enable = lib.mkDefault false;
    onedark.enable = lib.mkDefault false;
    oxocarbon.enable = lib.mkDefault false;
    rose-pine.enable = lib.mkDefault false;
  };
}
