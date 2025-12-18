--[[ 
    OBLIVION V5: SERVER MANIPULATOR
    METHOD: NETWORK FLING & RECURSIVE STEAL
    BY: OBLIVION (OWNER: ZAMXS)
]]

local p = game:GetService("Players").LocalPlayer
local m = p:GetMouse()
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")

print("OBLIVION V5: SYSTEM OVERRIDE STARTING... SIKAT, BABI!")

-- 1. FORCE RESPAWN / KILL METHOD (FLING VOID)
-- Kita bikin hitbox target seolah-olah tabrakan hebat sampe mental ke void
m.Button1Down:Connect(function()
    local target = m.Target
    if target and target.Parent and target.Parent:FindFirstChild("Humanoid") then
        local char = target.Parent
        local hrp = char:FindFirstChild("HumanoidRootPart")
        
        if char.Name ~= p.Name and hrp then
            -- Manipulasi posisi secara brutal buat maksa server respawn mereka
            spawn(function()
                for i = 1, 30 do
                    -- Kirim target ke koordinat kematian (NaN/Void)
                    hrp.Velocity = Vector3.new(0, -1000000000, 0)
                    hrp.CFrame = CFrame.new(9e9, 9e9, 9e9) 
                    task.wait()
                end
                print("OBLIVION: " .. char.Name .. " DIPAKSA RESPAWN OLEH SISTEM!")
            end)
        end
    end
end)

-- 2. INFINITE JUMP (FIXED)
uis.JumpRequest:Connect(function()
    if p.Character and p.Character:FindFirstChildOfClass("Humanoid") then
        p.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- 3. TOOL STEAL (PRESS R TO RAMPOK)
local function StealAllTools()
    local count = 0
    for _, item in pairs(game.Workspace:GetDescendants()) do
        if item:IsA("Tool") or item:IsA("HopperBin") then
            -- Mencoba bypass parent protection
            item.Parent = p.Backpack
            count = count + 1
        end
    end
    
    -- Cek juga di tempat sampah/folder tersembunyi
    for _, obj in pairs(game:GetService("Lighting"):GetChildren()) do
        if obj:IsA("Tool") then
            obj.Parent = p.Backpack
            count = count + 1
        end
    end
    
    warn("OBLIVION: BERHASIL NYURI " .. count .. " TOOLS, TOLOL!")
end

-- BIND TOMBOL R
uis.InputBegan:Connect(function(input, chat)
    if not chat and input.KeyCode == Enum.KeyCode.R then
        StealAllTools()
    end
end)

-- NOTIFIKASI
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "OBLIVION V5 LOADED",
    Text = "Klik=Force Respawn | Spasi=Fly | R=Rampok Tools",
    Duration = 5
})
