-- ==================================================================================================
-- INÍCIO DO CÓDIGO DA BIBLIOTECA RAYFIELD (4k+ linhas de código)
-- VOCÊ NÃO PRECISA ENTENDER ESTA PARTE, ELA APENAS CARREGA A UI
-- ==================================================================================================

local Rayfield = {}
Rayfield.__index = Rayfield
Rayfield.windows = {}
Rayfield.loading = {}
Rayfield.options = {}
Rayfield.toggles = {}
Rayfield.loaded = false
Rayfield.callbacks = {}

local loaded = false
local toggled = false
local drag = false
local dragging = nil
local lastPos = nil
local lastSize = nil
local lastZIndex = nil
local lastScale = nil
local lastOffset = nil

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")
local TextService = game:GetService("TextService")

-- Configuration
local config = {
    Themes = {
        Default = {
            Background = Color3.fromRGB(30, 30, 30),
            Border = Color3.fromRGB(40, 40, 40),
            Accent = Color3.fromRGB(0, 150, 255),
            Text = Color3.fromRGB(240, 240, 240),
            TextMuted = Color3.fromRGB(150, 150, 150),
            Highlight = Color3.fromRGB(50, 50, 50),
            Secondary = Color3.fromRGB(20, 20, 20),
        },
        Dark = {
            Background = Color3.fromRGB(18, 18, 18),
            Border = Color3.fromRGB(30, 30, 30),
            Accent = Color3.fromRGB(9, 100, 150),
            Text = Color3.fromRGB(230, 230, 230),
            TextMuted = Color3.fromRGB(130, 130, 130),
            Highlight = Color3.fromRGB(40, 40, 40),
            Secondary = Color3.fromRGB(10, 10, 10),
        },
        Light = {
            Background = Color3.fromRGB(230, 230, 230),
            Border = Color3.fromRGB(200, 200, 200),
            Accent = Color3.fromRGB(150, 0, 255),
            Text = Color3.fromRGB(10, 10, 10),
            TextMuted = Color3.fromRGB(100, 100, 100),
            Highlight = Color3.fromRGB(210, 210, 210),
            Secondary = Color3.fromRGB(240, 240, 240),
        },
    },
    defaultTheme = "Default",
    defaultIcon = 0,
    defaultLoadingTitle = "Rayfield Interface Suite",
    defaultLoadingSubtitle = "by Sirius",
    defaultToggleUIKeybind = "RightShift",
    font = Enum.Font.SourceSans,
    textSize = 14,
    cornerRadius = 8,
    stroke = 1,
    padding = 8,
}
local theme = config.Themes[config.defaultTheme] or config.Themes.Default

local function new(className)
    return Instance.new(className)
end

local function create(className, properties)
    local instance = new(className)
    for key, value in pairs(properties) do
        pcall(function()
            instance[key] = value
        end)
    end
    return instance
end

local function applyTheme(instance)
    local function setColors(instance)
        local props = {
            BackgroundColor3 = theme.Background,
            BorderColor3 = theme.Border,
            TextColor3 = theme.Text,
            AccentColor = theme.Accent,
        }
        for key, value in pairs(props) do
            if instance:IsA("GuiObject") and pcall(function() return instance[key] end) then
                instance[key] = value
            end
        end
        if instance.Name == "Highlight" then
            instance.FillColor = theme.Highlight
            instance.OutlineColor = theme.Accent
        end
    end

    setColors(instance)
    for _, child in ipairs(instance:GetChildren()) do
        applyTheme(child)
    end
end

local function applyGlobalProperties(instance)
    local function setProperties(instance)
        local props = {
            Font = config.font,
            TextSize = config.textSize,
            CornerRadius = UDim.new(0, config.cornerRadius),
            BorderSizePixel = config.stroke,
            LayoutPadding = UDim.new(0, config.padding),
        }
        for key, value in pairs(props) do
            if instance:IsA("GuiObject") and pcall(function() return instance[key] end) then
                instance[key] = value
            end
        end
        if instance:IsA("UIStroke") then
            instance.Color = theme.Border
            instance.Thickness = config.stroke
        end
        if instance:IsA("UIPadding") then
            instance.Padding = UDim.new(0, config.padding)
        end
        if instance:IsA("UIListLayout") then
            instance.Padding = UDim.new(0, config.padding)
        end
    end

    setProperties(instance)
    for _, child in ipairs(instance:GetChildren()) do
        applyGlobalProperties(child)
    end
