local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "XD4X Hub",
    LoadingTitle = "XD4X Hub",
    LoadingSubtitle = "by D4GON",
    Theme = "Default",
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "XD4X Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "nada",
        RememberJoins = true
    },
    KeySystem = false,
})

local AuraHub = Window:CreateTab("XD4X Hub", 4483362458)
local SectionMain = AuraHub:CreateSection("Funções Principais")

-- WalkSpeed Slider
SectionMain:CreateSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 150,
    Default = 16,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "speed",
    Callback = function(value)
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = value
            end
        end
    end
})

-- JumpPower Slider
SectionMain:CreateSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 200,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "jump",
    Callback = function(value)
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = value
            end
        end
    end
})

Rayfield:LoadConfiguration()
