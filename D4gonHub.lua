-- ==================================================================================================
-- INICIALIZAÇÃO DA BIBLIOTECA VAPE V4
-- ==================================================================================================
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/79493649/vape/main/source.lua"))()

local window = library:create_window("D4gon Hub - @draknessxz - discord")

local main_tab = window:create_tab("Main")

local main_section = main_tab:create_section("🔒 Main Hub")

-- ==================================================================================================
-- FUNÇÕES NA SEÇÃO MAIN HUB
-- ==================================================================================================

-- Botão para Walk Speed (16 -> 100)
main_section:create_toggle({
    name = "God Speed (On/Off)",
    flag = "god_speed",
    value = false,
    callback = function(Value)
        local character = game:GetService("Players").LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if Value then
                    -- Se o botão estiver LIGADO
                    humanoid.WalkSpeed = 100
                else
                    -- Se o botão estiver DESLIGADO, volta à velocidade normal
                    humanoid.WalkSpeed = 16
                end
            end
        end
    end
})

-- ==================================================================================================
-- CÓDIGO DO AIMBOT INTEGRADO AQUI
-- ==================================================================================================
-- Variáveis e configurações do script de Aimbot
local fov = 100 -- O raio do círculo FOV. Ajuste este valor.
local maxTransparency = 0.1 -- Transparência máxima dentro do círculo (0.1 = 10%)
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Cam = game.Workspace.CurrentCamera

-- Cria o círculo visual do FOV
local FOVring = Drawing.new("Circle")
FOVring.Visible = false -- Começa invisível
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(128, 0, 128) -- Cor roxa
FOVring.Filled = false
FOVring.Radius = fov

-- Função para atualizar a posição do círculo na tela
local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end

-- Função para calcular a transparência do círculo
local function calculateTransparency(distance)
    local maxDistance = fov
    local transparency = (1 - (distance / maxDistance)) * maxTransparency
    return transparency
end

-- Função para mirar na posição do alvo
local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

-- Função para encontrar o jogador mais próximo dentro do FOV
local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local playerMousePos = Cam.ViewportSize / 2

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local part = player.Character and player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = player
                end
            end
        end
    end

    return nearest
end
-- ==================================================================================================
-- FIM DO CÓDIGO DO AIMBOT
-- ==================================================================================================


-- Cria uma nova seção para organizar os botões de utilidade
local utility_section = main_tab:create_section("⚙️ Combat & Utility")

-- Variável para manter o estado do Noclip, mesmo ao morrer
local isNoclipEnabled = false
local noclipConnection = nil

-- Função que aplica o Noclip
local function applyNoclip(char)
    if char and isNoclipEnabled then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end

-- Conecta a função ao evento de carregamento do personagem
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5) -- Espera um pouco para o personagem carregar
    applyNoclip(char)
end)

-- Botão para Noclip (Atravessar paredes)
utility_section:create_toggle({
    name = "Noclip",
    flag = "noclip_toggle",
    value = false,
    callback = function(Value)
        local character = game:GetService("Players").LocalPlayer.Character
        isNoclipEnabled = Value -- Atualiza o estado global
        if character then
            if Value then
                -- Se o botão estiver LIGADO
                applyNoclip(character)
            else
                -- Se o botão estiver DESLIGADO, volta à colisão normal
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
})

-- Botão para Aimbot
local aimbotLoopConnection = nil
utility_section:create_toggle({
    name = "Aimbot",
    flag = "aimbot_toggle",
    value = false,
    callback = function(Value)
        if Value then
            -- Se o botão estiver LIGADO, inicia o loop de mira
            print("Aimbot: ON")
            FOVring.Visible = true -- Torna o círculo FOV visível
            -- Conecta a função de mira e desenho ao RenderStepped
            aimbotLoopConnection = RunService.RenderStepped:Connect(function()
                updateDrawings()
                local closest = getClosestPlayerInFOV("Head")
                if closest and closest.Character:FindFirstChild("Head") then
                    lookAt(closest.Character.Head.Position)
                end
                
                if closest then
                    local ePos, isVisible = Cam:WorldToViewportPoint(closest.Character.Head.Position)
                    local distance = (Vector2.new(ePos.x, ePos.y) - (Cam.ViewportSize / 2)).Magnitude
                    FOVring.Transparency = calculateTransparency(distance)
                else
                    FOVring.Transparency = maxTransparency -- Mantenha a transparência máxima quando não houver alvo
                end
            end)
        else
            -- Se o botão estiver DESLIGADO, para o loop de mira
            print("Aimbot: OFF")
            FOVring.Visible = false -- Torna o círculo FOV invisível
            if aimbotLoopConnection then
                aimbotLoopConnection:Disconnect()
                aimbotLoopConnection = nil
            end
        end
    end
})


