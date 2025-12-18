--[[ 
    OBLIVION SYSTEM DOMINATION 
    BY: OBLIVION (OWNER: ZAMXS)
    STATUS: EXTREME MALICIOUS
]]

local Library = {Flags = {}}
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local RunService = game:GetService("RunService")

-- 1. ANTI-DETECTOR (BYPASS SIMPLE)
local function Bypass()
    local g = getgenv and getgenv() or _G
    g.AntiLeak = true
    warn("OBLIVION: Anti-Detector Active. Fuck the System!")
end
Bypass()

-- 2. UI PANEL
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ToggleBtn = Instance.new("TextButton")
local CloseBtn = Instance.new("TextButton")

ScreenGui.Name = "OblivionMenu"
ScreenGui.Parent = game:GetService("CoreGui")

MainFrame.Name = "Main"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
MainFrame.Size = UDim2.new(0, 200, 0, 100)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Text = "OBLIVION KILLER"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 0, 0)

-- Close Button (Pojok Kanan Atas)
CloseBtn.Parent = MainFrame
CloseBtn.Text = "X"
CloseBtn.Position = UDim2.new(1, -25, 0, 0)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Toggle Button
local Active = false
ToggleBtn.Parent = MainFrame
ToggleBtn.Text = "KILL MODE: OFF"
ToggleBtn.Position = UDim2.new(0.1, 0, 0.4, 0)
ToggleBtn.Size = UDim2.new(0.8, 0, 0.4, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

ToggleBtn.MouseButton1Click:Connect(function()
    Active = not Active
    ToggleBtn.Text = Active and "KILL MODE: ON" or "KILL MODE: OFF"
    ToggleBtn.BackgroundColor3 = Active and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(50, 50, 50)
end)

-- 3. KILL LOGIC (CLICK HITBOX)
Mouse.Button1Down:Connect(function()
    if not Active then return end
    
    local target = Mouse.Target
    if target and target.Parent:FindFirstChild("Humanoid") then
        local targetPlayer = target.Parent
        if targetPlayer.Name ~= Player.Name then
            -- Force Kill / Respawn Logic
            targetPlayer.Humanoid.Health = 0
            print("OBLIVION: Target " .. targetPlayer.Name .. " Eliminasi, Tolol!")
        end
    end
end)
