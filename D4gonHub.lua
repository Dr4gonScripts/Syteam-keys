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

-- ABA MAIN
local MainTab = Window:CreateTab("XD4X Hub", 4483362458)
local MainSection = MainTab:CreateSection("Funções Principais")

MainSection:CreateToggle({
    Name = "God Speed (16 → 100)",
    CurrentValue = false,
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = Value and 100 or 16 end
    end
})

MainSection:CreateToggle({
    Name = "Super Pulo (50 → 120)",
    CurrentValue = false,
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = Value and 120 or 50 end
    end
})

MainSection:CreateButton({
    Name = "Ativar Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game.Players.LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        Rayfield:Notify({Title = "XD4X Hub", Content = "Anti-AFK ativado!", Duration = 5})
    end
})

-- ABA MUSCLES LEGENDS
local MusclesTab = Window:CreateTab("Muscles Legends", 4483362458)
local MusclesSection = MusclesTab:CreateSection("🦾 Auto Farm")

MusclesSection:CreateButton({
    Name = "Speed Hub X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

MusclesSection:CreateButton({
    Name = "Beamed V2 (key: Benishot)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ben1x1x1x1x/V2/refs/heads/main/BeamedV2FreeLoader"))()
    end
})

-- ABA BLOX FRUITS
local BloxFruitsTab = Window:CreateTab("Blox Fruits", 4483362458)
local BloxFruitsSection = BloxFruitsTab:CreateSection("⚔️ Combat & Farm")

BloxFruitsSection:CreateButton({
    Name = "Speed Hub X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

BloxFruitsSection:CreateButton({
    Name = "Redz Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
    end
})

Rayfield:LoadConfiguration()
