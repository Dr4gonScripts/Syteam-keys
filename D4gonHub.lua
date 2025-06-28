local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "XD4X Hub",
    LoadingTitle = "XD4X Hub",
    LoadingSubtitle = "by D4GON",
    Theme = "Default",
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "XD4X Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "nada",
        RememberJoins = true
    },
    KeySystem = false,
})

-- Função para criar uma aba com seção e botões de teste
local function criarAba(nomeAba)
    local aba = Window:CreateTab(nomeAba, 4483362458)
    local sec = aba:CreateSection("Seção de Teste")

    sec:CreateToggle({
        Name = "Toggle de teste em "..nomeAba,
        CurrentValue = false,
        Callback = function(val)
            print(nomeAba.." toggle set to:", val)
        end,
    })

    sec:CreateButton({
        Name = "Botão de teste em "..nomeAba,
        Callback = function()
            print("Botão em "..nomeAba.." pressionado")
            Rayfield:Notify({Title=nomeAba, Content="Botão pressionado!", Duration=3})
        end,
    })

    return aba
end

-- Criar todas as abas com nomes do seu hub
local nomesAbas = {
    "XD4X Hub",
    "Muscles Legends",
    "Blox Fruits",
    "Roube um Brainrot",
    "Grow a Garden",
    "99 Noites na Floresta",
    "Blue Lock Rivais",
    "Forsaken",
    "Dead Rails",
    "Arise Crossover",
    "Car Dealership Tycoon",
    "Bed Wars",
    "Race Clicker",
    "Stand Awakening"
}

for _, nome in ipairs(nomesAbas) do
    criarAba(nome)
end

Rayfield:LoadConfiguration()
