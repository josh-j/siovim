let
  timing = ms: let
    msS = builtins.toString ms;
  in {
    __raw =
      # lua
      ''
        -- Animate only for ${msS}ms
        require('mini.animate').gen_timing.linear({
          duration = ${msS},
          unit = 'total'
        })
      '';
  };
in {
  plugins = {
    mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
        animate = {
          cursor.enable = false;
          scroll.timing = timing 100;
          resize.timing = timing 100;
          open.enable = false;
          close.enable = false;
        };
        basic = {
          options = {
            extra_ui = true;
          };
          mappings = {
            option_toggle_prefix = "<leader>xmt";
          };
        };
        clue = {
          window = {
            delay = 500;
            config = {
              border = "none";
              width.__raw = ''
                math.floor(0.318 * vim.o.columns)
              '';
              row = "auto";
              col = "auto";
              anchor = "SE";
            };
          };
          triggers = [
            {
              mode = "n";
              keys = "<leader>";
            }
            {
              mode = "x";
              keys = "<leader>";
            }
            {
              mode = "i";
              keys = "<C-x>";
            }
            {
              mode = "n";
              keys = "g";
            }
            {
              mode = "x";
              keys = "g";
            }
            {
              mode = "n";
              keys = "'";
            }
            {
              mode = "n";
              keys = "`";
            }
            {
              mode = "n";
              keys = "]";
            }
            {
              mode = "n";
              keys = "[";
            }
            {
              mode = "x";
              keys = "'";
            }
            {
              mode = "x";
              keys = "`";
            }
            {
              mode = "n";
              keys = "\"";
            }
            {
              mode = "x";
              keys = "\"";
            }
            {
              mode = "i";
              keys = "<C-r>";
            }
            {
              mode = "c";
              keys = "<C-r>";
            }
            {
              mode = "n";
              keys = "<C-w>";
            }
            {
              mode = "n";
              keys = "z";
            }
            {
              mode = "x";
              keys = "z";
            }
          ];
          clues = [
            {__raw = "require('mini.clue').gen_clues.builtin_completion()";}
            {__raw = "require('mini.clue').gen_clues.g()";}
            {__raw = "require('mini.clue').gen_clues.marks()";}
            {__raw = "require('mini.clue').gen_clues.registers()";}
            {__raw = "require('mini.clue').gen_clues.windows()";}
            {__raw = "require('mini.clue').gen_clues.z()";}
          ];
        };
        comment = {
          mappings = {
            comment = "<leader>c";
            comment_line = "<leader>c";
            comment_visual = "<leader>c";
            textobject = "<leader>c";
          };
        };
        hipatterns = {
          hex_color.__raw =
            # lua
            ''
              -- Highlight hex color strings (`#rrggbb`) using that color
              require('mini.hipatterns').gen_highlighter.hex_color()
            '';
        };
        jump = {
          # Extend f, F, t, T to work on multiple lines.
        };
        keymap = {
          # j k
        };
        pairs = {
        };
        move = {
          # Move any selection in any direction
        };
        cursorword = {
          # Highlight word under cursor
          delay = 0;
        };
        icons = {
          # style = "glpyh";
        };

        # notify = {
        #
        # };

        indentscope = {
          options = {
            try_as_border = true;
            border = "both";
          };
          draw.animation.__raw =
            # lua
            ''
              require('mini.indentscope').gen_animation.none()
            '';
          # symbol = "¦";
          # symbol = "";
          #   draw.delay = 0;
        };
        surround = {
          mappings = {
            add = "gsa";
            delete = "gsd";
            find = "gsf";
            find_left = "gsF";
            highlight = "gsh";
            replace = "gsr";
            update_n_lines = "gsn";
          };
        };
        starter = {
          content_hooks = {
            "__unkeyed-1.adding_bullet" = {
              __raw = "require('mini.starter').gen_hook.adding_bullet()";
            };
            "__unkeyed-2.indexing" = {
              __raw = "require('mini.starter').gen_hook.indexing('all', { 'Builtin actions' })";
            };
            "__unkeyed-3.padding" = {
              __raw = "require('mini.starter').gen_hook.aligning('center', 'center')";
            };
          };
          evaluate_single = true;
          header = ''
            ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
            ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
            ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
            ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
            ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
          '';
          items = {
            "__unkeyed-1.buildtin_actions" = {
              __raw = "require('mini.starter').sections.builtin_actions()";
            };
            "__unkeyed-2.recent_files_current_directory" = {
              __raw = "require('mini.starter').sections.recent_files(10, false)";
            };
            "__unkeyed-3.recent_files" = {
              __raw = "require('mini.starter').sections.recent_files(10, true)";
            };
            "__unkeyed-4.sessions" = {
              __raw = "require('mini.starter').sections.sessions(5, true)";
            };
          };
        };
      };
    };
  };
}
