{ pkgs, stablePkgs, lib, ... }: {
  plugins = {
    dap = {
      enable = true;
      adapters.executables.lldb = {
        command = lib.mkForce "${stablePkgs.lldb}/bin/lldb-vscode";
      };
      signs = {
        dapBreakpoint = {
          text = " ";
          texthl = "DiagnosticInfo";
        };
        dapBreakpointCondition = {
          text = " ";
          texthl = "DiagnosticInfo";
        };
        dapBreakpointRejected = {
          text = " ";
          texthl = "DiagnosticError";
        };
        dapLogPoint = {
          text = " ";
          texthl = "DiagnosticInfo";
        };
        dapStopped = {
          text = "󰁕 ";
          texthl = "DiagnosticWarn";
          linehl = "DapStoppedLine";
          numhl = "DapStoppedLine";
        };
      };
    };
    dap-ui = {
      enable = true;
      settings.layouts = [
        {
          elements = [
            {
              id = "scopes";
              size = 0.25;
            }
            {
              id = "breakpoints";
              size = 0.25;
            }
            {
              id = "stacks";
              size = 0.25;
            }
            {
              id = "watches";
              size = 0.25;
            }
          ];
          position = "left";
          size = 40;
        }
        {
          elements = [
            {
              id = "repl";
              size = 0.5;
            }
            {
              id = "console";
              size = 0;
            }
          ];
          position = "bottom";
          size = 10;
        }
      ];
    };
    dap-virtual-text.enable = true;
  };
}
