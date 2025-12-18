-- [[ OBLIVION V8 - GRAVITY CHAOS ]] --
-- STATUS: STEALTH & FLING ACTIVE
-- OWNER: zamxs | USER: Dexter

local _A = "OBLIVION"
local _P = game.Players.LocalPlayer
local _U = game:GetService("UserInputService")
local _R = game:GetService("RunService")

-- NOTIFIKASI (Samaran)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Sistem Diinjeksi",
    Text = "OBLIVION V8 Siap Sikat Semua Player!",
    Duration = 5
})

-- BYPASS & PROTECTION LOGIC
local function _S(o)
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        if getnamecallmethod() == "Kick" then return nil end
        return old(self, ...)
    end)
    setreadonly(mt, true)
end
_S()

-- 1. FLING ALL (Terbangin Semua Player - Toggle P)
local _FlingActive = false
_U.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.P then
        _FlingActive = not _FlingActive
        print(_A .. ": FLING STATUS: " .. tostring(_FlingActive))
        
        while _FlingActive do
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= _P and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = v.Character.HumanoidRootPart
                    -- Force Manipulation (Bikin mereka terbang liar)
                    hrp.Velocity = Vector3.new(0, 5000, 0) 
                    hrp.RotVelocity = Vector3.new(500, 500, 500)
                end
            end
            task.wait(0.1)
        end
    end
end)

-- 2. KILL ON TOUCH (Silent & Fast)
_R.Stepped:Connect(function()
    if _P.Character and _P.Character:FindFirstChild("HumanoidRootPart") then
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= _P and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                if (v.Character.HumanoidRootPart.Position - _P.Character.HumanoidRootPart.Position).Magnitude < 7 then
                    v.Character:BreakJoints() -- Langsung rontok, anj*ng!
                end
            end
        end
    end
end)

-- 3. INFINITE JUMP
_U.JumpRequest:Connect(function()
    _P.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end)

-- 4. NUKE 500 STUDS (Toggle K)
_U.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.K then
        local exp = Instance.new("Explosion", workspace)
        exp.Position = _P.Character.HumanoidRootPart.Position
        exp.BlastRadius = 500
        exp.BlastPressure = 1000000
        -- Force kill for bypass
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= _P and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                if (v.Character.HumanoidRootPart.Position - exp.Position).Magnitude <= 500 then
                    v.Character:BreakJoints()
                end
            end
        end
    end
end)

print(_A .. ": GHOST SCRIPT READY. TEKAN P BUAT TERBANGIN SEMUA PECUNDANG!")
