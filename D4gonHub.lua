-- ==================================================================================================
-- INICIALIZAÇÃO DA BIBLIOTECA ORION
-- ==================================================================================================
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "D4gon Hub - @draknessxz - discord", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "🔒 Main Hub"
})

-- ==================================================================================================
-- BARRA DE PESQUISA COM LÓGICA DE FILTRAGEM (CÓDIGO EXISTENTE)
-- ==================================================================================================

-- Esta função percorre todas as seções de uma aba e filtra seus elementos
local function filterAllSections(tab, searchText)
    local hasSearchText = #searchText > 0
    local lowerSearchText = string.lower(searchText)
    
    -- task.spawn é usado para evitar travar a UI durante a filtragem
    task.spawn(function()
        -- Percorre todos os filhos da aba (Tab) para encontrar as seções
        for _, sectionFrame in ipairs(tab.Frame:GetChildren()) do
            -- Verifica se o Frame é uma seção de elementos (Section)
            if sectionFrame:IsA("Frame") and sectionFrame.Name == "Section" and sectionFrame:FindFirstChild("Frame") then
                -- Percorre os elementos dentro da seção
                for _, item in ipairs(sectionFrame.Frame:GetChildren()) do
                    -- Verifica se o elemento tem um rótulo de nome para filtrar
                    if item:IsA("Frame") and item:FindFirstChild("NameLabel") then
                        local nameLabel = item.NameLabel
                        local itemName = string.lower(nameLabel.Text)
                        
                        -- Se a caixa de pesquisa estiver vazia, mostre todos os elementos
                        if not hasSearchText then
                            item.Visible = true
                        else
                            -- Caso contrário, mostre apenas se o nome contiver o texto pesquisado
                            if string.find(itemName, lowerSearchText, 1, true) then
                                item.Visible = true
                            else
                                item.Visible = false
                            end
                        end
                    end
                end
            end
        end
    end)
end

-- A barra de pesquisa é adicionada como o primeiro elemento da seção Main Hub
Section:AddTextbox({
	Name = "Pesquisar",
	Default = "", -- Texto padrão vazio
	-- A função Callback é executada toda vez que o texto na caixa de pesquisa muda
	Callback = function(text)
		-- Chama a função de filtro para a aba "Main"
		filterAllSections(Tab, text)
	end
})
-- ==================================================================================================
-- FIM DO CÓDIGO DA BARRA DE PESQUISA
-- ==================================================================================================


-- ==================================================================================================
-- FUNÇÕES ABAIXO DA BARRA DE PESQUISA
-- ==================================================================================================

