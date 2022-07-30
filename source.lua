function randomString() local length = math.random(10,20) local array = {} for i = 1, length do array[i] = string.char(math.random(32, 126)) end return table.concat(array) end
local function tween(o,i,g) game:GetService("TweenService"):Create(o,i,g):Play() end

local QS = {}

-- Debugging Function
local function debug(text)
	if not _G.DEBUG then return end
	if (syn) then
		rconsoleprint("[Debug] " .. tostring(text).."\n") -- Avoid printing to the Roblox in-game console at all costs. Printing to the Roblox console is unsafe.
	else
		print("[Debug] " .. tostring(text))
	end
end

-- Initialize UI
local Holder = Instance.new('ScreenGui')
Holder.Name = randomString()
if (syn) then syn.protect_gui(Holder) end
Holder.IgnoreGuiInset = true
Holder.Parent = game:GetService('CoreGui')

local Host = Instance.new("Frame")
Host.Name = "Host"
Host.AnchorPoint = Vector2.new(0, 1)
Host.AutomaticSize = Enum.AutomaticSize.X
Host.Size = UDim2.new(0, 0, 0, 75)
Host.Position = UDim2.new(0, 25, 1, 100) -- 0,25,1,-25
Host.BorderSizePixel = 0
Host.BackgroundColor3 = Color3.fromRGB(26, 1, 22)
Host.Parent = Holder

local UICorner = Instance.new("UICorner")
UICorner.Parent = Host

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0, 0.5)
Main.AutomaticSize = Enum.AutomaticSize.X
Main.Size = UDim2.new(0, 45, 0, 45)
Main.BackgroundTransparency = 1
Main.Position = UDim2.new(0, 15, 0.5, 0)
Main.BorderSizePixel = 0
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.Parent = Host

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 15)
UIListLayout.Parent = Main

local BottomCornerRadius = Instance.new("Frame")
BottomCornerRadius.Name = "BottomCornerRadius"
BottomCornerRadius.AnchorPoint = Vector2.new(0, 1)
BottomCornerRadius.Size = UDim2.new(1, 15, 0, 8)
BottomCornerRadius.Position = UDim2.new(0, 0, 1, 0)
BottomCornerRadius.BorderSizePixel = 0
BottomCornerRadius.BackgroundColor3 = Color3.fromRGB(26, 1, 22)
BottomCornerRadius.Parent = Host

local Line = Instance.new("Frame")
Line.Name = "Line"
Line.Size = UDim2.new(1, 15, 0, 5)
Line.Position = UDim2.new(0, 0, 1, 0)
Line.BorderSizePixel = 0
Line.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
Line.Parent = Host

-- Close Btn
local Window = Instance.new("Frame")
Window.Name = "Window"
Window.Size = UDim2.new(0, 45, 0, 45)
Window.BackgroundColor3 = Color3.fromRGB(255, 98, 101)
Window.LayoutOrder = 32767
Window.Parent = Main

local UICorner1 = Instance.new("UICorner")
UICorner1.Parent = Window

local Icon = Instance.new("ImageLabel")
Icon.Name = "Icon"
Icon.AnchorPoint = Vector2.new(0.5, 0.5)
Icon.Size = UDim2.new(0, 25, 0, 25)
Icon.BackgroundTransparency = 1
Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
Icon.BorderSizePixel = 0
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.ImageColor3 = Color3.fromRGB(26, 1, 22)
Icon.Image = "rbxassetid://6031094678"
Icon.Parent = Window

local Button = Instance.new("ImageButton")
Button.Name = "Button"
Button.ZIndex = 2
Button.Size = UDim2.new(1, 0, 1, 0)
Button.BackgroundTransparency = 1
Button.BorderSizePixel = 0
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.Parent = Window

