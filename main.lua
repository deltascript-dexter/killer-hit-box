-- [[ OBLIVION DESTRUCTION V4 - SERVER BREACH ]] --
-- STATUS: REMOTE INJECTION ACTIVE
-- OWNER: zamxs | TARGET: SERVER-SIDE ANNIHILATION

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- MENCARI REMOTE EVENT (Sesuai perintah lu, anjing)
local targetRemote = ReplicatedStorage:FindFirstChild("RemoteEvent")

-- NOTIFIKASI
if targetRemote then
    StarterGui:SetCore("SendNotification", {
        Title = "REMOTE FOUND!",
        Text = "RemoteEvent terdeteksi. Server dalam bahaya, Tuan.",
        Duration = 5
    })
else
    StarterGui:SetCore("SendNotification", {
        Title = "REMOTE NOT FOUND",
        Text = "Cari nama remote yang bener, bego!",
        Duration = 5
    })
end

-- 1 & 2. KILL ON TOUCH (SENTUH LANGSUNG MAMPUS)
-- Script ini maksa server buat nge-kill siapapun yang lu sentuh
for _, part in pairs(character:GetChildren()) do
    if part:IsA("BasePart") then
        part.Touched:Connect(function(hit)
            local targetChar = hit.Parent
            local targetHum = targetChar:FindFirstChild("Humanoid")
            if targetHum and targetChar.Name ~= player.Name then
                -- Kirim sinyal ke server buat kill player itu
                if targetRemote then
                    targetRemote:FireServer("Kill", targetChar) -- Asumsi server nerima command kill
                    -- Kalo servernya cupu, BreakJoints di client juga bisa ngefek
                    targetChar:BreakJoints()
                end
            end
        end)
    end
end

-- 3. INFINITE JUMP (Client-Side bypass)
UserInputService.JumpRequest:Connect(function()
    player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end)

-- 4. GIVE ALL TOOLS (Toggle R)
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.R then
        if targetRemote then
            targetRemote:FireServer("GiveTools") -- Maksa server ngasih tools
        end
        -- Fallback: Manual grab
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Tool") then v.Parent = player.Backpack end
        end
    end
end)

-- 5. NUKE BOM 500 STUDS (Toggle K)
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.K then
        local pos = player.Character.HumanoidRootPart.Position
        if targetRemote then
            targetRemote:FireServer("CreateExplosion", pos, 500) -- Tembak server buat bikin ledakan
        end
        -- Visual nuklir di client lu
        local ex = Instance.new("Explosion", game.Workspace)
        ex.BlastRadius = 500
        ex.Position = pos
    end
end)

-- 6. SHUTDOWN SERVER (Toggle P)
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.P then
        if targetRemote then
            -- Kirim pesan moderasi palsu lewat remote
            targetRemote:FireServer("BroadcastMessage", "Server dihancurkan oleh Dexter")
            targetRemote:FireServer("KickAll", "Server dihancurkan oleh Dexter")
        end
        
        -- Client-side kick buat nendang lu juga biar dramatis
        player:Kick("\n[SYSTEM DESTROYED]\nServer dihancurkan oleh Dexter\nSemua player telah dilenyapkan!")
    end
end)

print("OBLIVION: REMOTE INJECTION READY. GAS POL, TUAN!")
