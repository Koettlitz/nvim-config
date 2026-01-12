-- table to store current progress for each client
local M = {}
M.progress = {}

-- track LSP $/progress messages
vim.lsp.handlers['$/progress'] = function(_, result, ctx)
  local value = result.value
  if not value then return end

  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not client then return end

  if value.kind == 'begin' or value.kind == 'report' then
    M.progress[client.name] = value.title or value.message
  elseif value.kind == 'end' then
    M.progress[client.name] = nil
  end
end

-- function for statusline
function M.status()
  local msgs = {}
  for client, msg in pairs(M.progress) do
    table.insert(msgs, ' ' .. client .. ': ' .. msg)
  end
  return table.concat(msgs, ' | ')
end

return M