end

local function createLoadingScreen(options)
    local loadingScreen = create("ScreenGui", {
        Name = "RayfieldLoadingScreen",
        Parent = CoreGui,
        DisplayOrder = 999,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Enabled = true,
        ResetOnSpawn = false,
    })

    local background = create("Frame", {
        Name = "Background",
        Parent = loadingScreen,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = theme.Background,
        BorderSizePixel = 0,
    })

    local content = create("Frame", {
        Name = "Content",
        Parent = background,
        Size = UDim2.new(0.5, 0, 0.5, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        LayoutOrder = 1,
    })

    local title = create("TextLabel", {
        Name = "Title",
        Parent = content,
        Size = UDim2.new(1, 0, 0.2, 0),
        Position = UDim2.fromScale(0, 0.3),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = theme.Background,
        TextColor3 = theme.Text,
        TextScaled = true,
        Text = options.LoadingTitle,
        Font = config.font,
        TextSize = 24,
    })

    local subtitle = create("TextLabel", {
        Name = "Subtitle",
        Parent = content,
        Size = UDim2.new(1, 0, 0.1, 0),
        Position = UDim2.fromScale(0, 0.6),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = theme.Background,
        TextColor3 = theme.TextMuted,
        TextScaled = true,
        Text = options.LoadingSubtitle,
        Font = config.font,
        TextSize = 18,
    })

    local iconFrame = create("Frame", {
        Name = "IconFrame",
        Parent = background,
        Size = UDim2.new(0, 50, 0, 50),
        Position = UDim2.fromScale(0.5, 0.4),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
    })

    local icon = create("ImageLabel", {
        Name = "Icon",
        Parent = iconFrame,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Image = options.Icon,
        ImageColor3 = theme.Accent,
    })

    local iconTween = TweenService:Create(icon, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
        Rotation = 360,
    })
    iconTween:Play()

    return loadingScreen
end

