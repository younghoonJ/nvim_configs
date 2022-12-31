
function ColorMyPencils(color)
	-- color = color or "rose-pine"
    -- color = color or "gruvbox"
    -- color = color or "eldar"
    -- color = color or "landscape"
    -- color = color or "PaperColorSlim"
    color = color or "carbonfox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

ColorMyPencils()
