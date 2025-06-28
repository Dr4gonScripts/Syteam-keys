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
-- INÍCIO DA LÓGICA DO SUPER JUMP (CÓDIGO OTIMIZADO)
-- ==================================================================================================

-- Obtém o serviço de jogadores e o jogador local
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Cria uma variável para armazenar o estado do super pulo
local superJumpEnabled = false

-- Função para atualizar o JumpPower do personagem.
-- Esta função pode ser chamada a qualquer momento para aplicar o pulo.
local function updateJumpPower()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if superJumpEnabled then
                -- Se o super pulo estiver LIGADO, define o JumpPower para 300
                humanoid.JumpPower = 300
            else
                -- Se estiver DESLIGADO, volta ao JumpPower padrão de 50
                humanoid.JumpPower = 50
            end
        end
    end
end

-- Conecta a função de atualização ao evento CharacterAdded.
-- Isso é CRUCIAL! Garante que o super pulo seja aplicado toda vez que o jogador
-- renascer, pois um novo personagem é criado.
LocalPlayer.CharacterAdded:Connect(function(character)
    -- Espera que o Humanoid carregue para evitar erros
    character:WaitForChild("Humanoid")
    -- Aplica o JumpPower com base no estado atual do botão
    updateJumpPower()
end)

-- Se o personagem já estiver no jogo quando o script carregar,
-- aplique o JumpPower inicial (que é o padrão de 50).
if LocalPlayer.Character then
    updateJumpPower()
end

-- ==================================================================================================
-- FIM DA LÓGICA DO SUPER JUMP
-- ==================================================================================================


-- ==================================================================================================
-- BARRA DE PESQUISA COM LÓGICA DE FILTRAGEM
-- ==================================================================================================
local function filterAllSections(tab, searchText)
    local hasSearchText = #searchText > 0
    local lowerSearchText = string.lower(searchText)
    
    task.spawn(function()
        for _, sectionFrame in ipairs(tab.Frame:GetChildren()) do
            if sectionFrame:IsA("Frame") and sectionFrame.Name == "Section" and sectionFrame:FindFirstChild("Frame") then
                for _, item in ipairs(sectionFrame.Frame:GetChildren()) do
                    if item:IsA("Frame") and item:FindFirstChild("NameLabel") then
                        local nameLabel = item.NameLabel
                        local itemName = string.lower(nameLabel.Text)
                        
                        if not hasSearchText then
                            item.Visible = true
                        else
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

Section:AddTextbox({
	Name = "Pesquisar",
	Default = "",
	Callback = function(text)
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

-- Botão para Jump Power (50 -> 300) - AGORA USANDO A LÓGICA OTIMIZADA!
Section:AddToggle({
	Name = "Super Jump (On/Off)",
	Default = false,
	Callback = function(Value)
        -- Apenas atualiza o estado e chama a função de atualização.
        -- O evento CharacterAdded já está conectado no início do script.
		superJumpEnabled = Value
        updateJumpPower()
	end
})

-- ==================================================================================================
-- CÓDIGO DO AIMBOT INTEGRADO AQUI
-- ==================================================================================================
-- Variáveis e configurações do script de Aimbot
local fov = 100 -- O raio do círculo FOV. Ajuste este valor.
local maxTransparency = 0.1 -- Transparência máxima dentro do círculo (0.1 = 10%)
local RunService = game:GetService("RunService")
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
	Default = false,
	Callback = function(Value)
		if Value then
			print("Aimbot: ON")
            FOVring.Visible = true
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
                    FOVring.Transparency = maxTransparency
                end
            end)
		else
			print("Aimbot: OFF")
            FOVring.Visible = false
			if aimbotLoopConnection then
				aimbotLoopConnection:Disconnect()
				aimbotLoopConnection = nil
			end
		end
	end
})


-- Botão para ESP (Executa um script externo)
UtilitySection:AddButton({
	Name = "Execute ESP (Link Externo)",
	Callback = function()
		print("Executando script de ESP do GitHub...")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/wa0101/Roblox-ESP/refs/heads/main/esp.lua",true))()
	end
})


-- Botão para mudar o FOV (Campo de Visão)
UtilitySection:AddToggle({
	Name = "FOV Changer",
	Default = false,
	Callback = function(Value)
		local camera = game:GetService("Workspace").CurrentCamera
		if camera then
			if Value then
				camera.FieldOfView = 120
			else
				camera.FieldOfView = 70
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


UtilitySection:AddButton({
	Name = "Rejoin",
	Callback = function()
		print("Tentando rejoin...")
		-- Usa o TeleportService para teleportar o jogador de volta ao mesmo lugar,
		-- o que força uma nova conexão com o servidor.
        local TeleportService = game:GetService("TeleportService")
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
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
	Icon = "rbxassetid://4483345998",
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
	Icon = "rbxassetid://4483345998",
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
	Icon = "rbxassetid://4483345998",
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
