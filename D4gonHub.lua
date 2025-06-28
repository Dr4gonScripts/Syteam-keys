local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "XD4X Hub",
    LoadingTitle = "XD4X Hub",
    LoadingSubtitle = "by D4GON",
    Theme = "Default",
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

-- === Aba Main ===
local MainTab = Window:CreateTab("XD4X Hub", 4483362458)
local MainSection = MainTab:CreateSection("Funções Principais")

MainSection:CreateToggle({
    Name = "God Speed (16 → 100)",
    CurrentValue = false,
    Callback = function(value)
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = value and 100 or 16 end
    end
})

MainSection:CreateToggle({
    Name = "Super Pulo (50 → 120)",
    CurrentValue = false,
    Callback = function(value)
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = value and 120 or 50 end
    end
})

MainSection:CreateButton({
    Name = "Ativar Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        Rayfield:Notify({Title="XD4X Hub", Content="Anti-AFK ativado!", Duration=5})
    end
})

MainSection:CreateButton({
    Name = "Ativar Fly",
    Callback = function()
        local player = game.Players.LocalPlayer
        local mouse = player:GetMouse()
        local torso = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not torso then
            Rayfield:Notify({Title="Erro", Content="Personagem não encontrado!", Duration=5})
            return
        end
        local speed = 2

        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame

        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

        local flying = true

        local function stopFly()
            flying = false
            bg:Destroy()
            bv:Destroy()
        end

        mouse.KeyDown:Connect(function(key)
            if not flying then return end
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

        Rayfield:Notify({Title="Fly Ativado", Content="Use W, A, S, D e Espaço", Duration=5})
    end
})

MainSection:CreateButton({
    Name = "Resetar Personagem",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.Health = 0
            end
        end
    end
})

-- === Abas de Jogos ===

local function createGameTab(tabName)
    local tab = Window:CreateTab(tabName, 4483362458)
    local section = tab:CreateSection("Scripts " .. tabName)
    return tab, section
end

local function createScriptButton(section, name)
    section:CreateButton({
        Name = name,
        Callback = function()
            Rayfield:Notify({Title = "XD4X Hub", Content = name .. " executado!", Duration = 4})
            -- Aqui você coloca o código do script que deseja rodar (sem usar loadstring externo)
        end
    })
end

-- Muscles Legends
local musclesTab, musclesSection = createGameTab("Muscles Legends")
createScriptButton(musclesSection, "Speed Hub X")
createScriptButton(musclesSection, "Beamed V2 (key: Benishot)")
createScriptButton(musclesSection, "ML V1")
createScriptButton(musclesSection, "KTM (key: KTMx2025)")

-- Blox Fruits
local bloxTab, bloxSection = createGameTab("Blox Fruits")
createScriptButton(bloxSection, "Speed Hub X")
createScriptButton(bloxSection, "Redz Hub")
createScriptButton(bloxSection, "Alchemy Hub Beta Edition")
createScriptButton(bloxSection, "Cokka Hub")

-- Roube um Brainrot
local brainrotTab, brainrotSection = createGameTab("Roube um Brainrot")
createScriptButton(brainrotSection, "Moskvv Hub")
createScriptButton(brainrotSection, "Fenorik Hub")
createScriptButton(brainrotSection, "Nabaru Hub")
createScriptButton(brainrotSection, "oRee Hub")
createScriptButton(brainrotSection, "Makal Hub")

-- Grow a Garden
local growTab, growSection = createGameTab("Grow a Garden")
createScriptButton(growSection, "Speed Hub X")
createScriptButton(growSection, "No-Lag Hub")
createScriptButton(growSection, "ThunderZ Hub")
createScriptButton(growSection, "Dupe GAG")
createScriptButton(growSection, "Lunor Hub")

-- 99 Noites na Floresta
local nightTab, nightSection = createGameTab("99 Noites na Floresta")
createScriptButton(nightSection, "Fast Hub")
createScriptButton(nightSection, "EF Hub")
createScriptButton(nightSection, "H4x Hub")

-- Blue Lock Rivais
local blueLockTab, blueLockSection = createGameTab("Blue Lock Rivais")
createScriptButton(blueLockSection, "Alchemy Hub")

-- Forsaken
local forsakenTab, forsakenSection = createGameTab("Forsaken")
createScriptButton(forsakenSection, "Funny Hub")

-- Dead Rails
local deadRailsTab, deadRailsSection = createGameTab("Dead Rails")
createScriptButton(deadRailsSection, "Tbao Hub")
createScriptButton(deadRailsSection, "Than Hub")
createScriptButton(deadRailsSection, "Native Hub")
createScriptButton(deadRailsSection, "Speed Hub X")

-- Arise Crossover (Em breve)
local ariseTab, ariseSection = createGameTab("Arise Crossover")
ariseSection:CreateLabel("♟ Arise Crossover - Em breve...")

-- Car Dealership Tycoon
local carTab, carSection = createGameTab("Car Dealership Tycoon")
createScriptButton(carSection, "Auto Farm - JuninhoOGado")
createScriptButton(carSection, "Norepinefina Hub")
createScriptButton(carSection, "Auto Race")

-- Bed Wars
local bedWarsTab, bedWarsSection = createGameTab("Bed Wars")
createScriptButton(bedWarsSection, "VapeVoid Hub")

-- Race Clicker
local raceTab, raceSection = createGameTab("Race Clicker")
createScriptButton(raceSection, "Auto farm")

-- Stand Awakening
local standTab, standSection = createGameTab("Stand Awakening")
createScriptButton(standSection, "Auto farm")

Rayfield:LoadConfiguration()
