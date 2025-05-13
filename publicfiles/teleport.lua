-- TeleportGUI Script
-- This script creates a draggable GUI with a text input and execute button
-- The player can enter an object name and teleport to it if it exists in the "Mine" folder
-- Also displays current player coordinates

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TeleportGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Create main frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 250, 0, 190) -- Increased height to accommodate coordinates
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -95)
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
-- Remove Draggable property since we're using custom drag script
MainFrame.Parent = ScreenGui

-- Create title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TitleLabel.BorderSizePixel = 0
TitleLabel.Text = "Teleport to Object"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 18
TitleLabel.Parent = MainFrame

-- Create input label
local InputLabel = Instance.new("TextLabel")
InputLabel.Name = "InputLabel"
InputLabel.Size = UDim2.new(1, -20, 0, 20)
InputLabel.Position = UDim2.new(0, 10, 0, 40)
InputLabel.BackgroundTransparency = 1
InputLabel.Text = "Enter Object Name:"
InputLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InputLabel.Font = Enum.Font.SourceSans
InputLabel.TextSize = 14
InputLabel.TextXAlignment = Enum.TextXAlignment.Left
InputLabel.Parent = MainFrame

-- Create text input
local TextBox = Instance.new("TextBox")
TextBox.Name = "ObjectNameInput"
TextBox.Size = UDim2.new(1, -20, 0, 30)
TextBox.Position = UDim2.new(0, 10, 0, 65)
TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TextBox.BorderColor3 = Color3.fromRGB(100, 100, 100)
TextBox.Text = ""
TextBox.PlaceholderText = "Type object name here..."
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 14
TextBox.ClearTextOnFocus = false
TextBox.Parent = MainFrame

-- Create execute button
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Size = UDim2.new(1, -20, 0, 30)
ExecuteButton.Position = UDim2.new(0, 10, 0, 105)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
ExecuteButton.BorderSizePixel = 0
ExecuteButton.Text = "Teleport"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.Font = Enum.Font.SourceSansBold
ExecuteButton.TextSize = 16
ExecuteButton.Parent = MainFrame

-- Create coordinates display
local CoordinatesLabel = Instance.new("TextLabel")
CoordinatesLabel.Name = "CoordinatesLabel"
CoordinatesLabel.Size = UDim2.new(1, -20, 0, 30)
CoordinatesLabel.Position = UDim2.new(0, 10, 0, 145)
CoordinatesLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CoordinatesLabel.BorderColor3 = Color3.fromRGB(100, 100, 100)
CoordinatesLabel.Text = "Position: X: 0, Y: 0, Z: 0"
CoordinatesLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CoordinatesLabel.Font = Enum.Font.SourceSans
CoordinatesLabel.TextSize = 14
CoordinatesLabel.TextXAlignment = Enum.TextXAlignment.Left
CoordinatesLabel.Parent = MainFrame