local UIGradient = Instance.new("UIGradient")
UIGradient.Rotation = 135
UIGradient.Color = ColorSequence.new(Color3.fromRGB(238, 238, 238), Color3.fromRGB(180, 180, 180))
UIGradient.Parent = Window
local hasClosed = false
spawn(function()
    Button.MouseEnter:Connect(function()
        if not (hasClosed) then
            tween(Button, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {BackgroundTransparency = 0.8})
        end
    end)
    Button.MouseLeave:Connect(function()
        if not (hasClosed) then
            tween(Button, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {BackgroundTransparency = 1})
        end
    end)
    Button.MouseButton1Down:Connect(function()
        if (hasClosed) then return end
        hasClosed = true
        tween(Host, TweenInfo.new(0.75, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0, 25, 1, 100)})
        wait(1)
        Holder:Destroy()
    end)
end)

-- Add Buttons
function QS:AddEntry(name, icon, code)
	local Window = Instance.new("Frame")
	Window.Name = "Window"
	Window.AutomaticSize = Enum.AutomaticSize.X
	Window.Size = UDim2.new(0, 45, 0, 45)
	Window.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Window.Parent = Main

	local UICorner = Instance.new("UICorner")
	UICorner.Parent = Window

	local UIGradient = Instance.new("UIGradient")
	UIGradient.Rotation = 135
	UIGradient.Color = ColorSequence.new(Color3.fromRGB(238, 238, 238), Color3.fromRGB(180, 180, 180))
	UIGradient.Parent = Window

	local Icon = Instance.new("ImageLabel")
	Icon.Name = "Icon"
	Icon.AnchorPoint = Vector2.new(0, 0.5)
	Icon.Size = UDim2.new(0, 25, 0, 25)
	Icon.BackgroundTransparency = 1
	Icon.Position = UDim2.new(0, 10, 0.5, 0)
	Icon.BorderSizePixel = 0
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.ImageColor3 = Color3.fromRGB(26, 1, 22)
	Icon.Image = icon
	if not icon:match("rbxassetid://") then
	    Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
	end
	Icon.Parent = Window

	local Button = Instance.new("ImageButton")
	Button.Name = "Button"
	Button.ZIndex = 2
	Button.Size = UDim2.new(1, 0, 1, 0)
	Button.BackgroundTransparency = 1
	Button.BorderSizePixel = 0
	Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button.Parent = Window

	local CodeName = Instance.new("TextLabel")
	CodeName.Name = "CodeName"
	CodeName.Size = UDim2.new(0, 0, 0, 45)
	CodeName.ClipsDescendants = true
	CodeName.BackgroundTransparency = 1
	CodeName.Position = UDim2.new(0, 45, 0, 0)
	CodeName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CodeName.FontSize = Enum.FontSize.Size14
	CodeName.TextSize = 14
	CodeName.RichText = true
	CodeName.TextColor3 = Color3.fromRGB(0, 0, 0)
	CodeName.Text = "<b>"..name.."</b>"
	CodeName.Font = Enum.Font.Ubuntu
	CodeName.TextXAlignment = Enum.TextXAlignment.Left
	CodeName.Parent = Window

	spawn(function()
		local hasClicked = false
		Button.MouseEnter:Connect(function()
			tween(CodeName, TweenInfo.new(0.2), {Size = UDim2.new(0, (CodeName.TextBounds.X + 10), 0, 45)})
			if not (hasClicked) then
				tween(Window, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {BackgroundColor3 = Color3.fromRGB(200, 200, 200)})
			end
		end)
		Button.MouseLeave:Connect(function()
			tween(CodeName, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 45)})
			if not (hasClicked) then
				tween(Window, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)})
			end
		end)
		Button.MouseButton1Down:Connect(function()
			if (hasClicked) or (hasClosed) then return end
			hasClicked = true
			tween(Window, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {BackgroundColor3 = Color3.fromRGB(30, 215, 96)})
			if (code) then -- Check if there's actual code to execute.
				local err, succ = pcall(function()
					loadstring(code)()
				end)
				if not succ then
					debug(err)
				end
			end
		end)
	end)

end

-- Show UI
tween(Host, TweenInfo.new(0.75, Enum.EasingStyle.Back), {Position = UDim2.new(0, 25, 1, -25)})

-- Return Library
return QS
