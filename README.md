# Roblox Shared Toolbar Manager

This is very simple library implementing two functions: `getToolbar`, and `addButton`. The purpose of this library is to make it easy to combine multiple plugin buttons under one toolbar, without running into errors.

## Example Usage

```lua
local toolbarManager = require(path.to.module)

--your code here.

local function buildButton(toolbar)
	local button = toolbarManager.addButton(
		toolbar,
		"Create Motor6D", 
		"Create Motor6Ds for parts", 
		"rbxassetid://9467278136"
	)
	
	button:SetActive(WIDGET.Enabled)
	button.Click:connect(function()
		WIDGET.Enabled = not WIDGET.Enabled
		button:SetActive(WIDGET.Enabled)
	end)
end

toolbarManager.getToolbar(plugin, "Tukars' Plugins", buildButton)
```

## Documentation

- `toolbarManager.getToolbar(plugin, toolbarName: string, ancestryChanged: () -> (PluginToolbar)): `: This function takes 3 arguments, the first is the literal keyword `plugin` (as modules do not have access to the plugin variable). The next is the name of the toolbar, if you want to store buttons under the same toolbar they will need to access this toolbar using the same name. The next is a callback that **may be called multiple times over the lifetime of the plugin**. The reason this callback might call multiple times is because if another plugin updates, it'll delete the toolbar it's stored under (which is also the toolbar this plugin stores its button under). It's important we always have a button available for users to use (see above code). 

- `toolbarManager.addButton(toolbar: PluginToolbar, buttonName: string, description: string, imageID: string): PluginToolbarButton`: This will return a PluginToolbarButton instance, just as [toolbar:CreateButton()](https://create.roblox.com/docs/reference/engine/classes/PluginToolbar#CreateButton) does. The first argument should be the toolbar you got from `toolbarManager.getToolbar()`, however it can also be one you get from `plugin:CreateToolbar()`. The next three arguments are the name, description, and image of the button. These are the same as the `toolbar:CreateButton()` function. If a button already exists in that toolbar, it will return that button (since plugin buttons cannot be overriden), if not, then it creates and returns a new button.


* type annotations may be incorrect.

## License

This project is licensed under the CC0 license.
