local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local virtualInputManager = game:GetService("VirtualInputManager")
local lighting = game:GetService("Lighting")
local coreGui = game:GetService("CoreGui")
local workspaceService = game:GetService("Workspace")
local localPlayer = players.LocalPlayer
local currentCamera = workspace.CurrentCamera
local unknown = string.lower("Unknown")
local v1 = false

for index, value in ipairs({
  "delta", "codex", "hydrogen", "arceus", "fluxus", "trigon", "evon", "vega", "solara",
  "mobile",
}) do
  if string.find(unknown, value) then
    v1 = true
    break
  end
end

if userInputService.TouchEnabled and not userInputService.KeyboardEnabled then
  v1 = true
end

print("Executor:", "Unknown", "| Mobile:", v1)

local function f1()
  if isfile and readfile and isfile("OretachiMM2Key.txt") then
    local v2, v3 = pcall(readfile, "OretachiMM2Key.txt")

    if v2 and v3 == "ORETACHI2026" then
      return true
    end

    return false
  end

  return false
end

local v4 = {
  Speed = false,
  SpeedValue = 50,
  Fly = false,
  FlyValue = 50,
  NoClip = false,
  InfiniteJump = false,
  NoFog = false,
  NoShake = false,
  PotatoGraphics = false,
  InnocentESP = false,
  SheriffESP = false,
  MurdererESP = false,
  CoinESP = false,
  GunESP = false,
  MurdererAutoKill = false,
  SheriffAutoKill = false,
  InnocentAutoKill = false,
  QuickButtons = false,
}

local v5 = true

local function f2(p1)
  local vector = Vector3.new(0, 0.4, 0)
  return CFrame.new(p1.Position + p1.CFrame.LookVector * -2.3 + vector, p1.Position)
end

local function f3()
  local v6 = {}

  local coinContainer = workspaceService:FindFirstChild("MilBase")
    and workspaceService.MilBase:FindFirstChild("CoinContainer")

  if coinContainer then
    for index2, value2 in ipairs(coinContainer:GetChildren()) do
      if value2.Name == "Coin_Server" then
        local basePart = value2:IsA("BasePart") and value2

        local basePart2 = basePart
        basePart2 = basePart or value2:FindFirstChildWhichIsA("BasePart")

        if basePart2 then
          table.insert(v6, basePart2)
        end
      end
    end
  end

  return v6
end

local function f4(p2)
  v4.PotatoGraphics = p2

  if p2 then
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    lighting.GlobalShadows = false
  else
    settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
    lighting.GlobalShadows = true
  end
end

local v7 = {}
local v8 = {}

local function f5()
  for key, value3 in pairs(v8) do
    local v9 = value3
    pcall(function() v9:Remove() end)
  end

  v8 = {}
end

local function f6(p3)
  local character = localPlayer.Character

  if not character then
    return
  else
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
      humanoidRootPart.CFrame = typeof(p3) == "CFrame" and p3 or CFrame.new(p3)
      humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    end

    return
  end
end

local v10 = {}

local function f7(p4)
  v4.NoFog = p4

  if p4 then
    lighting.FogEnd = 100000
    lighting.FogStart = 100000
  else
    lighting.FogEnd = 1000
    lighting.FogStart = 0
  end
end

local v11 = {}
local connect

local function f8(p5)
  v4.NoShake = p5

  if connect then
    connect:Disconnect()
    connect = nil
  end

  if p5 then
    connect = runService.RenderStepped:Connect(function()
      local character2 = localPlayer.Character

      if character2 then
        local humanoid = character2:FindFirstChildOfClass("Humanoid")

        if humanoid then
          humanoid.CameraOffset = Vector3.zero
        end
      end
    end)
  end
end

local v12 = {}
local f9

local function f10(p6)
  return f9(p6, "Knife")
end

function f9(p7, p8)
  local function f11(p9)
    if not p9 then
      return false
    end

    for index3, value4 in ipairs(p9:GetChildren()) do
      if value4:IsA("Tool") and value4.Name == p8 then
        return true
      end
    end

    return false
  end

  if p7.Character and f11(p7.Character) then
    return true
  end

  return f11(p7:FindFirstChild("Backpack"))
end

local f12

local function f13(p10)
  return not f10(p10) and not f12(p10)
end

local function f14(p11)
  if not p11.Character then
    return false
  else
    local humanoid2 = p11.Character:FindFirstChildOfClass("Humanoid")
    return humanoid2 and humanoid2.Health > 0
  end
end

local connect2

