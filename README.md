# rblx-quickscript
A script that is put into autoexec which allows you to quickly execute a preset number of scripts using an in-game UI.

# Usage
1. Insert following code into any text editor.
```lua
QS = loadstring(game:HttpGet('https://raw.githubusercontent.com/DexTheExplorer/rblx-quickscript/main/source.lua'))()

QS:AddEntry('Hello World', 'rbxassetid://6026568210', "print('Hello World!')")

```

2. Add/Modify entries in this format.
```lua
--[[
  ScriptName : The name of the script. It will show up on the button in-game.
  ScriptIcon : An image asset. It will show up on the button in-game. Can be either 'rbxassetid://123' or 'get_synasset('image.png')'
  ScriptCode : The code that will be ran upon click. This can be a loadstring or plain luau code.
]]--

QS:AddEntry(ScriptName, ScriptIcon, ScriptCode)
```

3. Make sure your script looks something like this
```lua
QS = loadstring(game:HttpGet('https://raw.githubusercontent.com/DexTheExplorer/rblx-quickscript/main/source.lua'))()

QS:AddEntry('Hello World', 'rbxassetid://6026568210', "print('Hello World!')")
QS:AddEntry('Die', 'rbxassetid://6034287515', "game.Players.LocalPlayer.Character.Humanoid.Health = 0")
QS:AddEntry('Spawn Block', 'rbxassetid://6031630222', "local part = Instance.new('Part') part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position part.Parent = workspace")
```

4. Save the file into your autoexec folder.

Congratulations. It should now work accordingly.

# Issues
QuickScript will **not** tell you if your script encountered an error, unless `_G.DEBUG` is set to **true**.

Make sure to format your code correctly. **You cannot use multiple `"` in a script without escaping.**

**Solution:** Use `'` inside of scripts instead of `"`.
```lua
QS:AddEntry('Cool Script', 'rbxassetid://1', "loadstring(game:HttpGet('https://raw.githubusercontent.com/DexTheExplorer/rblx-quickscript/main/source.lua'))()")
```
