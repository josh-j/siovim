{pkgs, ...}: {
  plugins.better-escape = {
    enable = pkgs.lib.mkDefault true;
  };
}
