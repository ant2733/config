return {
    "folke/snacks.nvim",
    opts = {
        image = {}
    },
    config = function()
        require("snacks").setup()
    end
}

