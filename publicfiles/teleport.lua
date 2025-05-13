-- TeleportGUI Script
-- This script creates a draggable GUI with a text input and execute button
-- The player can enter an object name and teleport to it if it exists in the "Mine" folder
-- Also displays current player coordinates

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

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
MainFrame.Draggable = true
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
    
    -- Find the object with the specified name in the Mine folder
    local targetObject = mineFolder:FindFirstChild(objectName)
    if not targetObject then
        print("Error: Object named '" .. objectName .. "' not found in the Mine folder.")
        return
    end
    
    -- Make sure the player character exists
    local character = Player.Character
    if not character then
        print("Error: Player character not found.")
        return
    end
    
    -- Teleport the player to the object
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        -- Get position to teleport to
        local targetPosition
        
        -- Check if the target has a primary part or is a part itself
        if targetObject:IsA("Model") and targetObject.PrimaryPart then
            targetPosition = targetObject.PrimaryPart.Position
        elseif targetObject:IsA("BasePart") then
            targetPosition = targetObject.Position
        else
            -- Try to find any part in the object
            local anyPart = targetObject:FindFirstChildWhichIsA("BasePart")
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
        print("Teleported to " .. objectName)
    else
        print("Error: HumanoidRootPart not found.")
    end
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

print("Teleport GUI loaded successfully. Type an object name and click 'Teleport' to go to it.")
