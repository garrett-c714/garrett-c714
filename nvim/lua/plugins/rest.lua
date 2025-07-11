local M = {
    "rest-nvim/rest.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    --rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    --Install: xml2lua, mimetypes

    config = function()
        require("rest-nvim").setup({
            custom_dynamic_variables = {},
            request = {
                skip_ssl_verification = false,
                hooks = {
                    encode_url = true,
                    user_agent = "rest.nvim v" .. require("rest-nvim.api").VERSION,
                    set_content_type = true,
                },
            },
            response = {
                decode_url = true,
                format = true,
            },
            clients = {
                curl = {
                    statistics = {
                        { id="time_total", winbar="take", title="Time taken" },
                        { id="size_download", winbar="size", title="Download size" },
                    },
                    opts = {
                        set_compressed = false,
                        certificates = {}
                    },
                },
            },
            cookies = {
                enable = true,
                path = vim.fs.joinpath(vim.fn.stdpath("data"), "rest-nvim.cookies"),
            },
            env = {
                enable = true,
                pattern = ".*%.env.*",
                find = function()
                    local config = require("rest-nvim.config")
                    return vim.fs.find(function(name, _)
                        return name:match(config.env.pattern)
                    end, {
                        path = vim.fn.getcwd(),
                        type = "file",
                        limit = math.huge,
                    })
                end,
            },
            ui = {
                winbar = true,
                keybinds = {
                    prev = "H",
                    next = "L",
                },
            },
            highlight = {
                enable = true,
                timeout = 750,
            },
            _log_level = vim.log.levels.WARN,
        })
    end
}

--return {}
return { M }
