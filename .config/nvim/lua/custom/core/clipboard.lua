local function clipboard_tool()
  return vim.fn['provider#clipboard#Executable']()
end

local function should_force_osc52()
  if clipboard_tool() ~= '' then return false end

  local term = vim.env.TERM or ''
  return vim.env.SSH_TTY ~= nil or vim.env.TMUX ~= nil or term:match 'kitty'
end

if should_force_osc52() then vim.g.clipboard = 'osc52' end

vim.schedule(function()
  vim.opt.clipboard:append 'unnamedplus'

  local provider = clipboard_tool()
  if provider == '' then
    vim.notify(
      'No clipboard provider found. Install wl-clipboard, xclip/xsel, or use tmux/SSH with OSC52 support.',
      vim.log.levels.WARN
    )
    return
  end

  if provider == 'osc52' then
    vim.notify('Using OSC52 clipboard fallback', vim.log.levels.INFO)
  end
end)
