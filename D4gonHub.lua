-- Carrega a biblioteca Rayfield usando o URL oficial e estável
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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
-- Cria uma janela de login que só será destruída após a chave correta ser inserida
local KeyWindow = Rayfield:CreateWindow({
    Name = "Sistema de Chave",
    Description = "Insira a chave para acessar o hub.",
    LoadingTitle = "Verificando Chave...",
    LoadingSubtitle = "Aguarde..."
})

local KeyTab = KeyWindow:AddTab("Autenticação")

local KeySection = KeyTab:AddSection("Acesso")

local KeyTextBox = KeySection:AddInput({
    Name = "Chave de Acesso",
    Placeholder = "Insira a chave aqui...",
    Callback = function()
        -- A verificação será feita no botão para melhor controle
    end
})

KeySection:AddButton({
    Name = "Verificar Chave",
    Description = "Clique para verificar a chave.",
    Callback = function()
        if KeyTextBox.Value == CORRETA_CHAVE then
            -- Se a chave estiver correta, destrói a janela de login e cria a UI principal
            KeyWindow:Destroy()

            -- Cria a janela principal da UI "D4gon UI"
            local Window = Rayfield:CreateWindow({
                Name = "D4gon UI",
                Description = "Hub com inúmeras funções.",
                Icon = 0, -- Sem ícone. Mude para um ID ou string para usar um ícone.
                LoadingTitle = "Carregando Rayfield...",
                LoadingSubtitle = "by Sirius",
                Theme = "Default",
                ToggleUIKeybind = "P" -- A tecla 'P' para mostrar/esconder a UI
            })

            local HubTab = Window:AddTab("Hub")

            --- Funções de Movimento ---
            local MovementSection = HubTab:AddSection("Movimento")
            
            MovementSection:AddSlider({
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

            MovementSection:AddSlider({
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
            local SpectateSection = HubTab:AddSection("Espectar")

            local SpectateInput = SpectateSection:AddInput({
                Name = "Nome de Usuário",
                Placeholder = "Insira o nick da pessoa aqui...",
            })

            SpectateSection:AddToggle({
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
            local GameplaySection = HubTab:AddSection("Gameplay")

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
            GameplaySection:AddToggle({
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
            GameplaySection:AddToggle({
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
            local SocialSection = HubTab:AddSection("Social")
            
            SocialSection:AddButton({
                Name = "Entrar no Discord",
                Description = "Clique para ver o link do servidor.",
                Callback = function()
                    print("Link do Discord: " .. DISCORD_LINK)
                end
            })

            SocialSection:AddButton({
                Name = "Meu Linktree",
                Description = "Veja todas as minhas redes sociais.",
                Callback = function()
                    print("Linktree: " .. LINKTREE_LINK)
                end
            })

            -- Destrói o loader da Rayfield após a UI ser criada
            Window:CloseLoading()

        else
            -- Se a chave estiver incorreta, mostra um aviso
            print("Chave incorreta! Acesso negado.")
        end
    end
})
