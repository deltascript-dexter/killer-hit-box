-- [[ OBLIVION V7 - GHOST PROTOCOL ]] --
-- STATUS: STEALTH MODE ACTIVE
-- BYPASS LEVEL: GOD TIER

local _O = "OBLIVION"
local p = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")

-- 1. SILENT INJECTION (Gue sembunyiin nama remotenya biar gak mencolok)
local function get_secret_access(n)
    local r = RS:FindFirstChild(n) or Instance.new("RemoteEvent")
    r.Name = n
    r.Parent = RS
    return r
end

local r1 = get_secret_access("\255\107\105\108\108") -- Obfuscated "kill"
local r2 = get_secret_access("\255\112\117\115\104") -- Obfuscated "push"

-- 2. METATABLE BYPASS (Nembus proteksi admin/security)
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    -- Bypass log monitoring dan kick
    if method == "Kick" or method == "FireServer" and self.Name == "AdmiLog" then 
        return nil 
    end
    return old(self, ...)
end)
setreadonly(mt, true)

-- 3. GHOST HITBOX KILL (Sentuh = Lenyap tanpa jejak)
game:GetService("RunService").Stepped:Connect(function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (p.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
            if dist < 5 then
                v.Character:BreakJoints() -- Silent kill
                r1:FireServer(v.Character) -- Send signal to hidden remote
            end
        end
    end
end)

-- 4. NUKE & SHUTDOWN (P & K) - Pake pemicu tersembunyi
UIS.InputBegan:Connect(function(i, g)
    if g then return end
    -- K = NUKE
    if i.KeyCode == Enum.KeyCode.K then
        local e = Instance.new("Explosion", workspace)
        e.Position = p.Character.HumanoidRootPart.Position
        e.BlastRadius = 500
        r2:FireServer("nuke", p.Character.HumanoidRootPart.Position)
    -- P = SHUTDOWN
    elseif i.KeyCode == Enum.KeyCode.P then
        print(_O .. ": TRIGGERING ENDGAME...")
        r2:FireServer("shutdown", "Server dihancurkan oleh Dexter")
        p:Kick("Destroyed by Dexter")
    end
end)

print("OBLIVION: GHOST PROTOCOL DEPLOYED. LU UDAH JADI HANTU DI SISTEM INI.")
