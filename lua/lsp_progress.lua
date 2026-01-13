-- lua/lsp_progress_spinner.lua
local M = {}

-- table to store current progress for each client
M.progress = {}

-- spinner frames
local frames = { "⠋","⠙","⠹","⠸","⠼","⠴","⠦","⠧","⠇","⠏" }
local frame = 1
local timer

-- helper: start spinner timer
local function start_timer()
    if timer then return end
    timer = vim.loop.new_timer()
    timer:start(0, 120, vim.schedule_wrap(function()
        frame = frame % #frames + 1
        -- refresh lualine every tick
        if require("lualine") then
            require("lualine").refresh()
        end
    end))
end

-- helper: stop spinner timer
local function stop_timer()
    if timer then
        timer:stop()
        timer:close()
        timer = nil
    end
end

-- track LSP $/progress messages
vim.lsp.handlers['$/progress'] = function(_, result, ctx)
    local value = result.value
    if not value then return end

    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if not client then return end

    if value.kind == 'begin' or value.kind == 'report' then
        M.progress[client.name] = value.title or value.message or ""
    elseif value.kind == 'end' then
        M.progress[client.name] = nil
    end
end

-- function for lualine
function M.status()
    local msgs = {}
    for client, msg in pairs(M.progress) do
        if msg and msg ~= "" then
            table.insert(msgs, string.format(" %s: %s %s", client, frames[frame], msg))
        else
            table.insert(msgs, string.format(" %s %s", client, frames[frame]))
        end
    end

    if next(M.progress) == nil then
        stop_timer()
        return ""
    else
        start_timer()
    end

    return table.concat(msgs, " | ")
end

return M
