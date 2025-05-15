local M = {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        -- build = function() vim.fn["mkdp#util#install"]() end,
        build = "cd app && npm install && git restore .",
        config = function()
                local IMAGE_PATH = "/home/garcox/.markdown_images"

                vim.g.mkdp_auto_start = 0
                vim.g.mkdp_auto_close = 1
                vim.g.mkdp_refresh_slow = 0
                vim.g.mkdp_command_for_global = 0
                vim.g.mkdp_open_to_the_world = 1
                vim.g.mkdp_open_ip = '0.0.0.0'
                vim.g.mkdp_browser = ''
                vim.g.mkdp_echo_preview_url = 1
                vim.g.mkdp_browserfunc = ''
                vim.g.mkdp_preview_options = {
                        mkit = {},
                        uml = {},
                        maid = {},
                        disable_sync_scroll = 0,
                        sync_scroll_type = 'middle',
                        hide_yaml_meta = 1,
                        sequence_diagrams = {},
                        flowchart_diagrams = {},
                        content_editable = false,
                        disable_filename = 0,
                        toc = {},
                }
                vim.g.mkdp_markdown_css = ''
                vim.g.mkdp_highlight_css = ''
                vim.g.mkdp_port = '4444'
                vim.g.mkdp_page_title = '「${name}」'
                vim.g.mkdp_images_path = IMAGE_PATH
                vim.g.mkdp_filetypes = {'markdown'}
                vim.g.mkdp_theme = 'light'
                vim.g.mkdp_combine_preview = 0
                vim.g.mkdp_combine_preview_auto_refresh = 1
        end,
}

return { M }
