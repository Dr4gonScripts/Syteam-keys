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
-- FUNÇÕES ADICIONADAS AQUI
-- ==================================================================================================

-- Botão para Walk Speed (16 -> 100)
Section:AddToggle({
	Name = "God Speed (On/Off)",
	Default = false, -- Começa desligado
	Callback = function(Value)
		local character = game.Players.LocalPlayer.Character
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

-- Botão para Jump Power (50 -> 300)
Section:AddToggle({
	Name = "Super Jump (On/Off)",
	Default = false, -- Começa desligado
	Callback = function(Value)
		local character = game.Players.LocalPlayer.Character
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				if Value then
					-- Se o botão estiver LIGADO
					humanoid.JumpPower = 500
				else
					-- Se o botão estiver DESLIGADO, volta ao pulo normal
					humanoid.JumpPower = 50
				end
			end
		end
	end
})

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
		local character = game.Players.LocalPlayer.Character
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
			aimbotLoopConnection = game:GetService("RunService").RenderStepped:Connect(function()
				-- >>> COLOQUE SUA LÓGICA DE AIMBOT AQUI <<<
				-- Você precisa encontrar o inimigo mais próximo e ajustar a CFrame da sua câmera ou arma.
				-- Esta é uma lógica complexa que depende do jogo.
				-- Exemplo: CFrame.new(player.Character.Head.Position, target.Character.Head.Position)
			end)
		else
			-- Se o botão estiver DESLIGADO, para o loop de mira
			print("Aimbot: OFF")
			if aimbotLoopConnection then
				aimbotLoopConnection:Disconnect()
				aimbotLoopConnection = nil
			end
		end
	end
})


-- Botão para ESP (Ver jogadores através das paredes)
local espLoopConnection = nil
local espGuiContainer = Instance.new("ScreenGui")
espGuiContainer.Name = "ESPGui"
espGuiContainer.Parent = game:GetService("CoreGui")

UtilitySection:AddToggle({
	Name = "ESP",
	Default = false, -- Começa desligado
	Callback = function(Value)
		if Value then
			-- Se o botão estiver LIGADO, inicia o loop de ESP
			print("ESP: ON")
			espLoopConnection = game:GetService("RunService").RenderStepped:Connect(function()
				-- >>> COLOQUE SUA LÓGICA DE ESP AQUI <<<
				-- Você precisa criar caixas 2D, linhas ou texto para cada jogador e atualizá-los a cada frame.
				-- Isso envolve WorldToViewportPoint e cálculos de posição.
				-- Exemplo: for _, player in pairs(game.Players:GetPlayers()) do ... end
			end)
		else
			-- Se o botão estiver DESLIGADO, para o loop e destrói o GUI
			print("ESP: OFF")
			if espLoopConnection then
				espLoopConnection:Disconnect()
				espLoopConnection = nil
			end
			-- Destrói todos os elementos visuais do ESP
			for _, child in ipairs(espGuiContainer:GetChildren()) do
				child:Destroy()
			end
		end
	end
})

-- Botão para mudar o FOV (Campo de Visão)
UtilitySection:AddToggle({
	Name = "FOV Changer",
	Default = false, -- Começa desligado
	Callback = function(Value)
		local camera = game.Workspace.CurrentCamera
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

-- ==================================================================================================
-- FIM DAS FUNÇÕES
-- ==================================================================================================

OrionLib:MakeNotification({
	Name = "D4gon Hub",
	Content = "carregando...",
	Image = "rbxassetid://4483345998",
	Time = 5
})

OrionLib:Init()
