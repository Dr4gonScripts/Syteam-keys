-- Tenta carregar a biblioteca Rayfield usando o link oficial
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Adiciona uma espera generosa para dar tempo
task.wait(5) 

-- VERIFICAÇÃO CRÍTICA: O que a variável 'Rayfield' se tornou?
print("Rayfield carregada? Tipo da variável:", typeof(Rayfield))

-- Tenta criar uma janela de teste para verificar se os métodos funcionam
if typeof(Rayfield) == "table" and Rayfield.CreateWindow then
    print("Rayfield parece ser uma tabela. Tentando criar a janela de teste...")
    
    local testWindow = Rayfield:CreateWindow({ Name = "Teste de Janela", Description = "Se você ver esta janela, funcionou!" })
    local testTab = testWindow:AddTab("Aba de Teste")
    testTab:AddSection("Seção de Teste")
    
    print("Sucesso! A janela e a aba foram criadas.")
else
    print("ERRO FINAL: Rayfield não foi carregada corretamente. O executor está bloqueando a biblioteca.")
    print("Por favor, considere usar uma biblioteca de UI diferente.")
end
