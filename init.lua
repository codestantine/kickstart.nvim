--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.opt.termguicolors = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 500

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = false

-- Set cursor shape and style
-- vim.o.guicursor = 'n-v-c:block,i:hor10'
-- vim.o.guicursor = 'n-v-c:block,i:block-blinkon1-blinkoff1-blinkwait0'
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 2

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- persian font
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- this is copied from old config it is not in Kickstart
local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
-- keymap.set('n','+','<C-a>')
-- keymap.set('n','-','<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
-- keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
--keymap.set('n', '<Space>', '<C-w>w')
--keymap.set('', 's<left>', '<C-w>h')
--keymap.set('', 's<up>', '<C-w>k')
--keymap.set('', 's<down>', '<C-w>j')
--keymap.set('', 's<right>', '<C-w>l')
--keymap.set('', 'sh', '<C-w>h')
--keymap.set('', 'sk', '<C-w>k')
--keymap.set('', 'sj', '<C-w>j')
--keymap.set('', 'sl', '<C-w>l')
--
---- Resize window
--keymap.set('n', '<C-w><left>', '<C-w><')
--keymap.set('n', '<C-w><right>', '<C-w>>')
--keymap.set('n', '<C-w><up>', '<C-w>+')
--keymap.set('n', '<C-w><down>', '<C-w>-')
---- END OF COPIED FILES
-- chat gpt time
-- ~/.config/nvim/init.lua or ~/.config/nvim/lua/your_config_file.lua
------------------------------------------------------------------------

-- Define the key mapping for inserting a semicolon at the end of the line in insert mode
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>A;<Esc>', { noremap = true })

-- Define the key mapping for inserting a comma at the end of the line in insert mode
vim.api.nvim_set_keymap('i', '<C-j>', '<Esc>A,<Esc>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-_>je', '<Esc>:lua insertElseIf()<CR>', { noremap = true, silent = true })

-- InsertIfElse
vim.api.nvim_set_keymap('n', '<C-_>jI', '<Esc>:lua insertIfElse()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-_>jE', '<Esc>:lua InsertElse()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-_>jt', ':lua InsertTryCatch()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-_>jT', ':lua InsertTryCatchFinally()<CR>', { noremap = true, silent = true })
-- Map <leader>Tab to be the new :Ex
vim.api.nvim_set_keymap('n', '<Leader><Tab>', ':lua toggle_explorer()<CR>', { noremap = true, silent = true })

-- Map "jj" to exit insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Map "jk" to exit insert mode and then re-enter insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>a', { noremap = true, silent = true })

-- Map "xxc" to remove the comment
vim.api.nvim_set_keymap('i', '<C-_>c', '<Esc>_v$hda', { noremap = true, silent = true })

-- Go 🦾
-- Map ffp to print fmt.Println()
vim.api.nvim_set_keymap('i', '<C-_>gp', 'fmt.Println()<Esc>i', { noremap = true, silent = true })
-- Map xxP to print fmt.Printf()
vim.api.nvim_set_keymap('i', '<C-_>gf', 'fmt.Printf()<Esc>i', { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  'i',
  '<C-_>g0',
  '// Automated 💻<return>package main<return><return>import (<return>"fmt"<return>)<return><return>func main() {<return>}<Esc><leader>f',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap('i', '<C-_>ko', '<Esc>ddko', { noremap = true, silent = true })

-- Map <C-_>jl to print fmt.Println()
vim.api.nvim_set_keymap('i', '<C-_>jl', 'console.log();<Esc>hi', { noremap = true, silent = true })

-- Map <C-_>jt to print console.time();
vim.api.nvim_set_keymap('i', '<C-_>jt', 'console.time();<Esc>hi', { noremap = true, silent = true })

-- Map <C-_>jT to print console.timeEnd();
vim.api.nvim_set_keymap('i', '<C-_>jT', 'console.timeEnd();<Esc>hi', { noremap = true, silent = true })

-- Python
vim.api.nvim_set_keymap('i', '<C-_>pp', 'print()<Esc>jddk$i', { noremap = true, silent = true })

--
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Function to compile and run C files
function RunC()
  local filename = vim.fn.expand '%:r'
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Quote the output filename as well to handle spaces
  local quoted_output = string.format('"%s"', filename)

  -- Compile the C file with the quoted file path
  vim.cmd(string.format('!gcc %s -o %s', quoted_filepath, quoted_output))

  -- Run the compiled executable
  vim.cmd(string.format('!%s', quoted_output))
end

-- Function to compile and run C++ files
function RunCpp()
  local filename = vim.fn.expand '%:r'
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Quote the output filename as well to handle spaces
  local quoted_output = string.format('"%s"', filename)

  -- Compile the C++ file with the quoted file path
  vim.cmd(string.format('!g++ %s -o %s', quoted_filepath, quoted_output))

  -- Run the compiled executable
  vim.cmd(string.format('!%s', quoted_output))
end

-- Function to run Python files
function RunPython()
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Run the Python file with the quoted file path
  vim.cmd(string.format('!python3 %s', quoted_filepath))
end

-- Function to compile and run Go files
-- Function to compile and run Go files
function RunGo()
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Run the Go file with the quoted file path
  vim.cmd(string.format('!go run %s', quoted_filepath))
end

-- Function to run Node.js files
function RunNode()
  -- Quote the file path to handle spaces
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Run the Node.js file with the quoted file path
  vim.cmd(string.format('!node %s', quoted_filepath))
end

-- Function to run .js files using Deno
function RunDeno()
  -- Quote the file path to handle spaces
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Run the Node.js file with the quoted file path
  vim.cmd(string.format('!deno run %s', quoted_filepath))
end

-- Function to run Bun files
function RunBun()
  -- Define the Bun executable path
  local bun_path = '/home/amir/.bun/bin/bun'

  -- Quote the file path to handle spaces
  local quoted_filepath = string.format('"%s"', vim.fn.expand '%')

  -- Run the Bun file with the quoted file path
  vim.cmd(string.format('!%s %s', bun_path, quoted_filepath))
end

-- Function to compile and run Rust files
function RunRust()
  local filepath = vim.fn.expand '%'
  local filename = vim.fn.expand '%:t:r' -- Extract filename without extension

  -- Quote the file path to handle spaces
  local quoted_filepath = string.format('"%s"', filepath)

  -- Compile the Rust file with the quoted file path
  vim.cmd(string.format('!rustc %s && ./%s', quoted_filepath, filename))
end

-- Function to compile and run Java files
function RunJava()
  local filename = vim.fn.expand '%:r'
  vim.cmd('!javac ' .. filename .. '.java && java ' .. filename)
end

-- Function to run Lua files
function RunLua()
  vim.cmd '!lua %'
end

-- Function to compile and run Zig files
function RunZig()
  local filename = vim.fn.expand '%:r'
  vim.cmd('!zig run ' .. filename .. '.zig')
end

-- Function to run Bash files
function RunBash()
  vim.cmd '!bash %'
end

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>0j', ':lua RunJava()<CR>', { noremap = true, silent = true })
--[[ vim.api.nvim_set_keymap('n', '<leader>0s', ':lua RunCSharp()<CR>', { noremap = true, silent = true }) ]]
vim.api.nvim_set_keymap('n', '<leader>0l', ':lua RunLua()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0z', ':lua RunZig()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>01', ':lua RunBash()<CR>', { noremap = true, silent = true })

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>0c', ':lua RunC()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>00', ':lua RunCpp()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>09', ':lua RunPython()<CR>', { noremap = true, silent = true })

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>0g', ':lua RunGo()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0n', ':lua RunNode()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0r', ':lua RunRust()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0b', ':lua RunBun()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0d', ':lua RunDeno()<CR>', { noremap = true, silent = true })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      vim.cmd 'source ~/.config/nvim/coc-config.vim'
    end,
  },
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'olimorris/onedarkpro.nvim', -- onedarkpro colorscheme
  'skywind3000/asyncrun.vim', -- Added by Amirmohammad Divani -- asyncrun (for c)
  'norcalli/nvim-colorizer.lua', -- Added by me -- colorizer
  'Jezda1337/nvim-html-css',
  -- 'windwp/nvim-ts-autotag', -- added by chatgpt/ html-css ids,classes integration
  'hrsh7th/nvim-compe', -- chatgpt
  'iamcco/markdown-preview.nvim',
  { 'neoclide/coc.nvim', opts = {} }, -- Added by Amirmohammad Divani
  'kylechui/nvim-surround',
  'ayu-theme/ayu-vim',
  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  { 'kylechui/nvim-surround', opts = {} },
  -- Amir changed this
  -- {
  --   'xiyaowong/nvim-transparent',
  --   opts = {
  --
  --     extra_groups = {
  --       -- Other groups that should be cleared
  --       'NormalFloat', -- Float window
  --       'NormalNC', -- Non-current window
  --       'FloatBorder', -- Float window borders
  --       'WhichKeyFloat', -- WhichKey float
  --     },
  --     exclude_groups = {
  --       'NvimTree', -- Example of excluding a plugin
  --       'TelescopePrompt', -- Example of excluding Telescope prompt
  --     },
  --   },
  -- },
  -- -- end here
  {
    'Civitasv/cmake-tools.nvim',
  },
  {
    'mfussenegger/nvim-dap',
    opts = {},
    dependencies = { 'rcarriga/nvim-dap-ui', 'mxsdev/nvim-dap-vscode-js' },
    config = function()
      require('dap-vscode-js').setup {
        -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
        debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
        -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
        -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
      }

      for _, language in ipairs { 'typescript', 'javascript' } do
        require('dap').configurations[language] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
          },
        }
      end
      local dap = require 'dap'
      local dapui = require 'dapui'
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        -- cpp = { 'clangd' },
      }
    end,
  },
  {
    'ayu-theme/ayu-vim',
    config = function()
      -- Enable true color support
      vim.opt.termguicolors = true
      -- Set the colorscheme variant you want
      vim.g.ayucolor = 'dark' -- Options: "light", "mirage", "dark"
    end,
  },
  {
    'eldritch-theme/eldritch.nvim',
    lazy = false,
    priority = 1000,
    opts = { -- your configuration comes here
      -- or leave it empty to use the default settings
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = 'dark', -- style for sidebars, see below
        floats = 'dark', -- style for floating windows
      },
      sidebars = { 'qf', 'help' }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = false, -- dims inactive windows, transparent must be false for this to work
      lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors) end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors) end,
    },
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {
        -- ...
      }

      -- vim.cmd 'colorscheme github_dark'
    end,
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      -- Enable transparent background
      transparent = true,

      -- Enable italics comments
      italic_comments = false,

      -- Replace all fillchars with ' ' for the ultimate clean look
      hide_fillchars = false,

      -- Modern borderless telescope theme
      borderless_telescope = true,

      -- Set terminal colors used in `:terminal`
      terminal_colors = false,

      theme = {
        variant = 'auto', -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
        highlights = {
          -- Highlight groups to override, adding new groups is also possible
          -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

          -- Example:
          Comment = { fg = '#696969', bg = 'NONE', italic = true },

          -- Complete list can be found in `lua/cyberdream/theme.lua`
        },

        -- Override a highlight group entirely using the color palette
        overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
          -- Example:
          return {
            Comment = { fg = colors.green, bg = 'NONE', italic = true },
            ['@property'] = { fg = colors.magenta, bold = true },
          }
        end,

        -- Override a color entirely
        colors = {
          -- For a list of colors see `lua/cyberdream/colours.lua`
          -- Example:
          -- bg = '#000000',
          -- green = '#00ff00',
          -- magenta = '#ff00ff',
        },
      },

      -- Disable or enable colorscheme extensions
      extensions = {
        telescope = true,
        notify = true,
        mini = true,
        ...,
      },
    },
  },
  -- { 'oxfist/night-owl.nvim', opts = {
  --   theme = 'night-owl',
  -- } },
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '🧩' },
        change = { text = '☢️' },
        delete = { text = '✂️' },
        topdelete = { text = '🛸' },
        changedelete = { text = '💥' },
      },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    },
  },
  -- Primeagen Start
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Rose Pine Rose-Pine/neovim
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      variant = 'auto', -- auto, main, moon, or dawn
      dark_variant = 'main', -- main, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
      },

      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },

      groups = {
        border = 'muted',
        link = 'iris',
        panel = 'surface',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        note = 'pine',
        todo = 'rose',
        warn = 'gold',

        git_add = 'foam',
        git_change = 'rose',
        git_delete = 'love',
        git_dirty = 'rose',
        git_ignore = 'muted',
        git_merge = 'iris',
        git_rename = 'pine',
        git_stage = 'iris',
        git_text = 'rose',
        git_untracked = 'subtle',

        h1 = 'iris',
        h2 = 'foam',
        h3 = 'rose',
        h4 = 'gold',
        h5 = 'pine',
        h6 = 'foam',
      },

      highlight_groups = {
        Comment = { fg = 'foam' },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
      end,
    },
  },

  -- Primeagen END

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
      }
      -- visual mode
      require('which-key').register({
        ['<leader>h'] = { 'Git [H]unk' },
      }, { mode = 'v' })
    end,
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      {
        'nvim-tree/nvim-web-devicons',
        opts = {
          default = true,
          strict = true,
          override_by_filename = {
            ['.gitignore'] = {
              icon = '',
              color = '#f1502f',
              name = 'Gitignore',
            },
          },
          -- same as `override` but specifically for overrides by extension
          -- takes effect when `strict` is true
          override_by_extension = {
            ['log'] = {
              icon = '',
              color = '#81e043',
              name = 'Log',
            },
          },
        },
      },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = true,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap.
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following autocommand is used to enable inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          -- Amir
          -- if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          --   map('<leader>th', function()
          --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          --   end, '[T]oggle Inlay [H]ints')
          -- end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- biome = {},
        black = {},
        cmakelang = {},
        cmakelint = {},
        cpplint = {},
        cpptools = {},
        cssls = {},
        emmet_language_server = {}, -- Added by Amirmohammad Divani -- emmet
        gopls = {},
        html = {},
        pyright = {},
        rust_analyzer = {},
        tailwindcss = {},
        tsserver = {},
        revive = {},
        zls = {},

        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'black' },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight'
      -- vim.cmd.colorscheme 'onelight'
      -- vim.cmd.colorscheme 'onedark_vivid'

      -- vim.cmd 'colorscheme cyberdream'
      -- vim.cmd.colorscheme 'rose-pine-dawn'
      -- vim.cmd.colorscheme 'onedark_dark'
      -- vim.g.ayucolor = 'mirage'
      -- vim.cmd.colorscheme 'ayu'
      -- Enable true colors support
      vim.opt.termguicolors = true
      vim.cmd [[colorscheme eldritch]]

      -- Set the ayucolor theme

      -- CHATGPT END
      -- You can configure highlights by doing something like:
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
  -- another one (colorscheme)
  -- onedarkpro
  -- vim.cmd 'colorscheme onedark',
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      --     require('mini.surround').setup()
      --
      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = true }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  -- -- Mini plugins setup
  -- require('mini.surround').setup()
  --
  -- -- Simple and easy statusline
  -- local statusline = require 'mini.statusline'
  --
  -- -- Configure the statusline
  -- statusline.setup {
  --   use_icons = true,
  --   set_vim_settings = true, -- Ensure vim settings are applied correctly
  -- }
  --
  -- -- Customize the section for cursor location
  -- statusline.section_location = function()
  --   return '%2l:%-2v'
  -- end
  --
  -- -- Apply settings to ensure there is no extra space
  -- vim.cmd('set noshowmode')
  -- vim.cmd('set noruler')
  -- vim.opt.laststatus = 3 -- Use a global statusline
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },

  -- If you are using a Nerd Font: set icons to an empty table which will use the
  -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
  -- Amir icons
  icons = vim.g.have_nerd_font,
  ui = {
    icons = {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}

-- trying colorizer
require('colorizer').setup {
  --  '*', -- Highlight all files, but customize some others.
  css = { rgb_fn = true, RGB = true, RRGGBB = true, names = true, RRGGBBAA = true, hsl_fn = true, css_fn = true, css = true }, -- Enable parsing rgb(...) functions in css.
  html = { names = false }, -- Disable parsing "names" like Blue or Gray
  javascript = { rgb_fn = true, RGB = true, RRGGBB = true, names = true, RRGGBBAA = true, hsl_fn = true, css_fn = true },
}
-- ---------------------------------------------------------
-- change tab size
-- Set tab size to 2 for HTML, CSS, and JavaScript files
vim.cmd 'autocmd FileType html,javascript,css setlocal shiftwidth=2'
vim.cmd 'autocmd FileType html,javascript,css setlocal softtabstop=2'
vim.cmd 'autocmd FileType html,javascript,css setlocal tabstop=2'
-- kylechui/nvim-surround
--
-- let g:coc_node_path = '/home/amir/.nvm/versions/node/v22.2.0/bin/node';
-- -- Primeagen Harpoon
local harpoon = require 'harpoon'
--
-- -- REQUIRED
harpoon:setup()
-- -- REQUIRED
harpoon:dump()
--
vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
--
vim.keymap.set('n', '<A-1>', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<A-2>', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<A-3>', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<A-4>', function()
  harpoon:list():select(4)
end)
--
-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<leader>zp', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<leader>zn', function()
  harpoon:list():next()
end)
--
-- chatgpt harpoon remove file

