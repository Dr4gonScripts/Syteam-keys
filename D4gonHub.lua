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
local UserInputService = game:GetService("UserInputService")
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
local isFlying = false
local flyConnection = nil
local flySpeed = 50 -- Velocidade inicial do voo

-- Cria a janela principal da UI "D4gon UI"
local Window = OrionLib:MakeWindow({
    Name = "D4gon UI",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest",
    IntroText = "D4gon Hub."
})

-- Adicionando a linha que faltava para criar a aba 'Main'
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://2549575201",
	PremiumOnly = false
})

-- Notificação de que a UI está carregando (usando 'Title' conforme a documentação)
OrionLib:MakeNotification({
	Title = "D4gon Hub",
	Content = "Hub carregado! Use a tecla padrão para abrir/fechar (geralmente 'Insert' ou 'Right Shift').",
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
    Increment = 1,
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
    Increment = 1,
    Callback = function(value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
})

--- Funções de Fly ---
MovementSection:AddSlider({
    Name = "Fly Speed",
    Min = 10,
    Max = 250,
    Default = 50,
    Increment = 1,
    Callback = function(value)
        flySpeed = value
    end
})

MovementSection:AddToggle({
    Name = "Ativar Fly",
    Default = false,
    Callback = function(toggled)
        isFlying = toggled
        if isFlying then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.PlatformStand = true
                LocalPlayer.Character.Humanoid.WalkSpeed = 0
                LocalPlayer.Character.Humanoid.JumpPower = 0

                flyConnection = RunService.Heartbeat:Connect(function()
                    if not isFlying or not LocalPlayer.Character then
                        return
                    end

                    local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if not rootPart then return end

                    local moveDirection = Vector3.new(0, 0, 0)
                    local camCFrame = Camera.CFrame
                    local rightVector = camCFrame.RightVector
                    local upVector = camCFrame.UpVector
                    local lookVector = camCFrame.LookVector

                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveDirection = moveDirection + lookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveDirection = moveDirection - lookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveDirection = moveDirection - rightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveDirection = moveDirection + rightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.E) or UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        moveDirection = moveDirection + upVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
                        moveDirection = moveDirection - upVector
                    end

                    rootPart.CFrame = rootPart.CFrame + moveDirection.Unit * flySpeed * RunService.Heartbeat:Wait()
                end)
            end
        else
            if flyConnection then
                flyConnection:Disconnect()
                flyConnection = nil
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.PlatformStand = false
                LocalPlayer.Character.Humanoid.WalkSpeed = 16 -- Retorna ao padrão
                LocalPlayer.Character.Humanoid.JumpPower = 50  -- Retorna ao padrão
            end
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
