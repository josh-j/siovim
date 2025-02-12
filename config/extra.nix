{pkgs, stablePkgs, ...}: {
  extraConfigLuaPost = builtins.readFile ./extra.lua;

  extraPackages = with pkgs; [
    # runtime dependencies
    fd
    ripgrep
    # powershell-editor-services
  ] ++ [
    stablePkgs.lldb  # Use LLDB from stable
  ] ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
    # runtime dependencies
    gnused
  ];

}
