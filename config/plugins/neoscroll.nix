{pkgs, ...}: {
  plugins.neoscroll = {
    enable = pkgs.lib.mkDefault true;
  };
}
