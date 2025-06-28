local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local UserInputService = game:GetService("UserInputService")

-- Criar ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SimpleHubGui"
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.Enabled = false -- inicia fechado

-- Janela principal (Frame)
local Window = Instance.new("Frame")
Window.Size = UDim2.new(0, 300, 0, 350)
Window.Position = UDim2.new(0.5, -150, 0.5, -175)
Window.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Window.BorderSizePixel = 0
Window.Parent = ScreenGui

-- Título
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.Text = "Simple Hub"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true
Title.Parent = Window

-- Função para criar slider
local function CreateSlider(parent, labelText, min, max, default, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 0, 60)
    container.BackgroundTransparency = 1
    container.Position = UDim2.new(0, 10, 0, #parent:GetChildren() * 65)
    container.Parent = parent

    local label = Instance.new("TextLabel")
    label.Text = labelText .. ": " .. tostring(default)
    label.Size = UDim2.new(1, 0, 0, 20)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1,1,1)
    label.Parent = container

    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(1, 0, 0, 20)
    sliderFrame.Position = UDim2.new(0, 0, 0, 30)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    sliderFrame.Parent = container

    local sliderButton = Instance.new("Frame")
    sliderButton.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderButton.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
    sliderButton.Parent = sliderFrame

    local dragging = false

    sliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    sliderButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    sliderFrame.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local relativePos = math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1)
            sliderButton.Size = UDim2.new(relativePos, 0, 1, 0)
            local value = math.floor(min + (max - min) * relativePos)
            label.Text = labelText .. ": " .. tostring(value)
            callback(value)
        end
    end)
end

-- Criar os sliders dentro da janela
CreateSlider(Window, "Walk Speed", 16, 100, 16, function(value)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end
end)

CreateSlider(Window, "Jump Power", 50, 150, 50, function(value)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.JumpPower = value
        end
    end
end)

-- Abrir/Fechar GUI com "K"
mouse.KeyDown:Connect(function(key)
    if key == "k" then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)
