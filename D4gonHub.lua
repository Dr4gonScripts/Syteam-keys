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

local Tab = Window:CreateTab("XD4X Hub", 4483362458)
local SectionMain = Tab:CreateSection("Main Features")

-- Toggle WalkSpeed
SectionMain:CreateToggle({
    Name = "God Speed (16 ↔ 100)",
    CurrentValue = false,
    Callback = function(active)
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = active and 100 or 16
            end
        end
    end,
})

-- Toggle JumpPower
SectionMain:CreateToggle({
    Name = "Super Jump (50 ↔ 120)",
    CurrentValue = false,
    Callback = function(active)
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = active and 120 or 50
            end
        end
    end,
})

-- Anti-AFK toggle
SectionMain:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Callback = function(active)
        if active then
            local vu = game:GetService("VirtualUser")
            game.Players.LocalPlayer.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        end
    end,
})

-- Reset character button
SectionMain:CreateButton({
    Name = "Reset Character",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.Health = 0
            end
        end
    end,
})

Rayfield:LoadConfiguration()