-- -- basic telescope configuration
-- local conf = require('telescope.config').values
-- local function toggle_telescope(harpoon_files)
--   local file_paths = {}
--   for _, item in ipairs(harpoon_files.items) do
--     table.insert(file_paths, item.value)
--   end
--
--   require('telescope.pickers')
--     .new({}, {
--       prompt_title = 'Harpoon',
--       finder = require('telescope.finders').new_table {
--         results = file_paths,
--       },
--       previewer = conf.file_previewer {},
--       sorter = conf.generic_sorter {},
--     })
--     :find()
-- end
--
-- vim.keymap.set('n', '<C-e>', function()
--   toggle_telescope(harpoon:list())
-- end, { desc = 'Open harpoon window' })
-- DAP
local dap = require 'dap'
-- vim.keymap.set('n', '<leader>Z1', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<leader>Zd', dap.continue, {})

local osys = require 'cmake-tools.osys'
require('cmake-tools').setup {
  cmake_command = 'cmake', -- this is used to specify cmake command path
  ctest_command = 'ctest', -- this is used to specify ctest command path
  cmake_use_preset = true,
  cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
  cmake_generate_options = { '-DCMAKE_EXPORT_COMPILE_COMMANDS=1' }, -- this will be passed when invoke `CMakeGenerate`
  cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
  -- support macro expansion:
  --       ${kit}
  --       ${kitGenerator}
  --       ${variant:xx}
  cmake_build_directory = function()
    if osys.iswin32 then
      return 'out\\${variant:buildType}'
    end
    return 'out/${variant:buildType}'
  end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
  cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
  cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
  cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
  cmake_variants_message = {
    short = { show = true }, -- whether to show short message
    long = { show = true, max_length = 40 }, -- whether to show long message
  },
  cmake_dap_configuration = { -- debug settings for cmake
    name = 'cpp',
    type = 'codelldb',
    request = 'launch',
    stopOnEntry = false,
    runInTerminal = true,
    console = 'integratedTerminal',
  },
  cmake_executor = { -- executor to use
    name = 'quickfix', -- name of the executor
    opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
    default_opts = { -- a list of default and possible values for executors
      quickfix = {
        show = 'always', -- "always", "only_on_error"
        position = 'belowright', -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
        size = 10,
        encoding = 'utf-8', -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
        auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
      },
      toggleterm = {
        direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
        close_on_exit = false, -- whether close the terminal when exit
        auto_scroll = true, -- whether auto scroll to the bottom
        singleton = true, -- single instance, autocloses the opened one, if present
      },
      overseer = {
        new_task_opts = {
          strategy = {
            'toggleterm',
            direction = 'horizontal',
            autos_croll = true,
            quit_on_exit = 'success',
          },
        }, -- options to pass into the `overseer.new_task` command
        on_new_task = function(task)
          require('overseer').open { enter = false, direction = 'right' }
        end, -- a function that gets overseer.Task when it is created, before calling `task:start`
      },
      terminal = {
        name = 'Main Terminal',
        prefix_name = '[CMakeTools]: ', -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
        split_direction = 'horizontal', -- "horizontal", "vertical"
        split_size = 11,

        -- Window handling
        single_terminal_per_instance = true, -- Single viewport, multiple windows
        single_terminal_per_tab = true, -- Single viewport per tab
        keep_terminal_static_location = true, -- Static location of the viewport if avialable

        -- Running Tasks
        start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
        focus = false, -- Focus on terminal when cmake task is launched.
        do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
      }, -- terminal executor uses the values in cmake_terminal
    },
  },
  cmake_runner = { -- runner to use
    name = 'terminal', -- name of the runner
    opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
    default_opts = { -- a list of default and possible values for runners
      quickfix = {
        show = 'always', -- "always", "only_on_error"
        position = 'belowright', -- "bottom", "top"
        size = 10,
        encoding = 'utf-8',
        auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
      },
      toggleterm = {
        direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
        close_on_exit = false, -- whether close the terminal when exit
        auto_scroll = true, -- whether auto scroll to the bottom
        singleton = true, -- single instance, autocloses the opened one, if present
      },
      overseer = {
        new_task_opts = {
          strategy = {
            'toggleterm',
            direction = 'horizontal',
            autos_croll = true,
            quit_on_exit = 'success',
          },
        }, -- options to pass into the `overseer.new_task` command
        on_new_task = function(task) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
      },
      terminal = {
        name = 'Main Terminal',
        prefix_name = '[CMakeTools]: ', -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
        split_direction = 'horizontal', -- "horizontal", "vertical"
        split_size = 11,

        -- Window handling
        single_terminal_per_instance = true, -- Single viewport, multiple windows
        single_terminal_per_tab = true, -- Single viewport per tab
        keep_terminal_static_location = true, -- Static location of the viewport if avialable

        -- Running Tasks
        start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
        focus = false, -- Focus on terminal when cmake task is launched.
        do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
      },
    },
  },
  cmake_notifications = {
    runner = { enabled = true },
    executor = { enabled = true },
    spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }, -- icons used for progress display
    refresh_rate_ms = 100, -- how often to iterate icons
  },
  cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
}

