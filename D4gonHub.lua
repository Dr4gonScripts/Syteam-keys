-- ==================================================================================================
-- INÍCIO DA BIBLIOTECA ORION (EMBUTIDA NO SCRIPT PARA MAIOR CONFIABILIDADE)
-- ==================================================================================================

local OrionLib = (function()
-- Código-fonte completo da biblioteca Orion
-- Para garantir que não haja falhas de download (game:HttpGet)
-- @author jensonhirst - https://github.com/jensonhirst/Orion/main/source

local is_old = (getfenv or getgenv)().script
local function getenv(level)
	return (getfenv or getgenv)(level)
end
if not is_old then
	_G.script = nil
	local fenv = getenv(0)
	local function setfenv(f, t)
		f = type(f) == "function" and f or debug.getinfo(f, "f").func
		local upvals = debug.getupvalues(f)
		for i, v in pairs(upvals) do
			if v == "_ENV" then
				debug.setupvalue(f, i, t)
				break
			end
		end
		return f
	end
	setfenv(getfenv, getenv(1))
	setfenv(setfenv, getenv(1))
end
local library = {}
local old_getfenv = getfenv
local getfenv = old_getfenv or getgenv
local setfenv = setfenv or function(f, t) debug.setupvalue(f, 1, t) end
local old_loadstring = loadstring
loadstring = function(str, name)
	return old_loadstring(str, name)
end
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local camera = game:GetService("Workspace").CurrentCamera
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Orion_GUI"
local UI_scale = 1
local old_uis_getmouse = UserInputService.GetMouseLocation
function UserInputService:GetMouseLocation()
	return old_uis_getmouse(self) * UI_scale
end
local window
local objects = {}
local tabs = {}
local colors = {
	main = Color3.fromHex("#FF2A5C"),
	background = Color3.fromHex("#171717"),
	dark_background = Color3.fromHex("#131313"),
	light_background = Color3.fromHex("#262626"),
	text = Color3.fromHex("#FFFFFF"),
	secondary_text = Color3.fromHex("#858585"),
	accent = Color3.fromHex("#FF2A5C"),
	toggle_off = Color3.fromHex("#333333"),
	button_hover = Color3.fromHex("#212121"),
}
local accent_colors = {
	pink = Color3.fromHex("#FF2A5C"),
	blue = Color3.fromHex("#2A79FF"),
	green = Color3.fromHex("#2AFF4D"),
	red = Color3.fromHex("#FF2A2A"),
	yellow = Color3.fromHex("#FFF22A"),
	purple = Color3.fromHex("#B22AFF"),
	white = Color3.fromHex("#FFFFFF"),
	orange = Color3.fromHex("#FFA500"),
}
local current_accent = "pink"
local tween_info_window = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local tween_info_in = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween_info_out = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local function get_setting(name, default)
	if not default then
		default = false
	end
	local save = getsynasset("OrionLib_Config.json")
	if not save then
		return default
	end
	local success, decoded = pcall(HttpService.JSONDecode, HttpService, save)
	if not success then
		return default
	end
	if decoded[name] == nil then
		return default
	else
		return decoded[name]
	end
end
local function save_setting(name, value)
	local save = getsynasset("OrionLib_Config.json")
	local decoded
	local success, decoded = pcall(HttpService.JSONDecode, HttpService, save)
	if not success then
		decoded = {}
	end
	decoded[name] = value
	local success_encode, encoded = pcall(HttpService.JSONEncode, HttpService, decoded)
	if success_encode then
		writesynasset("OrionLib_Config.json", encoded)
	end
end
local function update_accent_color(color)
	colors.accent = color
	current_accent = color.Name
	if window then
		window.AccentColor.BackgroundColor3 = color
		window.WindowToggle.TextColor3 = color
		for name, obj in pairs(objects) do
			if obj.Type == "Slider" then
				obj.Main.BackgroundColor3 = color
			elseif obj.Type == "Toggle" then
				if obj.Enabled then
					obj.Main.BackgroundColor3 = color
				end
			elseif obj.Type == "ColorPicker" then
				obj.Indicator.BackgroundColor3 = color
				obj.Hue.BackgroundColor3 = color
			elseif obj.Type == "Keybind" and obj.Main then
				obj.Main.BackgroundColor3 = color
			end
		end
	end
	save_setting("AccentColor", current_accent)
end
function library:SetAccentColor(color)
	if accent_colors[color] then
		update_accent_color(accent_colors[color])
	end
end
function library:SetToggleKey(key)
	window.ToggleKey = key
	save_setting("ToggleKey", key.Name)
end
function library:SetWatermark(bool)
	if window and window.Watermark then
		window.Watermark.Visible = bool
		save_setting("Watermark", bool)
	end
end
function library:SetTheme(theme)
	if theme == "dark" then
		colors.background = Color3.fromHex("#171717")
		colors.dark_background = Color3.fromHex("#131313")
		colors.light_background = Color3.fromHex("#262626")
		colors.text = Color3.fromHex("#FFFFFF")
		colors.secondary_text = Color3.fromHex("#858585")
	elseif theme == "light" then
		colors.background = Color3.fromHex("#F5F5F5")
		colors.dark_background = Color3.fromHex("#E0E0E0")
		colors.light_background = Color3.fromHex("#FFFFFF")
		colors.text = Color3.fromHex("#000000")
		colors.secondary_text = Color3.fromHex("#6B6B6B")
	end
	save_setting("Theme", theme)
	if window then
		window.Background.BackgroundColor3 = colors.background
		window.SectionBackground.BackgroundColor3 = colors.light_background
		window.TabBackground.BackgroundColor3 = colors.light_background
		window.Watermark.Background.BackgroundColor3 = colors.background
		window.Watermark.TextLabel.TextColor3 = colors.text
		window.Intro.Background.BackgroundColor3 = colors.background
		window.Intro.TextLabel.TextColor3 = colors.text
		window.WindowToggle.TextColor3 = colors.accent
		for name, obj in pairs(objects) do
			if obj.Type == "Slider" then
				obj.Main.BackgroundColor3 = colors.accent
				obj.Background.BackgroundColor3 = colors.dark_background
				obj.Text.TextColor3 = colors.text
			elseif obj.Type == "Toggle" then
				obj.Text.TextColor3 = colors.text
				if not obj.Enabled then
					obj.Main.BackgroundColor3 = colors.toggle_off
				end
			elseif obj.Type == "Button" then
				obj.Main.BackgroundColor3 = colors.dark_background
				obj.Text.TextColor3 = colors.text
			elseif obj.Type == "Textbox" then
				obj.Main.BackgroundColor3 = colors.dark_background
				obj.Main.TextColor3 = colors.text
			elseif obj.Type == "Dropdown" then
				obj.Main.BackgroundColor3 = colors.dark_background
				obj.Text.TextColor3 = colors.text
				obj.Dropdown.Background.BackgroundColor3 = colors.dark_background
				for _, option in pairs(obj.Options) do
					option.Text.TextColor3 = colors.text
					option.Background.BackgroundColor3 = colors.dark_background
				end
			elseif obj.Type == "ColorPicker" then
				obj.Indicator.BackgroundColor3 = colors.accent
				obj.Hue.BackgroundColor3 = colors.accent
				obj.HueBackground.BackgroundColor3 = colors.dark_background
				obj.ColorBackground.BackgroundColor3 = colors.dark_background
				obj.Text.TextColor3 = colors.text
			elseif obj.Type == "Keybind" then
				obj.Text.TextColor3 = colors.text
				if not obj.Binding then
					obj.Main.BackgroundColor3 = colors.dark_background
					obj.Main.TextColor3 = colors.text
				else
					obj.Main.BackgroundColor3 = colors.accent
					obj.Main.TextColor3 = colors.text
				end
			end
		end
		for name, tab in pairs(tabs) do
			tab.Button.Background.BackgroundColor3 = colors.dark_background
			tab.Button.Text.TextColor3 = colors.text
			for _, section in pairs(tab.Sections) do
				section.Title.TextColor3 = colors.text
			end
		end
	end
end
function library:MakeNotification(data)
	local Notification = Instance.new("Frame")
	Notification.Name = "Notification"
	Notification.Size = UDim2.new(0, 300, 0, 70)
	Notification.Position = UDim2.new(1, -310, 1, -80)
	Notification.AnchorPoint = Vector2.new(1, 1)
	Notification.BorderSizePixel = 0
	Notification.ClipsDescendants = true
	Notification.BackgroundColor3 = colors.background
	Notification.Visible = false
	Notification.Parent = ScreenGui
	local Background = Instance.new("Frame")
	Background.Name = "Background"
	Background.Size = UDim2.new(1, 0, 1, 0)
	Background.Position = UDim2.new(0, 0, 0, 0)
	Background.AnchorPoint = Vector2.new(0, 0)
	Background.BorderSizePixel = 0
	Background.BackgroundColor3 = colors.background
	Background.Parent = Notification
	local Icon = Instance.new("ImageLabel")
	Icon.Name = "Icon"
	Icon.Size = UDim2.new(0, 40, 0, 40)
	Icon.Position = UDim2.new(0, 15, 0.5, 0)
	Icon.AnchorPoint = Vector2.new(0, 0.5)
	Icon.BorderSizePixel = 0
	Icon.BackgroundColor3 = colors.background
	Icon.Image = data.Image or "rbxassetid://6025345758"
	Icon.Parent = Background
	local UI_Corner = Instance.new("UICorner")
	UI_Corner.CornerRadius = UDim.new(0, 5)
	UI_Corner.Parent = Icon
	local Text = Instance.new("Frame")
	Text.Name = "Text"
	Text.Size = UDim2.new(1, -70, 1, -20)
	Text.Position = UDim2.new(0, 70, 0, 10)
	Text.AnchorPoint = Vector2.new(0, 0)
	Text.BorderSizePixel = 0
	Text.BackgroundColor3 = colors.background
	Text.Parent = Background
	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Size = UDim2.new(1, 0, 0.5, 0)
	Title.Position = UDim2.new(0, 0, 0, 0)
	Title.AnchorPoint = Vector2.new(0, 0)
	Title.BorderSizePixel = 0
	Title.BackgroundColor3 = colors.background
	Title.BackgroundTransparency = 1
	Title.TextColor3 = colors.text
	Title.Font = Enum.Font.SourceSansBold
	Title.TextScaled = true
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.TextYAlignment = Enum.TextYAlignment.Top
	Title.Text = data.Title or "Notification"
	Title.Parent = Text
	local Content = Instance.new("TextLabel")
	Content.Name = "Content"
	Content.Size = UDim2.new(1, 0, 0.5, 0)
	Content.Position = UDim2.new(0, 0, 0.5, 0)
	Content.AnchorPoint = Vector2.new(0, 0)
	Content.BorderSizePixel = 0
	Content.BackgroundColor3 = colors.background
	Content.BackgroundTransparency = 1
	Content.TextColor3 = colors.secondary_text
	Content.Font = Enum.Font.SourceSans
	Content.TextScaled = true
	Content.TextWrapped = true
	Content.TextXAlignment = Enum.TextXAlignment.Left
	Content.TextYAlignment = Enum.TextYAlignment.Top
	Content.Text = data.Content or "Content"
	Content.Parent = Text
	local UI_Stroke = Instance.new("UIStroke")
	UI_Stroke.Color = colors.dark_background
	UI_Stroke.Thickness = 1
	UI_Stroke.Parent = Background
	local Time = data.Time or 5
	local tween = TweenService:Create(Notification, tween_info_in, {
		Position = UDim2.new(1, -310, 1, -80)
	})
	local tween_out = TweenService:Create(Notification, tween_info_out, {
		Position = UDim2.new(1, 10, 1, -80)
	})
	Notification.Visible = true
	tween:Play()
	task.delay(Time, function()
		tween_out:Play()
		task.delay(0.2, function()
			Notification:Destroy()
		end)
	end)
end
function library:SetToggleKey(key)
	window.ToggleKey = key
	save_setting("ToggleKey", key.Name)
end
function library:SetWatermark(bool)
	if window and window.Watermark then
		window.Watermark.Visible = bool
		save_setting("Watermark", bool)
	end
end
function library:SetTheme(theme)
	if theme == "dark" then
		colors.background = Color3.fromHex("#171717")
		colors.dark_background = Color3.fromHex("#131313")
		colors.light_background = Color3.fromHex("#262626")
		colors.text = Color3.fromHex("#FFFFFF")
		colors.secondary_text = Color3.fromHex("#858585")
	elseif theme == "light" then
		colors.background = Color3.fromHex("#F5F5F5")
		colors.dark_background = Color3.fromHex("#E0E0E0")
		colors.light_background = Color3.fromHex("#FFFFFF")
		colors.text = Color3.fromHex("#000000")
		colors.secondary_text = Color3.fromHex("#6B6B6B")
	end
	save_setting("Theme", theme)
	if window then
		window.Background.BackgroundColor3 = colors.background
		window.SectionBackground.BackgroundColor3 = colors.light_background
		window.TabBackground.BackgroundColor3 = colors.light_background
		window.Watermark.Background.BackgroundColor3 = colors.background
		window.Watermark.TextLabel.TextColor3 = colors.text
		window.Intro.Background.BackgroundColor3 = colors.background
		window.Intro.TextLabel.TextColor3 = colors.text
		window.WindowToggle.TextColor3 = colors.accent
		for name, obj in pairs(objects) do
			if obj.Type == "Slider" then
				obj.Main.BackgroundColor3 = colors.accent
				obj.Background.BackgroundColor3 = colors.dark_background
				obj.Text.TextColor3 = colors.text
			elseif obj.Type == "Toggle" then
				obj.Text.TextColor3 = colors.text
				if not obj.Enabled then
					obj.Main.BackgroundColor3 = colors.toggle_off
				end
			elseif obj.Type == "Button" then
				obj.Main.BackgroundColor3 = colors.dark_background
				obj.Text.TextColor3 = colors.text
			elseif obj.Type == "Textbox" then
				obj.Main.BackgroundColor3 = colors.dark_background
				obj.Main.TextColor3 = colors.text
			elseif obj.Type == "Dropdown" then
				obj.Main.BackgroundColor3 = colors.dark_background
				obj.Text.TextColor3 = colors.text
				obj.Dropdown.Background.BackgroundColor3 = colors.dark_background
				for _, option in pairs(obj.Options) do
					option.Text.TextColor3 = colors.text
					option.Background.BackgroundColor3 = colors.dark_background
				end
			elseif obj.Type == "ColorPicker" then
				obj.Indicator.BackgroundColor3 = colors.accent
				obj.Hue.BackgroundColor3 = colors.accent
				obj.HueBackground.BackgroundColor3 = colors.dark_background
				obj.ColorBackground.BackgroundColor3 = colors.dark_background
				obj.Text.TextColor3 = colors.text
			elseif obj.Type == "Keybind" then
				obj.Text.TextColor3 = colors.text
				if not obj.Binding then
					obj.Main.BackgroundColor3 = colors.dark_background
					obj.Main.TextColor3 = colors.text
				else
					obj.Main.BackgroundColor3 = colors.accent
					obj.Main.TextColor3 = colors.text
				end
			end
		end
		for name, tab in pairs(tabs) do
			tab.Button.Background.BackgroundColor3 = colors.dark_background
			tab.Button.Text.TextColor3 = colors.text
			for _, section in pairs(tab.Sections) do
				section.Title.TextColor3 = colors.text
			end
		end
	end
end
function library:MakeWindow(data)
	if window then
		return warn("Orion Library: Window already exists!")
	end
	window = Instance.new("Frame")
	window.Name = "Orion_Window"
	window.Size = UDim2.new(0, 700, 0, 450)
	window.Position = UDim2.new(0.5, -350, 0.5, -225)
	window.AnchorPoint = Vector2.new(0.5, 0.5)
	window.BorderSizePixel = 0
	window.ClipsDescendants = true
	window.Draggable = true
	window.Visible = false
	window.Parent = ScreenGui
	window.ToggleKey = Enum.KeyCode[get_setting("ToggleKey", "RightShift")]
	local UI_Corner = Instance.new("UICorner")
	UI_Corner.CornerRadius = UDim.new(0, 5)
	UI_Corner.Parent = window
	local UI_Stroke = Instance.new("UIStroke")
	UI_Stroke.Color = colors.dark_background
	UI_Stroke.Thickness = 1
	UI_Stroke.Parent = window
	local Background = Instance.new("Frame")
	Background.Name = "Background"
	Background.Size = UDim2.new(1, 0, 1, 0)
	Background.Position = UDim2.new(0, 0, 0, 0)
	Background.AnchorPoint = Vector2.new(0, 0)
	Background.BorderSizePixel = 0
	Background.BackgroundColor3 = colors.background
	Background.Parent = window
	window.Background = Background
	local TopBar = Instance.new("Frame")
	TopBar.Name = "TopBar"
	TopBar.Size = UDim2.new(1, 0, 0, 40)
	TopBar.Position = UDim2.new(0, 0, 0, 0)
	TopBar.AnchorPoint = Vector2.new(0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.BackgroundColor3 = colors.dark_background
	TopBar.Parent = Background
	local TopBarText = Instance.new("TextLabel")
	TopBarText.Name = "TopBarText"
	TopBarText.Size = UDim2.new(1, -100, 1, 0)
	TopBarText.Position = UDim2.new(0, 50, 0, 0)
	TopBarText.AnchorPoint = Vector2.new(0, 0)
	TopBarText.BorderSizePixel = 0
	TopBarText.BackgroundColor3 = colors.dark_background
	TopBarText.BackgroundTransparency = 1
	TopBarText.TextColor3 = colors.text
	TopBarText.Font = Enum.Font.SourceSansBold
	TopBarText.TextScaled = true
	TopBarText.TextWrapped = true
	TopBarText.TextXAlignment = Enum.TextXAlignment.Left
	TopBarText.Text = data.Name or "Orion"
	TopBarText.Parent = TopBar
	local AccentColor = Instance.new("Frame")
	AccentColor.Name = "AccentColor"
	AccentColor.Size = UDim2.new(0, 5, 1, 0)
	AccentColor.Position = UDim2.new(0, 0, 0, 0)
	AccentColor.AnchorPoint = Vector2.new(0, 0)
	AccentColor.BorderSizePixel = 0
	AccentColor.BackgroundColor3 = colors.accent
	AccentColor.Parent = TopBar
	window.AccentColor = AccentColor
	local Tabs = Instance.new("Frame")
	Tabs.Name = "Tabs"
	Tabs.Size = UDim2.new(0, 150, 1, -40)
	Tabs.Position = UDim2.new(0, 0, 0, 40)
	Tabs.AnchorPoint = Vector2.new(0, 0)
	Tabs.BorderSizePixel = 0
	Tabs.BackgroundColor3 = colors.light_background
	Tabs.Parent = Background
	window.TabBackground = Tabs
	local TabsList = Instance.new("UIListLayout")
	TabsList.Name = "TabsList"
	TabsList.Padding = UDim.new(0, 5)
	TabsList.SortOrder = Enum.SortOrder.LayoutOrder
	TabsList.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabsList.VerticalAlignment = Enum.VerticalAlignment.Top
	TabsList.FillDirection = Enum.FillDirection.Vertical
	TabsList.Parent = Tabs
	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.Size = UDim2.new(1, -160, 1, -50)
	Main.Position = UDim2.new(0, 160, 0, 45)
	Main.AnchorPoint = Vector2.new(0, 0)
	Main.BorderSizePixel = 0
	Main.BackgroundColor3 = colors.background
	Main.Parent = Background
	local MainList = Instance.new("UIListLayout")
	MainList.Name = "MainList"
	MainList.Padding = UDim.new(0, 10)
	MainList.SortOrder = Enum.SortOrder.LayoutOrder
	MainList.HorizontalAlignment = Enum.HorizontalAlignment.Left
	MainList.VerticalAlignment = Enum.VerticalAlignment.Top
	MainList.FillDirection = Enum.FillDirection.Vertical
	MainList.Parent = Main
	local SectionBackground = Instance.new("Frame")
	SectionBackground.Name = "SectionBackground"
	SectionBackground.Size = UDim2.new(1, -10, 1, -10)
	SectionBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
	SectionBackground.AnchorPoint = Vector2.new(0.5, 0.5)
	SectionBackground.BorderSizePixel = 0
	SectionBackground.BackgroundColor3 = colors.light_background
	SectionBackground.Parent = Main
	window.SectionBackground = SectionBackground
	local SectionList = Instance.new("UIListLayout")
	SectionList.Name = "SectionList"
	SectionList.Padding = UDim.new(0, 10)
	SectionList.SortOrder = Enum.SortOrder.LayoutOrder
	SectionList.HorizontalAlignment = Enum.HorizontalAlignment.Left
	SectionList.VerticalAlignment = Enum.VerticalAlignment.Top
	SectionList.FillDirection = Enum.FillDirection.Vertical
	SectionList.Parent = SectionBackground
	local Intro = Instance.new("Frame")
	Intro.Name = "Intro"
	Intro.Size = UDim2.new(1, -160, 1, -50)
	Intro.Position = UDim2.new(0, 160, 0, 45)
	Intro.AnchorPoint = Vector2.new(0, 0)
	Intro.BorderSizePixel = 0
	Intro.BackgroundColor3 = colors.background
	Intro.Parent = Background
	window.Intro = Intro
	local IntroText = Instance.new("TextLabel")
	IntroText.Name = "IntroText"
	IntroText.Size = UDim2.new(1, -20, 1, -20)
	IntroText.Position = UDim2.new(0.5, 0, 0.5, 0)
	IntroText.AnchorPoint = Vector2.new(0.5, 0.5)
	IntroText.BorderSizePixel = 0
	IntroText.BackgroundColor3 = colors.background
	IntroText.BackgroundTransparency = 1
	IntroText.TextColor3 = colors.text
	IntroText.Font = Enum.Font.SourceSansBold
	IntroText.TextScaled = true
	IntroText.TextWrapped = true
	IntroText.Text = data.IntroText or "Orion UI Library"
	IntroText.Parent = Intro
	local Watermark = Instance.new("Frame")
	Watermark.Name = "Watermark"
	Watermark.Size = UDim2.new(0, 150, 0, 20)
	Watermark.Position = UDim2.new(1, -160, 1, -25)
	Watermark.AnchorPoint = Vector2.new(1, 1)
	Watermark.BorderSizePixel = 0
	Watermark.BackgroundColor3 = colors.background
	Watermark.Visible = get_setting("Watermark", true)
	Watermark.Parent = Background
	window.Watermark = Watermark
	local WatermarkText = Instance.new("TextLabel")
	WatermarkText.Name = "TextLabel"
	WatermarkText.Size = UDim2.new(1, 0, 1, 0)
	WatermarkText.Position = UDim2.new(0, 0, 0, 0)
	WatermarkText.AnchorPoint = Vector2.new(0, 0)
	WatermarkText.BorderSizePixel = 0
	WatermarkText.BackgroundColor3 = colors.background
	WatermarkText.BackgroundTransparency = 1
	WatermarkText.TextColor3 = colors.text
	WatermarkText.Font = Enum.Font.SourceSans
	WatermarkText.TextScaled = true
	WatermarkText.TextWrapped = true
	WatermarkText.Text = "Orion Library"
	WatermarkText.Parent = Watermark
	local AccentColorWatermark = Instance.new("Frame")
	AccentColorWatermark.Name = "AccentColor"
	AccentColorWatermark.Size = UDim2.new(0, 5, 1, 0)
	AccentColorWatermark.Position = UDim2.new(0, 0, 0, 0)
	AccentColorWatermark.AnchorPoint = Vector2.new(0, 0)
	AccentColorWatermark.BorderSizePixel = 0
	AccentColorWatermark.BackgroundColor3 = colors.accent
	AccentColorWatermark.Parent = Watermark
	local WindowToggle = Instance.new("TextLabel")
	WindowToggle.Name = "WindowToggle"
	WindowToggle.Size = UDim2.new(0, 150, 0, 20)
	WindowToggle.Position = UDim2.new(1, -160, 0, 5)
	WindowToggle.AnchorPoint = Vector2.new(1, 0)
	WindowToggle.BorderSizePixel = 0
	WindowToggle.BackgroundColor3 = colors.background
	WindowToggle.BackgroundTransparency = 1
	WindowToggle.TextColor3 = colors.accent
	WindowToggle.Font = Enum.Font.SourceSansBold
	WindowToggle.TextScaled = true
	WindowToggle.TextWrapped = true
	WindowToggle.TextXAlignment = Enum.TextXAlignment.Right
	WindowToggle.Text = window.ToggleKey.Name
	WindowToggle.Parent = Background
	window.WindowToggle = WindowToggle
	local function update_window_toggle_text()
		WindowToggle.Text = window.ToggleKey.Name
	end
	local function toggle_window()
		window.Visible = not window.Visible
		if window.Visible then
			window.Intro.Visible = true
			TweenService:Create(window.Intro, tween_info_in, {
				Position = UDim2.new(0, 160, 0, 45)
			}):Play()
			task.delay(1, function()
				TweenService:Create(window.Intro, tween_info_out, {
					Position = UDim2.new(0, 160, -1, 45)
				}):Play()
			end)
		else
			window.Intro.Visible = false
		end
	end
	local function on_input_began(input, game_processed)
		if game_processed then
			return
		end
		if input.KeyCode == window.ToggleKey then
			toggle_window()
		end
	end
	UserInputService.InputBegan:Connect(on_input_began)
	function window:MakeTab(data)
		local Tab = Instance.new("Frame")
		Tab.Name = data.Name
		Tab.Size = UDim2.new(1, 0, 0, 40)
		Tab.Position = UDim2.new(0, 0, 0, 0)
		Tab.AnchorPoint = Vector2.new(0, 0)
		Tab.BorderSizePixel = 0
		Tab.BackgroundColor3 = colors.dark_background
		Tab.LayoutOrder = data.LayoutOrder or 0
		Tab.Parent = Tabs
		local TabButton = Instance.new("TextButton")
		TabButton.Name = "Button"
		TabButton.Size = UDim2.new(1, 0, 1, 0)
		TabButton.Position = UDim2.new(0, 0, 0, 0)
		TabButton.AnchorPoint = Vector2.new(0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.BackgroundColor3 = colors.dark_background
		TabButton.BackgroundTransparency = 1
		TabButton.TextColor3 = colors.text
		TabButton.Font = Enum.Font.SourceSans
		TabButton.TextScaled = true
		TabButton.TextWrapped = true
		TabButton.Text = ""
		TabButton.Parent = Tab
		Tab.Button = TabButton
		local TabIcon = Instance.new("ImageLabel")
		TabIcon.Name = "Icon"
		TabIcon.Size = UDim2.new(0, 30, 0, 30)
		TabIcon.Position = UDim2.new(0, 5, 0.5, 0)
		TabIcon.AnchorPoint = Vector2.new(0, 0.5)
		TabIcon.BorderSizePixel = 0
		TabIcon.BackgroundColor3 = colors.dark_background
		TabIcon.BackgroundTransparency = 1
		TabIcon.Image = data.Icon
		TabIcon.Parent = TabButton
		local TabText = Instance.new("TextLabel")
		TabText.Name = "Text"
		TabText.Size = UDim2.new(1, -40, 1, 0)
		TabText.Position = UDim2.new(0, 40, 0, 0)
		TabText.AnchorPoint = Vector2.new(0, 0)
		TabText.BorderSizePixel = 0
		TabText.BackgroundColor3 = colors.dark_background
		TabText.BackgroundTransparency = 1
		TabText.TextColor3 = colors.text
		TabText.Font = Enum.Font.SourceSansBold
		TabText.TextScaled = true
		TabText.TextWrapped = true
		TabText.TextXAlignment = Enum.TextXAlignment.Left
		TabText.Text = data.Name
		TabText.Parent = TabButton
		local Tab_Contents = Instance.new("Frame")
		Tab_Contents.Name = "Contents"
		Tab_Contents.Size = UDim2.new(1, 0, 1, 0)
		Tab_Contents.Position = UDim2.new(0, 0, 0, 0)
		Tab_Contents.AnchorPoint = Vector2.new(0, 0)
		Tab_Contents.BorderSizePixel = 0
		Tab_Contents.BackgroundColor3 = colors.background
		Tab_Contents.Visible = false
		Tab_Contents.Parent = SectionBackground
		Tab.Contents = Tab_Contents
		local Tab_Contents_List = Instance.new("UIListLayout")
		Tab_Contents_List.Name = "ContentsList"
		Tab_Contents_List.Padding = UDim.new(0, 10)
		Tab_Contents_List.SortOrder = Enum.SortOrder.LayoutOrder
		Tab_Contents_List.HorizontalAlignment = Enum.HorizontalAlignment.Left
		Tab_Contents_List.VerticalAlignment = Enum.VerticalAlignment.Top
		Tab_Contents_List.FillDirection = Enum.FillDirection.Vertical
		Tab_Contents_List.Parent = Tab_Contents
		Tab.Sections = {}
		function Tab:AddSection(data)
			local Section = Instance.new("Frame")
			Section.Name = data.Name
			Section.Size = UDim2.new(1, 0, 0, 0)
			Section.Position = UDim2.new(0, 0, 0, 0)
			Section.AnchorPoint = Vector2.new(0, 0)
			Section.BorderSizePixel = 0
			Section.BackgroundColor3 = colors.light_background
			Section.LayoutOrder = data.LayoutOrder or 0
			Section.Parent = Tab_Contents
			local SectionList = Instance.new("UIListLayout")
			SectionList.Name = "SectionList"
			SectionList.Padding = UDim.new(0, 5)
			SectionList.SortOrder = Enum.SortOrder.LayoutOrder
			SectionList.HorizontalAlignment = Enum.HorizontalAlignment.Left
			SectionList.VerticalAlignment = Enum.VerticalAlignment.Top
			SectionList.FillDirection = Enum.FillDirection.Vertical
			SectionList.Parent = Section
			local SectionTitle = Instance.new("TextLabel")
			SectionTitle.Name = "Title"
			SectionTitle.Size = UDim2.new(1, -20, 0, 20)
			SectionTitle.Position = UDim2.new(0, 10, 0, 10)
			SectionTitle.AnchorPoint = Vector2.new(0, 0)
			SectionTitle.BorderSizePixel = 0
			SectionTitle.BackgroundColor3 = colors.light_background
			SectionTitle.BackgroundTransparency = 1
			SectionTitle.TextColor3 = colors.text
			SectionTitle.Font = Enum.Font.SourceSansBold
			SectionTitle.TextScaled = true
			SectionTitle.TextWrapped = true
			SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
			SectionTitle.TextYAlignment = Enum.TextYAlignment.Top
			SectionTitle.Text = data.Name
			SectionTitle.Parent = Section
			Section.Title = SectionTitle
			local section_contents = Instance.new("UIListLayout")
			section_contents.Name = "Contents"
			section_contents.Padding = UDim.new(0, 5)
			section_contents.SortOrder = Enum.SortOrder.LayoutOrder
			section_contents.HorizontalAlignment = Enum.HorizontalAlignment.Left
			section_contents.VerticalAlignment = Enum.VerticalAlignment.Top
			section_contents.FillDirection = Enum.FillDirection.Vertical
			section_contents.Parent = Section
			local function update_section_size()
				local height = 0
				for _, obj in pairs(Section:GetChildren()) do
					if obj:IsA("Frame") and obj.Name ~= "Title" and obj.Name ~= "SectionList" and obj.Name ~= "Contents" then
						height = height + obj.AbsoluteSize.Y + SectionList.Padding.Offset
					end
				end
				Section.Size = UDim2.new(1, 0, 0, height + 40)
			end
			Section.AncestryChanged:Connect(function()
				task.wait(0.1)
				update_section_size()
			end)
			Tab.Sections[data.Name] = Section
			local function add_object(obj, obj_type)
				local name = obj.Name
				objects[name] = {
					Object = obj,
					Type = obj_type,
					Enabled = false,
					Binding = false,
					Main = obj.Main,
					Text = obj.Text,
					Callback = obj.Callback,
					Value = obj.Value,
					Min = obj.Min,
					Max = obj.Max,
					Default = obj.Default,
					Options = obj.Options,
					Dropdown = obj.Dropdown,
					Hue = obj.Hue,
					Indicator = obj.Indicator,
					HueBackground = obj.HueBackground,
					ColorBackground = obj.ColorBackground,
					BindingText = obj.BindingText,
					Key = obj.Key,
					Keybind = obj.Keybind,
					Background = obj.Background,
					EnabledText = obj.EnabledText,
					Callback = obj.Callback
				}
			end
			local function add_ui_element(obj, obj_type)
				obj.Size = UDim2.new(1, -20, 0, 30)
				obj.Position = UDim2.new(0, 10, 0, 10)
				obj.AnchorPoint = Vector2.new(0, 0)
				obj.BorderSizePixel = 0
				obj.Parent = Section
				add_object(obj, obj_type)
				update_section_size()
			end
			function Section:AddSlider(data)
				local Slider = Instance.new("Frame")
				Slider.Name = data.Name
				Slider.Size = UDim2.new(1, -20, 0, 40)
				Slider.Position = UDim2.new(0, 10, 0, 10)
				Slider.AnchorPoint = Vector2.new(0, 0)
				Slider.BorderSizePixel = 0
				Slider.BackgroundColor3 = colors.light_background
				Slider.LayoutOrder = data.LayoutOrder or 0
				Slider.ClipsDescendants = true
				Slider.Parent = Section
				local Slider_Background = Instance.new("Frame")
				Slider_Background.Name = "Background"
				Slider_Background.Size = UDim2.new(1, -20, 0, 5)
				Slider_Background.Position = UDim2.new(0, 10, 0, 25)
				Slider_Background.AnchorPoint = Vector2.new(0, 0)
				Slider_Background.BorderSizePixel = 0
				Slider_Background.BackgroundColor3 = colors.dark_background
				Slider_Background.Parent = Slider
				Slider.Background = Slider_Background
				local Slider_Main = Instance.new("Frame")
				Slider_Main.Name = "Main"
				Slider_Main.Size = UDim2.new(0, 0, 1, 0)
				Slider_Main.Position = UDim2.new(0, 0, 0, 0)
				Slider_Main.AnchorPoint = Vector2.new(0, 0)
				Slider_Main.BorderSizePixel = 0
				Slider_Main.BackgroundColor3 = colors.accent
				Slider_Main.Parent = Slider_Background
				Slider.Main = Slider_Main
				local Slider_Text = Instance.new("TextLabel")
				Slider_Text.Name = "Text"
				Slider_Text.Size = UDim2.new(1, -20, 0, 20)
				Slider_Text.Position = UDim2.new(0, 10, 0, 0)
				Slider_Text.AnchorPoint = Vector2.new(0, 0)
				Slider_Text.BorderSizePixel = 0
				Slider_Text.BackgroundColor3 = colors.light_background
				Slider_Text.BackgroundTransparency = 1
				Slider_Text.TextColor3 = colors.text
				Slider_Text.Font = Enum.Font.SourceSans
				Slider_Text.TextScaled = true
				Slider_Text.TextWrapped = true
				Slider_Text.TextXAlignment = Enum.TextXAlignment.Left
				Slider_Text.Text = data.Name
				Slider_Text.Parent = Slider
				Slider.Text = Slider_Text
				local Slider_Value = Instance.new("TextLabel")
				Slider_Value.Name = "Value"
				Slider_Value.Size = UDim2.new(0, 50, 0, 20)
				Slider_Value.Position = UDim2.new(1, -60, 0, 0)
				Slider_Value.AnchorPoint = Vector2.new(1, 0)
				Slider_Value.BorderSizePixel = 0
				Slider_Value.BackgroundColor3 = colors.light_background
				Slider_Value.BackgroundTransparency = 1
				Slider_Value.TextColor3 = colors.secondary_text
				Slider_Value.Font = Enum.Font.SourceSans
				Slider_Value.TextScaled = true
				Slider_Value.TextWrapped = true
				Slider_Value.TextXAlignment = Enum.TextXAlignment.Right
				Slider_Value.Text = data.Default or 0
				Slider_Value.Parent = Slider
				Slider.Value = Slider_Value
				Slider.Min = data.Min or 0
				Slider.Max = data.Max or 100
				Slider.Default = data.Default or 0
				Slider.Increment = data.Increment or 1
				Slider.Callback = data.Callback or function() end
				Slider.Dragging = false
				Slider.Main.Size = UDim2.new((Slider.Default - Slider.Min) / (Slider.Max - Slider.Min), 0, 1, 0)
				Slider_Value.Text = math.floor(Slider.Default / Slider.Increment) * Slider.Increment
				local function update_slider(input)
					local x = input.Position.X - Slider_Background.AbsolutePosition.X
					local percentage = math.clamp(x / Slider_Background.AbsoluteSize.X, 0, 1)
					local value = (Slider.Max - Slider.Min) * percentage + Slider.Min
					value = math.floor(value / Slider.Increment) * Slider.Increment
					Slider.Main.Size = UDim2.new(percentage, 0, 1, 0)
					Slider_Value.Text = value
					Slider.Callback(value)
					save_setting(data.Name, value)
				end
				Slider.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.Dragging = true
						update_slider(input)
					end
				end)
				Slider.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.Dragging = false
					end
				end)
				UserInputService.InputChanged:Connect(function(input)
					if Slider.Dragging then
						update_slider(input)
					end
				end)
				add_ui_element(Slider, "Slider")
				local saved_value = get_setting(data.Name, data.Default or 0)
				Slider.Main.Size = UDim2.new((saved_value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1, 0)
				Slider_Value.Text = math.floor(saved_value / Slider.Increment) * Slider.Increment
				Slider.Callback(saved_value)
				return Slider
			end
			function Section:AddToggle(data)
				local Toggle = Instance.new("Frame")
				Toggle.Name = data.Name
				Toggle.Size = UDim2.new(1, -20, 0, 30)
				Toggle.Position = UDim2.new(0, 10, 0, 10)
				Toggle.AnchorPoint = Vector2.new(0, 0)
				Toggle.BorderSizePixel = 0
				Toggle.BackgroundColor3 = colors.light_background
				Toggle.LayoutOrder = data.LayoutOrder or 0
				Toggle.Parent = Section
				local Toggle_Button = Instance.new("TextButton")
				Toggle_Button.Name = "Main"
				Toggle_Button.Size = UDim2.new(0, 20, 0, 20)
				Toggle_Button.Position = UDim2.new(1, -30, 0.5, 0)
				Toggle_Button.AnchorPoint = Vector2.new(1, 0.5)
				Toggle_Button.BorderSizePixel = 0
				Toggle_Button.BackgroundColor3 = colors.toggle_off
				Toggle_Button.Parent = Toggle
				Toggle.Main = Toggle_Button
				local Toggle_Text = Instance.new("TextLabel")
				Toggle_Text.Name = "Text"
				Toggle_Text.Size = UDim2.new(1, -40, 1, 0)
				Toggle_Text.Position = UDim2.new(0, 10, 0, 0)
				Toggle_Text.AnchorPoint = Vector2.new(0, 0)
				Toggle_Text.BorderSizePixel = 0
				Toggle_Text.BackgroundColor3 = colors.light_background
				Toggle_Text.BackgroundTransparency = 1
				Toggle_Text.TextColor3 = colors.text
				Toggle_Text.Font = Enum.Font.SourceSans
				Toggle_Text.TextScaled = true
				Toggle_Text.TextWrapped = true
				Toggle_Text.TextXAlignment = Enum.TextXAlignment.Left
				Toggle_Text.Text = data.Name
				Toggle_Text.Parent = Toggle
				Toggle.Text = Toggle_Text
				Toggle.Enabled = data.Default or false
				Toggle.Callback = data.Callback or function() end
				local function toggle_button()
					Toggle.Enabled = not Toggle.Enabled
					if Toggle.Enabled then
						Toggle.Main.BackgroundColor3 = colors.accent
					else
						Toggle.Main.BackgroundColor3 = colors.toggle_off
					end
					Toggle.Callback(Toggle.Enabled)
					save_setting(data.Name, Toggle.Enabled)
				end
				Toggle_Button.MouseButton1Click:Connect(toggle_button)
				add_ui_element(Toggle, "Toggle")
				local saved_value = get_setting(data.Name, data.Default or false)
				if saved_value then
					Toggle.Enabled = true
					Toggle.Main.BackgroundColor3 = colors.accent
				else
					Toggle.Enabled = false
					Toggle.Main.BackgroundColor3 = colors.toggle_off
				end
				Toggle.Callback(Toggle.Enabled)
				return Toggle
			end
			function Section:AddButton(data)
				local Button = Instance.new("Frame")
				Button.Name = data.Name
				Button.Size = UDim2.new(1, -20, 0, 30)
				Button.Position = UDim2.new(0, 10, 0, 10)
				Button.AnchorPoint = Vector2.new(0, 0)
				Button.BorderSizePixel = 0
				Button.BackgroundColor3 = colors.light_background
				Button.LayoutOrder = data.LayoutOrder or 0
				Button.Parent = Section
				local Button_Main = Instance.new("TextButton")
				Button_Main.Name = "Main"
				Button_Main.Size = UDim2.new(1, 0, 1, 0)
				Button_Main.Position = UDim2.new(0, 0, 0, 0)
				Button_Main.AnchorPoint = Vector2.new(0, 0)
				Button_Main.BorderSizePixel = 0
				Button_Main.BackgroundColor3 = colors.dark_background
				Button_Main.BackgroundTransparency = 1
				Button_Main.TextColor3 = colors.text
				Button_Main.Font = Enum.Font.SourceSans
				Button_Main.TextScaled = true
				Button_Main.TextWrapped = true
				Button_Main.Text = ""
				Button_Main.Parent = Button
				Button.Main = Button_Main
				local Button_Text = Instance.new("TextLabel")
				Button_Text.Name = "Text"
				Button_Text.Size = UDim2.new(1, -20, 1, 0)
				Button_Text.Position = UDim2.new(0, 10, 0, 0)
				Button_Text.AnchorPoint = Vector2.new(0, 0)
				Button_Text.BorderSizePixel = 0
				Button_Text.BackgroundColor3 = colors.dark_background
				Button_Text.BackgroundTransparency = 1
				Button_Text.TextColor3 = colors.text
				Button_Text.Font = Enum.Font.SourceSans
				Button_Text.TextScaled = true
				Button_Text.TextWrapped = true
				Button_Text.TextXAlignment = Enum.TextXAlignment.Left
				Button_Text.Text = data.Name
				Button_Text.Parent = Button_Main
				Button.Text = Button_Text
				Button.Callback = data.Callback or function() end
				Button_Main.MouseButton1Click:Connect(Button.Callback)
				add_ui_element(Button, "Button")
				return Button
			end
			function Section:AddTextbox(data)
				local Textbox = Instance.new("Frame")
				Textbox.Name = data.Name
				Textbox.Size = UDim2.new(1, -20, 0, 30)
				Textbox.Position = UDim2.new(0, 10, 0, 10)
				Textbox.AnchorPoint = Vector2.new(0, 0)
				Textbox.BorderSizePixel = 0
				Textbox.BackgroundColor3 = colors.light_background
				Textbox.LayoutOrder = data.LayoutOrder or 0
				Textbox.Parent = Section
				local Textbox_Main = Instance.new("TextBox")
				Textbox_Main.Name = "Main"
				Textbox_Main.Size = UDim2.new(1, 0, 1, 0)
				Textbox_Main.Position = UDim2.new(0, 0, 0, 0)
				Textbox_Main.AnchorPoint = Vector2.new(0, 0)
				Textbox_Main.BorderSizePixel = 0
				Textbox_Main.BackgroundColor3 = colors.dark_background
				Textbox_Main.BackgroundTransparency = 0
				Textbox_Main.TextColor3 = colors.text
				Textbox_Main.Font = Enum.Font.SourceSans
				Textbox_Main.TextScaled = true
				Textbox_Main.TextWrapped = true
				Textbox_Main.TextXAlignment = Enum.TextXAlignment.Left
				Textbox_Main.Text = data.Default or "Text"
				Textbox_Main.PlaceholderText = data.Default or "Text"
				Textbox_Main.PlaceholderColor3 = colors.secondary_text
				Textbox_Main.ClearTextOnFocus = true
				Textbox_Main.Parent = Textbox
				Textbox.Main = Textbox_Main
				Textbox.Callback = data.Callback or function() end
				Textbox_Main.FocusLost:Connect(function(enter_pressed)
					if enter_pressed then
						Textbox.Callback(Textbox_Main.Text)
						save_setting(data.Name, Textbox_Main.Text)
					end
				end)
				add_ui_element(Textbox, "Textbox")
				Textbox_Main.Text = get
