local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Teste Rayfield",
    LoadingTitle = "Teste",
    LoadingSubtitle = "Só pra testar",
})

local Tab = Window:CreateTab("Main Tab")

Rayfield:LoadConfiguration()