-- Function to toggle file explorer
function _G.toggle_explorer()
  local current_buffer = vim.api.nvim_get_current_buf()
  local current_filetype = vim.api.nvim_buf_get_option(current_buffer, 'filetype')

  if current_filetype == 'netrw' then
    -- If currently in netrw, go back to previous buffer
    vim.cmd 'b#'
  else
    -- Otherwise, open the file explorer
    vim.cmd 'Ex'
  end
end
vim.g.have_nerd_font = true
--

-- Define the global function for JavaScript
-- function _G.insert_console_log(value)
--   local log_snippet = string.format(
--     'console.log("%s: ", %s, ", Type: ", Array.isArray(%s) ? "array" : (%s === null) ? "null" : (typeof %s === "object" ? %s.constructor.name : typeof %s));',
--     value,
--     value,
--     value,
--     value,
--     value,
--     value,
--     value
--   )
--   vim.api.nvim_put({ log_snippet }, 'l', true, true)
-- end

-- comprehensive console
-- Define a global variable to store the last prompted value
_G.last_prompted_value = ''

-- Function to insert the getType function and a console log
function _G.create_and_call_get_type()
  -- JavaScript snippet for the getType function
  local get_type_function = [[
  function getType(value) {
    if (Array.isArray(value)) return "array";
    if (value === null) return "null";
    if (typeof value === "object") return value.constructor.name;
    return typeof value;
  }
  ]]

  -- Insert the getType function (if not already inserted)
  if vim.fn.search('function getType', 'nw') == 0 then
    vim.api.nvim_put(vim.split(get_type_function, '\n'), '', true, true)
  end

  -- Prompt for variable name if not stored in last_prompted_value
  if _G.last_prompted_value == '' then
    _G.last_prompted_value = vim.fn.input 'Variable name to log: '
  end

  -- Insert the console log statement with the stored variable name
  local log_snippet = string.format('console.log(`%s: ${%s}, Type: ${getType(%s)}`);', _G.last_prompted_value, _G.last_prompted_value, _G.last_prompted_value)
  vim.api.nvim_put({ log_snippet }, '', true, true)
