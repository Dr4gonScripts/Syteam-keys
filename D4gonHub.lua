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
AuraHub:CreateToggle({
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
    SectionParent = SectionMain
})

-- Super Pulo (Toggle)
AuraHub:CreateToggle({
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
    SectionParent = SectionMain
})

-- Anti-AFK (Botão)
AuraHub:CreateButton({
    Name = "Ativar Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        Rayfield:Notify({
            Title = "XD4X Hub",
            Content = "Anti-AFK ativado!",
            Duration = 5
        })
    end,
    SectionParent = SectionMain
})

-- Fly simples (Botão)
AuraHub:CreateButton({
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

        Rayfield:Notify({
            Title = "Fly Ativado",
            Content = "Use W, A, S, D e Espaço para voar",
            Duration = 5
        })
    end,
    SectionParent = SectionMain
})

-- Resetar Personagem (Botão)
AuraHub:CreateButton({
    Name = "Resetar Personagem",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end,
    SectionParent = SectionMain
})

-- Função pra criar abas e botões de scripts
local function createGameTab(name)
    local tab = Window:CreateTab(name, 4483362458)
    local section = tab:CreateSection(name .. " Scripts")
    return tab, section
end

local function createScriptButton(section, scriptName)
    section:CreateButton({
        Name = scriptName,
        Callback = function()
            Rayfield:Notify({
                Title = "XD4X Hub",
                Content = scriptName .. " executado!",
                Duration = 4
            })
            -- Coloque aqui o código real do script
        end
    })
end

-- Abas e scripts:

local musclesTab, musclesSection = createGameTab("Muscles Legends")
createScriptButton(musclesSection, "Speed Hub X")
createScriptButton(musclesSection, "Beamed V2 (key: Benishot)")
createScriptButton(musclesSection, "ML V1")
createScriptButton(musclesSection, "KTM (key: KTMx2025)")

local bloxTab, bloxSection = createGameTab("Blox Fruits")
createScriptButton(bloxSection, "Speed Hub X")
createScriptButton(bloxSection, "Redz Hub")
createScriptButton(bloxSection, "Alchemy Hub Beta Edition")
createScriptButton(bloxSection, "Cokka Hub")

local brainrotTab, brainrotSection = createGameTab("Roube um Brainrot")
createScriptButton(brainrotSection, "Moskvv Hub")
createScriptButton(brainrotSection, "Fenorik Hub")
createScriptButton(brainrotSection, "Nabaru Hub")
createScriptButton(brainrotSection, "oRee Hub")
createScriptButton(brainrotSection, "Makal Hub")

local growTab, growSection = createGameTab("Grow a Garden")
createScriptButton(growSection, "Speed Hub X")
createScriptButton(growSection, "No-Lag Hub")
createScriptButton(growSection, "ThunderZ Hub")
createScriptButton(growSection, "Dupe GAG")
createScriptButton(growSection, "Lunor Hub")

local nightTab, nightSection = createGameTab("99 Noites na Floresta")
createScriptButton(nightSection, "Fast Hub")
createScriptButton(nightSection, "EF Hub")
createScriptButton(nightSection, "H4x Hub")

local blueLockTab, blueLockSection = createGameTab("Blue Lock Rivais")
createScriptButton(blueLockSection, "Alchemy Hub")

local forsakenTab, forsakenSection = createGameTab("Forsaken")
createScriptButton(forsakenSection, "Funny Hub")

local deadRailsTab, deadRailsSection = createGameTab("Dead Rails")
createScriptButton(deadRailsSection, "Tbao Hub")
createScriptButton(deadRailsSection, "Than Hub")
createScriptButton(deadRailsSection, "Native Hub")
createScriptButton(deadRailsSection, "Speed Hub X")

local ariseTab, ariseSection = createGameTab("Arise Crossover")
ariseSection:CreateLabel("♟ Arise Crossover - Em breve...")

local carTab, carSection = createGameTab("Car Dealership Tycoon")
createScriptButton(carSection, "Auto Farm - JuninhoOGado")
createScriptButton(carSection, "Norepinefina Hub")
createScriptButton(carSection, "Auto Race")

local bedWarsTab, bedWarsSection = createGameTab("Bed Wars")
createScriptButton(bedWarsSection, "VapeVoid Hub")

local raceTab, raceSection = createGameTab("Race Clicker")
createScriptButton(raceSection, "Auto farm")

local standTab, standSection = createGameTab("Stand Awakening")
createScriptButton(standSection, "Auto farm")

Rayfield:LoadConfiguration()
