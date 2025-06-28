local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "XD4X Hub",
   Icon = nil, -- ou assetId válido em string
   LoadingTitle = "XD4X Hub",
   LoadingSubtitle = "by D4GON",
   Theme = "Default",
   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

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


local AuraHub = Window:CreateTab("XD4X Hub", 4483362458)
local Farm = Window:CreateTab("Farm", 4483362458)

local SectionMain = AuraHub:CreateSection("Funções Principais")



local ParagraphCreator = Farm:CreateParagraph({
   Title = "Criador",
   Content = "XD4X by: Dr4gon"
})

Rayfield:LoadConfiguration()
