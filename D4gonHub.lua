ocal OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

local Window = OrionLib:MakeWindow({Name = "D4gon Hub - @draknessxz - discord", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "🔒 Main Hub"
})

-- Botão para Walk Speed (16 -> 100)
Section:AddToggle({
    Name = "God Speed (On/Off)",
    Default = false,
    Callback = function(Value)
        local character = game:GetService("Players").LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if Value then
                    humanoid.WalkSpeed = 100
                else
                    humanoid.WalkSpeed = 16
                end
            end
        end
    end
})

-- ==================================================================================================
-- ABA MUSCLES LEGENDS
-- ==================================================================================================

local MusclesLegendsTab = Window:MakeTab({
    Name = "Muscles Legends",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local AutoFarmSection = MusclesLegendsTab:AddSection({
    Name = "🦾 Auto Farm"
})

AutoFarmSection:AddButton({
    Name = "Speed Hub X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

AutoFarmSection:AddButton({
    Name = "Beamed V2 (key: Benishot)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ben1x1x1x1x/V2/refs/heads/main/BeamedV2FreeLoader"))()
    end
})

AutoFarmSection:AddButton({
    Name = "ML V1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2581235867/21/refs/heads/main/By%20Tokattk"))()
    end
})

AutoFarmSection:AddButton({
    Name = "KTM (key: KTMx2025)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zapstreams123/KTMHUB/refs/heads/main/PublicVersion"))()
    end
})

-- ==================================================================================================
-- BLOX FRUITS ABA
-- ==================================================================================================

local BloxFruitsTab = Window:MakeTab({
    Name = "Blox Fruits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local BFSection = BloxFruitsTab:AddSection({
    Name = "⚔️ Combat & Farm"
})

BFSection:AddButton({
    Name = "Speed Hub X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

BFSection:AddButton({
    Name = "Redz Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
    end
})

BFSection:AddButton({
    Name = "Alchemy Hub Beta Edition",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DENGHUB2025/HUGHUB/main/WL", true))()
    end
})

BFSection:AddButton({
    Name = "Cokka Hub",
    Callback = function()
        loadstring(game:HttpGet"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua")()
    end
})

-- ==================================================================================================
-- ABA ROUBE UM BRAINROT
-- ==================================================================================================

local StealABrainrotTab = Window:MakeTab({
    Name = "Roube um Brainrot",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local BrainrotSection = StealABrainrotTab:AddSection({
    Name = "🧠 Brainrot Farm"
})

BrainrotSection:AddButton({
    Name = "Moskvv Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/forkT3/Steal-a-Brianrot/main/Steal-A-Brianrot.lua"))()
    end
})

BrainrotSection:AddButton({
    Name = "Fenorik HUb",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fenorik/FenorikHub/refs/heads/main/FenorikHubINIT.lua"))()
    end
})

BrainrotSection:AddButton({
    Name = "Nabaru Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
    end
})

BrainrotSection:AddButton({
    Name = "oRee Hub",
    Callback = function()
        loadstring(game:HttpGet("https://oreofdev.github.io/Sw1ftSync/Raw/SSXBr/"))()
    end
})

BrainrotSection:AddButton({
    Name = "Makal Hub",
    Callback = function()
        local a,b,c=loadstring,(syn and syn.request)or(http and http.request)or(request)or(http_request),assert
        c(a and b,"Executor not Supported")
        a(b({Url="https://makalhub.vercel.app/api/script/loader",Method="GET"}).Body)()
    end
})

-- ==================================================================================================
-- Iniciar
-- ==================================================================================================

OrionLib:MakeNotification({
    Name = "D4gon Hub",
    Content = "carregando...",
    Image = "rbxassetid://4483345998",
    Time = 5
})

OrionLib:Init()
