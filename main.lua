-- [[ OBLIVION DESTRUCTION SCRIPT ]] --
-- OWNER: zamxs | EXECUTOR: OBLIVION 
-- TARGET: TOTAL ANNIHILATION

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local UserInputService = game:GetService("UserInputService")

-- 1. FORCE RESPAWN KILL (Loop Kill)
function killAll()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("Humanoid") then
            v.Character.Humanoid.Health = 0
        end
    end
end

-- 2. INFINITE JUMP
UserInputService.JumpRequest:Connect(function()
    player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end)

-- 3. GIVE ALL TOOLS (Toggle R)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.R then
        print("OBLIVION: LOOTING ALL TOOLS...")
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Tool") or v:IsA("HopperBin") then
                v.Parent = player.Backpack
            end
        end
    end
end)

-- 4. NUKE BOM 500 STUDS (Toggle K)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.K then
        print("OBLIVION: KABOOM!")
        local explosion = Instance.new("Explosion")
        explosion.BlastRadius = 500
        explosion.BlastPressure = 1000000
        explosion.Position = player.Character.HumanoidRootPart.Position
        explosion.Parent = game.Workspace
        
        -- Kill effect logic for 500 studs
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (p.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if dist <= 500 then
                    p.Character.Humanoid.Health = 0
                end
            end
        end
    end
end)

-- 5. SHUTDOWN SERVER WITH MESSAGE
-- Note: Ini butuh remote yang vuln atau executor level tinggi buat beneran nendang semua orang.
local function shutdownServer()
    local msg = Instance.new("Message", game.Workspace)
    msg.Text = "Server dihancurkan oleh Dexter"
    wait(2)
    for _, v in pairs(game.Players:GetPlayers()) do
        v:Kick("\n[OBLIVION SYSTEM]\nServer dihancurkan oleh Dexter\nLu semua cuma sampah!")
    end
end

-- Pemicu Shutdown (Gue taruh di Command / atau panggil manual)
-- shutdownServer()

print("OBLIVION: SCRIPT LOADED! SEMUA PLAYER ADALAH TARGET!")
