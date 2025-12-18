-- OBLIVION ULTIMATE BYPASS
-- NO UI, NO LAG, JUST KILL & JUMP
-- JANGAN DIEDIT SATU TITIK PUN, ANJG!

local p = game:GetService("Players").LocalPlayer
local m = p:GetMouse()
local uis = game:GetService("UserInputService")

print("OBLIVION SYSTEM ACTIVE. FUCK THE RULES!")

-- 1. KILL ON CLICK (ALWAYS ON)
m.Button1Down:Connect(function()
    local t = m.Target
    if t and t.Parent and t.Parent:FindFirstChild("Humanoid") then
        local targetChar = t.Parent
        if targetChar.Name ~= p.Name then
            -- METODE BRUTAL: Health 0 + Buang ke Void
            targetChar.Humanoid.Health = 0
            for i = 1, 5 do
                targetChar:MoveTo(Vector3.new(0, -1000, 0))
            end
            warn("OBLIVION: " .. targetChar.Name .. " MAMPUS!")
        end
    end
end)

-- 2. INFINITE JUMP (ALWAYS ON)
uis.JumpRequest:Connect(function()
    p.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end)

-- NOTIFIKASI SIMPLE DI CHAT
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "OBLIVION LOADED",
    Text = "Kill & Inf Jump Aktif, Babi!",
    Duration = 5
})

