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

-- === ABA MAIN ===
local MainTab = Window:CreateTab("XD4X Hub", 4483362458)
local MainSection = MainTab:CreateSection("Funções Principais")

MainSection:CreateToggle({
    Name = "God Speed (16 → 100)",
    CurrentValue = false,
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = Value and 100 or 16 end
    end,
})

MainSection:CreateToggle({
    Name = "Super Pulo (50 → 120)",
    CurrentValue = false,
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = Value and 120 or 50 end
    end,
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
        Rayfield:Notify({Title="XD4X Hub", Content="Anti-AFK ativado!", Duration=5})
    end,
})

MainSection:CreateButton({
    Name = "Ativar Fly",
    Callback = function()
        local player = game.Players.LocalPlayer
        local mouse = player:GetMouse()
        local torso = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not torso then return end
        local speed = 2

        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame

        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

        mouse.KeyDown:Connect(function(key)
            key = key:lower()
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
})

MainSection:CreateButton({
    Name = "Resetar Personagem",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end,
})

-- ==================================================================
-- ABA MUSCLES LEGENDS
-- ==================================================================
local MusclesTab = Window:CreateTab("Muscles Legends", 4483345998)
local MusclesSection = MusclesTab:CreateSection("🦾 Auto Farm")

MusclesTab:CreateButton({
    Name = "Speed Hub X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end,
    SectionParent = MusclesSection
})

MusclesTab:CreateButton({
    Name = "Beamed V2 (key: Benishot)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ben1x1x1x1x/V2/refs/heads/main/BeamedV2FreeLoader"))()
    end,
    SectionParent = MusclesSection
})

MusclesTab:CreateButton({
    Name = "ML V1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2581235867/21/refs/heads/main/By%20Tokattk"))()
    end,
    SectionParent = MusclesSection
})

MusclesTab:CreateButton({
    Name = "KTM (key: KTMx2025)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zapstreams123/KTMHUB/refs/heads/main/PublicVersion"))()
    end,
    SectionParent = MusclesSection
})

-- ==================================================================
-- ABA BLOX FRUITS
-- ==================================================================
local BloxFruitsTab = Window:CreateTab("Blox Fruits", 4483345998)
local BloxFruitsSection = BloxFruitsTab:CreateSection("⚔️ Combat & Farm")

BloxFruitsTab:CreateButton({
    Name = "Speed Hub X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end,
    SectionParent = BloxFruitsSection
})

BloxFruitsTab:CreateButton({
    Name = "Redz Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
    end,
    SectionParent = BloxFruitsSection
})

BloxFruitsTab:CreateButton({
    Name = "Alchemy Hub Beta Edition",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DENGHUB2025/HUGHUB/main/WL", true))()
    end,
    SectionParent = BloxFruitsSection
})

BloxFruitsTab:CreateButton({
    Name = "Cokka Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua"))()
    end,
    SectionParent = BloxFruitsSection
})

-- ==================================================================
-- ABA ROUBE UM BRAINROT
-- ==================================================================
local BrainrotTab = Window:CreateTab("Roube um Brainrot", 4483345998)
local BrainrotSection = BrainrotTab:CreateSection("🧠 Brainrot Farm")

BrainrotTab:CreateButton({
    Name = "Moskvv Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/forkT3/Steal-a-Brianrot/main/Steal-A-Brianrot.lua"))()
    end,
    SectionParent = BrainrotSection
})

BrainrotTab:CreateButton({
    Name = "Fenorik Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fenorik/FenorikHub/refs/heads/main/FenorikHubINIT.lua"))()
    end,
    SectionParent = BrainrotSection
})

BrainrotTab:CreateButton({
    Name = "Nabaru Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
    end,
    SectionParent = BrainrotSection
})

BrainrotTab:CreateButton({
    Name = "oRee Hub",
    Callback = function()
        loadstring(game:HttpGet("https://oreofdev.github.io/Sw1ftSync/Raw/SSXBr/"))()
    end,
    SectionParent = BrainrotSection
})

BrainrotTab:CreateButton({
    Name = "Makal Hub",
    Callback = function()
        local a,b,c=loadstring,(syn and syn.request)or(http and http.request)or(request)or(http_request),assert
        c(a and b,"Executor not Supported")
        a(b({Url="https://makalhub.vercel.app/api/script/loader",Method="GET"}).Body)()
    end,
    SectionParent = BrainrotSection
})

-- ==================================================================
-- ABA GROW A GARDEN
-- ==================================================================
local GrowGardenTab = Window:CreateTab("Grow a Garden", 4483345998)
local GrowGardenSection = GrowGardenTab:CreateSection("🌱 Garden Farm")

GrowGardenTab:CreateButton({
    Name = "Speed Hub X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end,
    SectionParent = GrowGardenSection
})

GrowGardenTab:CreateButton({
    Name = "No-Lag Hub",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV2.lua"))()
    end,
    SectionParent = GrowGardenSection
})

GrowGardenTab:CreateButton({
    Name = "ThunderZ Hub",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua'))()
    end,
    SectionParent = GrowGardenSection
})

GrowGardenTab:CreateButton({
    Name = "Dupe GAG",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/SPIDROSH/Grow-a-Garden/refs/heads/main/DGAG'))()
    end,
    SectionParent = GrowGardenSection
})

