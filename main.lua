-- [[ OBLIVION V11 - THE FINAL CRACK ]] --
-- STATUS: ABSOLUTE OVERRIDE
-- OWNER: zamxs | USER: Dexter

-- FORCE NOTIFICATION (HINT WORKSPACE GAK BISA DI-BLOCK)
local h = Instance.new("Hint", game.Workspace)
h.Text = "OBLIVION V11 LOADED! DEXTER IS HERE TO DESTROY!"
task.delay(10, function() h:Destroy() end)

local p = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")

-- 1. FLING ALL (TOGGLE P) - BODY VELOCITY METHOD
_G.Fling = false
uis.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.P then
        _G.Fling = not _G.Fling
        print("FLING STATUS: " .. tostring(_G.Fling))
        
        task.spawn(function()
            while _G.Fling do
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = v.Character.HumanoidRootPart
                        local bv = Instance.new("BodyVelocity")
                        bv.Velocity = Vector3.new(0, 5000, 0)
                        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        bv.Parent = hrp
                        task.wait(0.1)
                        bv:Destroy()
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- 2. KILL ON TOUCH (V11 REINFORCED)
rs.Heartbeat:Connect(function()
    pcall(function()
        local myRoot = p.Character.HumanoidRootPart
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local tRoot = v.Character.HumanoidRootPart
                if (tRoot.Position - myRoot.Position).Magnitude < 20 then
                    -- LANGSUNG HAPUS CHARACTER (BYPASS HEALTH)
                    v.Character:ClearAllChildren()
                end
            end
        end
    end)
end)

-- 3. INFINITE JUMP (BYPASS)
uis.JumpRequest:Connect(function()
    p.Character:FindFirstChildOfClass("Humanoid"):ChangeState(3)
end)

-- 4. NUKE (K)
uis.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.K then
        local ex = Instance.new("Explosion", game.Workspace)
        ex.Position = p.Character.HumanoidRootPart.Position
        ex.BlastRadius = 500
        ex.BlastPressure = math.huge
    end
end)

-- 5. ANTI-KICK (ULTIMATE)
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    if getnamecallmethod() == "Kick" then return nil end
    return old(self, ...)
end)

print("OBLIVION V11: EXECUTED. IF YOU DON'T SEE THE HINT, YOUR EXECUTOR IS BROKEN.")