local function f15(p12)
  if connect2 then
    connect2:Disconnect()
    connect2 = nil
  end

  if p12 then
    connect2 = runService.Stepped:Connect(function()
      local character3 = localPlayer.Character

      if character3 then
        for index4, value5 in ipairs(character3:GetDescendants()) do
          if value5:IsA("BasePart") then
            value5.CanCollide = false
          end
        end
      end
    end)
  end
end

function f12(p13)
  return f9(p13, "Gun")
end

local v13

local function f16()
  v4.MurdererAutoKill = false
  v4.SheriffAutoKill = false
  v4.InnocentAutoKill = false

  v12 = {}

  if v13 then
    task.cancel(v13)
    v13 = nil
  end
end

local function f17()
  for key2, value6 in pairs(v10) do
    local v14 = value6
    pcall(function() v14:Remove() end)
  end

  v10 = {}
end

local connect3, bodyVelocity, bodyGyro

local function f18(p14)
  v4.Fly = p14
  local character4 = localPlayer.Character
  local humanoidRootPart2

  if not character4 then
    return
  else
    humanoidRootPart2 = character4:FindFirstChild("HumanoidRootPart")
    local v15 = not humanoidRootPart2
    local humanoid3 = character4:FindFirstChildOfClass("Humanoid")

    if v15 or not humanoid3 then
      return
    end

    if connect3 then
      connect3:Disconnect()
      connect3 = nil
    end

    if bodyVelocity then
      bodyVelocity:Destroy()
      bodyVelocity = nil
    end

    if bodyGyro then
      bodyGyro:Destroy()
      bodyGyro = nil
    end

    if p14 then
      bodyVelocity = Instance.new("BodyVelocity")
      bodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyVelocity.Velocity = Vector3.zero
      bodyVelocity.Parent = humanoidRootPart2

      bodyGyro = Instance.new("BodyGyro")
      bodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyGyro.P = 90000
      bodyGyro.Parent = humanoidRootPart2

      humanoid3.PlatformStand = true

      connect3 = runService.RenderStepped:Connect(function()
        if not v4.Fly or not humanoidRootPart2.Parent then
          return
        else
          local cframe = currentCamera.CFrame
          local zero = Vector3.zero

          if userInputService:IsKeyDown(Enum.KeyCode.W) then
            zero = zero + cframe.LookVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.S) then
            zero = zero - cframe.LookVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.A) then
            zero = zero - cframe.RightVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.D) then
            zero = zero + cframe.RightVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.Space) then
            zero = zero + Vector3.new(0, 1, 0)
          end

          if userInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            zero = zero + Vector3.new(0, -1, 0)
          end

          local v16 = bodyVelocity
          v16.Velocity = zero.Magnitude > 0 and zero.Unit * v4.FlyValue or Vector3.zero

          bodyGyro.CFrame = cframe
          return
        end
      end)
    else
      humanoid3.PlatformStand = false
    end

    return
  end
end

local function f19(text, p15)
  local textButton = Instance.new("TextButton")
  textButton.Size = UDim2.new(0, 150, 0, 34)
  textButton.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
  textButton.Text = text
  textButton.TextColor3 = Color3.fromRGB(240, 240, 245)
  textButton.TextSize = 13
  textButton.Font = Enum.Font.GothamBold
  textButton.Parent = coreGui:FindFirstChild("OretachiMM2") or coreGui

  Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 6)

  local instance = Instance.new("UIStroke", textButton)
  instance.Color = Color3.fromRGB(0, 140, 90)
  instance.Thickness = 1.2

  textButton.MouseButton1Click:Connect(p15)
  table.insert(v11, textButton)
  return textButton
end

local function f20()
  local v17 = {}

  for index5, value7 in ipairs(workspaceService:GetDescendants()) do
    if value7.Name == "GunDrop" then
      local basePart3 = value7:IsA("BasePart") and value7

      local basePart4 = basePart3
      basePart4 = basePart3 or value7:FindFirstChildWhichIsA("BasePart")

      if basePart4 then
        table.insert(v17, basePart4)
      end
    end
  end

  return v17
end

local function f21()
  for key3, value8 in pairs(v11) do
  end

  v11 = {}
end

local function f22(p16)
  v4.NoClip = p16
  f15(p16)
end

local connect4, cframe2, textButton2, f23

