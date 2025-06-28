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

-- God Speed (Toggle)
SectionMain:CreateToggle({
    Name = "God Speed (16 ↔ 100)",
    CurrentValue = false,
    Callback = function(Value)
        local character = game:GetService("Players").LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = Value and 100 or 16
            end
        end
    end,
})

-- Super Pulo (Toggle)
SectionMain:CreateToggle({
    Name = "Super Pulo (50 ↔ 120)",
    CurrentValue = false,
    Callback = function(Value)
        local character = game:GetService("Players").LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = Value and 120 or 50
            end
        end
    end,
})

-- Anti-AFK (Botão)
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

-- Fly simples (Botão)
SectionMain:CreateButton({
    Name = "Ativar Fly",
    Callback = function()
        local player = game.Players.LocalPlayer
        local mouse = player:GetMouse()
        local torso = player.Character:WaitForChild("HumanoidRootPart")
        local speed = 2

        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame

        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

        mouse.KeyDown:Connect(function(key)
            if key == "w" then
                bv.velocity = torso.CFrame.lookVector * speed
            elseif key == "s" then
                bv.velocity = -torso.CFrame.lookVector * speed
            elseif key == "a" then
                bv.velocity = -torso.CFrame.rightVector * speed
            elseif key == "d" then
                bv.velocity = torso.CFrame.rightVector * speed
            elseif key == " " then
                bv.velocity = Vector3.new(0, speed, 0)
            end
        end)
    end,
})

-- Resetar Personagem (Botão)
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

-- Aba Muscles Legends
local MC = Window:CreateTab("Muscles Legends", 4483362458)
local SectionMCS = MC:CreateSection("🦾 Auto farms")

SectionMCS:CreateButton({
    Name = "Speed Hub X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end,
})

SectionMCS:CreateButton({
    Name = "KTM (key: KTMx2025)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zapstreams123/KTMHUB/refs/heads/main/PublicVersion", true))()
    end,
})

SectionMCS:CreateButton({
    Name = "Beamed V2 (key: Benishot)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ben1x1x1x1x/V2/refs/heads/main/BeamedV2FreeLoader", true))()
    end,
})

SectionMCS:CreateButton({
    Name = "Ml V1 Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2581235867/21/refs/heads/main/By%20Tokattk", true))()
    end,
})

Rayfield:LoadConfiguration()
