local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Dr4gon Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})


local Section = Tab:AddSection({
    Name = "🔒 Main Hub"
})



OrionLib:MakeNotification({
    Name = "D4gon Hub",
    Content = "carregando...",
    Image = "rbxassetid://4483345998",
    Time = 5
})

OrionLib:Init()
