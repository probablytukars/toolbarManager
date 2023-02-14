local toolbarManager = {}

function toolbarManager.getToolbar(plugin, parent, toolbarName, ancestryChanged)
	local toolbar = parent:FindFirstChild(toolbarName)

	if not toolbar then
		toolbar = plugin:CreateToolbar(toolbarName)
		toolbar.Name = toolbarName;
		toolbar.Parent = parent;
	end

	toolbar.AncestryChanged:Connect(function()
		local newToolbar = parent:WaitForChild(toolbarName, 5)
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
