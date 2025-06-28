-- XD4X Hub completo com Rayfield - com todas abas
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

-- Aba Principal e Funções Principais já adicionadas (God Speed, Fly, Anti AFK)
local MainTab = Window:CreateTab("XD4X Hub", 4483362458)
local SectionMain = MainTab:CreateSection("Funções Principais")

MainTab:CreateToggle({
    Name = "God Speed (16 → 100)",
    CurrentValue = false,
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = Value and 100 or 16 end
    end,
    SectionParent = SectionMain
})

MainTab:CreateToggle({
    Name = "Super Pulo (50 → 120)",
    CurrentValue = false,
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = Value and 120 or 50 end
    end,
    SectionParent = SectionMain
})

MainTab:CreateButton({
    Name = "Ativar Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        Rayfield:Notify({Title="XD4X Hub", Content="Anti-AFK ativado!", Duration=5})
    end,
    SectionParent = SectionMain
})

MainTab:CreateButton({
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

        Rayfield:Notify({Title="Fly Ativado", Content="Use W, A, S, D e Espaço", Duration=5})
    end,
    SectionParent = SectionMain
})

MainTab:CreateButton({
    Name = "Resetar Personagem",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end,
    SectionParent = SectionMain
})

-- Função auxiliar para criar botões que carregam scripts de URL
local function CreateScriptButton(tab, sectionName, buttons)
    local section = tab:CreateSection(sectionName)
    for _, btn in ipairs(buttons) do
        section:CreateButton({
            Name = btn.Name,
            Callback = btn.Callback,
        })
    end
end

-- ABAS DE JOGOS E SCRIPTS
-- Muscles Legends
local MusclesTab = Window:CreateTab("Muscles Legends", 4483345998)
CreateScriptButton(MusclesTab, "🦾 Auto Farm", {
    {Name = "Speed Hub X", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))() end},
    {Name = "Beamed V2 (key: Benishot)", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ben1x1x1x1x/V2/refs/heads/main/BeamedV2FreeLoader"))() end},
    {Name = "ML V1", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/2581235867/21/refs/heads/main/By%20Tokattk"))() end},
    {Name = "KTM (key: KTMx2025)", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/zapstreams123/KTMHUB/refs/heads/main/PublicVersion"))() end},
})

-- Blox Fruits
local BloxFruitsTab = Window:CreateTab("Blox Fruits", 4483345998)
CreateScriptButton(BloxFruitsTab, "⚔️ Combat & Farm", {
    {Name = "Speed Hub X", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))() end},
    {Name = "Redz Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))() end},
    {Name = "Alchemy Hub Beta Edition", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DENGHUB2025/HUGHUB/main/WL", true))() end},
    {Name = "Cokka Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua"))() end},
})

-- Roube um Brainrot
local BrainrotTab = Window:CreateTab("Roube um Brainrot", 4483345998)
CreateScriptButton(BrainrotTab, "🧠 Brainrot Farm", {
    {Name = "Moskvv Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/forkT3/Steal-a-Brianrot/main/Steal-A-Brianrot.lua"))() end},
    {Name = "Fenorik Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Fenorik/FenorikHub/refs/heads/main/FenorikHubINIT.lua"))() end},
    {Name = "Nabaru Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))() end},
    {Name = "oRee Hub", Callback = function() loadstring(game:HttpGet("https://oreofdev.github.io/Sw1ftSync/Raw/SSXBr/"))() end},
    {Name = "Makal Hub", Callback = function()
        local a,b,c=loadstring,(syn and syn.request)or(http and http.request)or(request)or(http_request),assert
        c(a and b,"Executor not Supported")
        a(b({Url="https://makalhub.vercel.app/api/script/loader",Method="GET"}).Body)()
    end},
})

-- Grow a Garden
local GrowGardenTab = Window:CreateTab("Grow a Garden", 4483345998)
CreateScriptButton(GrowGardenTab, "🌱 Garden Farm", {
    {Name = "Speed Hub X", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))() end},
    {Name = "No-Lag Hub", Callback = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV2.lua"))() end},
    {Name = "ThunderZ Hub", Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua'))() end},
    {Name = "Dupe GAG", Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/SPIDROSH/Grow-a-Garden/refs/heads/main/DGAG'))() end},
    {Name = "Lunor Hub", Callback = function() loadstring(game:HttpGet('https://lunor.dev/loader'))() end},
})

-- 99 Noites na Floresta
local NEFTab = Window:CreateTab("99 Noites na Floresta", 4483345998)
CreateScriptButton(NEFTab, "🌲 99 Noites na Floresta Farm", {
    {Name = "Fast Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/adibhub1/99-nighit-in-forest/refs/heads/main/99%20night%20in%20forest"))() end},
    {Name = "EF Hub", Callback = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1craku/Test/refs/heads/main/99%20Nights%20in%20the%20Forest%202"))() end},
    {Name = "H4x Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua", true))() end},
})

-- Blue Lock Rivais
local BLRTab = Window:CreateTab("Blue Lock Rivais", 4483345998)
CreateScriptButton(BLRTab, "⚽ BLR Auto Farm", {
    {Name = "Alchemy Hub", Callback = function() loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))() end},
})

-- Forsaken
local FRTab = Window:CreateTab("Forsaken", 4483345998)
CreateScriptButton(FRTab, "🔪 Forsaken Auto Farm", {
    {Name = "Funny Hub", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Forsaken-Funny-Hub-V2-42056"))() end},
})

-- Dead Rails
local DRTab = Window:CreateTab("Dead Rails", 4483345998)
CreateScriptButton(DRTab, "💴 Auto Bound", {
    {Name = "Tbao Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))() end},
    {Name = "Than Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))() end},
    {Name = "Native Hub", Callback = function() loadstring(game:HttpGet("https://getnative.cc/script/loader"))() end},
    {Name = "Speed Hub X", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))() end},
})

-- Arise Crossover
local ARTab = Window:CreateTab("Arise Crossover", 4483345998)
local ARCSection = ARTab:CreateSection("♟ Arise Crossover - Em breve...")

-- Car Dealership Tycoon
local CDTTab = Window:CreateTab("Car Dealership Tycoon", 4483345998)
CreateScriptButton(CDTTab, "🚗 Car Dealership Auto Farm", {
    {Name = "Auto Farm - JuninhoOGado", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/JuninhoOGado/ScriptsSite/main/Script245"))() end},
    {Name = "Norepinefina Hub", Callback = function() loadstring(game:HttpGet("https://norepinefrina.com"))() end},
    {Name = "Auto Race", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Vehicle%20legends"))() end},
})

-- Bed Wars
local BDTab = Window:CreateTab("Bed Wars", 4483345998)
CreateScriptButton(BDTab, "🛏 Bed Wars - farm", {
    {Name = "VapeVoid Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua", true))() end},
})

-- Race Clicker
local RCTab = Window:CreateTab("Race Clicker", 4483345998)
CreateScriptButton(RCTab, "🚥 Race clicker Farm", {
    {Name = "Auto farm", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/RaceClicker"))() end},
})

-- Stand Awakening
local STATab = Window:CreateTab("Stand Awakening", 4483345998)
CreateScriptButton(STATab, "🕴 Stand Farm", {
    {Name = "Auto farm", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/snowbrkkkk/main/refs/heads/main/Standsawakening"))() end},
})

Rayfield:LoadConfiguration()
