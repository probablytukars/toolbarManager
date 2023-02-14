local toolbarManager = {}

local function getToolbarFolder()
	local coreGui = game:GetService("CoreGui")
	local folderName = "PluginToolbars"
	
	local toolbarFolder = coreGui:FindFirstChild(folderName)
	
	if not toolbarFolder then
		toolbarFolder = Instance.new("Folder")
		toolbarFolder.Name = folderName
		toolbarFolder.Parent = coreGui
	end
	
	return toolbarFolder
end

function toolbarManager.getToolbar(plugin, toolbarName, ancestryChanged)
	local toolbarFolder = getToolbarFolder()
	local toolbar = toolbarFolder:FindFirstChild(toolbarName)

	if not toolbar then
		toolbar = plugin:CreateToolbar(toolbarName)
		toolbar.Name = toolbarName;
		toolbar.Parent = toolbarFolder;
	end

	toolbar.AncestryChanged:Connect(function()
		local newToolbar = toolbarFolder:WaitForChild(toolbarName, 5)
		if newToolbar and newToolbar.Parent then
			ancestryChanged(newToolbar)
		end
	end)
	
	ancestryChanged(toolbar)
end

function toolbarManager.addButton(toolbar, buttonName, description, imageID)
	local existingButton = toolbar:FindFirstChild(buttonName)

	if existingButton then return existingButton end

	local newButton = toolbar:CreateButton(buttonName, description, imageID)
	newButton.Name = buttonName
	newButton.Parent = toolbar

	return newButton	
end

return toolbarManager
