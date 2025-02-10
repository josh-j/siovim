{pkgs, stablePkgs, ...}: {
  extraConfigLuaPost = builtins.readFile ./extra.lua;

  extraPackages = with pkgs; [
    # runtime dependencies
    fd
    ripgrep
  ] ++ [
    stablePkgs.lldb  # Use LLDB from stable
  ] ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
    # runtime dependencies
    gnused
  ];
}
