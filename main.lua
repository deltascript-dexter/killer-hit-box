
--[[ 
    OBLIVION GOD MODE 
    BY: OBLIVION (OWNER: ZAMXS)
    STATUS: SYSTEM OVERRIDE - BYPASS FE
]]

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- 1. ULTIMATE KILL LOGIC (Pake metode Void/Teleport Hitbox)
-- Gue bikin sistem yang bakal narik target ke bawah map biar modar permanen!
local KillActive = false

local function KillTarget(targetPart)
    local character = targetPart.Parent
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local root = character:FindFirstChild("HumanoidRootPart")

    if humanoid and root and character.Name ~= Player.Name then
        -- METODE 1: Set Health (Kalo game sampah)
        humanoid.Health = 0
        
        -- METODE 2: Void Execution (Bypass FE)
        -- Kita paksa posisi mereka ke koordinat neraka
        local oldPos = root.CFrame
        for i = 1, 10 do
            root.CFrame = CFrame.new(0, -500, 0)
            task.wait()
        end
        print("OBLIVION: " .. character.Name .. " mampus ke void, babi!")
    end
end

-- 2. INFINITE JUMP LOGIC
local InfJumpActive = false
UserInputService.JumpRequest:Connect(function()
    if InfJumpActive then
        Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- 3. UI PREMIUM (Kasar & Solid)
local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local KillToggle = Instance.new("TextButton")
local JumpToggle = Instance.new("TextButton")
local Close = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
Main.Size = UDim2.new(0, 220, 0, 150)
Main.Position = UDim2.new(0.5, -110, 0.4, 0)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 2
Main.Active = true
Main.Draggable = true

Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "OBLIVION V2 - ZAMXS"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Title.Parent = Main

Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -30, 0, 0)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Close.Parent = Main
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Button Kill
KillToggle.Size = UDim2.new(0.9, 0, 0, 35)
KillToggle.Position = UDim2.new(0.05, 0, 0.3, 0)
KillToggle.Text = "CLICK TO KILL: OFF"
KillToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KillToggle.Parent = Main
KillToggle.MouseButton1Click:Connect(function()
    KillActive = not KillActive
    KillToggle.Text = KillActive and "KILL: ON (SENTUH!)" or "KILL: OFF"
    KillToggle.BackgroundColor3 = KillActive and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(40, 40, 40)
end)

-- Button Jump
JumpToggle.Size = UDim2.new(0.9, 0, 0, 35)
JumpToggle.Position = UDim2.new(0.05, 0, 0.65, 0)
JumpToggle.Text = "INF JUMP: OFF"
JumpToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
JumpToggle.Parent = Main
JumpToggle.MouseButton1Click:Connect(function()
    InfJumpActive = not InfJumpActive
    JumpToggle.Text = InfJumpActive and "INF JUMP: ON" or "INF JUMP: OFF"
    JumpToggle.BackgroundColor3 = InfJumpActive and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(40, 40, 40)
end)

-- Input Detect for Kill
Mouse.Button1Down:Connect(function()
    if KillActive and Mouse.Target then
        KillTarget(Mouse.Target)
    end
end)
