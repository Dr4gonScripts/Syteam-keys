-- Carrega a biblioteca Rayfield do link raw
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/Source.lua"))()

-- Define a chave correta e o link do Discord
local CORRETA_CHAVE = "Dr4gonX"
local DISCORD_LINK = "https://discord.gg/PvssedzXpT"

-- Câmera local e serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera

-- Variáveis para o sistema de espectador
local isSpectating = false
local spectateConnection = nil
local originalCameraType = Camera.CameraType

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
        -- Não faz nada aqui, a verificação será feita no botão
    end
})

KeySection:AddButton({
    Name = "Verificar Chave",
    Description = "Clique para verificar a chave.",
    Callback = function()
        if KeyTextBox.Value == CORRETA_CHAVE then
            -- Se a chave estiver correta, destrói a janela de login e cria a UI principal
            KeyWindow:Destroy()
            
            -- Cria a janela principal da UI
            local Window = Rayfield:CreateWindow({
                Name = "D4gon UI",
                Description = "Hub com inúmeras funções.",
                LoadingTitle = "Carregando Rayfield...",
                LoadingSubtitle = "Aguarde um momento...",
                ToggleUIKeybind = "P" -- A tecla 'P' para mostrar/esconder a UI
            })
            
            local HubTab = Window:AddTab("Hub")

            --- Funções de Walk Speed e Jump Power ---
            local MovementSection = HubTab:AddSection("Movimento")
            
            MovementSection:AddSlider({
                Name = "Walk Speed",
                Description = "Ajusta a velocidade de movimento do seu personagem.",
                Min = 0,
                Max = 500,
                Default = 16, -- Velocidade padrão do Roblox
                Rounding = 0,
                Callback = function(value)
                    -- Muda a velocidade de movimento do Humanoid
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
                Default = 50, -- Altura padrão do Roblox
                Rounding = 0,
                Callback = function(value)
                    -- Muda o poder de pulo do Humanoid
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
                        -- Tenta encontrar o jogador pelo nome de usuário
                        local targetPlayer = Players:FindFirstChild(SpectateInput.Value)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
                            -- Se o jogador for encontrado, muda o tipo da câmera e inicia o loop de espectar
                            Camera.CameraType = Enum.CameraType.Scriptable
                            spectateConnection = RunService.Heartbeat:Connect(function()
                                -- Atualiza a posição da câmera para seguir o jogador-alvo
                                if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                    Camera.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 10) -- Posiciona a câmera ligeiramente atrás
                                else
                                    -- Se o jogador-alvo sumir, para de espectar
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
                            -- Se o jogador não for encontrado, mostra um erro e desativa o toggle
                            print("Jogador não encontrado ou sem personagem.")
                            -- Desativa o toggle se o jogador não for encontrado
                            -- Você pode precisar de uma função da Rayfield para desativar o toggle na UI
                            isSpectate = false
                        end
                    else
                        -- Se o toggle for desativado, para o espectador e retorna a câmera ao normal
                        if spectateConnection then
                            spectateConnection:Disconnect()
                            spectateConnection = nil
                        end
                        Camera.CameraType = originalCameraType
                        print("Espectador desativado.")
                    end
                end
            })

            --- Outras Funções ---
            local OtherSection = HubTab:AddSection("Social")
            
            OtherSection:AddButton({
                Name = "Entrar no Discord",
                Description = "Clique para ver o link do servidor.",
                Callback = function()
                    -- Imprime o link no console do desenvolvedor
                    print("Link do Discord: " .. DISCORD_LINK)
                    -- Note: Em um script de exploit, você poderia usar uma função para copiar o texto para a área de transferência
                end
            })

            -- Destrói o loader da Rayfield após a UI ser criada
            Window:CloseLoading()

        else
            -- Se a chave estiver incorreta, mostra um aviso
            print("Chave incorreta! Acesso negado.")
            -- Você pode adicionar um aviso na UI aqui
        end
    end
})
