{pkgs, ...}: {
  plugins.transparent = {
    enable = pkgs.lib.mkDefault true;
    # settings = {
    #   exclude_groups = [];
    #   extra_groups = [
    #     "BufferLineTabClose"
    #     "BufferLineBufferSelected"
    #     "BufferLineFill"
    #     "BufferLineBackground"
    #     "BufferLineSeparator"
    #     "BufferLineIndicatorSelected"
    #   ];
    # };
  };
}
