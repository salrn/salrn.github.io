-- Gui to Lua
-- Version: 3.2

-- Instances:

local Frame = Instance.new("Frame")
local Add = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local Objects = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Template = Instance.new("Frame")
local PartName = Instance.new("TextLabel")
local AmountFound = Instance.new("TextLabel")
local Go = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local MinuteTime = Instance.new("TextLabel")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")

--Properties:

Frame.Parent = game.StarterGui.ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.299715936, 0, 0.261996329, 0)
Frame.Size = UDim2.new(0.335718542, 0, 0.425373137, 0)

Add.Name = "Add"
Add.Parent = Frame
Add.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Add.BorderColor3 = Color3.fromRGB(0, 0, 0)
Add.BorderSizePixel = 0
Add.Position = UDim2.new(0.904085279, 0, 0.851526916, 0)
Add.Size = UDim2.new(0, 54, 0, 50)
Add.Font = Enum.Font.SourceSans
Add.Text = "Add to list"
Add.TextColor3 = Color3.fromRGB(0, 0, 0)
Add.TextScaled = true
Add.TextSize = 14.000
Add.TextWrapped = true

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 0, 0.851526916, 0)
TextBox.Size = UDim2.new(0, 509, 0, 50)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000

Objects.Name = "Objects"
Objects.Parent = Frame
Objects.Active = true
Objects.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Objects.BorderColor3 = Color3.fromRGB(0, 0, 0)
Objects.BorderSizePixel = 0
Objects.Position = UDim2.new(0, 0, 0.0497076027, 0)
Objects.Size = UDim2.new(0, 563, 0, 274)

UIListLayout.Parent = Objects
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Template.Name = "Template"
Template.Parent = Objects
Template.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
Template.BorderSizePixel = 0
Template.Size = UDim2.new(0, 563, 0, 51)
Template.Visible = false

PartName.Name = "PartName"
PartName.Parent = Template
PartName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PartName.BorderColor3 = Color3.fromRGB(0, 0, 0)
PartName.BorderSizePixel = 0
PartName.Size = UDim2.new(0, 315, 0, 50)
PartName.Font = Enum.Font.SourceSans
PartName.Text = "ObjectName"
PartName.TextColor3 = Color3.fromRGB(0, 0, 0)
PartName.TextScaled = true
PartName.TextSize = 14.000
PartName.TextWrapped = true

AmountFound.Name = "AmountFound"
AmountFound.Parent = Template
AmountFound.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AmountFound.BorderColor3 = Color3.fromRGB(0, 0, 0)
AmountFound.BorderSizePixel = 0
AmountFound.Position = UDim2.new(0.559502661, 0, 0.0196078438, 0)
AmountFound.Size = UDim2.new(0, 104, 0, 50)
AmountFound.Font = Enum.Font.SourceSans
AmountFound.Text = "AmountFound"
AmountFound.TextColor3 = Color3.fromRGB(0, 0, 0)
AmountFound.TextScaled = true
AmountFound.TextSize = 14.000
AmountFound.TextWrapped = true

Go.Name = "Go"
Go.Parent = Template
Go.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Go.BorderColor3 = Color3.fromRGB(0, 0, 0)
Go.BorderSizePixel = 0
Go.Position = UDim2.new(0.74422735, 0, 0.0196078438, 0)
Go.Size = UDim2.new(0, 144, 0, 50)
Go.Font = Enum.Font.SourceSans
Go.Text = "Go"
Go.TextColor3 = Color3.fromRGB(0, 0, 0)
Go.TextScaled = true
Go.TextSize = 14.000
Go.TextWrapped = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0124333929, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 17)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "Azure Mines GUI"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint.Parent = TextLabel
UITextSizeConstraint.MaxTextSize = 17

MinuteTime.Name = "MinuteTime"
MinuteTime.Parent = Frame
MinuteTime.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinuteTime.BackgroundTransparency = 1.000
MinuteTime.BorderColor3 = Color3.fromRGB(0, 0, 0)
MinuteTime.BorderSizePixel = 0
MinuteTime.Position = UDim2.new(0.634103, 0, 0, 0)
MinuteTime.Size = UDim2.new(0, 200, 0, 17)
MinuteTime.Font = Enum.Font.Unknown
MinuteTime.Text = "Azure Mines GUI"
MinuteTime.TextColor3 = Color3.fromRGB(255, 255, 255)
MinuteTime.TextScaled = true
MinuteTime.TextSize = 14.000
MinuteTime.TextWrapped = true
MinuteTime.TextXAlignment = Enum.TextXAlignment.Right

UITextSizeConstraint_2.Parent = MinuteTime
UITextSizeConstraint_2.MaxTextSize = 17

-- Scripts:

local function JWQD_fake_script() -- Frame.DragScript 
	local script = Instance.new('LocalScript', Frame)

	--Not made by me, check out this video: https://www.youtube.com/watch?v=z25nyNBG7Js&t=22s
	--Put this inside of your Frame and configure the speed if you would like.
	--Enjoy! Credits go to: https://www.youtube.com/watch?v=z25nyNBG7Js&t=22s
	
	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
	