local function f24()
  local oretachiMM2 = Instance.new("ScreenGui")
  oretachiMM2.Name = "OretachiMM2"
  oretachiMM2.ResetOnSpawn = false
  oretachiMM2.Parent = coreGui

  local v18 = v1 and 400 or 540
  local v19 = v1 and 480 or 520

  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, v18, 0, v19)
  frame.Position = UDim2.new(0.5, -v18 / 2, 0.5, -v19 / 2)
  frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
  frame.BorderSizePixel = 0
  frame.Active = true
  frame.Draggable = true
  frame.Parent = oretachiMM2

  Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

  local frame2 = Instance.new("Frame")
  frame2.Size = UDim2.new(1, 0, 0, 36)
  frame2.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
  frame2.Parent = frame

  Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 10)

  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(0, 260, 1, 0)
  textLabel.Position = UDim2.new(0, 12, 0, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "Oretachi's MM2"
  textLabel.TextColor3 = Color3.fromRGB(235, 235, 245)
  textLabel.TextSize = v1 and 15 or 16
  textLabel.Font = Enum.Font.GothamBold
  textLabel.TextXAlignment = Enum.TextXAlignment.Left
  textLabel.Parent = frame2

  local textButton3 = Instance.new("TextButton")
  textButton3.Size = UDim2.new(0, 30, 0, 24)
  textButton3.Position = UDim2.new(1, -38, 0.5, -12)
  textButton3.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
  textButton3.Text = "−"
  textButton3.TextColor3 = Color3.fromRGB(230, 230, 230)
  textButton3.Font = Enum.Font.GothamBold
  textButton3.Parent = frame2

  Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 6)

  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(0, 180, 0, 16)
  textLabel2.Position = UDim2.new(0, 10, 1, -20)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = "Executor: Unknown"
  textLabel2.TextColor3 = Color3.fromRGB(120, 120, 140)
  textLabel2.TextSize = 11
  textLabel2.Font = Enum.Font.Gotham
  textLabel2.TextXAlignment = Enum.TextXAlignment.Left
  textLabel2.Parent = frame

  local function f25()
    if textButton2 then
      textButton2:Destroy()
    end

    textButton2 = Instance.new("TextButton")
    textButton2.Size = UDim2.new(0, 42, 0, 42)
    textButton2.Position = UDim2.new(1, -52, 0, 12)
    textButton2.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    textButton2.Text = "≡"
    textButton2.TextColor3 = Color3.fromRGB(0, 200, 120)
    textButton2.TextSize = 20
    textButton2.Font = Enum.Font.GothamBold
    textButton2.Visible = false
    textButton2.Parent = oretachiMM2

    Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", textButton2).Color = Color3.fromRGB(0, 140, 90)

    textButton2.MouseButton1Click:Connect(function()
      v5 = true
      frame.Visible = true
      textButton2.Visible = false
    end)
  end

  f25()

  textButton3.MouseButton1Click:Connect(function()
    v5 = false
    frame.Visible = false

    if v1 then
      textButton2.Visible = true
    end
  end)

  local frame3 = Instance.new("Frame")
  frame3.Size = UDim2.new(1, -12, 0, 30)
  frame3.Position = UDim2.new(0, 6, 0, 42)
  frame3.BackgroundTransparency = 1
  frame3.Parent = frame

  local function f26(text2, p17)
    local textButton4 = Instance.new("TextButton")
    textButton4.Size = UDim2.new(0, v1 and 90 or 110, 1, 0)
    textButton4.Position = UDim2.new(0, (p17 - 1) * (v1 and 96 or 118), 0, 0)
    textButton4.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    textButton4.Text = text2
    textButton4.TextColor3 = Color3.fromRGB(180, 180, 195)
    textButton4.TextSize = 12
    textButton4.Font = Enum.Font.GothamMedium
    textButton4.Parent = frame3

    Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 6)
    return textButton4
  end

  local v20 = f26("Player", 1)
  local v21 = f26("ESP", 2)
  local v22 = f26("Kill", 3)

  local frame4 = Instance.new("Frame")
  frame4.Size = UDim2.new(1, -12, 1, -85)
  frame4.Position = UDim2.new(0, 6, 0, 78)
  frame4.BackgroundTransparency = 1
  frame4.Parent = frame

  local function f27()
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.ScrollBarThickness = 4
    scrollingFrame.Visible = false
    scrollingFrame.Parent = frame4

    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Parent = scrollingFrame
    uiListLayout.Padding = UDim.new(0, 7)

    uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 12)
    end)

    return scrollingFrame
  end

  local v23 = f27()
  local v24 = f27()
  local v25 = f27()
  v23.Visible = true

  local function f28(p18, p19)
    v23.Visible = false
    v24.Visible = false
    v25.Visible = false
    p18.Visible = true

    for index6, value9 in ipairs(frame3:GetChildren()) do
      if value9:IsA("TextButton") then
        value9.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        value9.TextColor3 = Color3.fromRGB(180, 180, 195)
      end
    end

    p19.BackgroundColor3 = Color3.fromRGB(0, 125, 85)
    p19.TextColor3 = Color3.fromRGB(255, 255, 255)
  end

  v20.MouseButton1Click:Connect(function() f28(v23, v20) end)
  v21.MouseButton1Click:Connect(function() f28(v24, v21) end)
  v22.MouseButton1Click:Connect(function() f28(v25, v22) end)

  local function f29(parent, text3, fn)
    local frame5 = Instance.new("Frame")
    frame5.Size = UDim2.new(1, 0, 0, v1 and 40 or 36)
    frame5.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    frame5.Parent = parent

    Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 7)

    local textLabel3 = Instance.new("TextLabel")
    textLabel3.Size = UDim2.new(1, -62, 1, 0)
    textLabel3.Position = UDim2.new(0, 12, 0, 0)
    textLabel3.BackgroundTransparency = 1
    textLabel3.Text = text3
    textLabel3.TextColor3 = Color3.fromRGB(225, 225, 235)
    textLabel3.TextSize = 13
    textLabel3.Font = Enum.Font.Gotham
    textLabel3.TextXAlignment = Enum.TextXAlignment.Left
    textLabel3.Parent = frame5

    local textButton5 = Instance.new("TextButton")
    textButton5.Size = UDim2.new(0, 42, 0, 22)
    textButton5.Position = UDim2.new(1, -50, 0.5, -11)
    textButton5.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    textButton5.Text = ""
    textButton5.Parent = frame5

    Instance.new("UICorner", textButton5).CornerRadius = UDim.new(1, 0)
    local v26 = false

    textButton5.MouseButton1Click:Connect(function()
      v26 = not v26

      textButton5.BackgroundColor3 = v26 and Color3.fromRGB(0, 145, 85)
        or Color3.fromRGB(50, 50, 60)

      fn(v26)
    end)

    return {
      SetState = function(p20)
        v26 = p20

        textButton5.BackgroundColor3 = p20 and Color3.fromRGB(0, 145, 85)
          or Color3.fromRGB(50, 50, 60)
      end,
    }
  end

  local function f30(parent2, text4, p21, p22, p23, fn2)
    local frame6 = Instance.new("Frame")
    frame6.Size = UDim2.new(1, 0, 0, v1 and 64 or 58)
    frame6.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    frame6.Parent = parent2

    Instance.new("UICorner", frame6).CornerRadius = UDim.new(0, 7)

    local textLabel4 = Instance.new("TextLabel")
    textLabel4.Size = UDim2.new(0.65, 0, 0, 20)
    textLabel4.Position = UDim2.new(0, 12, 0, 5)
    textLabel4.BackgroundTransparency = 1
    textLabel4.Text = text4
    textLabel4.TextColor3 = Color3.fromRGB(225, 225, 235)
    textLabel4.TextSize = 13
    textLabel4.Font = Enum.Font.Gotham
    textLabel4.TextXAlignment = Enum.TextXAlignment.Left
    textLabel4.Parent = frame6
    local textLabel5 = Instance.new("TextLabel")
    textLabel5.Size = UDim2.new(0.3, -12, 0, 20)
    textLabel5.Position = UDim2.new(0.68, 0, 0, 5)
    textLabel5.BackgroundTransparency = 1
    textLabel5.Text = tostring(p23)
    textLabel5.TextColor3 = Color3.fromRGB(0, 210, 130)
    textLabel5.TextSize = 13
    textLabel5.Font = Enum.Font.GothamBold
    textLabel5.TextXAlignment = Enum.TextXAlignment.Right
    textLabel5.Parent = frame6

    local frame7 = Instance.new("Frame")
    frame7.Size = UDim2.new(1, -24, 0, v1 and 12 or 9)
    frame7.Position = UDim2.new(0, 12, 0, v1 and 36 or 32)
    frame7.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
    frame7.Parent = frame6

    Instance.new("UICorner", frame7).CornerRadius = UDim.new(1, 0)

    local frame8 = Instance.new("Frame")
    frame8.Size = UDim2.new((p23 - p21) / (p22 - p21), 0, 1, 0)
    frame8.BackgroundColor3 = Color3.fromRGB(0, 160, 95)
    frame8.Parent = frame7

    Instance.new("UICorner", frame8).CornerRadius = UDim.new(1, 0)
    local v27 = false

    local function f31(p24)
      local v28 = math.clamp((p24.X - frame7.AbsolutePosition.X) / frame7.AbsoluteSize.X, 0, 1)
      local v29 = math.floor(p21 + (p22 - p21) * v28 + 0.5)
      frame8.Size = UDim2.new(v28, 0, 1, 0)
      textLabel5.Text = tostring(v29)
      fn2(v29)
    end

    frame7.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        v27 = true
        f31(input.Position)
      end
    end)

    userInputService.InputEnded:Connect(function(input2)
      if input2.UserInputType == Enum.UserInputType.MouseButton1
        or input2.UserInputType == Enum.UserInputType.Touch then
        v27 = false
      end
    end)

    userInputService.InputChanged:Connect(function(input3)
      if v27
        and (input3.UserInputType == Enum.UserInputType.MouseMovement
          or input3.UserInputType == Enum.UserInputType.Touch) then
        f31(input3.Position)
      end
    end)
  end

  local function f32(parent3, text5, p25)
    local textButton6 = Instance.new("TextButton")
    textButton6.Size = UDim2.new(1, 0, 0, v1 and 38 or 34)
    textButton6.BackgroundColor3 = Color3.fromRGB(38, 42, 58)
    textButton6.Text = text5
    textButton6.TextColor3 = Color3.fromRGB(235, 235, 245)
    textButton6.TextSize = 13
    textButton6.Font = Enum.Font.GothamMedium
    textButton6.Parent = parent3

    Instance.new("UICorner", textButton6).CornerRadius = UDim.new(0, 7)
    textButton6.MouseButton1Click:Connect(p25)
    return textButton6
  end

  local function f33(parent4, text6, p26)
    local textLabel6 = Instance.new("TextLabel")
    textLabel6.Size = UDim2.new(1, 0, 0, 18)
    textLabel6.BackgroundTransparency = 1
    textLabel6.Text = text6
    textLabel6.TextColor3 = p26 or Color3.fromRGB(180, 180, 190)
    textLabel6.TextSize = 12
    textLabel6.Font = Enum.Font.Gotham
    textLabel6.TextXAlignment = Enum.TextXAlignment.Left
    textLabel6.Parent = parent4
  end

  f29(v23, "Speed Hack", function(p27)
    v4.Speed = p27

    if connect4 then
      connect4:Disconnect()
      connect4 = nil
    end

    if p27 then
      connect4 = runService.Heartbeat:Connect(function()
        local character5 = localPlayer.Character

        if character5 and character5:FindFirstChildOfClass("Humanoid") then
          character5.Humanoid.WalkSpeed = v4.SpeedValue
        end
      end)
    else
      local character6 = localPlayer.Character

      if character6 and character6:FindFirstChildOfClass("Humanoid") then
        character6.Humanoid.WalkSpeed = 16
      end
    end
  end)

  f30(v23, "Speed Value", 1, 1000, 50, function(speedValue) v4.SpeedValue = speedValue end)
  f29(v23, "Fly", function(p28) f18(p28) end)
  f30(v23, "Fly Speed", 1, 1000, 50, function(flyValue) v4.FlyValue = flyValue end)

  f29(v23, "NoClip", function(p29) f22(p29) end)
  f29(v23, "Infinite Jump", function(infiniteJump) v4.InfiniteJump = infiniteJump end)
  f29(v23, "No Fog", function(p30) f7(p30) end)
  f29(v23, "No Shake", function(p31) f8(p31) end)
  f29(v23, "Potato Graphics", function(p32) f4(p32) end)

  userInputService.JumpRequest:Connect(function()
    if v4.InfiniteJump then
      local character7 = localPlayer.Character

      if character7 and character7:FindFirstChildOfClass("Humanoid") then
        character7.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
      end
    end
  end)

  f29(v24, "Innocent ESP", function(innocentESP) v4.InnocentESP = innocentESP end)
  f29(v24, "Sheriff ESP", function(sheriffESP) v4.SheriffESP = sheriffESP end)
  f29(v24, "Murderer ESP", function(murdererESP) v4.MurdererESP = murdererESP end)

  f29(v24, "Coin ESP", function(p33)
    v4.CoinESP = p33

    if not p33 then
      f5()
    end
  end)

  f29(v24, "Gun ESP", function(p34)
    v4.GunESP = p34

    if not p34 then
      f17()
    end
  end)

  f33(v24, "Spectate", Color3.fromRGB(0, 200, 130))

  f32(v24, "Refresh Player List", function()
    for index7, value10 in ipairs(players:GetPlayers()) do
      local v30 = value10

      if v30 ~= localPlayer then
        f32(v24, v30.Name, function()
          if v30.Character and v30.Character:FindFirstChildOfClass("Humanoid") then
            currentCamera.CameraSubject = v30.Character.Humanoid
          end
        end)
      end
    end
  end)

  f32(v24, "Stop Spectating", function()
    if localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
      currentCamera.CameraSubject = localPlayer.Character.Humanoid
    end
  end)

  f29(v25, "Button for Features", function(quickButtons)
    v4.QuickButtons = quickButtons
    f23()
  end)

  f32(v25, "Auto Pick-up Gun", function()
    local v31 = f20()
    local humanoidRootPart3

    if #v31 > 0 then
      humanoidRootPart3 = localPlayer.Character
        and localPlayer.Character:FindFirstChild("HumanoidRootPart")

      if humanoidRootPart3 then
        table.sort(v31, function(p35, p36)
          return (p35.Position - humanoidRootPart3.Position).Magnitude
            < (p36.Position - humanoidRootPart3.Position).Magnitude
        end)

        f6(v31[1].CFrame * CFrame.new(0, 3, 0))
      end
    end
  end)

  local v32 = f29(v25, "Murderer Auto Kill (Sheriff)", function(p37)
    f16()
    v4.MurdererAutoKill = p37

    if p37 then
      v13 = task.spawn(function()
        while v4.MurdererAutoKill do
          if f12(localPlayer) then
            for index8, value11 in ipairs(players:GetPlayers()) do
              if not v4.MurdererAutoKill then
                break
              end

              if value11 ~= localPlayer and f10(value11) and f14(value11) then
                local character8 = localPlayer.Character

                if character8 and character8:FindFirstChild("HumanoidRootPart") then
                  cframe2 = character8.HumanoidRootPart.CFrame
                  f6(f2(value11.Character.HumanoidRootPart))
                  virtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                  task.wait(0.1)
                  virtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                  task.wait(0.3)

                  if f14(value11) and cframe2 then
                    f6(cframe2)
                  end

                  task.wait(2.5)
                end
              end
            end
          end

          task.wait(0.4)
        end
      end)
    end
  end)

  local v33 = f29(v25, "Sheriff Auto Kill (Murderer)", function(p38)
    f16()
    v4.SheriffAutoKill = p38

    if p38 then
      v13 = task.spawn(function()
        while v4.SheriffAutoKill do
          if f10(localPlayer) then
            for index9, value12 in ipairs(players:GetPlayers()) do
              if not v4.SheriffAutoKill then
                break
              end

              if value12 ~= localPlayer and f12(value12) and f14(value12) then
                local character9 = localPlayer.Character

                if character9 and character9:FindFirstChild("HumanoidRootPart") then
                  cframe2 = character9.HumanoidRootPart.CFrame
                  f6(f2(value12.Character.HumanoidRootPart))
                  virtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                  task.wait(0.08)
                  virtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                  task.wait(0.25)

                  if f14(value12) and cframe2 then
                    f6(cframe2)
                  end

                  task.wait(2.5)
                end
              end
            end
          end

          task.wait(0.4)
        end
      end)
    end
  end)

  local v34 = f29(v25, "Innocent Auto Kill (Murderer)", function(p39)
    f16()
    v4.InnocentAutoKill = p39
    v12 = {}

    if p39 then
      v13 = task.spawn(function()
        while v4.InnocentAutoKill do
          if f10(localPlayer) then
            for index10, value13 in ipairs(players:GetPlayers()) do
              if not v4.InnocentAutoKill then
                break
              end

              if value13 ~= localPlayer and f13(value13) and f14(value13) and not v12[value13] then
                local character10 = value13.Character

                local humanoidRootPart4 = character10

                humanoidRootPart4 = character10
                  and value13.Character:FindFirstChild("HumanoidRootPart")

                if humanoidRootPart4 then
                  f6(f2(humanoidRootPart4))
                  v12[value13] = true
                  local count = 0

                  while f14(value13) and v4.InnocentAutoKill and count < 18 do
                    virtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                    task.wait(0.06)
                    virtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                    task.wait(0.04)
                    count = count + 1
                  end
                end
              end
            end
          end

          task.wait(0.2)
        end
      end)
    end
  end)

  f33(v25, "Press [K] to stop all Auto Kills", Color3.fromRGB(255, 180, 50))

  runService.RenderStepped:Connect(function()
    local v35 = {}

    for index11, value14 in ipairs(players:GetPlayers()) do
      if value14 ~= localPlayer and value14.Character then
        local humanoidRootPart5 = value14.Character:FindFirstChild("HumanoidRootPart")
        local humanoid4 = value14.Character:FindFirstChildOfClass("Humanoid")

        if humanoidRootPart5 and humanoid4 and humanoid4.Health > 0 then
          v35[value14] = true

          if not v7[value14] then
            v7[value14] = { Name = Drawing.new("Text"), Info = Drawing.new("Text") }

            local v36 = v7[value14]
            v36.Name.Size = 15
            v36.Name.Center = true
            v36.Name.Outline = true
            v36.Info.Size = 12
            v36.Info.Center = true
            v36.Info.Outline = true
          end

          local v37 = v7[value14]

          local v38, v39 = currentCamera:WorldToViewportPoint(humanoidRootPart5.Position
            + Vector3.new(0, 3.1, 0))

          if v39 then
            local magnitude = 0

            if localPlayer.Character
              and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
              magnitude = (humanoidRootPart5.Position
                - localPlayer.Character.HumanoidRootPart.Position).Magnitude
            end

            local v40 = f10(value14)
            local v41 = f12(value14)
            local v42 = f13(value14)
            local v43 = false
            local color = Color3.fromRGB(255, 255, 255)
            local v44 = ""

            if v4.MurdererESP and v40 then
              v43 = true
              color = Color3.fromRGB(255, 50, 50)
              v44 = "[MURDERER] "
            elseif v4.SheriffESP and v41 then
              v43 = true
              color = Color3.fromRGB(50, 150, 255)
              v44 = "[SHERIFF] "
            elseif v4.InnocentESP and v42 then
              v43 = true
              color = Color3.fromRGB(80, 220, 100)
              v44 = "[INNOCENT] "
            end

            if v43 then
              v37.Name.Text = v44 .. value14.Name
              v37.Name.Color = color
              v37.Name.Position = Vector2.new(v38.X, v38.Y - 15)
              v37.Name.Visible = true

              v37.Info.Text = string.format(
                "%d HP | %d studs", math.floor(humanoid4.Health), math.floor(magnitude)
              )

              v37.Info.Color = color
              v37.Info.Position = Vector2.new(v38.X, v38.Y)
              v37.Info.Visible = true
            else
              v37.Name.Visible = false
              v37.Info.Visible = false
            end
          else
            v37.Name.Visible = false
            v37.Info.Visible = false
          end
        end
      end
    end

    for key4, value15 in pairs(v7) do
      local v45 = value15

      if not v35[key4] then
        pcall(function() v45.Name:Remove() end)
        pcall(function() v45.Info:Remove() end)
        v7[key4] = nil
      end
    end

    if v4.CoinESP then
      local v46 = {}

      for index12, value16 in ipairs((f3())) do
        v46[value16] = true

        if not v8[value16] then
          local text7 = Drawing.new("Text")
          text7.Size = 13
          text7.Center = true
          text7.Outline = true
          text7.Color = Color3.fromRGB(255, 215, 0)
          text7.Text = "COIN"

          v8[value16] = text7
        end

        local v47 = v8[value16]
        local v48, v49 = currentCamera:WorldToViewportPoint(value16.Position)
        v47.Visible = v49 and v48.Z > 0

        if v47.Visible then
          v47.Position = Vector2.new(v48.X, v48.Y)
        end
      end

      for key5, value17 in pairs(v8) do
        local v50 = value17

        if not v46[key5] then
          pcall(function() v50:Remove() end)
          v8[key5] = nil
        end
      end
    else
      f5()
    end

    if v4.GunESP then
      local v51 = {}

      for index13, value18 in ipairs((f20())) do
        v51[value18] = true

        if not v10[value18] then
          local text8 = Drawing.new("Text")
          text8.Size = 14
          text8.Center = true
          text8.Outline = true
          text8.Color = Color3.fromRGB(0, 200, 255)
          text8.Text = "GUN"

          v10[value18] = text8
        end

        local v52 = v10[value18]
        local v53, v54 = currentCamera:WorldToViewportPoint(value18.Position)
        v52.Visible = v54 and v53.Z > 0

        if v52.Visible then
          v52.Position = Vector2.new(v53.X, v53.Y)
        end
      end

      for key6, value19 in pairs(v10) do
        local v55 = value19

        if not v51[key6] then
          pcall(function() v55:Remove() end)
          v10[key6] = nil
        end
      end
    else
      f17()
    end
  end)

  userInputService.InputBegan:Connect(function(input4, p40)
    if p40 then
      return
    end

    if not v1 and input4.KeyCode == Enum.KeyCode.RightControl then
      v5 = not v5
      frame.Visible = v5

      if textButton2 then
        textButton2.Visible = not v5
      end
    end

    if input4.KeyCode == Enum.KeyCode.K then
      f16()
      v32.SetState(false)
      v33.SetState(false)
      v34.SetState(false)
    end
  end)

  print("Oretachi's MM2 | Mobile + No Farm loaded")
