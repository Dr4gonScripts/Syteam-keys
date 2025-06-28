-- ==================================================================================================
-- INÍCIO DO CARREGADOR DA BIBLIOTECA ORION
-- ==================================================================================================

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

-- ==================================================================================================
-- FIM DO CARREGADOR DA BIBLIOTECA ORION
-- ==================================================================================================


--- INÍCIO DO SEU CÓDIGO (ADAPTADO PARA ORION) ---

-- Câmera local e serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera

-- Variáveis para os sistemas de controle
local isSpectating = false
local spectateConnection = nil
local originalCameraType = Camera.CameraType
local isESP_Enabled = false
local isAimbot_Enabled = false
local isNoclip_Enabled = false
local noclipConnection = nil

-- Cria a janela principal da UI "D4gon UI"
local Window = OrionLib:MakeWindow({
    Name = "D4gon UI",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroText = "Hub com inúmeras funções."
})

-- Define a tecla de toggle para abrir/fechar a UI
OrionLib:SetToggleKey(Enum.KeyCode.P) -- Pressione a tecla 'P' para mostrar/esconder a UI

-- Cria a aba "Main"
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://2549575201",
	PremiumOnly = false
})

-- Notificação de que a UI está carregando (usando 'Title' conforme a documentação)
OrionLib:MakeNotification({
	Title = "D4gon Hub",
	Content = "Hub carregado! Pressione 'P' para abrir.",
	Image = "rbxassetid://4483345998",
	Time = 10
})

--- Funções de Movimento ---
local MovementSection = Tab:AddSection({ Name = "Movimento" })

MovementSection:AddSlider({
    Name = "Walk Speed",
    Min = 0,
    Max = 500,
    Default = 16,
    Increment = 1, -- Usando 'Increment' conforme a documentação
    Callback = function(value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})

MovementSection:AddSlider({
    Name = "Jump Power",
    Min = 0,
    Max = 500,
    Default = 50,
    Increment = 1, -- Usando 'Increment' conforme a documentação
    Callback = function(value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
})

--- Sistema de Espectador (View) ---
local SpectateSection = Tab:AddSection({ Name = "Espectar" })

local SpectateInput = SpectateSection:AddTextbox({
    Name = "Nome de Usuário",
    Default = "Insira o nick da pessoa aqui...",
    Callback = function() end
})

SpectateSection:AddToggle({
    Name = "Ativar Espectador",
    Default = false,
    Callback = function(toggled)
        isSpectating = toggled
        if toggled then
            local targetPlayer = Players:FindFirstChild(SpectateInput.Value)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
                Camera.CameraType = Enum.CameraType.Scriptable
                spectateConnection = RunService.Heartbeat:Connect(function()
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        Camera.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 10)
                    else
                        print("O jogador-alvo não está mais disponível. Parando de espectar.")
                        isSpectating = false
                        Camera.CameraType = originalCameraType
                        if spectateConnection then
                            spectateConnection:Disconnect()
                            spectateConnection = nil
                        end
                    end
                end)
            else
                print("Jogador não encontrado ou sem personagem.")
            end
        else
            if spectateConnection then
                spectateConnection:Disconnect()
                spectateConnection = nil
            end
            Camera.CameraType = originalCameraType
            print("Espectador desativado.")
        end
    end
})

--- Funções de Gameplay ---
local GameplaySection = Tab:AddSection({ Name = "Gameplay" })

-- 1. Função ESP (Highlight)
local function updateESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local highlight = player.Character:FindFirstChild("PlayerHighlight")
            if not highlight then
                highlight = Instance.new("Highlight")
                highlight.Name = "PlayerHighlight"
                highlight.Parent = player.Character
                highlight.Adornee = player.Character
            end

            local team = player.Team
            if team and LocalPlayer.Team and team.Name ~= LocalPlayer.Team.Name then
                -- Inimigo
                highlight.FillColor = Color3.new(1, 0, 0) -- Vermelho
                highlight.OutlineColor = Color3.new(1, 0.5, 0.5)
            elseif team and LocalPlayer.Team and team.Name == LocalPlayer.Team.Name then
                -- Aliado
                highlight.FillColor = Color3.new(0, 1, 0) -- Verde
                highlight.OutlineColor = Color3.new(0.5, 1, 0.5)
            else
                -- Sem time ou time desconhecido
                highlight.FillColor = Color3.new(0, 0.5, 1) -- Azul
                highlight.OutlineColor = Color3.new(0.5, 0.75, 1)
            end
            highlight.Enabled = isESP_Enabled
        end
    end
end

GameplaySection:AddToggle({
    Name = "Ativar ESP (Highlight)",
    Default = false,
    Callback = function(toggled)
        isESP_Enabled = toggled
        if isESP_Enabled then
            updateESP()
            Players.PlayerAdded:Connect(updateESP)
            Players.PlayerRemoving:Connect(function(player)
                if player.Character and player.Character:FindFirstChild("PlayerHighlight") then
                    player.Character.PlayerHighlight:Destroy()
                end
            end)
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("PlayerHighlight") then
                    player.Character.PlayerHighlight.Enabled = false
                end
            end
        end
    end
})

-- 2. Função Aimbot (Shift Lock/Primeira Pessoa)
GameplaySection:AddToggle({
    Name = "Ativar Aimbot",
    Default = false,
    Callback = function(toggled)
        isAimbot_Enabled = toggled
        if isAimbot_Enabled then
            RunService.Heartbeat:Connect(function()
                if isAimbot_Enabled and (Camera.CameraType == Enum.CameraType.Scriptable or Players.LocalPlayer.DevComputerCameraMovementMode == Enum.DevComputerCameraMovementMode.User) then
                    local closestPlayer = nil
                    local minDistance = math.huge
                    
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                            if distance < minDistance then
                                minDistance = distance
                                closestPlayer = player
                            end
                        end
                    end

                    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestPlayer.Character.HumanoidRootPart.Position)
                    end
                end
            end)
        end
    end
})

-- 3. Função Noclip
GameplaySection:AddToggle({
    Name = "Ativar Noclip",
    Default = false,
    Callback = function(toggled)
        isNoclip_Enabled = toggled
        if isNoclip_Enabled then
            LocalPlayer.Character.Archivable = true
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
            noclipConnection = RunService.Heartbeat:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = LocalPlayer.Character.HumanoidRootPart
                    local floor = Workspace:FindPartOnRay(Ray.new(rootPart.Position, Vector3.new(0, -100, 0)))
                    if floor and floor.Instance and floor.Instance.Parent ~= LocalPlayer.Character then
                        if floor.Distance > 5 then
                            rootPart.Velocity = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end)
        else
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
        end
    end
})

-- ==================================================================================================
-- FUNÇÃO OBRIGATÓRIA PARA INICIALIZAR A UI
-- ==================================================================================================
OrionLib:Init()
