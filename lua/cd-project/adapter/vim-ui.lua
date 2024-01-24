local api = require("cd-project.api")
local config = require("cd-project.config"
local function logErr(msg)
	vim.notify(msg, vim.log.levels.ERROR, { title = "cd-project.nvim" })
end

-- TODO: how to make this level purely to get user input and pass to the api functions
local function cd_project()
	vim.ui.select(api.get_project_paths(), {
		prompt = "Select a directory",
	}, function(dir)
		if not dir then
			return logErr("Must select a valid dir")
		end
		api.cd_project(dir)
		if config.config.verbose then
			vim.notify("\nSwitched to dir: " .. dir)
		end
	end)
end

return {
	cd_project = cd_project,
}
