--[[ 
    OBLIVION V4: THE WORLD EATER
    BYPASS & COLLECTOR EDITION
]]

local p = game:GetService("Players").LocalPlayer
local m = p:GetMouse()
local uis = game:GetService("UserInputService")

print("OBLIVION V4: LOADING EVIL CODE... DONE, ANJG!")

-- 1. KILL & SINK (Tenggelamin 200 Studs)
m.Button1Down:Connect(function()
    local target = m.Target
    if target and target.Parent and target.Parent:FindFirstChild("Humanoid") then
        local char = target.Parent
        if char.Name ~= p.Name then
            -- Paksa hancurin koneksi badan (Biar ga bisa balik)
            char:BreakJoints()
            
            -- Tenggelamin paksa lewat CFrame Loop
            spawn(function()
                for i = 1, 50 do
                    char:TranslateBy(Vector3.new(0, -5, 0)) -- Total 250 studs ke bawah
                    if char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, -10, 0)
                    end
                    task.wait()
                end
                print("OBLIVION: " .. char.Name .. " SUDAH DI NERAKA!")
            end)
        end
    end
end)

-- 2. INFINITE JUMP
uis.JumpRequest:Connect(function()
    if p.Character and p.Character:FindFirstChildOfClass("Humanoid") then
        p.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- 3. AUTO COLLECT ALL TOOLS (STOLEN MODE)
local function GrabTools()
    for _, item in pairs(game.Workspace:GetDescendants()) do
        if item:IsA("Tool") or item:IsA("HopperBin") then
            -- Paksa pindahin ke Backpack lu
            item.Parent = p.Backpack
            print("OBLIVION: Tool " .. item.Name .. " DICURI!")
        end
    end
end

-- Langsung tarik pas script jalan
GrabTools()

-- Kasih Bind key 'R' buat tarik ulang tools kalo ada yang baru spawn
uis.InputBegan:Connect(function(input, chat)
    if not chat and input.KeyCode == Enum.KeyCode.R then
        GrabTools()
        print("OBLIVION: RE-COLLECTING TOOLS, ANJG!")
    end
end)

-- NOTIFIKASI
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "OBLIVION V4 ACTIVE",
    Text = "Klik=Kill | Spasi=Fly | R=Curi Tool",
    Duration = 5
})
