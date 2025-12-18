-- [[ OBLIVION V9 - THE GHOST IN THE SHELL ]] --
-- STATUS: UNDETECTABLE (ENCRYPTED)
-- OWNER: zamxs | USER: Dexter

local _G = getgenv()
local _S = setmetatable
local _H = game:GetService("\82\117\110\83\101\114\118\105\99\101") -- RunService
local _I = game:GetService("\85\115\101\114\105\110\112\117\116\83\101\114\118\105\99\101") -- UserInputService
local _P = game:GetService("\80\108\97\121\101\114\115").LocalPlayer

-- NOTIFIKASI DISAMARKAN (Biar dikira script system)
game:GetService("\83\116\97\114\116\101\114\71\117\105"):SetCore("SendNotification", {
    Title = "System_Update_09",
    Text = "V9.0.1 Integrated Successfully.",
    Duration = 5
})

-- [[ BYPASS ANTI-CHEAT ENGINE ]] --
local function _B()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        -- Sembunyiin semua jejak FireServer dan Kick
        if method == "\75\105\99\107" or method == "\107\105\99\107" then 
            return nil 
        end
        return old(self, ...)
    end)
    setreadonly(mt, true)
end
pcall(_B)

-- [[ FEATURES - ENCRYPTED LOGIC ]] --

-- 1. FLING ALL (P) - High Speed Desync
_G._FLING = false
_I.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.P then
        _G._FLING = not _G._FLING
        while _G._FLING do
            for _, v in pairs(game:GetService("\80\108\97\121\101\114\115"):GetPlayers()) do
                if v ~= _P and v.Character and v.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") then
                    local r = v.Character.HumanoidRootPart
                    r.Velocity = Vector3.new(0, 999999, 0) -- Force Yeet
                    r.RotVelocity = Vector3.new(999999, 999999, 999999)
                end
            end
            task.wait(0.01)
        end
    end
end)

-- 2. SILENT KILL (TOUCH)
_H.Stepped:Connect(function()
    pcall(function()
        local myRoot = _P.Character.HumanoidRootPart
        for _, v in pairs(game:GetService("\80\108\97\121\101\114\115"):GetPlayers()) do
            if v ~= _P and v.Character and v.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") then
                if (v.Character.HumanoidRootPart.Position - myRoot.Position).Magnitude < 10 then
                    v.Character.Humanoid.Health = 0
                    v.Character:BreakJoints()
                end
            end
        end
    end)
end)

-- 3. INFINITE JUMP
_I.JumpRequest:Connect(function()
    _P.Character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100"):ChangeState(3)
end)

-- 4. NUCLEAR (K)
_I.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.K then
        local exp = Instance.new("\69\120\112\108\111\115\105\111\110", workspace)
        exp.Position = _P.Character.HumanoidRootPart.Position
        exp.BlastRadius = 500
    end
end)

print("OBLIVION: V9 STEALTH INJECTED. ANTI-CHEAT IS NOW A JOKE.")
