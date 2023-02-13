# Toolbar Manager

#### NOTICE: THIS PROJECT IS CURRENTLY IN THE PROCESS OF BEING DOCUMENTED

This is very simple library implementing two functions: `getToolbar`, and `addButton`. The purpose of this library is to make it easy to combine multiple plugin buttons under one toolbar, without running into errors.

## Example Usage

```lua
local toolbarManager = require(path.to.module)
local toolbar = toolbarManager.getToolbar(plugin, coreGui, "name of toolbar")

local button = toolbarManager.addButton(
	toolbar,
	"Button name", 
	"Button Description.", 
	"Button rbxassetid (image)"
)

--The rest of your code here.

```

## Documentation

- `toolbarManager.getToolbar(plugin, parent: Instance, toolbarName: string): PluginToolbar`: This will return a PluginToolbar instance, just as [plugin:CreateToolbar()](https://create.roblox.com/docs/reference/engine/classes/Plugin#CreateToolbar) does. This returns the existing toolbar if one already exists, and if not, creates a new toolbar. This requires the literal built in `plugin` variable (as module scripts do not have access to it), the parent location of where to keep the toolbar, which MUST be NON-NULL (a typical choice is coreGui), and the name of the toolbar to create.

- `toolbarManager.addButton(toolbar: PluginToolbar, buttonName: string, description: string, imageID: string): PluginToolbarButton`: This will return a PluginToolbarButton instance, just as [toolbar:CreateButton()](https://create.roblox.com/docs/reference/engine/classes/PluginToolbar#CreateButton) does. The first argument should be the toolbar you got from `toolbarManager.getToolbar()`, however it can also be one you get from `plugin:CreateToolbar()`. The next three arguments are the name, description, and image of the button. These are the same as the `toolbar:CreateButton()` function. If a button already exists in that toolbar, it will return that button (since plugin buttons cannot be overriden), if not, then it creates and returns a new button.


* type annotations may be incorrect.

## License

This project is licensed under the CC0 license.
