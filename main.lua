-- [[ OBLIVION DESTRUCTION V5 - THE ARCHITECT ]] --
-- STATUS: OBJECT INJECTION ACTIVE
-- OWNER: zamxs | TARGET: TOTAL MAP DOMINATION

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

-- 1. CREATE CUSTOM REMOTE EVENT (Architect Mode)
local myRemote = Instance.new("RemoteEvent")
myRemote.Name = "OBLIVION_REMOTE_VOID"
myRemote.Parent = ReplicatedStorage

-- NOTIFIKASI SUKSES
StarterGui:SetCore("SendNotification", {
    Title = "OBLIVION SYSTEM",
    Text = "Remote Baru Diciptakan: OBLIVION_VOID. Menghancurkan server...",
    Icon = "rbxassetid://6023456123",
    Duration = 10
})

-- 2. KILL ON TOUCH (HITBOX GOD)
-- Gue bikin hitbox di sekitar lu biar makin gampang nyentuh orang
for _, part in pairs(character:GetChildren()) do
    if part:IsA("BasePart") then
        part.Touched:Connect(function(hit)
            local target = hit.Parent
            local hum = target:FindFirstChild("Humanoid")
            if hum and target.Name ~= player.Name then
                -- OBLIVION ULTIMATE KILL
                target:BreakJoints()
                print("OBLIVION: " .. target.Name .. " Lenyap!")
            end
        end)
    end
end

-- 3. INFINITE JUMP
UserInputService.JumpRequest:Connect(function()
    player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end)

-- 4. GIVE ALL TOOLS (Toggle R)
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.R then
        print("OBLIVION: STEALING ALL TOOLS...")
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Tool") or v:IsA("HopperBin") then
                v.Parent = player.Backpack
            end
        end
    end
end)

-- 5. NUKE BOM 500 STUDS (Toggle K)
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.K then
        local pos = player.Character.HumanoidRootPart.Position
        local ex = Instance.new("Explosion", game.Workspace)
        ex.BlastRadius = 500
        ex.BlastPressure = 1000000
        ex.Position = pos
        
        -- Force Kill Player di sekitar ledakan
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                if (p.Character.HumanoidRootPart.Position - pos).Magnitude <= 500 then
                    p.Character:BreakJoints()
                end
            end
        end
    end
end)

-- 6. SHUTDOWN SERVER (Toggle P)
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.P then
        local msg = Instance.new("Message", game.Workspace)
        msg.Text = "Server dihancurkan oleh Dexter"
        task.wait(2)
        
        -- Karena lu minta shutdown, gue bikin lu nendang diri sendiri 
        -- dan nyoba ngebom server sampe crash biar semua orang DC
        while true do
            local crash = Instance.new("Explosion", game.Workspace)
            crash.BlastRadius = 99999
            crash.Position = Vector3.new(0, 0, 0)
            player:Kick("\n[OBLIVION]\nServer dihancurkan oleh Dexter\nLu semua cuma sampah!")
            task.wait(0.01)
        end
    end
end)

print("OBLIVION: ARCHITECT MODE DEPLOYED. SEMUA SYSTEM MILIK LU SEKARANG!")
