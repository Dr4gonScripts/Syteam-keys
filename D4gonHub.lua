local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "ROBLOKI 6.2.9", HidePremium = false, SaveConfig = true, ConfigFolder = "Project segredo"})

local Tab = Window:MakeTab({
	Name = "Muscles Legends - Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Muscles Farm"
})

Tab:AddButton({
	Name = "Speed Hub X",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua'))()
  	end    
})

OrionLib:Init()