function Rayfield:CreateWindow(options)
    options = options or {}
    options.Name = options.Name or "Rayfield Window"
    options.Description = options.Description or "A new Rayfield window"
    options.Icon = options.Icon or config.defaultIcon
    options.LoadingTitle = options.LoadingTitle or config.defaultLoadingTitle
    options.LoadingSubtitle = options.LoadingSubtitle or config.defaultLoadingSubtitle
    options.Theme = options.Theme or config.defaultTheme
    options.ToggleUIKeybind = options.ToggleUIKeybind or config.defaultToggleUIKeybind

    theme = config.Themes[options.Theme] or config.Themes.Default

    local mainGui = create("ScreenGui", {
        Name = options.Name:gsub(" ", ""),
        Parent = CoreGui,
        DisplayOrder = 100,
        IgnoreGuiInset = true,
        Enabled = false,
        ResetOnSpawn = false,
    })

    local window = create("Frame", {
        Name = "Window",
        Parent = mainGui,
        Size = UDim2.new(0, 600, 0, 400),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = theme.Background,
        BorderSizePixel = config.stroke,
    })

    local uiCorner = create("UICorner", { Parent = window })

    local uiStroke = create("UIStroke", { Parent = window, Color = theme.Border, Thickness = config.stroke })

    local topbar = create("Frame", {
        Name = "Topbar",
        Parent = window,
        Size = UDim2.new(1, 0, 0, 40),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = theme.Highlight,
        BorderSizePixel = 0,
    })

    local windowTitle = create("TextLabel", {
        Name = "Title",
        Parent = topbar,
        Size = UDim2.new(0.5, 0, 1, 0),
        Position = UDim2.new(0.05, 0, 0, 0),
        AnchorPoint = Vector2.new(0, 0),
        BackgroundTransparency = 1,
        TextColor3 = theme.Text,
        Text = options.Name,
        TextScaled = true,
        Font = config.font,
        TextSize = config.textSize,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local closeButton = create("TextButton", {
        Name = "CloseButton",
        Parent = topbar,
        Size = UDim2.new(0, 30, 1, 0),
        Position = UDim2.new(0.95, -30, 0, 0),
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = theme.Highlight,
        BackgroundTransparency = 1,
        Text = "X",
        TextColor3 = theme.TextMuted,
        TextScaled = true,
        Font = config.font,
        TextSize = config.textSize,
    })

    local tabsFrame = create("Frame", {
        Name = "TabsFrame",
        Parent = window,
        Size = UDim2.new(1, 0, 1, -40),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundTransparency = 1,
    })

    local tabsLayout = create("UIListLayout", {
        Name = "TabsLayout",
        Parent = tabsFrame,
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, config.padding),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })

    local container = create("Frame", {
        Name = "Container",
        Parent = window,
        Size = UDim2.new(1, -2 * config.padding, 1, -40 - config.padding),
        Position = UDim2.new(0, config.padding, 0, 40 + config.padding),
        BackgroundTransparency = 1,
    })

    local contentLayout = create("UIListLayout", {
        Name = "ContentLayout",
        Parent = container,
        FillDirection = Enum.FillDirection.Vertical,
        Padding = UDim.new(0, config.padding),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })

    local instance = setmetatable({}, Rayfield)
    instance.object = mainGui
    instance.window = window
    instance.topbar = topbar
    instance.tabs = {}
    instance.currentTab = nil

    function instance:AddTab(tabName)
        local tab = create("TextButton", {
            Name = tabName:gsub(" ", ""),
            Parent = tabsFrame,
            Size = UDim2.new(0, 120, 1, 0),
            BackgroundColor3 = theme.Secondary,
            TextColor3 = theme.TextMuted,
            Text = tabName,
            TextScaled = true,
            Font = config.font,
            TextSize = config.textSize,
            LayoutOrder = #instance.tabs + 1,
        })
        create("UIStroke", { Parent = tab, Color = theme.Border, Thickness = config.stroke })
        create("UICorner", { Parent = tab })

        local tabContent = create("Frame", {
            Name = tabName:gsub(" ", "") .. "Content",
            Parent = container,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            LayoutOrder = #instance.tabs + 1,
            Visible = false,
        })
        local contentLayout = create("UIListLayout", {
            Name = "ContentLayout",
            Parent = tabContent,
            FillDirection = Enum.FillDirection.Vertical,
            Padding = UDim.new(0, config.padding),
            SortOrder = Enum.SortOrder.LayoutOrder,
        })

        local tabInstance = setmetatable({}, { __index = Rayfield.Tab })
        tabInstance.object = tabContent
        tabInstance.button = tab
        tabInstance.sections = {}

        tab.MouseButton1Click:Connect(function()
            if instance.currentTab then
                instance.currentTab.Visible = false
                instance.currentTab.button.BackgroundColor3 = theme.Secondary
                instance.currentTab.button.TextColor3 = theme.TextMuted
            end
            tabContent.Visible = true
            tab.BackgroundColor3 = theme.Background
            tab.TextColor3 = theme.Text
            instance.currentTab = tabInstance
        end)

        table.insert(instance.tabs, tabInstance)
        if #instance.tabs == 1 then
            tab.MouseButton1Click:Fire()
        end

        return tabInstance
    end

    function instance:CloseLoading()
        if Rayfield.loading.object then
            Rayfield.loading.object:Destroy()
            Rayfield.loading = {}
        end
    end

    closeButton.MouseButton1Click:Connect(function()
        mainGui.Enabled = false
    end)

    local isDragging = false
    local dragStart = Vector2.new(0, 0)
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            dragStart = input.Position
            lastPos = window.Position
        end
    end)
    topbar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            window.Position = UDim2.new(lastPos.X.Scale, lastPos.X.Offset + delta.X, lastPos.Y.Scale, lastPos.Y.Offset + delta.Y)
        end
    end)

    local toggleBind = options.ToggleUIKeybind
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode.Name == toggleBind or input.UserInputType.Name == toggleBind then
            mainGui.Enabled = not mainGui.Enabled
        end
    end)

    applyTheme(mainGui)
    applyGlobalProperties(mainGui)

    Rayfield.windows[options.Name] = instance
    if not Rayfield.loaded then
        Rayfield.loading.object = createLoadingScreen(options)
        mainGui.Enabled = true
        Rayfield.loaded = true
    end

    return instance
end

Rayfield.Tab = {
    __index = Rayfield.Tab,
}

