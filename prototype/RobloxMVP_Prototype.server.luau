--!strict
--[[
    PROTOTYPE: Bring Me Core Match & Overhead Carry Verification
    Throwaway script to test in Roblox Studio.
    
    How to run:
    1. Open a blank Roblox baseplate in Roblox Studio.
    2. Insert a Script in ServerScriptService.
    3. Paste this code and press Play!
    
    What it verifies:
    - Auto-generates a central Hub Deposit Pad (Neon Green) and an objective Part.
    - Runs the 15s Intermission -> 5s Countdown -> 75s Scavenge loop with visual prints/billboards.
    - Lets players trigger a ProximityPrompt to test the Overhead WeldConstraint and Luminous Highlight.
    - Automatically scores and concludes the round when the Carrier steps onto the Deposit Pad.
]]

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

print("[PROTOTYPE] Initializing Bring Me throwaway prototype...")

-- 1. Setup Prototype Environment Parts
local hubPad = Instance.new("Part")
hubPad.Name = "PrototypeDepositZone"
hubPad.Size = Vector3.new(16, 1, 16)
hubPad.Position = Vector3.new(0, 0.5, 0)
hubPad.Anchored = true
hubPad.Material = Enum.Material.Neon
hubPad.Color = Color3.fromRGB(34, 197, 94)
hubPad.Parent = Workspace

local billboard = Instance.new("BillboardGui")
billboard.Size = UDim2.new(0, 200, 0, 50)
billboard.StudsOffset = Vector3.new(0, 6, 0)
billboard.AlwaysOnTop = true
local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(1, 0, 1, 0)
timerLabel.BackgroundTransparency = 1
timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timerLabel.TextSize = 24
timerLabel.Font = Enum.Font.GothamBold
timerLabel.Text = "LOBBY WAITING"
timerLabel.Parent = billboard
billboard.Parent = hubPad

-- 2. State Variables
local currentCarrier: Player? = nil
local activeItem: Part? = nil
local activeWeld: WeldConstraint? = nil
local activeHighlight: Highlight? = nil
local isRoundActive = false

-- 3. Item Spawning & Overhead Carry Functions
local function spawnTestItem()
    if activeItem then activeItem:Destroy() end
    
    local item = Instance.new("Part")
    item.Name = "PrototypeTargetItem"
    item.Size = Vector3.new(2, 2, 2)
    -- Spawn 40 studs away from the hub
    item.Position = Vector3.new(35, 3, 35)
    item.Color = Color3.fromRGB(251, 191, 36)
    item.Material = Enum.Material.Neon
    item.Anchored = false
    item.Parent = Workspace
    
    local prompt = Instance.new("ProximityPrompt")
    prompt.ActionText = "Grab Target Item"
    prompt.ObjectText = "Golden Microscope"
    prompt.HoldDuration = 0
    prompt.MaxActivationDistance = 10
    prompt.Parent = item
    
    prompt.Triggered:Connect(function(player: Player)
        if currentCarrier or not isRoundActive then return end
        
        local character = player.Character
        if not character then return end
        local head = character:FindFirstChild("Head") :: BasePart?
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        if not head or not humanoid then return end
        
        currentCarrier = player
        prompt.Enabled = false
        item.CanCollide = false
        
        -- Lock carrier speed to 16
        humanoid.WalkSpeed = 16
        
        -- Overhead Weld
        item.CFrame = head.CFrame * CFrame.new(0, 2.8, 0)
        activeWeld = Instance.new("WeldConstraint")
        activeWeld.Part0 = head
        activeWeld.Part1 = item
        activeWeld.Parent = item
        
        -- Luminous Highlight
        activeHighlight = Instance.new("Highlight")
        activeHighlight.FillColor = Color3.fromRGB(255, 215, 0)
        activeHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        activeHighlight.Adornee = character
        activeHighlight.Parent = character
        
        print("[PROTOTYPE] " .. player.Name .. " picked up the item! Welded overhead.")
    end)
    
    activeItem = item
end

local function cleanupCarrier()
    if activeWeld then activeWeld:Destroy(); activeWeld = nil end
    if activeHighlight then activeHighlight:Destroy(); activeHighlight = nil end
    if activeItem then activeItem:Destroy(); activeItem = nil end
    currentCarrier = nil
end

-- 4. Hub Deposit Zone Listener
hubPad.Touched:Connect(function(hit)
    local character = hit.Parent
    local player = Players:GetPlayerFromCharacter(character)
    if player and player == currentCarrier and isRoundActive then
        print("[PROTOTYPE WIN!] " .. player.Name .. " stepped onto Deposit Pad with item! Round Won!")
        isRoundActive = false
        timerLabel.Text = "WINNER: " .. player.Name .. "!"
        timerLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
        cleanupCarrier()
    end
end)

-- 5. Main Prototype Game Loop
task.spawn(function()
    while true do
        -- Intermission (8s for fast prototyping)
        cleanupCarrier()
        for t = 8, 1, -1 do
            timerLabel.Text = "Intermission: " .. t .. "s"
            timerLabel.TextColor3 = Color3.fromRGB(148, 163, 184)
            task.wait(1)
        end
        
        -- Countdown (3s)
        for t = 3, 1, -1 do
            timerLabel.Text = "Starting in: " .. t .. "s"
            timerLabel.TextColor3 = Color3.fromRGB(245, 158, 11)
            task.wait(1)
        end
        
        -- Scavenge
        isRoundActive = true
        spawnTestItem()
        timerLabel.TextColor3 = Color3.fromRGB(56, 189, 248)
        
        local timer = 45
        while isRoundActive and timer > 0 do
            timerLabel.Text = "SCAVENGE: " .. timer .. "s"
            task.wait(1)
            timer -= 1
        end
        
        if isRoundActive then
            timerLabel.Text = "TIME'S UP! DRAW!"
            timerLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
            isRoundActive = false
        end
        
        task.wait(3) -- Celebration pause
    end
end)
