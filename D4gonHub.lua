-- ==================================================================================================
-- INÍCIO DO CARREGADOR DA BIBLIOTECA VAPE V4
-- ==================================================================================================

local VapeV4 = loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/vape-v4-loader/main/vape_loader.lua"))()

-- ==================================================================================================
-- FIM DO CARREGADOR DA BIBLIOTECA VAPE V4
-- ==================================================================================================


--- INÍCIO DO SEU CÓDIGO (ADAPTADO PARA VAPE V4) ---

-- Define a chave correta e o link do Discord e Linktree
local CORRETA_CHAVE = "Dr4gonX"
local DISCORD_LINK = "https://discord.gg/PvssedzXpT"
local LINKTREE_LINK = "https://linktr.ee/D4gonBRX"

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

--- Sistema de Chave (Login) ---
-- Cria uma janela de login simples da Vape V4
local KeyWindow = VapeV4:CreateUI("Sistema de Chave")

local KeyTab = KeyWindow:Tab("Autenticação")
local KeySection = KeyTab:Section("Acesso")

local KeyTextBox = KeySection:Input({
    Name = "Chave de Acesso",
    Placeholder = "Insira a chave aqui...",
    Callback = function(text)
        -- A verificação será feita no botão
    end
})

KeySection:Button({
    Name = "Verificar Chave",
    Description = "Clique para verificar a chave.",
    Callback = function()
        -- Note: Na Vape V4, o valor do Input é acessado com .Value
        if KeyTextBox.Value == CORRETA_CHAVE then
            -- Se a chave estiver correta, destrói a janela de login e cria a UI principal
            KeyWindow:Destroy()

            -- Cria a janela principal da UI "D4gon UI"
            local Window = VapeV4:CreateUI("D4gon UI")

            -- Define a tecla de toggle
            Window:ToggleKeybind(Enum.KeyCode.P)

            local HubTab = Window:Tab("Hub")

            --- Funções de Movimento ---
            local MovementSection = HubTab:Section("Movimento")
            
            MovementSection:Slider({
                Name = "Walk Speed",
                Description = "Ajusta a velocidade de movimento do seu personagem.",
                Min = 0,
                Max = 500,
                Default = 16,
                Rounding = 0,
                Callback = function(value)
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.WalkSpeed = value
                    end
                end
            })

            MovementSection:Slider({
                Name = "Jump Power",
                Description = "Ajusta a altura do seu pulo.",
                Min = 0,
                Max = 500,
                Default = 50,
                Rounding = 0,
                Callback = function(value)
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.JumpPower = value
                    end
                end
            })

            --- Sistema de Espectador (View) ---
            local SpectateSection = HubTab:Section("Espectar")

            local SpectateInput = SpectateSection:Input({
                Name = "Nome de Usuário",
                Placeholder = "Insira o nick da pessoa aqui...",
                Callback = function() end
            })

            SpectateSection:Toggle({
                Name = "Ativar Espectador",
                Description = "Espere a câmera de alguém. Insira o nick acima.",
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
            local GameplaySection = HubTab:Section("Gameplay")

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

            GameplaySection:Toggle({
                Name = "Ativar ESP (Highlight)",
                Description = "Adiciona um contorno colorido a todos os jogadores.",
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
            GameplaySection:Toggle({
                Name = "Ativar Aimbot",
                Description = "Sua mira seguirá o jogador mais próximo quando mirar.",
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
            GameplaySection:Toggle({
                Name = "Ativar Noclip",
                Description = "Permite atravessar paredes, mas não o chão.",
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

            --- Funções Sociais ---
            local SocialSection = HubTab:Section("Social")
            
            SocialSection:Button({
                Name = "Entrar no Discord",
                Description = "Clique para ver o link do servidor.",
                Callback = function()
                    print("Link do Discord: " .. DISCORD_LINK)
                end
            })

            SocialSection:Button({
                Name = "Meu Linktree",
                Description = "Veja todas as minhas redes sociais.",
                Callback = function()
                    print("Linktree: " .. LINKTREE_LINK)
                end
            })

        else
            -- Se a chave estiver incorreta, mostra um aviso
            print("Chave incorreta! Acesso negado.")
        end
    end
})
