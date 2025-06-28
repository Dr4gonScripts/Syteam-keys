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
    Name = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Increment = 1,
    Suffix = " WalkSpeed",
    Callback = function(value)
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = value
            end
        end
    end,
})

-- JumpPower Slider
SectionMain:CreateSlider({
    Name = "Jump Power",
    Min = 50,
    Max = 250,
    Default = 50,
    Increment = 1,
    Suffix = " JumpPower",
    Callback = function(value)
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = value
            end
        end
    end,
})

-- Anti-AFK Button
SectionMain:CreateButton({
    Name = "Ativar Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end,
})

-- Reset Button
SectionMain:CreateButton({
    Name = "Resetar Personagem",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end,
})

Rayfield:LoadConfiguration()