end
coroutine.wrap(JWQD_fake_script)()
local function UWHRHYE_fake_script() -- Add.ScriptYouAreEditing 
	local script = Instance.new('LocalScript', Add)

	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	local frame = script.Parent.Parent.Parent.Frame
	local textBox = frame.TextBox
	local addButton = frame.Add
	local objectsFrame = frame.Objects
	local template = objectsFrame.Template
	
	template.Visible = false
	
	local function findParts(partName)
		local parts = {}
		local mineFolder = workspace:FindFirstChild("Mine")
		if mineFolder then
			for _, part in pairs(mineFolder:GetDescendants()) do
				if part:IsA("BasePart") and part.Name:lower() == partName:lower() then
					table.insert(parts, part)
				end
			end
		end
		return parts
	end
	
	local function createPartEntry(partName, partsFound)
		local newEntry = template:Clone()
		newEntry.Name = partName
		newEntry.Visible = true
		newEntry.PartName.Text = partName
		newEntry.AmountFound.Text = tostring(#partsFound)
		newEntry.Parent = objectsFrame
		return newEntry
	end
	
	addButton.MouseButton1Click:Connect(function()
		local partName = textBox.Text:gsub("^%s*(.-)%s*$", "%1")
		if partName ~= "" then
			local partsFound = findParts(partName)
			if objectsFrame:FindFirstChild(partName) then
				local existingEntry = objectsFrame:FindFirstChild(partName)
				existingEntry.AmountFound.Text = tostring(#partsFound)
			else
				createPartEntry(partName, partsFound)
			end
			textBox.Text = ""
		end
	end)
	
	local lastUpdateTimes = {}
	local refreshIntervals = {}
	local totalStoneCount = 0
	local lastRescanStoneMilestone = 0
	local lastRescanTime = 0
	
	local function rescanMineFolder()
		local mineFolder = workspace:FindFirstChild("Mine")
		if mineFolder then
			local uniqueNames = {}
			for _, part in pairs(mineFolder:GetDescendants()) do
				if part:IsA("BasePart") then
					uniqueNames[part.Name] = true
				end
			end
			for partName in pairs(uniqueNames) do
				if not objectsFrame:FindFirstChild(partName) then
					local found = findParts(partName)
					createPartEntry(partName, found)
				end
			end
		end
	end
	
	local function refreshPartCounts()
		rescanMineFolder()
		lastRescanTime = tick()
	
		while true do
			local currentTime = tick()
	
			for _, entry in pairs(objectsFrame:GetChildren()) do
				if entry:IsA("Frame") and entry ~= template then
					local partName = entry.Name
					local lastUpdated = lastUpdateTimes[partName] or 0
					local interval = refreshIntervals[partName] or 3
	
					if currentTime - lastUpdated >= interval then
						local updatedParts = findParts(partName)
						entry.AmountFound.Text = tostring(#updatedParts)
						lastUpdateTimes[partName] = currentTime
	
						if partName:lower() == "stone" then
							totalStoneCount += #updatedParts
						end
	
						if #updatedParts == 0 then
							refreshIntervals[partName] = 3
						else
							refreshIntervals[partName] = 5
						end
					end
				end
			end
	
			if math.floor(totalStoneCount / 5000) > lastRescanStoneMilestone then
				lastRescanStoneMilestone = math.floor(totalStoneCount / 5000)
				rescanMineFolder()
			end
	
			if currentTime - lastRescanTime >= 60 then
				lastRescanTime = currentTime
				rescanMineFolder()
			end
	
			wait(1)
		end
	end
	
	coroutine.wrap(refreshPartCounts)()
	
end
coroutine.wrap(UWHRHYE_fake_script)()
local function DYZIMYX_fake_script() -- Go.LocalScript 
	local script = Instance.new('LocalScript', Go)

	-- LocalScript for the Go button
	-- Place this script inside each "Go" button
	
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Get the parent frame (which is named after the part)
	local parentFrame = script.Parent.Parent
	local partName = parentFrame.Name
	
	-- Function to find parts by name in the Mine folder
	local function findParts(name)
		local parts = {}
		local mineFolder = workspace:FindFirstChild("Mine")
	
		if mineFolder then
			for _, part in pairs(mineFolder:GetDescendants()) do
				if part:IsA("BasePart") and part.Name:lower() == name:lower() then
					table.insert(parts, part)
				end
			end
		end
	
		return parts
	end
	
	-- Handle the button click
	script.Parent.MouseButton1Click:Connect(function()
		local character = player.Character
		if character then
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart then
				-- Find the parts matching this button's parent frame name
				local matchingParts = findParts(partName)
	
				if #matchingParts > 0 then
					local targetPart = matchingParts[1]
					-- Teleport 3 studs above the part
					humanoidRootPart.CFrame = CFrame.new(targetPart.Position + Vector3.new(0, targetPart.Size.Y/2 + 3, 0))
				else
					-- Optional: Give feedback if part no longer exists
					print("Part no longer exists: " .. partName)
				end
			end
		end
	end)
end
coroutine.wrap(DYZIMYX_fake_script)()
local function VUIQH_fake_script() -- MinuteTime.LocalScript 
	local script = Instance.new('LocalScript', MinuteTime)

	local minuteTimeLabel = script.Parent
	
	while true do
		for i = 60, 0, -1 do
			minuteTimeLabel.Text = tostring(i)
			task.wait(1)
		end
	end
	
	
end
coroutine.wrap(VUIQH_fake_script)()