end

-- Function to prompt for a variable name and insert a console log statement
function _G.call_get_type()
  -- Prompt for variable name and store in last_prompted_value
  _G.last_prompted_value = vim.fn.input 'Variable name to log: '

  -- Insert the console log statement with the stored variable name
  local log_snippet = string.format('console.log(`%s: ${%s}, Type: ${getType(%s)}`);', _G.last_prompted_value, _G.last_prompted_value, _G.last_prompted_value)
  vim.api.nvim_put({ log_snippet }, '', true, true)
end

-- Map <C-_>jV to call the create_and_call_get_type function in normal mode
vim.api.nvim_set_keymap('n', '<C-_>jV', ':lua _G.create_and_call_get_type()<CR>', { noremap = true, silent = true })

-- Map <C-_>jc to call the call_get_type function in normal mode
vim.api.nvim_set_keymap('n', '<C-_>jc', ':lua _G.call_get_type()<CR>', { noremap = true, silent = true })

--------------------------------------------------
--------------------------------------------------
---just calling it without function decl
---
--------------------------------------------------
-- Map <C-_>jc to call the call_get_type function in normal mode
-- vim.api.nvim_set_keymap('n', '<C-_>jc', ':lua _G.call_get_type()<CR>', { noremap = true, silent = true })
--
-- console.log simple
function _G.insert_console_log_simple(value)
  local log_snippet = string.format('console.log(`%s: ${%s}, Type: ${typeof %s}`);', value, value, value)
  vim.api.nvim_put({ log_snippet }, 'l', true, true)
