local M = {}

M.heuristics = {
  GnuC = {
    validate = function(bufnr)
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 1000, false)
      local str = table.concat(lines, "\n")
      local ret = string.find(str, "\n  {\n    ")
      return ret ~= nil
    end,
    set_buffer = function(bufnr)
      vim.bo[bufnr].cindent = true
      vim.bo[bufnr].cinoptions = "j1,f0,^-2,{2,>4,:4,n-2,(0,t0"
      vim.bo[bufnr].expandtab = false
      vim.bo[bufnr].shiftwidth = 2
      vim.bo[bufnr].tabstop = 8
      -- disable treesitter indent
      vim.bo[bufnr].indentexpr = ""
      -- NOTE: This is a workaround for the indentexpr not working.
      vim.defer_fn(function()
        vim.bo[bufnr].indentexpr = ""
      end, 1000)
    end,
  },
}

M.set_from_buffer = function(style, bufid)
  if M.heuristics[style] and M.heuristics[style].set_buffer then
    M.heuristics[style].set_buffer(bufid)
  else
    vim.notify("No heuristic found for style: " .. style)
  end
end

M.set_current_buffer = function(style)
  local bufid = vim.api.nvim_get_current_buf()
  M.set_from_buffer(style, bufid)
end

M.auto_set_from_buffer = function(bufid)
  for _, heuristic in pairs(M.heuristics) do
    local s, result = pcall(heuristic.validate, bufid)
    if s and result then
      heuristic.set_buffer(bufid)
      return
    end
  end
end

M.auto_set_current_buffer = function()
  local bufid = vim.api.nvim_get_current_buf()
  M.auto_set_from_buffer(bufid)
end

return { ---@type LazySpec
  "AstroNvim/astrocore",

  ---@param _ LazyPlugin
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    opts.commands["AstroIndent"] = {
      function(o)
        require("guess-indent").set_from_buffer(nil, true, true)
        if o.args and o.fargs[1] then
          M.set_current_buffer(o.fargs[1])
        else
          M.auto_set_current_buffer()
        end
      end,
      desc = "Set the buffer indentation style",
      nargs = "?",
      complete = function(ArgLead, CmdLine, CursorPos)
        -- return completion candidates as a list-like table
        return vim.tbl_keys(M.heuristics)
      end,
    }
    opts.autocmds["GuessIndent"][1] = {
      event = "BufReadPost",
      desc = "Guess indentation when loading a file and do extra setup",
      callback = function(args)
        require("guess-indent").set_from_buffer(args.buf, true, true)
        M.auto_set_from_buffer(args.buf)
      end,
    }
  end,
}
