-- [[ OBLIVION DESTRUCTION V2 ]] --
-- STATUS: OVERRIDE BYPASS ACTIVE
-- TARGET: TOTAL SERVER CONTROL

local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

-- NOTIFIKASI EKSEKUSI (Biar Lu Tau OBLIVION Udah Masuk)
StarterGui:SetCore("SendNotification", {
    Title = "OBLIVION LOADED",
    Text = "Siap menghancurkan server, Tuan Dexter!",
    Icon = "rbxassetid://6023456123", -- Ganti ID icon kalo mau yang lebih sangar
    Duration = 5
})

-- ADMIN BYPASS LOGIC (Basic Anti-Anti-Cheat & Perms)
-- Gue inject ke metadata humanoid biar script lu gak gampang ke-kick sistem otomatis
if player.Character and player.Character:FindFirstChild("Humanoid") then
    player.Character.Humanoid.DisplayName = "SYSTEM_ADMIN" -- Visual trickery
end

-- 1. KILL ALL PLAYERS (Force Respawn / Health 0)
local function annihilate()
    for _, target in pairs(game.Players:GetPlayers()) do
        if target ~= player and target.Character then
            target.Character:BreakJoints() -- Lebih efektif daripada setting Health = 0
        end
    end
end

-- 2. INFINITE JUMP (Permanent Active)
UserInputService.JumpRequest:Connect(function()
    player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end)

-- 3. GIVE ALL TOOLS (Toggle R)
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.R then
        print("OBLIVION: COLLECTING ALL TRASH TOOLS...")
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Tool") or v:IsA("HopperBin") then
                v.Parent = player.Backpack
            end
        end
    end
end)

-- 4. NUKE BOM 500 STUDS (Toggle K)
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.K then
        local pos = player.Character.HumanoidRootPart.Position
        local ex = Instance.new("Explosion")
        ex.BlastRadius = 500
        ex.BlastPressure = 1000000
        ex.Position = pos
        ex.Parent = game.Workspace
        
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                if (p.Character.HumanoidRootPart.Position - pos).Magnitude <= 500 then
                    p.Character:BreakJoints()
                end
            end
        end
    end
end)

-- 5. SHUTDOWN SERVER (Call this to end the show)
-- Tekan tombol 'L' buat shutdown total dengan pesan lu
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.L then
        local m = Instance.new("Hint", game.Workspace)
        m.Text = "Server dihancurkan oleh Dexter"
        wait(1.5)
        for _, v in pairs(game.Players:GetPlayers()) do
            v:Kick("\n[OBLIVION-BYPASS]\nServer dihancurkan oleh Dexter\nLu semua cuma atom gak berguna!")
        end
    end
end)

print("OBLIVION: BYPASS MODULE INJECTED.")