end

-- Create a command to call the global function
vim.api.nvim_create_user_command('InsertConsoleLog', function(opts)
  _G.insert_console_log_simple(opts.args)
end, { nargs = 1 })

-- Create a keybinding to call the InsertConsoleLog command
vim.api.nvim_set_keymap('n', '<C-_>jv', ':InsertConsoleLog ', { noremap = true, silent = false })

-- Function to log a formatted comment in JavaScript
function LogJsComment()
  -- Define the comment line
  local comment_line = 'console.log("-------------------------------------");'

  -- Get the current buffer
  local bufnr = vim.api.nvim_get_current_buf()

  -- Get the current line number (1-based index)
  local line_nr = vim.fn.line '.' - 1

  -- Insert the log statement at the current cursor position
  vim.api.nvim_buf_set_lines(bufnr, line_nr, line_nr, false, { comment_line })
end

-- Map <C-_>jx to the LogJsComment function
vim.api.nvim_set_keymap('n', '<C-_>jx', ':lua LogJsComment()<CR>', { noremap = true, silent = true })

-- Console log simple without backticks and interpolation
function _G.insert_console_log_simple_no_type(value)
  local log_snippet = string.format('console.log("%s:", %s);', value, value)
  vim.api.nvim_put({ log_snippet }, 'l', true, true)
end

-- Create a command to call the global function
vim.api.nvim_create_user_command('InsertConsoleLogNoType', function(opts)
  _G.insert_console_log_simple_no_type(opts.args)
end, { nargs = 1 })

-- Create a keybinding to call the InsertConsoleLogNoType command
vim.api.nvim_set_keymap('n', '<C-_>jj', ':InsertConsoleLogNoType ', { noremap = true, silent = false })
-- console.log simple without backticks and interpolation
function _G.insert_console_log_simple_no_interp(value)
  local log_snippet = string.format('console.log("%s:", %s, ", Type:", typeof (%s));', value, value, value)
  vim.api.nvim_put({ log_snippet }, 'l', true, true)