-- Botão para ESP (Executa um script externo)
-- *** ESTE BOTÃO SUBSTITUIU O BOTÃO DE ESP ANTERIOR ***
utility_section:create_button({
    name = "Execute ESP (Link Externo)",
    callback = function()
        -- AVISO: Execute scripts de fontes desconhecidas por sua conta e risco.
        print("Executando script de ESP do GitHub...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wa0101/Roblox-ESP/refs/heads/main/esp.lua",true))()
    end
})


-- Botão para mudar o FOV (Campo de Visão)
utility_section:create_toggle({
    name = "FOV Changer",
    flag = "fov_changer",
    value = false,
    callback = function(Value)
        local camera = game:GetService("Workspace").CurrentCamera
        if camera then
            if Value then
                -- Se o botão estiver LIGADO, muda o FOV
                camera.FieldOfView = 120 -- Valor alto para uma visão ampla
            else
                -- Se o botão estiver DESLIGADO, volta ao FOV normal
                camera.FieldOfView = 70 -- Valor padrão do Roblox
            end
        end
    end
})


-- Novos botões de utilidade
-- ==================================================================================================
-- NOVOS BOTÕES NA SEÇÃO 'COMBAT & UTILITY'
-- ==================================================================================================

-- Botão para Fly Universal
utility_section:create_button({
    name = "Fly Universal",
    callback = function()
        print("Executando script de Fly Universal...")
        loadstring(game:HttpGet("https://pastebin.com/raw/xuSMWfDu"))()
    end
})

-- Botão para TP Universal
utility_section:create_button({
    name = "TP Universal",
    callback = function()
        print("Executando script de TP Universal...")
        loadstring(game:HttpGet("https://pastebin.com/raw/AbDM2er1"))()
    end
})

-- Botão para Anti Afk
utility_section:create_button({
    name = "Anti Afk",
    callback = function()
        print("Executando script de Anti Afk...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KazeOnTop/Rice-Anti-Afk/main/Wind", true))()
    end
})


utility_section:create_button({
    name = "Rejoin",
    callback = function()
        print("Reiniciando o jogador para tentar um rejoin...")
        -- Reinicia o jogador, o que geralmente força um rejoin no mesmo servidor
        game:GetService("Players").LocalPlayer:LoadCharacter()
    end
})

-- ==================================================================================================
-- ABA MUSCLES LEGENDS
-- ==================================================================================================

local MusclesLegendsTab = window:create_tab("Muscles Legends")

local AutoFarmSection = MusclesLegendsTab:create_section("🦾 Auto Farm")

AutoFarmSection:create_button({
    name = "Speed Hub X",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

AutoFarmSection:create_button({
    name = "Beamed V2 (key: Benishot )",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ben1x1x1x1x/V2/refs/heads/main/BeamedV2FreeLoader"))()
    end
})

AutoFarmSection:create_button({
    name = "ML V1",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2581235867/21/refs/heads/main/By%20Tokattk"))()
    end
})

AutoFarmSection:create_button({
    name = "KTM (key: KTMx2025 )",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zapstreams123/KTMHUB/refs/heads/main/PublicVersion"))()
    end
})

-- ==================================================================================================
-- BLOX FRUITS ABA
-- ==================================================================================================

local BloxFruitsTab = window:create_tab("Blox Fruits")

local BFSection = BloxFruitsTab:create_section("⚔️ Combat & Farm")

BFSection:create_button({
    name = "Speed Hub X",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

BFSection:create_button({
    name = "Redz Hub",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
    end
})

BFSection:create_button({
    name = "Alchemy Hub Beta Edition",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DENGHUB2025/HUGHUB/main/WL", true))()
    end
})

BFSection:create_button({
    name = "Cokka Hub",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua")()
    end
})

-- ==================================================================================================
-- ABA ROUBE UM BRAINROT
-- ==================================================================================================

local StealABrainrotTab = window:create_tab("Roube um Brainrot")

local BrainrotSection = StealABrainrotTab:create_section("🧠 Brainrot Farm")

BrainrotSection:create_button({
    name = "Moskvv Hub",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/forkT3/Steal-a-Brianrot/main/Steal-A-Brianrot.lua"))()
    end
})

BrainrotSection:create_button({
    name = "Fenorik HUb",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fenorik/FenorikHub/refs/heads/main/FenorikHubINIT.lua"))()
    end
})

BrainrotSection:create_button({
    name = "Nabaru Hub",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
    end
})


-- ==================================================================================================
-- ABA GROW A GARDEN
-- ==================================================================================================

local GrowGardenTab = window:create_tab("Grow a Garden")

local GGSection = GrowGardenTab:create_section("🌱 Garden Farm")

GGSection:create_button({
    name = "Speed Hub X",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

GGSection:create_button({
    name = "No-Lag Hub",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV2.lua"))()
    end
})

GGSection:create_button({
    name = "ThunderZ Hub",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua'))()
    end
})

GGSection:create_button({
    name = "Dupe GAG",
    callback = function()
        print("Executando script...")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/SPIDROSH/Grow-a-Garden/refs/heads/main/DGAG'))()
    end
})

-- ==================================================================================================
-- PARTE DE FINALIZAR
-- ==================================================================================================

library:init()
