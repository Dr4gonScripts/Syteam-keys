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

-- ABA PRINCIPAL
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

        Rayfield:Notify({Title = "Fly Ativado", Content = "Use W, A, S, D e Espaço", Duration = 5})
    end
})

MainSection:CreateButton({
    Name = "Resetar Personagem",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
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

MusclesSection:CreateButton({
    Name = "ML V1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2581235867/21/refs/heads/main/By%20Tokattk"))()
    end
})

MusclesSection:CreateButton({
    Name = "KTM (key: KTMx2025)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zapstreams123/KTMHUB/refs/heads/main/PublicVersion"))()
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

BloxFruitsSection:CreateButton({
    Name = "Alchemy Hub Beta Edition",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DENGHUB2025/HUGHUB/main/WL", true))()
    end
})

BloxFruitsSection:CreateButton({
    Name = "Cokka Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua"))()
    end
})

-- ABA ROUBE UM BRAINROT
local BrainrotTab = Window:CreateTab("Roube um Brainrot", 4483362458)
local BrainrotSection = BrainrotTab:CreateSection("🧠 Brainrot Farm")

BrainrotSection:CreateButton({
    Name = "Moskvv Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/forkT3/Steal-a-Brianrot/main/Steal-A-Brianrot.lua"))()
    end
})

BrainrotSection:CreateButton({
    Name = "Fenorik HUb",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fenorik/FenorikHub/refs/heads/main/FenorikHubINIT.lua"))()
    end
})

BrainrotSection:CreateButton({
    Name = "Nabaru Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
    end
})

BrainrotSection:CreateButton({
    Name = "oRee Hub",
    Callback = function()
        loadstring(game:HttpGet("https://oreofdev.github.io/Sw1ftSync/Raw/SSXBr/"))()
    end
})

BrainrotSection:CreateButton({
    Name = "Makal Hub",
    Callback = function()
        local a,b,c=loadstring,(syn and syn.request)or(http and http.request)or(request)or(http_request),assert
        c(a and b,"Executor not Supported")
        a(b({Url="https://makalhub.vercel.app/api/script/loader",Method="GET"}).Body)()
    end
})

-- ABA GROW A GARDEN
local GrowGardenTab = Window:CreateTab("Grow a Garden", 4483362458)
local GrowGardenSection = GrowGardenTab:CreateSection("🌱 Garden Farm")

GrowGardenSection:CreateButton({
    Name = "Speed Hub X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

GrowGardenSection:CreateButton({
    Name = "No-Lag Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV2.lua"))()
    end
})

GrowGardenSection:CreateButton({
    Name = "ThunderZ Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua"))()
    end
})

GrowGardenSection:CreateButton({
    Name = "Dupe GAG",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SPIDROSH/Grow-a-Garden/refs/heads/main/DGAG"))()
    end
})

GrowGardenSection:CreateButton({
    Name = "Lunor Hub",
    Callback = function()
        loadstring(game:HttpGet("https://lunor.dev/loader"))()
    end
})

-- ABA 99 NOITES EM UMA FLORESTA
local NightForestTab = Window:CreateTab("99 Noites na Floresta", 4483362458)
local NightForestSection = NightForestTab:CreateSection("🌲 99 Noites na Floresta Farm")

NightForestSection:CreateButton({
    Name = "Fast Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/adibhub1/99-nighit-in-forest/refs/heads/main/99%20night%20in%20forest"))()
    end
})

NightForestSection:CreateButton({
    Name = "EF Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1craku/Test/refs/heads/main/99%20Nights%20in%20the%20Forest%202"))()
    end
})

NightForestSection:CreateButton({
    Name = "H4x Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua", true))()
    end
})

-- ABA BLUE LOCK RIVAIS
local BlueLockTab = Window:CreateTab("Blue Lock Rivais", 4483362458)
local BlueLockSection = BlueLockTab:CreateSection("⚽ BLR Auto Farm")

BlueLockSection:CreateButton({
    Name = "Alchemy Hub",
    Callback = function()
        loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
    end
})

-- ABA FORSAKEN
local ForsakenTab = Window:CreateTab("Forsaken", 4483362458)
local ForsakenSection = ForsakenTab:CreateSection("🔪 Forsaken Auto Farm")

ForsakenSection:CreateButton({
    Name = "Funny Hub",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Forsaken-Funny-Hub-V2-42056"))()
    end
})

-- ABA DEAD RAILS
local DeadRailsTab = Window:CreateTab("Dead Rails", 4483362458)
local DeadRailsSection = DeadRailsTab:CreateSection("💴 Auto Bound")

DeadRailsSection:CreateButton({
    Name = "Tbao Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
    end
})

DeadRailsSection:CreateButton({
    Name = "Than Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
    end
})

DeadRailsSection:CreateButton({
    Name = "Native Hub",
    Callback = function()
        loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
    end
})

DeadRailsSection:CreateButton({
    Name = "Speed Hub X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
    end
})

-- ABA ARISE CROSSOVER
local AriseTab = Window:CreateTab("Arise Crossover", 4483362458)
local AriseSection = AriseTab:CreateSection("♟ Arise Crossover - Em breve...")

-- ABA CAR DEALERSHIP TYCOON
local CarDealershipTab = Window:CreateTab("Car Dealership Tycoon", 4483362458)
local CarDealershipSection = CarDealershipTab:CreateSection("🚗 Car Dealership Auto Farm")

CarDealershipSection:CreateButton({
    Name = "Auto Farm - JuninhoOGado",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JuninhoOGado/ScriptsSite/main/Script245"))()
    end
})

CarDealershipSection:CreateButton({
    Name = "Norepinefina Hub",
    Callback = function()
        loadstring(game:HttpGet("https://norepinefrina.com"))()
    end
})

CarDealershipSection:CreateButton({
    Name = "Auto Race",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Vehicle%20legends"))()
    end
})

-- ABA BED WARS
local BedWarsTab = Window:CreateTab("Bed Wars", 4483362458)
local BedWarsSection = BedWarsTab:CreateSection("🛏 Bed Wars - farm")

BedWarsSection:CreateButton({
    Name = "VapeVoid Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua", true))()
    end
})

-- ABA RACE CLICKER
local RaceClickerTab = Window:CreateTab("Race Clicker", 4483362458)
local RaceClickerSection = RaceClickerTab:CreateSection("🚥 Race clicker Farm")

RaceClickerSection:CreateButton({
    Name = "Auto farm",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/RaceClicker"))()
    end
})

-- ABA STAND AWAKENING
local StandAwakeningTab = Window:CreateTab("Stand Awakening", 4483362458)
local StandAwakeningSection = StandAwakeningTab:CreateSection("🕴 Stand Farm")

StandAwakeningSection:CreateButton({
    Name = "Auto farm",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/snowbrkkkk/main/refs/heads/main/Standsawakening"))()
    end
})

Rayfield:LoadConfiguration()