end

-- Create a command to call the global function
vim.api.nvim_create_user_command('InsertConsoleLogNoInterp', function(opts)
  _G.insert_console_log_simple_no_interp(opts.args)
end, { nargs = 1 })

-- Create a keybinding to call the InsertConsoleLogNoInterp command
vim.api.nvim_set_keymap('n', '<C-_>jl', ':InsertConsoleLogNoInterp ', { noremap = true, silent = false })

function insertIfElse()
  -- Insert the 'else if' statement with an empty block
  vim.api.nvim_command 'normal! iif () {\r} else {\r}'

  -- Move cursor to the next parentheses or curly brace and start editing
  vim.api.nvim_command 'normal! %khi'
  vim.api.nvim_command 'normal! i'
end
--
function insertElseIf()
  -- Move to the end of the current block (matching brace)
  vim.fn.search('}', 'c', '')

  -- Insert the 'else if' statement with an empty block
  vim.api.nvim_command 'normal! oelse if () {\r}'

  -- Move cursor to the next parentheses or curly brace and start editing
  vim.api.nvim_command 'normal! %hi'
end
--

function InsertTryCatch()
  vim.api.nvim_command 'normal! otry {\r} catch (e) {\rconsole.log(e);\r}'

  -- Move cursor inside the 'try' block and start editing
  vim.api.nvim_command 'normal! kkko  '
end
function InsertTryCatchFinally()
  vim.api.nvim_command 'normal! otry {\r} catch (e) {\rconsole.log(e);\r} finally {\r}'

  -- Move cursor inside the 'try' block and start editing
  vim.api.nvim_command 'normal! kkkko  '
end

-- Define the Lua function to execute :e!
function Reload_file()
  vim.cmd 'e!'
end

-- Map <Leader>r to the Lua function
vim.api.nvim_set_keymap('n', '<Leader>zz', ':lua Reload_file()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<F8>', '<Esc>ua', { noremap = true, silent = true })
------------------------------------
function InsertElse()
  -- Move to the end of the current block (matching brace)
  vim.fn.search('}', 'c', '')

  -- Insert the 'else' statement with an empty block
  vim.api.nvim_command 'normal! oelse {\r}'

  -- Move cursor to the next curly brace and start editing
  vim.api.nvim_command 'normal! %ho  '
end

-- for Go (CHATGPT)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Initialize random number generator
math.randomseed(os.time())

-- Enable true color support
vim.opt.termguicolors = true

-- Define cursor colors
vim.cmd [[
  hi Cursor guifg=NONE guibg=#C3C3C3
  hi iCursor guifg=NONE guibg=#FFFFFF
  hi vCursor guifg=NONE guibg=#FF0000
  hi rCursor guifg=NONE guibg=#FF0000
  hi oCursor guifg=NONE guibg=#FF0000
]]

-- Configure cursor shapes with blinking and custom colors
vim.opt.guicursor = {
  'n-v-ve-c:block-Cursor', -- Blinking block cursor for normal, visual, visual-line, and command-line modes
  'i-ci:ver25-iCursor-blinkon0', -- Vertical bar cursor for insert and command-line insert modes
  'r-cr:hor20-rCursor', -- Horizontal cursor for replace and command-line replace modes
  'o:hor50-oCursor', -- Horizontal cursor for operator-pending mode
}

-- -- List of predefined colors
local colors = {
  '#FF69B4', -- Hot pink
  '#FF4500', -- Orange red
  '#32CD32', -- Lime green
  '#1E90FF', -- Dodger blue
  '#8A2BE2', -- Blue violet
  '#00CED1', -- Dark turquoise
  '#800080', -- Purple
}
--
-- -- Keep track of the last used color
local last_color = nil
--
-- -- Function to get a random color from the list, ensuring it's different from the last color
function _G.random_color_from_list()
  local color
  repeat
    local rand_index = math.random(1, #colors)
    color = colors[rand_index]
  until color ~= last_color
  last_color = color
  return color
end
--
-- -- Global function to set a random cursor color in insert mode
function _G.set_random_cursor_color()
  local color = random_color_from_list()
  vim.cmd(string.format('highlight iCursor guifg=NONE guibg=%s', color))
  vim.cmd(string.format('highlight Cursor guifg=NONE guibg=%s', color))
end
--
-- -- Autocmd group for cursor color change
vim.cmd [[
  augroup RandomCursorColor
    autocmd!
    autocmd InsertEnter * lua _G.set_random_cursor_color()
  augroup END
]]
-- Disable soft wrapping globally
-- vim.o.wrap = false
-- Example of disabling wrap for specific file types
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'markdown', 'text' },
  callback = function()
    vim.wo.wrap = false
  end,
})

function _G.wrap_with_println()
  -- Get the current line
  local line = vim.api.nvim_get_current_line()

  -- Trim leading whitespace
  local trimmed_line = line:gsub('^%s+', '')

  -- Format the new line
  local new_line = 'fmt.Println("' .. trimmed_line .. '")'

  -- Get the current cursor position
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  -- Insert the new line below the current line
  vim.api.nvim_buf_set_lines(0, row, row, false, { new_line })
end

-- Map the function to ctrl+/i
vim.api.nvim_set_keymap('n', '<C-_>gw', ':lua wrap_with_println()<CR>', { noremap = true, silent = true })

