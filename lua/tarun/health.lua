-- Health check module for Neovim configuration
local M = {}

-- Check if a command exists
local function command_exists(cmd)
    local handle = io.popen("command -v " .. cmd .. " 2>/dev/null")
    if not handle then
        return false
    end

    local result = handle:read("*a") or ""
    handle:close()
    return result ~= ""
end

-- Check clipboard support
local function check_clipboard()
    local has_clipboard = false
    local clipboard_util = nil
    
    -- Check for clipboard utilities on Linux
    if vim.fn.has("unix") == 1 and vim.fn.has("mac") == 0 then
        if command_exists("xclip") then
            has_clipboard = true
            clipboard_util = "xclip"
        elseif command_exists("xsel") then
            has_clipboard = true
            clipboard_util = "xsel"
        elseif command_exists("wl-copy") then
            has_clipboard = true
            clipboard_util = "wl-clipboard"
        end
    elseif vim.fn.has("mac") == 1 then
        -- macOS has native clipboard support
        has_clipboard = true
        clipboard_util = "pbcopy/pbpaste (native)"
    elseif vim.fn.has("win32") == 1 or vim.fn.has("wsl") == 1 then
        -- Windows/WSL
        if vim.fn.has("wsl") == 1 then
            if command_exists("xclip") then
                has_clipboard = true
                clipboard_util = "xclip"
            end
        else
            has_clipboard = true
            clipboard_util = "Windows native"
        end
    end
    
    return has_clipboard, clipboard_util
end

-- Check optional tools
local function check_tools()
    local tools = {
        { cmd = "rg", name = "ripgrep", description = "Fast searching (Telescope)" },
        { cmd = "fd", name = "fd", description = "Fast file finding (Telescope)" },
        { cmd = "node", name = "Node.js", description = "Required for many LSP servers" },
        { cmd = "git", name = "Git", description = "Required for plugin management" },
    }
    
    local missing = {}
    local found = {}
    
    for _, tool in ipairs(tools) do
        if command_exists(tool.cmd) then
            table.insert(found, tool)
        else
            table.insert(missing, tool)
        end
    end
    
    return found, missing
end

-- Display startup warnings
M.check_dependencies = function()
    local warnings = {}
    
    -- Check clipboard
    local has_clipboard, clipboard_util = check_clipboard()
    if not has_clipboard then
        table.insert(warnings, {
            level = "ERROR",
            message = "No clipboard utility found! System clipboard will not work.",
            solution = "Install xclip: sudo apt-get install xclip"
        })
    end
    
    -- Check tools
    local found_tools, missing_tools = check_tools()
    for _, tool in ipairs(missing_tools) do
        if tool.name == "Git" or tool.name == "Node.js" then
            table.insert(warnings, {
                level = "ERROR",
                message = tool.name .. " is not installed! " .. tool.description,
                solution = "Install " .. tool.name .. " for full functionality"
            })
        else
            table.insert(warnings, {
                level = "WARN",
                message = tool.name .. " is not installed. " .. tool.description,
                solution = "Optional: Install " .. tool.name .. " for better experience"
            })
        end
    end
    
    -- Display warnings if any
    if #warnings > 0 then
        vim.defer_fn(function()
            print("================== Neovim Config Health Check ==================")
            for _, warning in ipairs(warnings) do
                if warning.level == "ERROR" then
                    vim.api.nvim_echo({{warning.message, "ErrorMsg"}}, false, {})
                    vim.api.nvim_echo({{" → " .. warning.solution, "WarningMsg"}}, false, {})
                else
                    vim.api.nvim_echo({{warning.message, "WarningMsg"}}, false, {})
                    vim.api.nvim_echo({{" → " .. warning.solution, "Comment"}}, false, {})
                end
            end
            print("================================================================")
            print("Run :checkhealth for detailed diagnostics")
        end, 1000) -- Delay by 1 second to show after startup
    end
end

-- Neovim health check integration
M.check = function()
    local health = vim.health
    if not health then
        -- Fallback for older Neovim versions
        return
    end
    
    health.start("Neovim Config Dependencies")
    
    -- Check clipboard
    local has_clipboard, clipboard_util = check_clipboard()
    if has_clipboard then
        health.ok("Clipboard utility found: " .. clipboard_util)
    else
        health.error(
            "No clipboard utility found",
            "Install xclip: sudo apt-get install xclip"
        )
    end
    
    -- Check tools
    local found_tools, missing_tools = check_tools()
    
    health.start("Required Tools")
    for _, tool in ipairs(found_tools) do
        if tool.name == "Git" or tool.name == "Node.js" then
            health.ok(tool.name .. " is installed")
        end
    end
    
    for _, tool in ipairs(missing_tools) do
        if tool.name == "Git" or tool.name == "Node.js" then
            health.error(
                tool.name .. " is not installed",
                "Install " .. tool.name .. ": " .. tool.description
            )
        end
    end
    
    health.start("Optional Tools")
    for _, tool in ipairs(found_tools) do
        if tool.name ~= "Git" and tool.name ~= "Node.js" then
            health.ok(tool.name .. " is installed")
        end
    end
    
    for _, tool in ipairs(missing_tools) do
        if tool.name ~= "Git" and tool.name ~= "Node.js" then
            health.warn(
                tool.name .. " is not installed",
                tool.description
            )
        end
    end
end

return M
