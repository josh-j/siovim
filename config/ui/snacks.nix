{pkgs, ...}: {
  autoCmd = [
    {
      event = "User";
      pattern = "MiniFilesActionRename";
      callback.__raw = ''
        function(event)
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end
      '';
    }
  ];
  keymaps = [
    {
      mode = [
        "v"
        "n"
      ];
      key = "<leader>go";
      action = ":lua Snacks.gitbrowse.open()<CR>";
      options = {
        desc = "Open git repo";
      };
    }
  ];
  plugins.snacks = {
    enable = true;
    settings = {
      rename.enabled = true;
      animinate.enable = true;
      git.enabled = true;
      gitbrowse = {
        enabled = true;
      };
      notify.enabled = true;
      notifier = {
        enabled = true;
        timeout = 3000;
      };
      lazygit.enabled = true;
      dashboard = {
        enabled = true;
        preset = {
          keys = [
            {
              icon = " ";
              key = "f";
              desc = "find file";
              action = "<leader>ff";
            }
            {
              icon = " ";
              key = "n";
              desc = "new file";
              action = ":ene | startinsert";
            }
            {
              icon = " ";
              key = "/";
              desc = "find text";
              action = "<leader>fr";
            }
            {
              icon = " ";
              key = "r";
              desc = "recent files";
              action = "<leader>fg";
            }
            {
              icon = "";
              key = "o";
              desc = "lazygit";
              action = "<leader>gg";
            }
            {
              icon = " ";
              key = "q";
              desc = "quit";
              action = ":qa";
            }
          ];
        };
        sections = [
          {
            section = "header";
          }
          {
            icon = " ";
            pane = 2;
            title = "keymaps";
            section = "keys";
            padding = 1;
            indent = 3;
          }
          {
            icon = " ";
            pane = 2;
            title = "recent files";
            section = "recent_files";
            padding = 1;
            indent = 3;
          }
          {
            icon = " ";
            pane = 2;
            title = "projects";
            section = "projects";
            padding = 1;
            indent = 3;
          }
          {
            pane = 2;
            icon = " ";
            title = "git status";
            section = "terminal";
            enabled.__raw = ''
              snacks.git.get_root() ~= nil
            '';
            cmd = "${pkgs.hub}/bin/hub status --short --branch --renames";
            height = 5;
            padding = 1;
            ttl = 5 * 60;
            indent = 3;
          }
        ];
      };
    };
  };
}