-- Botão para Walk Speed (16 -> 100)
Section:AddToggle({
	Name = "God Speed (On/Off)",
	Default = false, -- Começa desligado
	Callback = function(Value)
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
-- COLOQUE O CÓDIGO DO SUPER JUMP AQUI, DEPOIS DA SEÇÃO 'Main Hub'
-- ==================================================================================================

-- Botão para Jump Power (50 -> 300) - Versão simples e direta
Section:AddToggle({
	Name = "Super Jump (On/Off)",
	Default = false, -- Começa desligado
	Callback = function(Value)
		local character = game:GetService("Players").LocalPlayer.Character
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				if Value then
					-- Se o botão estiver LIGADO
					humanoid.JumpPower = 300
				else
					-- Se o botão estiver DESLIGADO, volta ao pulo normal
					humanoid.JumpPower = 50
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
local function updateDrawsings()
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
local UtilitySection = Tab:AddSection({
	Name = "⚙️ Combat & Utility"
})

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
UtilitySection:AddToggle({
	Name = "Noclip",
	Default = false, -- Começa desligado
	Callback = function(Value)
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
UtilitySection:AddToggle({
	Name = "Aimbot",
	Default = false, -- Começa desligado
	Callback = function(Value)
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
UtilitySection:AddButton({
	Name = "Execute ESP (Link Externo)",
	Callback = function()
		-- AVISO: Execute scripts de fontes desconhecidas por sua conta e risco.
		print("Executando script de ESP do GitHub...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/wa0101/Roblox-ESP/refs/heads/main/esp.lua",true))()
	end
})


-- Botão para mudar o FOV (Campo de Visão)
UtilitySection:AddToggle({
	Name = "FOV Changer",
	Default = false, -- Começa desligado
	Callback = function(Value)
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
UtilitySection:AddButton({
	Name = "Fly Universal",
	Callback = function()
		print("Executando script de Fly Universal...")
		loadstring(game:HttpGet("https://pastebin.com/raw/xuSMWfDu"))()
	end
})

-- Botão para TP Universal
UtilitySection:AddButton({
	Name = "TP Universal",
	Callback = function()
		print("Executando script de TP Universal...")
		loadstring(game:HttpGet("https://pastebin.com/raw/AbDM2er1"))()
	end
})

-- Botão para Anti Afk
UtilitySection:AddButton({
	Name = "Anti Afk",
	Callback = function()
		print("Executando script de Anti Afk...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/KazeOnTop/Rice-Anti-Afk/main/Wind", true))()
	end
})


-- Botão de Rejoin (versão otimizada)
UtilitySection:AddButton({
	Name = "Rejoin",
	Callback = function()
		print("Teleportando para rejoin...")
		local TeleportService = game:GetService("TeleportService")
		local LocalPlayer = game:GetService("Players").LocalPlayer
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end
})

-- ==================================================================================================
-- ABA MUSCLES LEGENDS
-- ==================================================================================================

local MusclesLegendsTab = Window:MakeTab({
	Name = "Muscles Legends",
	Icon = "rbxassetid://4483345998", -- Ícone de bíceps
	PremiumOnly = false
})

local AutoFarmSection = MusclesLegendsTab:AddSection({
	Name = "🦾 Auto Farm"
})

AutoFarmSection:AddButton({
	Name = "Speed Hub X",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
	end
})

AutoFarmSection:AddButton({
	Name = "Beamed V2 (key: Benishot )",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ben1x1x1x1x/V2/refs/heads/main/BeamedV2FreeLoader"))()
	end
})

AutoFarmSection:AddButton({
	Name = "ML V1",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/2581235867/21/refs/heads/main/By%20Tokattk"))()
	end
})

AutoFarmSection:AddButton({
	Name = "KTM (key: KTMx2025 )",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/zapstreams123/KTMHUB/refs/heads/main/PublicVersion"))()
	end
})

-- ==================================================================================================
-- BLOX FRUITS ABA
-- ==================================================================================================

local BloxFruitsTab = Window:MakeTab({
	Name = "Blox Fruits",
	Icon = "rbxassetid://4483345998", -- Ícone de uma fruta
	PremiumOnly = false
})

local BFSection = BloxFruitsTab:AddSection({
	Name = "⚔️ Combat & Farm"
})

BFSection:AddButton({
	Name = "Speed Hub X",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
	end
})

BFSection:AddButton({
	Name = "Redz Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
	end
})

BFSection:AddButton({
	Name = "Alchemy Hub Beta Edition",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/DENGHUB2025/HUGHUB/main/WL", true))()
	end
})

BFSection:AddButton({
	Name = "Cokka Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua")()
	end
})

-- ==================================================================================================
-- ABA ROUBE UM BRAINROT
-- ==================================================================================================

local StealABrainrotTab = Window:MakeTab({
	Name = "Roube um Brainrot",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local BrainrotSection = StealABrainrotTab:AddSection({
	Name = "🧠 Brainrot Farm"
})

BrainrotSection:AddButton({
	Name = "Moskvv Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/forkT3/Steal-a-Brianrot/main/Steal-A-Brianrot.lua"))()
	end
})

BrainrotSection:AddButton({
	Name = "Fenorik HUb",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Fenorik/FenorikHub/refs/heads/main/FenorikHubINIT.lua"))()
	end
})

BrainrotSection:AddButton({
	Name = "Nabaru Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
	end
})


-- ==================================================================================================
-- ABA GROW A GARDEN
-- ==================================================================================================

local GrowGardenTab = Window:MakeTab({
	Name = "Grow a Garden",
	Icon = "rbxassetid://4483345998", -- Ícone de cérebro com engrenagens
	PremiumOnly = false
})

local GGSection = GrowGardenTab:AddSection({
	Name = "🌱 Garden Farm"
})

GGSection:AddButton({
	Name = "Speed Hub X",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
	end
})

GGSection:AddButton({
	Name = "No-Lag Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV2.lua"))()
	end
})

GGSection:AddButton({
	Name = "ThunderZ Hub",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua'))()
	end
})

GGSection:AddButton({
	Name = "Dupe GAG",
	Callback = function()
		print("Executando script...")
		loadstring(game:HttpGet('https://raw.githubusercontent.com/SPIDROSH/Grow-a-Garden/refs/heads/main/DGAG'))()
	end
})


-- ==================================================================================================
-- PARTE DE INICIAR
-- ==================================================================================================

OrionLib:MakeNotification({
	Name = "D4gon Hub",
	Content = "carregando...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

OrionLib:Init()