-- console.log()
function _G.wrap_with_console_log()
  -- Get the current line
  local line = vim.api.nvim_get_current_line()

  -- Trim leading whitespace
  local trimmed_line = line:gsub('^%s+', '')

  -- Format the new line
  local new_line = 'console.log("' .. trimmed_line .. '")'

  -- Get the current cursor position
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  -- Insert the new line below the current line
  vim.api.nvim_buf_set_lines(0, row, row, false, { new_line })
end

-- Map the function to ctrl+/i
vim.api.nvim_set_keymap('n', '<C-_>jw', ':lua wrap_with_console_log()<CR>', { noremap = true, silent = true })

-- Define the global function
function _G.insert_fmt_printf(value)
  local fmt_snippet = string.format('fmt.Printf("%s: %%v, Type: %%T\\n", %s, %s)', value, value, value)
  vim.api.nvim_put({ fmt_snippet }, 'l', true, true)
end

-- Create a command to call the global function
vim.api.nvim_create_user_command('InsertFmtPrintf', function(opts)
  _G.insert_fmt_printf(opts.args)
end, { nargs = 1 })

-- Create a keybinding to call the InsertFmtPrintf command
vim.api.nvim_set_keymap('n', '<C-_>gv', ':InsertFmtPrintf ', { noremap = true, silent = false })

-- Define a function to move to the end of the line, insert a new line, and respect indentation
function _G.move_to_end_and_newline()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>A<CR>', true, false, true), 'n', true)
end

-- Map <C-_><CR> to the custom function in insert mode
vim.api.nvim_set_keymap('i', '<C-_>CR>', '<Cmd>lua move_to_end_and_newline()<CR>', { noremap = true, silent = true })

--------------------------------------------------------------
-- Define the global function for inserting the for loop snippet
function _G.insert_go_for_loop()
  -- Prompt the user to enter the variable name
  local input = vim.fn.input 'Enter variable name: '
  if input ~= nil and input ~= '' then
    -- Construct the for loop snippet using the provided variable name
    local loop_snippet = string.format(
      [[
for index, character := range %s {
    fmt.Println("Index:", index, "Character:", string(character))
}
]],
      input
    )
    -- Insert the snippet at the current cursor position
    vim.api.nvim_put(vim.split(loop_snippet, '\n'), 'l', true, true)
  end
end

-- Create a command to call the global function
vim.api.nvim_create_user_command('InsertGoForLoop', function()
  _G.insert_go_for_loop()
end, {})

-- Create a keybinding to call the InsertGoForLoop command
vim.api.nvim_set_keymap('n', '<C-_>gl', ':InsertGoForLoop<CR>', { noremap = true, silent = false })

-- function _G.insert_script_tag()
--   -- Insert the script tag
--   local script_tag = '<script src=""></script>'
--   vim.api.nvim_put({ script_tag }, 'l', true, true)
--   -- Switch to normal mode
--   vim.cmd 'normal! k13la'
--   vim.cmd 'normal! i<C-Space>'
-- end

function _G.insert_script_tag()
  -- Define the script tag to insert
  local script_tag = '<script src=""></script>'

  -- Insert the script tag at the current cursor position
  vim.api.nvim_put({ script_tag }, 'l', true, true)

  -- Move cursor to the correct position and enter insert mode
  vim.cmd 'normal! k13la'
end

-- Map <C-_>js to call the insert_script_tag function
vim.api.nvim_set_keymap('n', '<C-_>js', ':lua insert_script_tag()<CR>', { noremap = true, silent = true })

------------------------------------------------------------
-- Function to replace text in the current buffer
function ReplaceText()
  local old_text = vim.fn.input 'Text to replace: '
  local new_text = vim.fn.input 'Replace it with: '

  if old_text == '' or new_text == '' then
    print 'Invalid input. Operation cancelled.'
    return
  end

  -- Get the total number of lines in the current buffer
  local total_lines = vim.api.nvim_buf_line_count(0)

  -- Iterate over each line in the buffer
  for line_number = 1, total_lines do
    -- Get the current line
    local line = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]

    -- Replace old_text with new_text
    local new_line = string.gsub(line, old_text, new_text)

    -- Set the modified line back to the buffer
    vim.api.nvim_buf_set_lines(0, line_number - 1, line_number, false, { new_line })
  end

  print("Replaced all occurrences of '" .. old_text .. "' with '" .. new_text .. "'.")
end

-- Key mapping to call the ReplaceText function
vim.api.nvim_set_keymap('n', '<C-_>ff', ':lua ReplaceText()<CR>', { noremap = true, silent = true })

------------------------------------------------------------

-- Function to replace a specified number of occurrences from the current line onward
function ReplaceTextOccurrences()
  local old_text = vim.fn.input 'Text to replace: '
  local new_text = vim.fn.input 'Replace it with: '
  local num_occurrences = tonumber(vim.fn.input 'Number of occurrences to replace: ')

  if old_text == '' or new_text == '' or num_occurrences == nil then
    print 'Invalid input. Operation cancelled.'
    return
  end

  -- Get the current cursor position
  local current_line = vim.fn.line '.'

  -- Get the total number of lines in the current buffer
  local total_lines = vim.api.nvim_buf_line_count(0)

  local occurrences_replaced = 0

  -- Iterate over each line from the current line onward in the buffer
  for line_number = current_line, total_lines do
    -- Get the current line
    local line = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]

    -- Replace occurrences of old_text with new_text up to num_occurrences
    local new_line, replacements = string.gsub(line, old_text, new_text, num_occurrences - occurrences_replaced)
    occurrences_replaced = occurrences_replaced + replacements

    -- Set the modified line back to the buffer
    vim.api.nvim_buf_set_lines(0, line_number - 1, line_number, false, { new_line })

    -- Break the loop if we've replaced the specified number of occurrences
    if occurrences_replaced >= num_occurrences then
      break
    end
  end

  print('Replaced ' .. occurrences_replaced .. " occurrences of '" .. old_text .. "' with '" .. new_text .. "'.")