end

function f23()
  f21()
  local v56

  if not v4.QuickButtons then
    return
  else
    v56 = 12

    local function f34(p41, p42)
      f19(p41, p42).Position = UDim2.new(0, 12, 0, v56)
      v56 = v56 + 40
    end

    f34("Pick-up Gun", function()
      local v57 = f20()
      local humanoidRootPart6

      if #v57 > 0 then
        humanoidRootPart6 = localPlayer.Character
          and localPlayer.Character:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart6 then
          table.sort(v57, function(p43, p44)
            return (p43.Position - humanoidRootPart6.Position).Magnitude
              < (p44.Position - humanoidRootPart6.Position).Magnitude
          end)

          f6(v57[1].CFrame * CFrame.new(0, 3, 0))
        end
      end
    end)

    f34("Murderer Kill", function()
      if v4.MurdererAutoKill then
        f16()
      else
        f16()
        v4.MurdererAutoKill = true
      end
    end)

    f34("Sheriff Kill", function()
      f16()
      v4.SheriffAutoKill = true
    end)

    f34("Innocent Kill", function()
      f16()
      v4.InnocentAutoKill = true
      v12 = {}
    end)

    return
  end
end

local oretachiKey, textBox, textLabel7

if f1() then
  f24()
else
  oretachiKey = Instance.new("ScreenGui")
  oretachiKey.Name = "OretachiKey"
  oretachiKey.Parent = coreGui

  local frame9 = Instance.new("Frame")
  frame9.Size = UDim2.new(0, 300, 0, 170)
  frame9.Position = UDim2.new(0.5, -150, 0.5, -85)
  frame9.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
  frame9.Parent = oretachiKey

  Instance.new("UICorner", frame9).CornerRadius = UDim.new(0, 10)

  local textLabel8 = Instance.new("TextLabel")
  textLabel8.Size = UDim2.new(1, 0, 0, 36)
  textLabel8.BackgroundTransparency = 1
  textLabel8.Text = "Enter Key"
  textLabel8.TextColor3 = Color3.fromRGB(230, 230, 240)
  textLabel8.TextSize = 17
  textLabel8.Font = Enum.Font.GothamBold
  textLabel8.Parent = frame9

  textBox = Instance.new("TextBox")
  textBox.Size = UDim2.new(0.8, 0, 0, 34)
  textBox.Position = UDim2.new(0.1, 0, 0.32, 0)
  textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
  textBox.PlaceholderText = "Key..."
  textBox.Text = ""
  textBox.TextColor3 = Color3.fromRGB(220, 220, 230)
  textBox.Parent = frame9

  Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)

  local textButton7 = Instance.new("TextButton")
  textButton7.Size = UDim2.new(0.8, 0, 0, 34)
  textButton7.Position = UDim2.new(0.1, 0, 0.62, 0)
  textButton7.BackgroundColor3 = Color3.fromRGB(0, 120, 80)
  textButton7.Text = "Submit"
  textButton7.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton7.Font = Enum.Font.GothamBold
  textButton7.Parent = frame9

  Instance.new("UICorner", textButton7).CornerRadius = UDim.new(0, 6)

  textLabel7 = Instance.new("TextLabel")
  textLabel7.Size = UDim2.new(1, 0, 0, 18)
  textLabel7.Position = UDim2.new(0, 0, 0.88, 0)
  textLabel7.BackgroundTransparency = 1
  textLabel7.Text = ""
  textLabel7.TextColor3 = Color3.fromRGB(255, 80, 80)
  textLabel7.Parent = frame9

  textButton7.MouseButton1Click:Connect(function()
    if textBox.Text == "ORETACHI2026" then
      oretachiKey:Destroy()
      f24()
    else
      textLabel7.Text = "Wrong Key!"
    end
  end)
end    else
      textLabel7.Text = "Wrong Key!"
    end
  end)
end