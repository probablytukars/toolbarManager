local toolbarManager = {}

function toolbarManager.destroyOldToolbars(parent, names)
	for _, name in pairs(names) do
		local oldToolbar = parent:FindFirstChild(name)
		if oldToolbar then oldToolbar:Destroy() end
	end
end

local function findFirstChildWithClass(object, name, class)
	for _, obj in pairs(object:GetChildren()) do
		if obj:IsA(class) and obj.Name == name then
			return obj
		end
	end
	return nil
end

function toolbarManager.getToolbar(plugin, parent, toolbarName)
	local toolbar = findFirstChildWithClass(parent, toolbarName, "PluginToolbar")

	if not toolbar then
		toolbar = plugin:CreateToolbar(toolbarName)
		toolbar.Name = toolbarName;
		toolbar.Parent = parent;
	end
	
	return toolbar
end

function toolbarManager.addButton(toolbar, buttonName, description, imageID)
	local existingButton = toolbar:FindFirstChild(buttonName)
	
	if existingButton then existingButton:Destroy() end
	
	local newButton = toolbar:CreateButton(buttonName, description, imageID)
	newButton.Name = buttonName
	newButton.Parent = toolbar
	
	return newButton	
end

return toolbarManager
