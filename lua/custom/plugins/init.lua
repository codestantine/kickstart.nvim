-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'NTBBloodbath/doom-one.nvim',
  -- 'ray-x/starry.nvim',
  'slugbyte/lackluster.nvim',
  'savq/melange-nvim',
  'vague2k/vague.nvim',
  'matsuuu/pinkmare',
  -- {
  --   'ggml-org/llama.vim',
  --   init = function()
  --     vim.g.llama_config = {
  --       auto_fim = true,
  --     }
  --
  --     vim.g.llama_model_path = '/home/adcodes/.cache/huggingface/hub/models--Qwen--Qwen2.5-Coder-1.5B/snapshots/df3ce67c0e24480f20468b6ef2894622d69eb73b'
  --   end,
  -- },
  {
    'preservim/vim-colors-pencil',
    config = function()
      -- Configure Pencil to use the light variant
      vim.g.pencil_terminal_italics = 1 -- Optional: Enable italics
      vim.g.pencil_neutral_code_bg = 1 -- Optional: Neutral background for code blocks
      vim.g.pencil_higher_contrast_ui = 0 -- Optional: Disable higher contrast UI (for softer look)

      -- Apply the Pencil colorscheme with the light variant
      -- vim.cmd 'set background=light'
      -- vim.cmd 'colorscheme pencil'
    end,
  },

  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_background = 'light' -- Light variant
      vim.g.gruvbox_material_enable_italic = 1 -- Optional: Enable italics
      -- vim.cmd('colorscheme gruvbox-material')
    end,
  },
  {
    'sainnhe/edge',
    config = function()
      vim.g.edge_style = 'light' -- Light variant
      -- vim.g.edge_enable_italic = 1 -- Optional: Enable italics
      -- vim.cmd('colorscheme edge')
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        variant = 'dawn', -- Light variant
      }
      -- vim.cmd 'colorscheme rose-pine'
    end,
  },

  'nanotech/jellybeans.vim',
  'jpo/vim-railscasts-theme',
  'FrenzyExists/aquarium-vim',
  'Mofiqul/vscode.nvim',
  'kristijanhusak/vim-hybrid-material',
  'sonph/onehalf',
  'rakr/vim-one',
  'navarasu/onedark.nvim',
  'olimorris/onedarkpro.nvim',
  'sainnhe/gruvbox-material',
  -- 'github/copilot.vim',
}
