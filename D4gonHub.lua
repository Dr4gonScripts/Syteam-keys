local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "XD4X Hub",
    LoadingTitle = "XD4X Hub",
    LoadingSubtitle = "by D4GON",
    Theme = "Dark",
    ToggleUIKeybind = Enum.KeyCode.K,
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

-- Criar aba Main
local MainTab = Window:CreateTab("XD4X Hub", 4483362458)
local MainSection = MainTab:CreateSection("Funções Principais")

MainSection:CreateToggle({
    Name = "God Speed (16 → 100)",
    CurrentValue = false,
    Flag = "GodSpeedToggle",
    Callback = function(value)
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = value and 100 or 16
        end
    end
})

MainSection:CreateToggle({
    Name = "Super Pulo (50 → 120)",
    CurrentValue = false,
    Flag = "SuperJumpToggle",
    Callback = function(value)
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.JumpPower = value and 120 or 50
        end
    end
})

MainSection:CreateButton({
    Name = "Ativar Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        Rayfield:Notify({
            Title = "XD4X Hub",
            Content = "Anti-AFK ativado!",
            Duration = 5
        })
    end
})

Rayfield:LoadConfiguration()