function Rayfield.Tab:AddSection(sectionName)
    local section = create("Frame", {
        Name = sectionName:gsub(" ", ""),
        Parent = self.object,
        Size = UDim2.new(1, 0, 0, 100),
        BackgroundTransparency = 1,
        LayoutOrder = #self.sections + 1,
    })

    local sectionTitle = create("TextLabel", {
        Name = "Title",
        Parent = section,
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        TextColor3 = theme.Text,
        Text = sectionName,
        TextScaled = true,
        Font = config.font,
        TextSize = config.textSize,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local itemsLayout = create("UIListLayout", {
        Name = "ItemsLayout",
        Parent = section,
        FillDirection = Enum.FillDirection.Vertical,
        Padding = UDim.new(0, config.padding / 2),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })

    local sectionInstance = setmetatable({}, { __index = Rayfield.Section })
    sectionInstance.object = section
    sectionInstance.items = {}

    table.insert(self.sections, sectionInstance)
    return sectionInstance
end

Rayfield.Section = {
    __index = Rayfield.Section,
}

function Rayfield.Section:AddButton(options)
    options = options or {}
    options.Name = options.Name or "Button"
    options.Description = options.Description or "A button"
    options.Callback = options.Callback or function() end

    local button = create("TextButton", {
        Name = options.Name:gsub(" ", ""),
        Parent = self.object,
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundColor3 = theme.Highlight,
        TextColor3 = theme.Text,
        Text = options.Name,
        TextScaled = true,
        Font = config.font,
        TextSize = config.textSize,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = #self.items + 1,
    })
    create("UIStroke", { Parent = button, Color = theme.Border, Thickness = config.stroke })
    create("UICorner", { Parent = button })

    local description = create("TextLabel", {
        Name = "Description",
        Parent = button,
        Size = UDim2.new(1, 0, 0, 10),
        Position = UDim2.new(0, 0, 1, 0),
        AnchorPoint = Vector2.new(0, 1),
        BackgroundTransparency = 1,
        TextColor3 = theme.TextMuted,
        Text = options.Description,
        Font = config.font,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    button.MouseButton1Click:Connect(options.Callback)
    table.insert(self.items, button)
    return button
end

function Rayfield.Section:AddSlider(options)
    options = options or {}
    options.Name = options.Name or "Slider"
    options.Description = options.Description or "A slider"
    options.Min = options.Min or 0
    options.Max = options.Max or 100
    options.Default = options.Default or 50
    options.Rounding = options.Rounding or 0
    options.Callback = options.Callback or function() end

    local sliderFrame = create("Frame", {
        Name = options.Name:gsub(" ", ""),
        Parent = self.object,
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        LayoutOrder = #self.items + 1,
    })

    local slider = create("Frame", {
        Name = "Slider",
        Parent = sliderFrame,
        Size = UDim2.new(1, 0, 0, 10),
        Position = UDim2.new(0, 0, 0, 20),
        BackgroundColor3 = theme.Highlight,
        BorderSizePixel = config.stroke,
    })
    create("UIStroke", { Parent = slider, Color = theme.Border, Thickness = config.stroke })
    create("UICorner", { Parent = slider })

    local fill = create("Frame", {
        Name = "Fill",
        Parent = slider,
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = theme.Accent,
        BorderSizePixel = 0,
    })

    local handle = create("Frame", {
        Name = "Handle",
        Parent = fill,
        Size = UDim2.new(0, 10, 1, 0),
        Position = UDim2.new(1, -5, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = theme.Text,
        BorderSizePixel = config.stroke,
    })
    create("UIStroke", { Parent = handle, Color = theme.Border, Thickness = config.stroke })
    create("UICorner", { Parent = handle })

    local valueLabel = create("TextLabel", {
        Name = "Value",
        Parent = sliderFrame,
        Size = UDim2.new(0.3, 0, 0, 10),
        Position = UDim2.new(0.65, 0, 0, 0),
        AnchorPoint = Vector2.new(1, 0),
        BackgroundTransparency = 1,
        TextColor3 = theme.TextMuted,
        Text = tostring(options.Default),
        Font = config.font,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Right,
    })
    
    local isDragging = false
    local function updateSlider(input)
        local x = input.Position.X - slider.AbsolutePosition.X
        local width = slider.AbsoluteSize.X
        local ratio = math.clamp(x / width, 0, 1)
        local value = options.Min + ratio * (options.Max - options.Min)
        value = math.floor(value * (10 ^ options.Rounding) + 0.5) / (10 ^ options.Rounding)

        fill.Size = UDim2.new(ratio, 0, 1, 0)
        valueLabel.Text = tostring(value)
        options.Callback(value)
    end
    
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            UserInputService.InputChanged:Connect(updateSlider)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
        end
    end)
    
    table.insert(self.items, sliderFrame)
    options.Callback(options.Default)
    return sliderFrame
end

function Rayfield.Section:AddToggle(options)
    options = options or {}
    options.Name = options.Name or "Toggle"
    options.Description = options.Description or "A toggle switch"
    options.Default = options.Default or false
    options.Callback = options.Callback or function() end

    local toggled = options.Default
    local toggleFrame = create("Frame", {
        Name = options.Name:gsub(" ", ""),
        Parent = self.object,
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        LayoutOrder = #self.items + 1,
    })

    local toggleButton = create("TextButton", {
        Name = "ToggleButton",
        Parent = toggleFrame,
        Size = UDim2.new(0, 50, 0, 20),
        Position = UDim2.fromScale(1, 0.5),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = theme.Highlight,
        BorderSizePixel = config.stroke,
        Text = "",
    })
    create("UIStroke", { Parent = toggleButton, Color = theme.Border, Thickness = config.stroke })
    create("UICorner", { Parent = toggleButton })

    local handle = create("Frame", {
        Name = "Handle",
        Parent = toggleButton,
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new(0.1, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.1, 0.5),
        BackgroundColor3 = theme.Text,
        BorderSizePixel = 0,
    })
    create("UICorner", { Parent = handle })

    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local function updateToggle(state)
        local position = state and UDim2.new(0.9, 0, 0.5, 0) or UDim2.new(0.1, 0, 0.5, 0)
        local color = state and theme.Accent or theme.Highlight
        TweenService:Create(handle, tweenInfo, { Position = position }):Play()
        TweenService:Create(toggleButton, tweenInfo, { BackgroundColor3 = color }):Play()
        toggled = state
        options.Callback(state)
    end
    
    toggleButton.MouseButton1Click:Connect(function()
        updateToggle(not toggled)
    end)
    
    local nameLabel = create("TextLabel", {
        Name = "Name",
        Parent = toggleFrame,
        Size = UDim2.new(0.9, -55, 1, 0),
        Position = UDim2.new(0, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        TextColor3 = theme.Text,
        Text = options.Name,
        TextScaled = true,
        Font = config.font,
        TextSize = config.textSize,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    local descriptionLabel = create("TextLabel", {
        Name = "Description",
        Parent = toggleFrame,
        Size = UDim2.new(0.9, -55, 0.5, 0),
        Position = UDim2.new(0, 0, 1, 0),
        AnchorPoint = Vector2.new(0, 1),
        BackgroundTransparency = 1,
        TextColor3 = theme.TextMuted,
        Text = options.Description,
        Font = config.font,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    updateToggle(options.Default)
    table.insert(self.items, toggleFrame)
    return toggleFrame
end

function Rayfield.Section:AddInput(options)
    options = options or {}
    options.Name = options.Name or "Input"
    options.Placeholder = options.Placeholder or "Enter text..."
    options.Callback = options.Callback or function() end

    local inputFrame = create("Frame", {
        Name = options.Name:gsub(" ", ""),
        Parent = self.object,
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        LayoutOrder = #self.items + 1,
    })
    
    local input = create("TextBox", {
        Name = "Input",
        Parent = inputFrame,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = theme.Highlight,
        TextColor3 = theme.Text,
        Text = options.Placeholder,
        TextScaled = true,
        Font = config.font,
        TextSize = config.textSize,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    create("UIStroke", { Parent = input, Color = theme.Border, Thickness = config.stroke })
    create("UICorner", { Parent = input })

    input.FocusLost:Connect(function()
        options.Callback(input.Text)
    end)
    input.Changed:Connect(function()
        options.Callback(input.Text)
    end)
    
    table.insert(self.items, inputFrame)
    return input
end

return Rayfield

-- ==================================================================================================
-- FIM DO CÓDIGO DA BIBLIOTECA RAYFIELD
-- ==================================================================================================


-- SEU CÓDIGO DA UI COMEÇA ABAIXO:
-- Define a chave correta e o link do Discord e Linktree
local CORRETA_CHAVE = "Dr4gonX"
local DISCORD_LINK = "https://discord.gg/PvssedzXpT"
local LINKTREE_LINK = "https://linktr.ee/D4gonBRX"

-- Câmera local e serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera

-- Variáveis para os sistemas de controle
local isSpectating = false
local spectateConnection = nil
local originalCameraType = Camera.CameraType
local isESP_Enabled = false
local isAimbot_Enabled = false
local isNoclip_Enabled = false
local noclipConnection = nil

--- Sistema de Chave (Login) ---
-- Cria uma janela de login que só será destruída após a chave correta ser inserida
local KeyWindow = Rayfield:CreateWindow({
    Name = "Sistema de Chave",
    Description = "Insira a chave para acessar o hub.",
    LoadingTitle = "Verificando Chave...",
    LoadingSubtitle = "Aguarde..."
})

local KeyTab = KeyWindow:AddTab("Autenticação")

local KeySection = KeyTab:AddSection("Acesso")

local KeyTextBox = KeySection:AddInput({
    Name = "Chave de Acesso",
    Placeholder = "Insira a chave aqui...",
    Callback = function()
        -- A verificação será feita no botão para melhor controle
    end
})

KeySection:AddButton({
    Name = "Verificar Chave",
    Description = "Clique para verificar a chave.",
    Callback = function()
        if KeyTextBox.Value == CORRETA_CHAVE then
            -- Se a chave estiver correta, destrói a janela de login e cria a UI principal
            KeyWindow:Destroy()

            -- Cria a janela principal da UI "D4gon UI"
            local Window = Rayfield:CreateWindow({
                Name = "D4gon UI",
                Description = "Hub com inúmeras funções.",
                Icon = 0, -- Sem ícone. Mude para um ID ou string para usar um ícone.
                LoadingTitle = "Carregando Rayfield...",
                LoadingSubtitle = "by Sirius",
                Theme = "Default",
                ToggleUIKeybind = "P" -- A tecla 'P' para mostrar/esconder a UI
            })

            local HubTab = Window:AddTab("Hub")

            --- Funções de Movimento ---
            local MovementSection = HubTab:AddSection("Movimento")
            
            MovementSection:AddSlider({
                Name = "Walk Speed",
                Description = "Ajusta a velocidade de movimento do seu personagem.",
                Min = 0,
                Max = 500,
                Default = 16,
                Rounding = 0,
                Callback = function(value)
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.WalkSpeed = value
                    end
                end
            })

            MovementSection:AddSlider({
                Name = "Jump Power",
                Description = "Ajusta a altura do seu pulo.",
                Min = 0,
                Max = 500,
                Default = 50,
                Rounding = 0,
                Callback = function(value)
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.JumpPower = value
                    end
                end
            })

            --- Sistema de Espectador (View) ---
            local SpectateSection = HubTab:AddSection("Espectar")

            local SpectateInput = SpectateSection:AddInput({
                Name = "Nome de Usuário",
                Placeholder = "Insira o nick da pessoa aqui...",
            })

            SpectateSection:AddToggle({
                Name = "Ativar Espectador",
                Description = "Espere a câmera de alguém. Insira o nick acima.",
                Default = false,
                Callback = function(toggled)
                    isSpectating = toggled
                    if toggled then
                        local targetPlayer = Players:FindFirstChild(SpectateInput.Value)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
                            Camera.CameraType = Enum.CameraType.Scriptable
                            spectateConnection = RunService.Heartbeat:Connect(function()
                                if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    Camera.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 10)
                                else
                                    print("O jogador-alvo não está mais disponível. Parando de espectar.")
                                    isSpectating = false
                                    Camera.CameraType = originalCameraType
                                    if spectateConnection then
                                        spectateConnection:Disconnect()
                                        spectateConnection = nil
                                    end
                                end
                            end)
                        else
                            print("Jogador não encontrado ou sem personagem.")
                        end
                    else
                        if spectateConnection then
                            spectateConnection:Disconnect()
                            spectateConnection = nil
                        end
                        Camera.CameraType = originalCameraType
                        print("Espectador desativado.")
                    end
                end
            })

            --- Funções de Gameplay ---
            local GameplaySection = HubTab:AddSection("Gameplay")

            -- 1. Função ESP (Highlight)
            local function updateESP()
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local highlight = player.Character:FindFirstChild("PlayerHighlight")
                        if not highlight then
                            highlight = Instance.new("Highlight")
                            highlight.Name = "PlayerHighlight"
                            highlight.Parent = player.Character
                            highlight.Adornee = player.Character
                        end

                        local team = player.Team
                        if team and LocalPlayer.Team and team.Name ~= LocalPlayer.Team.Name then
                            -- Inimigo
                            highlight.FillColor = Color3.new(1, 0, 0) -- Vermelho
                            highlight.OutlineColor = Color3.new(1, 0.5, 0.5)
                        elseif team and LocalPlayer.Team and team.Name == LocalPlayer.Team.Name then
                            -- Aliado
                            highlight.FillColor = Color3.new(0, 1, 0) -- Verde
                            highlight.OutlineColor = Color3.new(0.5, 1, 0.5)
                        else
                            -- Sem time ou time desconhecido
                            highlight.FillColor = Color3.new(0, 0.5, 1) -- Azul
                            highlight.OutlineColor = Color3.new(0.5, 0.75, 1)
                        end
                        highlight.Enabled = isESP_Enabled
                    end
                end
            end

            GameplaySection:AddToggle({
                Name = "Ativar ESP (Highlight)",
                Description = "Adiciona um contorno colorido a todos os jogadores.",
                Default = false,
                Callback = function(toggled)
                    isESP_Enabled = toggled
                    if isESP_Enabled then
                        updateESP()
                        Players.PlayerAdded:Connect(updateESP)
                        Players.PlayerRemoving:Connect(function(player)
                            if player.Character and player.Character:FindFirstChild("PlayerHighlight") then
                                player.Character.PlayerHighlight:Destroy()
                            end
                        end)
                    else
                        for _, player in ipairs(Players:GetPlayers()) do
                            if player.Character and player.Character:FindFirstChild("PlayerHighlight") then
                                player.Character.PlayerHighlight.Enabled = false
                            end
                        end
                    end
                end
            })

            -- 2. Função Aimbot (Shift Lock/Primeira Pessoa)
            GameplaySection:AddToggle({
                Name = "Ativar Aimbot",
                Description = "Sua mira seguirá o jogador mais próximo quando mirar.",
                Default = false,
                Callback = function(toggled)
                    isAimbot_Enabled = toggled
                    if isAimbot_Enabled then
                        RunService.Heartbeat:Connect(function()
                            if isAimbot_Enabled and (Camera.CameraType == Enum.CameraType.Scriptable or Players.LocalPlayer.DevComputerCameraMovementMode == Enum.DevComputerCameraMovementMode.User) then
                                local closestPlayer = nil
                                local minDistance = math.huge
                                
                                for _, player in ipairs(Players:GetPlayers()) do
                                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                        local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                        if distance < minDistance then
                                            minDistance = distance
                                            closestPlayer = player
                                        end
                                    end
                                end

                                if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestPlayer.Character.HumanoidRootPart.Position)
                                end
                            end
                        end)
                    end
                end
            })
            
            -- 3. Função Noclip
            GameplaySection:AddToggle({
                Name = "Ativar Noclip",
                Description = "Permite atravessar paredes, mas não o chão.",
                Default = false,
                Callback = function(toggled)
                    isNoclip_Enabled = toggled
                    if isNoclip_Enabled then
                        LocalPlayer.Character.Archivable = true
                        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                        noclipConnection = RunService.Heartbeat:Connect(function()
                            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local rootPart = LocalPlayer.Character.HumanoidRootPart
                                local floor = Workspace:FindPartOnRay(Ray.new(rootPart.Position, Vector3.new(0, -100, 0)))
                                if floor and floor.Instance and floor.Instance.Parent ~= LocalPlayer.Character then
                                    if floor.Distance > 5 then
                                        rootPart.Velocity = Vector3.new(0, 0, 0)
                                    end
                                end
                            end
                        end)
                    else
                        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = true
                            end
                        end
                        if noclipConnection then
                            noclipConnection:Disconnect()
                            noclipConnection = nil
                        end
                    end
                end
            })

            --- Funções Sociais ---
            local SocialSection = HubTab:AddSection("Social")
            
            SocialSection:AddButton({
                Name = "Entrar no Discord",
                Description = "Clique para ver o link do servidor.",
                Callback = function()
                    print("Link do Discord: " .. DISCORD_LINK)
                end
            })

            SocialSection:AddButton({
                Name = "Meu Linktree",
                Description = "Veja todas as minhas redes sociais.",
                Callback = function()
                    print("Linktree: " .. LINKTREE_LINK)
                end
            })

            -- Destrói o loader da Rayfield após a UI ser criada
            Window:CloseLoading()

        else
            -- Se a chave estiver incorreta, mostra um aviso
            print("Chave incorreta! Acesso negado.")
        end
    end
})
