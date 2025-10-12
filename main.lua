local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local UIStroke = Instance.new("UIStroke")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ClipToDeviceSafeArea = false
ScreenGui.Enabled = true
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.140000001, 0, 0.178104579, 0)
Frame.Size = UDim2.new(0, 194, 0, 374)
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Frame
UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(21, 21, 21))}
UIGradient.Rotation = 90
UIGradient.Parent = Frame
UIStroke.Parent = Frame
UIStroke.Color = Color3.fromRGB(123, 255, 182)
TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0463917516, 0, 0.0213903747, 0)
TextLabel.Size = UDim2.new(0, 175, 0, 29)
TextLabel.Font = Enum.Font.Code
TextLabel.Text = "bringer script"
TextLabel.TextColor3 = Color3.fromRGB(123, 255, 182)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.12371134, 0, 0.13636364, 0)
TextBox.Size = UDim2.new(0, 145, 0, 267)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderColor3 = Color3.fromRGB(91, 57, 57)
TextBox.PlaceholderText = "enter username, not display, and have a tool too"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 157, 157)
TextBox.TextSize = 25.000
TextBox.TextWrapped = true
TextBox.ClearTextOnFocus = false
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
UICorner_2.CornerRadius = UDim.new(0, 5)
UICorner_2.Parent = TextBox
TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.12371134, 0, 0.871657729, 0)
TextButton.Size = UDim2.new(0, 145, 0, 38)
TextButton.Font = Enum.Font.RobotoMono
TextButton.Text = "Bring"
TextButton.TextColor3 = Color3.fromRGB(123, 255, 182)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
UICorner_3.CornerRadius = UDim.new(0, 5)
UICorner_3.Parent = TextButton
TextButton.MouseButton1Click:Connect(function()
    local name = tostring(TextBox.Text)
local lplr = game.Players.LocalPlayer
local target = game.Players:FindFirstChild(tostring(name)) or nil
local chatService = game.TextChatService
if target == nil or target.Character.Humanoid.Health < 6 or target.Character.Humanoid == nil then
    return
end
local tool = lplr.Backpack:FindFirstChildOfClass('Tool') or lplr.Character:FindFirstChildOfClass('Tool') or nil
if tool == nil then
    return
end
local gameCamera = game.Workspace.CurrentCamera
if tool.Parent == lplr.Backpack then
    tool.Parent = lplr.Character
end
local function run(func)
    task.spawn(function()
        func()
    end)
end
local function reEquipTool()
    run(function()
        for _ = 1, 2 do
            if tool.Parent == lplr.Backpack then
                tool.Parent = lplr.Character
            else
                tool.Parent = lplr.Backpack
            end
        end
    end)
end
task.wait(0.18)
lplr.Character.Humanoid.Name = '1'
local humanoidClone = lplr.Character['1']:Clone()
humanoidClone.Name = 'Humanoid'
humanoidClone.Parent = lplr.Character
lplr.Character['1']:Destroy()
gameCamera.CameraSubject = lplr.Character.Humanoid
reEquipTool()
local oldcframe = lplr.Character.HumanoidRootPart.CFrame
local timeout = 1
run(function()
    chatService.TextChannels.RBXGeneral:SendAsync('-ch') -- no idea if this is visual but with accessories the target will suddenly have their hat as your hat
    task.wait(1)
    repeat
        lplr.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
        timeout = timeout + 1
        task.wait()
    until (target.Character:FindFirstChild(tostring(tool.Name)) or timeout > 100)
    lplr.Character.HumanoidRootPart.CFrame = oldcframe
    if tool.Parent == lplr.Character then
        tool.Parent = lplr.Backpack
    end
    task.wait(2)
    chatService.TextChannels.RBXGeneral:SendAsync('-rs')
    task.wait(0.7)
    lplr.Character.HumanoidRootPart.CFrame = oldcframe
end)
end)






-- code structure is messy, sorry :D
game.TextChatService.TextChannels.RBXGeneral:SendAsync('loaded bringer!')