GrowGardenTab:CreateButton({
    Name = "Lunor Hub",
    Callback = function()
        loadstring(game:HttpGet('https://lunor.dev/loader'))()
    end,
    SectionParent = GrowGardenSection
})

-- ==================================================================
-- ABA 99 NOITES NA FLORESTA
-- ==================================================================
local NightsTab = Window:CreateTab("99 Noites na Floresta", 4483345998)
local NightsSection = NightsTab:CreateSection("🌲 99 Noites na Floresta Farm")

NightsTab:CreateButton({
    Name = "Fast Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/adibhub1/99-nighit-in-forest/refs/heads/main/99%20night%20in%20forest"))()
    end,
    SectionParent = NightsSection
})

NightsTab:CreateButton({
    Name = "EF Hub",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1craku/Test/refs/heads/main/99%20Nights%20in%20the%20Forest%202"))()
    end,
    SectionParent = NightsSection
})

NightsTab:CreateButton({
    Name = "H4x Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua", true))()
    end,
    SectionParent = NightsSection
})

-- ==================================================================
-- ABA BLUE LOCK RIVAIS
-- ==================================================================
local BlueLockTab = Window:CreateTab("Blue Lock Rivais", 4483345998)
local BlueLockSection = BlueLockTab:CreateSection("⚽ BLR Auto Farm")

BlueLockTab:CreateButton({
    Name = "Alchemy Hub",
    Callback = function()
        loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
    end,
    SectionParent = BlueLockSection
})

-- ==================================================================
-- ABA FORSAKEN
-- ==================================================================
local ForsakenTab = Window:CreateTab("Forsaken", 4483345998)
local ForsakenSection = ForsakenTab:CreateSection("🔪 Forsaken Auto Farm")

ForsakenTab:CreateButton({
    Name = "Funny Hub",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Forsaken-Funny-Hub-V2-42056"))()
    end,
    SectionParent = ForsakenSection
})

-- ==================================================================
-- ABA DEAD RAILS
-- ==================================================================
local DeadRailsTab = Window:CreateTab("Dead Rails", 4483345998)
local DeadRailsSection = DeadRailsTab:CreateSection("💴 Auto Bound")

DeadRailsTab:CreateButton({
    Name = "Tbao Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
    end,
    SectionParent = DeadRailsSection
})

DeadRailsTab:CreateButton({
    Name = "Than Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
    end,
    SectionParent = DeadRailsSection
})

DeadRailsTab:CreateButton({
    Name = "Native Hub",
    Callback = function()
        loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
    end,
    SectionParent = DeadRailsSection
})

DeadRailsTab:CreateButton({
    Name = "Speed Hub X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
    end,
    SectionParent = DeadRailsSection
})

-- ==================================================================
-- ABA ARISE CROSSOVER (Em breve)
-- ==================================================================
local AriseTab = Window:CreateTab("Arise Crossover", 4483345998)
local AriseSection = AriseTab:CreateSection("♟ Arise Crossover - Em breve...")

-- ==================================================================
-- ABA CAR DEALERSHIP TYCOON
-- ==================================================================
local CarDealershipTab = Window:CreateTab("Car Dealership Tycoon", 4483345998)
local CarDealershipSection = CarDealershipTab:CreateSection("🚗 Car Dealership Auto Farm")

CarDealershipTab:CreateButton({
    Name = "Auto Farm - JuninhoOGado",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JuninhoOGado/ScriptsSite/main/Script245"))()
    end,
    SectionParent = CarDealershipSection
})

CarDealershipTab:CreateButton({
    Name = "Norepinefina Hub",
    Callback = function()
        loadstring(game:HttpGet("https://norepinefrina.com"))()
    end,
    SectionParent = CarDealershipSection
})

CarDealershipTab:CreateButton({
    Name = "Auto Race",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Vehicle%20legends"))()
    end,
    SectionParent = CarDealershipSection
})

-- ==================================================================
-- ABA BED WARS
-- ==================================================================
local BedWarsTab = Window:CreateTab("Bed Wars", 4483345998)
local BedWarsSection = BedWarsTab:CreateSection("🛏 Bed Wars - farm")

BedWarsTab:CreateButton({
    Name = "VapeVoid Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua", true))()
    end,
    SectionParent = BedWarsSection
})

-- ==================================================================
-- ABA RACE CLICKER
-- ==================================================================
local RaceClickerTab = Window:CreateTab("Race Clicker", 4483345998)
local RaceClickerSection = RaceClickerTab:CreateSection("🚥 Race clicker Farm")

RaceClickerTab:CreateButton({
    Name = "Auto farm",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/RaceClicker"))()
    end,
    SectionParent = RaceClickerSection
})

-- ==================================================================
-- ABA STAND AWAKENING
-- ==================================================================
local StandAwakeningTab = Window:CreateTab("Stand Awakening", 4483345998)
local StandAwakeningSection = StandAwakeningTab:CreateSection("🕴 Stand Farm")

StandAwakeningTab:CreateButton({
    Name = "Auto farm",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/snowbrkkkk/main/refs/heads/main/Standsawakening"))()
    end,
    SectionParent = StandAwakeningSection
})

Rayfield:LoadConfiguration()
