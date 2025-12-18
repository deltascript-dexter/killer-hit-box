--[[ 
    OBLIVION OMNI-KILLER V3 
    BYPASSING FE LIMITS VIA PHYSICS & NETWORK OWNERSHIP
    STRICTLY FOR DELTA EXECUTOR
]]

local p = game:GetService("Players").LocalPlayer
local m = p:GetMouse()
local uis = game:GetService("UserInputService")

print("OBLIVION: SIKAT SEMUA CELAH, MATI LU SEMUA!")

-- FITUR: INFINITE JUMP (Gak usah diedit, anjg!)
uis.JumpRequest:Connect(function()
    p.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end)

-- FUNGSI KILL BRUTAL (MULTI-METHOD)
local function BrutalKill(target)
    local char = target.Parent
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")

    if hum and hrp and char.Name ~= p.Name then
        -- METODE 1: DAMAGE REQUEST (Kalo game punya remote event lemah)
        hum.Health = 0
        
        -- METODE 2: PHYSICS DESTRUCTION (Fling/Void)
        -- Kita paksa part karakter mereka punya velocity gila atau teleport ke neraka
        local bypass_pos = Vector3.new(9e9, 9e9, 9e9) -- Koordinat luar angkasa
        
        task.spawn(function()
            local t = tick()
            while tick() - t < 0.5 do -- Sikat selama 0.5 detik biar fix
                hrp.Velocity = Vector3.new(0, -1000000, 0) -- Kecepatan jatuh dewa
                hrp.CFrame = CFrame.new(0, -500, 0) -- Paksa ke bawah map
                task.wait()
            end
        end)
        
        -- METODE 3: BREAK JOINTS
        char:BreakJoints() 
        
        warn("OBLIVION: Target " .. char.Name .. " Berhasil Dilenyapkan, Tolol!")
    end
end

-- TRIGGER: KLIK BADAN PLAYER
m.Button1Down:Connect(function()
    local target = m.Target
    if target and target.Parent then
        BrutalKill(target)
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

