local status_devicons, devicons = pcall(require, "nvim-web-devicons")
if status_devicons then
    devicons.setup({
        -- Use simpler icons that are more likely to display correctly
        override = {
            default_icon = {
                icon = "*",
                color = "#6d8086",
                name = "Default",
            },
            -- Add specific file type overrides with simple icons
            lua = {
                icon = "L",
                color = "#51a0cf",
                name = "Lua",
            },
            py = {
                icon = "P",
                color = "#ffbc03",
                name = "Python",
            },
            js = {
                icon = "J",
                color = "#cbcb41",
                name = "JavaScript",
            },
            -- Add more as needed
        },
        default = true,
        strict = true,
    })
else
    vim.notify("Devicons not found, skipping setup", vim.log.levels.WARN)
end
