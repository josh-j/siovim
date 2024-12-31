{
  imports = [
    ./bufferline.nix
    ./indent-blankline.nix
    ./lualine.nix
    ./mini.nix
    ./oil.nix
    # ./specs.nix
    ./snacks.nix
    ./noice.nix
    ./neotree.nix
    ./yazi.nix
    ./telescope2.nix
    ./undotree.nix
  ];

  plugins = {
    trim.enable = true;
    neoscroll.enable = true;
    dressing.enable = true;
  };
}