-- Function to teleport the player
local function teleportToObject()
    local objectName = TextBox.Text
    if objectName == "" then
        return
    end
    
    -- Find the "Mine" folder in workspace
    local mineFolder = workspace:FindFirstChild("Mine")
    if not mineFolder then
        print("Error: 'Mine' folder not found in workspace.")
        return
    end
    
    -- Make sure the player character exists
    local character = Player.Character
    if not character then
        print("Error: Player character not found.")
        return
    end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        print("Error: HumanoidRootPart not found.")
        return
    end
    
    -- Find all objects with the specified name in the Mine folder
    local matchingObjects = {}
    
    -- Function to recursively search for objects with matching names
    local function findMatchingObjects(parent)
        for _, obj in pairs(parent:GetChildren()) do
            if obj.Name == objectName then
                table.insert(matchingObjects, obj)
            end
            findMatchingObjects(obj) -- Search recursively
        end
    end
    
    findMatchingObjects(mineFolder)
    
    if #matchingObjects == 0 then
        print("Error: No objects named '" .. objectName .. "' found in the Mine folder.")
        return
    end
    
    -- Find the nearest object if there are multiple matches
    local nearestObject = nil
    local shortestDistance = math.huge
    
    for _, obj in ipairs(matchingObjects) do
        -- Get position of the object
        local targetPosition
        
        if obj:IsA("Model") and obj.PrimaryPart then
            targetPosition = obj.PrimaryPart.Position
        elseif obj:IsA("BasePart") then
            targetPosition = obj.Position
        else
            -- Try to find any part in the object
            local anyPart = obj:FindFirstChildWhichIsA("BasePart", true)
            if anyPart then
                targetPosition = anyPart.Position
            else
                -- Skip this object if we can't find a position
                continue
            end
        end
        
        -- Calculate distance
        local distance = (targetPosition - humanoidRootPart.Position).Magnitude
        
        -- Update nearest object if this one is closer
        if distance < shortestDistance then
            nearestObject = obj
            shortestDistance = distance
        end
    end
    
    if not nearestObject then
        print("Error: Could not find a valid object to teleport to.")
        return
    end
    
    -- Get position to teleport to
    local targetPosition
    
    if nearestObject:IsA("Model") and nearestObject.PrimaryPart then
        targetPosition = nearestObject.PrimaryPart.Position
    elseif nearestObject:IsA("BasePart") then
        targetPosition = nearestObject.Position
    else
        -- Try to find any part in the object
        local anyPart = nearestObject:FindFirstChildWhichIsA("BasePart", true)
        if anyPart then
            targetPosition = anyPart.Position
        else
            print("Error: Cannot find a valid position in the target object.")
            return
        end
    end
    
    -- Add a small Y offset to prevent getting stuck in the object
    targetPosition = targetPosition + Vector3.new(0, 3, 0)
    
    -- Teleport
    humanoidRootPart.CFrame = CFrame.new(targetPosition)
    print("Teleported to " .. objectName .. " (Distance: " .. math.floor(shortestDistance) .. " studs)")
end

-- Connect button click event
ExecuteButton.MouseButton1Click:Connect(teleportToObject)

-- Allow Enter key to trigger teleport as well
TextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        teleportToObject()
    end
end)

-- Update coordinates display
local function updateCoordinates()
    local character = Player.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    local position = humanoidRootPart.Position
    local roundedX = math.floor(position.X * 10) / 10
    local roundedY = math.floor(position.Y * 10) / 10
    local roundedZ = math.floor(position.Z * 10) / 10
    
    CoordinatesLabel.Text = "Position: X: " .. roundedX .. ", Y: " .. roundedY .. ", Z: " .. roundedZ
end

-- Connect to RenderStepped to update coordinates in real-time
RunService.RenderStepped:Connect(updateCoordinates)

-- Custom drag script implementation
local dragToggle = nil
local dragInput = nil
local dragStart = nil
local dragInfo = TweenInfo.new(0.1)
local dragPos = nil

local function updateInput(input)
    local delta = input.Position - dragStart
    local position = UDim2.new(dragPos.X.Scale, dragPos.X.Offset + delta.X, dragPos.Y.Scale, dragPos.Y.Offset + delta.Y)
    TweenService:Create(MainFrame, dragInfo, {Position = position}):Play()
end

local function dragInputBegan(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UserInputService:GetFocusedTextBox() == nil then
        dragToggle = true
        dragStart = input.Position
        dragPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end

local function dragInputChanged(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end

local function userInputChanged(input, gameProcessedEvent)
    if input == dragInput and dragToggle then
        updateInput(input)
    end
end

-- Connect drag events
MainFrame.InputBegan:Connect(dragInputBegan)
MainFrame.InputChanged:Connect(dragInputChanged)
UserInputService.InputChanged:Connect(userInputChanged)

print("Teleport GUI loaded successfully. Type an object name and click 'Teleport' to go to it.")
