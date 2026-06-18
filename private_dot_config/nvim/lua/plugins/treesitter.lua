return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'nvim-treesitter/nvim-treesitter-context',
    },
    opts = {
      parsers = {
        'bash',
        'comment',
        'css',
        'go',
        'gosum',
        'graphql',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'lua',
        'prisma',
        'rust',
        'scss',
        'tsx',
        'typescript',
        'yaml',
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    },
    config = function(_, opts)
      local treesitter = require('nvim-treesitter')

      treesitter.setup()

      local filetypes = {}
      for _, parser in ipairs(opts.parsers) do
        for _, filetype in ipairs(vim.treesitter.language.get_filetypes(parser)) do
          filetypes[filetype] = true
        end
      end

      local patterns = vim.tbl_keys(filetypes)
      table.sort(patterns)

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
        pattern = patterns,
        callback = function(args)
          local parser_started = true

          if opts.highlight and opts.highlight.enable then
            parser_started = pcall(vim.treesitter.start, args.buf)
          end

          if opts.indent and opts.indent.enable and parser_started then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

      if opts.autotag and opts.autotag.enable then
        local ok, autotag = pcall(require, 'nvim-ts-autotag')
        if ok then
          autotag.setup({
            opts = {
              enable_rename = opts.autotag.enable_rename,
              enable_close = opts.autotag.enable_close,
              enable_close_on_slash = opts.autotag.enable_close_on_slash,
            },
          })
        end
      end

      require('treesitter-context').setup({
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = 'outer',
        mode = 'cursor',
        separator = nil,
      })
    end,
  },
}