end

-- Key mapping to call the ReplaceTextOccurrences function
vim.api.nvim_set_keymap('n', '<C-_>fo', ':lua ReplaceTextOccurrences()<CR>', { noremap = true, silent = true })

-------------------
---for python types!
---

-- Define a global variable to store the last prompted value for Python
_G.last_prompted_value_python = ''

-- Function to insert the get_type function and a print statement in Python
function _G.create_and_call_get_type_python()
  -- Python snippet for the get_type function
  local get_type_function = [[
def get_type(value):
    if isinstance(value, list):
        return "list"
    elif value is None:
        return "NoneType"
    else:
        return type(value).__name__
  ]]

  -- Insert the get_type function (if not already inserted)
  if vim.fn.search('def get_type', 'nw') == 0 then
    vim.api.nvim_put(vim.split(get_type_function, '\n'), '', true, true)
  end

  -- Prompt for variable name if not stored in last_prompted_value_python
  if _G.last_prompted_value_python == '' then
    _G.last_prompted_value_python = vim.fn.input 'Variable name to log: '
  end

  -- Insert the print statement with the stored variable name
  local log_snippet =
    string.format('print("%s: ", %s, ", Type: ", get_type(%s))', _G.last_prompted_value_python, _G.last_prompted_value_python, _G.last_prompted_value_python)
  vim.api.nvim_put({ log_snippet }, '', true, true)
end

-- Function to prompt for a variable name and insert a print statement in Python
function _G.call_get_type_python()
  -- Prompt for variable name and store in last_prompted_value_python
  _G.last_prompted_value_python = vim.fn.input 'Variable name to log: '

  -- Insert the print statement with the stored variable name
  local log_snippet =
    string.format('print("%s: ", %s, ", Type: ", get_type(%s))', _G.last_prompted_value_python, _G.last_prompted_value_python, _G.last_prompted_value_python)
  vim.api.nvim_put({ log_snippet }, '', true, true)
end

-- Map <C-_>pV to call the create_and_call_get_type_python function in normal mode
vim.api.nvim_set_keymap('n', '<C-_>pV', ':lua _G.create_and_call_get_type_python()<CR>', { noremap = true, silent = true })

-- Map <C-_>pc to call the call_get_type_python function in normal mode
vim.api.nvim_set_keymap('n', '<C-_>pc', ':lua _G.call_get_type_python()<CR>', { noremap = true, silent = true })

-- Function to insert a simple Python print statement
function _G.insert_python_print_simple(value)
  local log_snippet = string.format('print("%s: ", %s, ", Type: ", type(%s).__name__)', value, value, value)
  vim.api.nvim_put({ log_snippet }, 'l', true, true)
end

-- Create a command to call the global function for Python
vim.api.nvim_create_user_command('InsertPythonPrint', function(opts)
  _G.insert_python_print_simple(opts.args)
end, { nargs = 1 })

-- Create a keybinding to call the InsertPythonPrint command
vim.api.nvim_set_keymap('n', '<C-_>pv', ':InsertPythonPrint ', { noremap = true, silent = false })

--------------------------------------
-- Function to run a shell command and capture the output
local function get_user_input(prompt)
  -- Use vim.fn.input to get user input in a more Neovim-friendly way
  local result = vim.fn.input(prompt)
  return result -- Return the input directly
end

-- Function to insert JavaScript code snippet
function _G.insert_js_variable_declaration()
  -- Get the variable name from the user
  local variable_name = get_user_input 'Enter the variable name: '

  if variable_name and variable_name ~= '' then
    -- JavaScript input handling function
    local input_function = [[
function input(prompt) {
  const readline = require('readline-sync');
  return readline.question(prompt);
}
]]
    -- JavaScript variable declaration snippet
    local log_snippet = string.format('let %s = input("Enter something: ");', variable_name)

    -- Insert the input function at the top of the buffer
    vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(input_function, '\n'))

    -- Insert the variable declaration at the current cursor position
    vim.api.nvim_put({ log_snippet }, 'l', true, true)
  else
    print 'Variable name cannot be empty'
  end
end

-- Create a command to call the global function
vim.api.nvim_create_user_command('InsertJSVar', function()
  _G.insert_js_variable_declaration()
end, {})

-- Create a keybinding to call the InsertJSVar command
vim.api.nvim_set_keymap('n', '<C-_>jr', ':InsertJSVar<CR>', { noremap = true, silent = false })

vim.o.background = 'dark'

-- Apply settings to ensure there is no extra space
-- vim.cmd 'set noshowmode'
-- vim.cmd 'set noruler'
-- vim.opt.laststatus = 3 -- Use a global statusline
-- Install nvim-transparent plugin
-- Install nvim-transparent plugin
-- require('lazy').setup {
--   ,
--   -- Add other plugins here
-- }

-- -- Require the transparent module and configure it
--
-- -- Set the transparency for the main window
-- vim.cmd [[au VimEnter * hi Normal guibg=NONE ctermbg=NONE]]
--
-- -- Set the solid background for hover windows (like floating windows)
-- vim.cmd [[
--   augroup NonTransparentHover
--     autocmd!
--     autocmd FileType lua,python,javascript,typescript setlocal winhighlight=NormalFloat:Normal
--   augroup END
-- ]]
-- Set the solid background for hover windows
vim.cmd [[
  hi NormalFloat guibg=#1e222a
  hi FloatBorder guibg=#1e222a
]]
