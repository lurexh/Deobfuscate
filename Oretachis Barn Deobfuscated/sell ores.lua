local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local virtualInputManager = game:GetService("VirtualInputManager")
local soundService = game:GetService("SoundService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local coreGui = game:GetService("CoreGui")
local debris = game:GetService("Debris")
local localPlayer = players.LocalPlayer
local currentCamera = workspace.CurrentCamera

local function f1()
  if isfile and readfile and isfile("OretachiSellOresKey.txt") then
    local v1, v2 = pcall(readfile, "OretachiSellOresKey.txt")

    if v1 and v2 == "ORETACHI2026" then
      return true
    end

    return false
  end

  return false
end

local v3 = {
  AutoOres = false,
  TPSpeed = 30,
  TPInterval = 2,
  AutoDrillYield = false,
  YieldCPS = 10,
  YieldInterval = 1,
  AutoDrillSpeed = false,
  SpeedCPS = 10,
  SpeedInterval = 1,
  AutoOreRegen = false,
  RegenCPS = 10,
  RegenInterval = 1,
  AutoRollingPedestal = false,
  PedestalCPS = 8,
  PedestalInterval = 1,
  AutoOreLuck = false,
  LuckCPS = 8,
  LuckInterval = 1,
  AntiAdmin = false,
  PlayerESP = false,
  Speed = false,
  SpeedValue = 50,
  Fly = false,
  FlyValue = 50,
  NoClip = false,
  InfiniteJump = false,
  AntiAfk = false,
  MuteGame = false,
}

local v4 = false
local v5 = {}

local function f2()
  for index, value in ipairs(workspace:GetDescendants()) do
    local v6 = value

    if v6:IsA("Sound") then
      pcall(function()
        v6.Volume = 0
        v6:Stop()
      end)
    end
  end

  for index2, value2 in ipairs(soundService:GetChildren()) do
    local v7 = value2

    if v7:IsA("Sound") and v7.Name ~= "GrokingoBoombox" then
      pcall(function()
        v7.Volume = 0
        v7:Stop()
      end)
    end
  end
end

local v8 = false
local v9 = {}
local v10 = 70
local looped = true

task.spawn(function()
  while true do
    if v3.MuteGame then
      f2()
    end

    task.wait(0.7)
  end
end)

local connect, bodyVelocity, bodyGyro

local function f3()
  if connect then
    connect:Disconnect()
    connect = nil
  end

  if bodyVelocity then
    bodyVelocity:Destroy()
    bodyVelocity = nil
  end

  if bodyGyro then
    bodyGyro:Destroy()
    bodyGyro = nil
  end

  local character = localPlayer.Character

  if character then
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
      humanoid.PlatformStand = false
    end
  end
end

local v11 = {
  "admin", "mod", "moderator", "tester", "helper", "staff", "owner", "dev", "ea_games",
  "@ea_games",
}

local function f4(p1)
  local v12 = string.lower(p1.Name)
  local v13 = string.lower(p1.DisplayName)

  for index3, value3 in ipairs(v11) do
    if string.find(v12, value3) or string.find(v13, value3) then
      return true
    end
  end

  return false
end

local connect2

local function f5()
  if connect2 then
    return
  end

  connect2 = runService.Stepped:Connect(function()
    if not v3.NoClip then
      return
    else
      local character2 = localPlayer.Character

      if character2 then
        for index4, value4 in ipairs(character2:GetDescendants()) do
          if value4:IsA("BasePart") then
            value4.CanCollide = false
          end
        end
      end

      return
    end
  end)
end

local function f6()
  if connect then
    return
  else
    local character3 = localPlayer.Character

    if not character3 then
      return
    else
      local humanoidRootPart = character3:FindFirstChild("HumanoidRootPart")
      local humanoid2 = character3:FindFirstChildOfClass("Humanoid")

      if not humanoidRootPart or not humanoid2 then
        return
      end

      bodyVelocity = Instance.new("BodyVelocity")
      bodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyVelocity.Velocity = Vector3.zero
      bodyVelocity.Parent = humanoidRootPart

      bodyGyro = Instance.new("BodyGyro")
      bodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyGyro.P = 90000
      bodyGyro.Parent = humanoidRootPart

      humanoid2.PlatformStand = true

      connect = runService.RenderStepped:Connect(function()
        if not v3.Fly then
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

          if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            zero = zero - Vector3.new(0, 1, 0)
          end

          local v14 = bodyVelocity
          v14.Velocity = zero.Magnitude > 0 and zero.Unit * v3.FlyValue or Vector3.zero

          bodyGyro.CFrame = cframe
          return
        end
      end)

      return
    end
  end
end

task.spawn(function()
  while true do
    if v3.AntiAdmin then
      local v15 = false

      for index5, value5 in ipairs(players:GetPlayers()) do
        if value5 ~= localPlayer and f4(value5) then
          v15 = true
          break
        end
      end

      v8 = v15
    else
      v8 = false
    end

    task.wait(3)
  end
end)

local function f7()
  local sound = Instance.new("Sound")
  sound.SoundId = "rbxassetid://88442833509532"
  sound.Volume = 2.5
  sound.Parent = soundService
  sound:Play()

  debris:AddItem(sound, 1)
end

local function f8()
  local character4 = localPlayer.Character

  if not character4 then
    return nil
  else
    local humanoidRootPart2 = character4:FindFirstChild("HumanoidRootPart")
    return humanoidRootPart2 and humanoidRootPart2.Position
  end
end

local function f9(p2)
  local character5 = localPlayer.Character

  if not character5 then
    return
  else
    local humanoidRootPart3 = character5:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart3 then
      return
    else
      local v16 = math.clamp(v3.TPSpeed, 1, 50)
      local v17 = math.max(1, math.floor(28 / v16))
      local count = 0

      while true do
        count = 1 + count

        if not (v17 >= count) then
          break
        end

        humanoidRootPart3.CFrame = humanoidRootPart3.CFrame:Lerp(CFrame.new(p2), count / v17)
        task.wait(0.012)
      end

      humanoidRootPart3.CFrame = CFrame.new(p2)
      return
    end
  end
end

local function f10(p3, p4)
  local remotes = replicatedStorage:FindFirstChild("Remotes")

  if not remotes then
    return
  end

  if not remotes:FindFirstChild(p3) then
    return
  end
end

local function f11(p5)
  for i = 1, p5 or 6 do
    virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.04)
    virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    task.wait(0.03)
  end
end

local function f12(p6)
  if not replicatedStorage:FindFirstChild(p6) then
    return
  end
end

local function f13()
  if connect2 then
    connect2:Disconnect()
    connect2 = nil
  end
end

local connect3

local function f14()
  if connect3 then
    connect3:Disconnect()
  end

  connect3 = runService.Heartbeat:Connect(function()
    if not v3.Speed then
      return
    else
      local character6 = localPlayer.Character

      if character6 then
        local humanoid3 = character6:FindFirstChildOfClass("Humanoid")

        if humanoid3 then
          humanoid3.WalkSpeed = v3.SpeedValue
        end
      end

      return
    end
  end)
end

local function f15()
  if connect3 then
    connect3:Disconnect()
    connect3 = nil
  end

  local character7 = localPlayer.Character

  if character7 then
    local humanoid4 = character7:FindFirstChildOfClass("Humanoid")

    if humanoid4 then
      humanoid4.WalkSpeed = 16
    end
  end
end

userInputService.JumpRequest:Connect(function()
  if v3.InfiniteJump then
    local character8 = localPlayer.Character

    if character8 then
      local humanoid5 = character8:FindFirstChildOfClass("Humanoid")

      if humanoid5 then
        humanoid5:ChangeState(Enum.HumanoidStateType.Jumping)
      end
    end
  end
end)

local function f16()
  if v5.Yield then
    return
  end

  v5.Yield = task.spawn(function()
    while v3.AutoDrillYield and not v8 do
      local count2 = 0

      while true do
        count2 = 1 + count2

        if not (3 >= count2) then
          break
        end

        f10("BaseUpgradeDrillYield", count2)
      end

      task.wait(v3.YieldInterval / math.max(v3.YieldCPS, 1))
    end

    v5.Yield = nil
  end)
end

task.spawn(function()
  while true do
    task.wait(600)

    if v3.AntiAfk then
      virtualInputManager:SendKeyEvent(true, Enum.KeyCode.W, false, game)
      task.wait(0.1)

      virtualInputManager:SendKeyEvent(false, Enum.KeyCode.W, false, game)
      virtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)

      task.wait(0.1)
      virtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
    end
  end
end)

local v18

local function f17(p7)
  if v18 then
    v18:Stop()
    v18:Destroy()
  end

  local grokingoBoombox = Instance.new("Sound")
  grokingoBoombox.Name = "GrokingoBoombox"
  grokingoBoombox.SoundId = "rbxassetid://" .. tostring(p7)
  grokingoBoombox.Volume = v10 / 100
  grokingoBoombox.Looped = looped
  grokingoBoombox.RollOffMaxDistance = 10000
  grokingoBoombox.RollOffMinDistance = 10000
  grokingoBoombox.Parent = soundService

  return grokingoBoombox
end

local function f18()
  if v5.Regen then
    return
  end

  v5.Regen = task.spawn(function()
    while v3.AutoOreRegen and not v8 do
      for j = 1, 3 do
        f10("BaseUpgradeOreRegenSpeed", j)
      end

      task.wait(v3.RegenInterval / math.max(v3.RegenCPS, 1))
    end

    v5.Regen = nil
  end)
end

local function f19()
  if v5.Speed then
    return
  end

  v5.Speed = task.spawn(function()
    while v3.AutoDrillSpeed and not v8 do
      local count3 = 0

      while true do
        count3 = 1 + count3

        if not (3 >= count3) then
          break
        end

        f10("BaseUpgradeDrillSpeed", count3)
      end

      task.wait(v3.SpeedInterval / math.max(v3.SpeedCPS, 1))
    end

    v5.Speed = nil
  end)
end

local v19, v20

local function f20()
  if v5.Ores then
    return
  end

  v5.Ores = task.spawn(function()
    while v3.AutoOres and not v8 do
      if v19 then
        f9(v19)
        local v21 = tick()

        while tick() - v21 < v3.TPInterval and v3.AutoOres do
          f11(5)
          task.wait(0.07)
        end
      end

      if v20 then
        f9(v20)
        local v22 = tick()

        while tick() - v22 < v3.TPInterval and v3.AutoOres do
          f11(5)
          task.wait(0.07)
        end
      end

      task.wait(0.25)
    end

    v5.Ores = nil
  end)
end

local function f21()
  if v5.Pedestal then
    return
  end

  v5.Pedestal = task.spawn(function()
    while v3.AutoRollingPedestal and not v8 do
      f12("RollerUpgradePedestal")
      task.wait(v3.PedestalInterval / math.max(v3.PedestalCPS, 1))
    end

    v5.Pedestal = nil
  end)
end

local v23, f22

local function f23()
  local oretachiSellOres = Instance.new("ScreenGui")
  oretachiSellOres.Name = "OretachiSellOres"
  oretachiSellOres.ResetOnSpawn = false
  oretachiSellOres.Parent = coreGui

  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, 0, 0, 0)
  frame.Position = UDim2.new(0.5, 0, 0.5, 0)
  frame.AnchorPoint = Vector2.new(0.5, 0.5)
  frame.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
  frame.BorderSizePixel = 0
  frame.Active = true
  frame.Draggable = true
  frame.Parent = oretachiSellOres

  Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

  local instance = Instance.new("UIStroke", frame)
  instance.Color = Color3.fromRGB(45, 45, 55)
  instance.Thickness = 1.5

  local frame2 = Instance.new("Frame")
  frame2.Size = UDim2.new(1, 0, 0, 52)
  frame2.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
  frame2.Parent = frame

  Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 14)

  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, -60, 1, 0)
  textLabel.Position = UDim2.new(0, 16, 0, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "Oretachi's Sell Ores!"
  textLabel.TextColor3 = Color3.fromRGB(245, 245, 255)
  textLabel.TextSize = 19
  textLabel.Font = Enum.Font.GothamBold
  textLabel.TextXAlignment = Enum.TextXAlignment.Left
  textLabel.Parent = frame2

  local textButton = Instance.new("TextButton")
  textButton.Size = UDim2.new(0, 36, 0, 28)
  textButton.Position = UDim2.new(1, -46, 0.5, -14)
  textButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
  textButton.Text = "−"
  textButton.TextColor3 = Color3.fromRGB(240, 240, 240)
  textButton.Font = Enum.Font.GothamBold
  textButton.Parent = frame2

  Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 7)

  local frame3 = Instance.new("Frame")
  frame3.Size = UDim2.new(1, -20, 0, 36)
  frame3.Position = UDim2.new(0, 10, 0, 60)
  frame3.BackgroundTransparency = 1
  frame3.Parent = frame

  local function f24(text, p8)
    local textButton2 = Instance.new("TextButton")
    textButton2.Size = UDim2.new(0, 120, 1, 0)
    textButton2.Position = UDim2.new(0, p8, 0, 0)
    textButton2.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    textButton2.Text = text
    textButton2.TextColor3 = Color3.fromRGB(220, 220, 230)
    textButton2.Font = Enum.Font.GothamMedium
    textButton2.TextSize = 14
    textButton2.Parent = frame3

    Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 8)
    return textButton2
  end

  local v24 = f24("Auto", 0)
  local v25 = f24("Player", 130)
  local v26 = f24("Music", 260)
  local v27 = f24("Misc", 390)
  v24.BackgroundColor3 = Color3.fromRGB(0, 145, 100)

  local frame4 = Instance.new("Frame")
  frame4.Size = UDim2.new(1, -20, 1, -110)
  frame4.Position = UDim2.new(0, 10, 0, 104)
  frame4.BackgroundTransparency = 1
  frame4.Parent = frame
  local v28 = {}

  for index6, value6 in ipairs({ "Auto", "Player", "Music", "Misc" }) do
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.ScrollBarThickness = 4
    scrollingFrame.Visible = value6 == "Auto"
    scrollingFrame.Parent = frame4

    v28[value6] = scrollingFrame

    local instance2 = Instance.new("UIListLayout", scrollingFrame)
    instance2.Padding = UDim.new(0, 8)

    instance2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, instance2.AbsoluteContentSize.Y + 25)
    end)
  end

  local function f25(parent, text2, fn)
    local frame5 = Instance.new("Frame")
    frame5.Size = UDim2.new(1, 0, 0, 44)
    frame5.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    frame5.Parent = parent

    Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 8)

    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Size = UDim2.new(1, -75, 1, 0)
    textLabel2.Position = UDim2.new(0, 12, 0, 0)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Text = text2
    textLabel2.TextColor3 = Color3.fromRGB(235, 235, 245)
    textLabel2.TextSize = 13
    textLabel2.Font = Enum.Font.Gotham
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.Parent = frame5

    local textButton3 = Instance.new("TextButton")
    textButton3.Size = UDim2.new(0, 50, 0, 24)
    textButton3.Position = UDim2.new(1, -60, 0.5, -12)
    textButton3.BackgroundColor3 = Color3.fromRGB(50, 50, 62)
    textButton3.Text = ""
    textButton3.Parent = frame5

    Instance.new("UICorner", textButton3).CornerRadius = UDim.new(1, 0)
    local v29 = false

    textButton3.MouseButton1Click:Connect(function()
      v29 = not v29

      textButton3.BackgroundColor3 = v29 and Color3.fromRGB(0, 165, 105)
        or Color3.fromRGB(50, 50, 62)

      f7()
      fn(v29)
    end)
  end

  local function f26(parent2, p9, p10, p11, p12, fn2)
    local frame6 = Instance.new("Frame")
    frame6.Size = UDim2.new(1, 0, 0, 62)
    frame6.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    frame6.Parent = parent2

    Instance.new("UICorner", frame6).CornerRadius = UDim.new(0, 8)

    local textLabel3 = Instance.new("TextLabel")
    textLabel3.Size = UDim2.new(1, -20, 0, 20)
    textLabel3.Position = UDim2.new(0, 12, 0, 6)
    textLabel3.BackgroundTransparency = 1
    textLabel3.Text = p9 .. ": " .. p12
    textLabel3.TextColor3 = Color3.fromRGB(235, 235, 245)
    textLabel3.TextSize = 12
    textLabel3.Font = Enum.Font.Gotham
    textLabel3.TextXAlignment = Enum.TextXAlignment.Left
    textLabel3.Parent = frame6

    local frame7 = Instance.new("Frame")
    frame7.Size = UDim2.new(1, -24, 0, 8)
    frame7.Position = UDim2.new(0, 12, 0, 36)
    frame7.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
    frame7.Parent = frame6

    Instance.new("UICorner", frame7).CornerRadius = UDim.new(1, 0)

    local frame8 = Instance.new("Frame")
    frame8.Size = UDim2.new((p12 - p10) / (p11 - p10), 0, 1, 0)
    frame8.BackgroundColor3 = Color3.fromRGB(0, 165, 105)
    frame8.Parent = frame7

    Instance.new("UICorner", frame8).CornerRadius = UDim.new(1, 0)
    local v30 = false

    frame7.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 then
        v30 = true
      end
    end)

    userInputService.InputEnded:Connect(function(input2)
      if input2.UserInputType == Enum.UserInputType.MouseButton1 then
        v30 = false
      end
    end)

    userInputService.InputChanged:Connect(function(input3)
      if v30 and input3.UserInputType == Enum.UserInputType.MouseMovement then
        local v31 = math.clamp((input3.Position.X - frame7.AbsolutePosition.X)
          / frame7.AbsoluteSize.X, 0, 1)

        frame8.Size = UDim2.new(v31, 0, 1, 0)
        local v32 = math.floor(p10 + (p11 - p10) * v31)
        textLabel3.Text = p9 .. ": " .. v32
        fn2(v32)
      end
    end)
  end

  local function f27(parent3, text3, fn3)
    local textButton4 = Instance.new("TextButton")
    textButton4.Size = UDim2.new(1, 0, 0, 38)
    textButton4.BackgroundColor3 = Color3.fromRGB(0, 130, 90)
    textButton4.Text = text3
    textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
    textButton4.Font = Enum.Font.GothamBold
    textButton4.TextSize = 13
    textButton4.Parent = parent3

    Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 8)

    textButton4.MouseButton1Click:Connect(function()
      f7()
      fn3()
    end)
  end

  local function f28(parent4, placeholderText)
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, 0, 0, 36)
    textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    textBox.PlaceholderText = placeholderText
    textBox.Text = ""
    textBox.TextColor3 = Color3.fromRGB(230, 230, 240)
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 13
    textBox.Parent = parent4

    Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 8)
    return textBox
  end

  local textLabel4 = Instance.new("TextLabel")
  textLabel4.Size = UDim2.new(1, 0, 0, 65)
  textLabel4.BackgroundColor3 = Color3.fromRGB(35, 30, 20)
  textLabel4.Text = "1. Go close to Crates → Draw Pick Up\n2. Go close to Sell NPC → Draw Sell\n3. Enable Auto Pick-up & Sell"
  textLabel4.TextColor3 = Color3.fromRGB(255, 200, 100)
  textLabel4.TextSize = 12
  textLabel4.Font = Enum.Font.Gotham
  textLabel4.TextWrapped = true
  textLabel4.Parent = v28.Auto

  Instance.new("UICorner", textLabel4).CornerRadius = UDim.new(0, 8)

  f27(v28.Auto, "Draw Pick Up Location", function()
    local v33 = f8()

    if v33 then
      v19 = v33
      print("Pick Up saved")
    end
  end)

  f27(v28.Auto, "Draw Sell Location", function()
    local v34 = f8()

    if v34 then
      v20 = v34
      print("Sell saved")
    end
  end)

  f25(v28.Auto, "Auto Pick-up & Sell Ores", function(p13)
    v3.AutoOres = p13

    if p13 then
      if not v19 or not v20 then
        warn("Draw both locations first!")
        return
      end

      f20()
      return
    end
  end)

  f26(v28.Auto, "Teleport Speed", 1, 50, 30, function(tpSpeed) v3.TPSpeed = tpSpeed end)

  f26(v28.Auto, "Seconds between TPs", 1, 8, 2, function(tpInterval)
    v3.TPInterval = tpInterval
  end)

  f25(v28.Auto, "Auto Drill Yield", function(p14)
    v3.AutoDrillYield = p14

    if p14 then
      f16()
    end
  end)

  f26(v28.Auto, "Yield - Clicks Per Sec", 1, 50, 10, function(yieldCPS)
    v3.YieldCPS = yieldCPS
  end)

  f26(v28.Auto, "Yield - Interval (sec)", 1, 60, 1, function(yieldInterval)
    v3.YieldInterval = yieldInterval
  end)

  f25(v28.Auto, "Auto Drill Speed", function(p15)
    v3.AutoDrillSpeed = p15

    if p15 then
      f19()
    end
  end)

  f26(v28.Auto, "Speed - Clicks Per Sec", 1, 50, 10, function(speedCPS)
    v3.SpeedCPS = speedCPS
  end)

  f26(v28.Auto, "Speed - Interval (sec)", 1, 60, 1, function(speedInterval)
    v3.SpeedInterval = speedInterval
  end)

  f25(v28.Auto, "Auto Ore Regen", function(p16)
    v3.AutoOreRegen = p16

    if p16 then
      f18()
    end
  end)

  f26(v28.Auto, "Regen - Clicks Per Sec", 1, 50, 10, function(regenCPS)
    v3.RegenCPS = regenCPS
  end)

  f26(v28.Auto, "Regen - Interval (sec)", 1, 60, 1, function(regenInterval)
    v3.RegenInterval = regenInterval
  end)

  f25(v28.Auto, "Auto Rolling Pedestals", function(p17)
    v3.AutoRollingPedestal = p17

    if p17 then
      f21()
    end
  end)

  f26(v28.Auto, "Pedestal - Clicks Per Sec", 1, 50, 8, function(pedestalCPS)
    v3.PedestalCPS = pedestalCPS
  end)

  f26(v28.Auto, "Pedestal - Interval (sec)", 1, 60, 1, function(pedestalInterval)
    v3.PedestalInterval = pedestalInterval
  end)

  f25(v28.Auto, "Auto Ore Luck", function(p18)
    v3.AutoOreLuck = p18

    if p18 then
      f22()
    end
  end)

  f26(v28.Auto, "Luck - Clicks Per Sec", 1, 50, 8, function(luckCPS) v3.LuckCPS = luckCPS end)

  f26(v28.Auto, "Luck - Interval (sec)", 1, 60, 1, function(luckInterval)
    v3.LuckInterval = luckInterval
  end)

  f25(v28.Player, "Player ESP", function(playerESP) v3.PlayerESP = playerESP end)

  f25(v28.Player, "Speed Hack", function(p19)
    v3.Speed = p19

    if p19 then
      f14()
    else
      f15()
    end
  end)

  f26(v28.Player, "Speed Value", 1, 1000, 50, function(speedValue)
    v3.SpeedValue = speedValue
  end)

  f25(v28.Player, "Fly", function(p20)
    v3.Fly = p20

    if p20 then
      f6()
    else
      f3()
    end
  end)

  f26(v28.Player, "Fly Value", 1, 1000, 50, function(flyValue) v3.FlyValue = flyValue end)

  f25(v28.Player, "No Clip", function(p21)
    v3.NoClip = p21

    if p21 then
      f5()
    else
      f13()
    end
  end)

  f25(v28.Player, "Infinite Jump", function(infiniteJump) v3.InfiniteJump = infiniteJump end)
  f25(v28.Player, "Anti-AFK (10 min)", function(antiAfk) v3.AntiAfk = antiAfk end)

  f25(v28.Music, "Mute Game Music (Recommended)", function(p22)
    v3.MuteGame = p22

    if p22 then
      f2()
    end
  end)

  local v35 = f28(v28.Music, "Enter Roblox Audio ID...")

  f27(v28.Music, "Prepare Song", function()
    local v36 = string.match(v35.Text, "%d+")

    if v36 then
      v23 = v36
      print("Prepared:", v36)
    end
  end)

  f27(v28.Music, "▶ Play", function()
    if v23 then
      v3.MuteGame = true
      f2()
      v18 = f17(v23)

      if v18 then
        v18:Play()
      end
    end
  end)

  f27(v28.Music, "⏹ Stop", function()
    if v18 then
      v18:Stop()
      v18:Destroy()
      v18 = nil
    end
  end)

  f26(v28.Music, "Volume", 1, 100, 70, function(p23)
    v10 = p23

    if v18 then
      v18.Volume = p23 / 100
    end
  end)

  f25(v28.Music, "Loop", function(p24)
    looped = p24

    if v18 then
      v18.Looped = p24
    end
  end)

  for index7, value7 in ipairs({
    { "Metamorphosis", "102890330623699" }, { "Limitless", "79094308247449" },
    { "Hollow Purple", "80767112039125" }, { "Todo Theme", "110319777022724" },
    { "Nanami", "101593085288560" }, { "Naoya vs Maki", "72627784747020" },
    { "0.2 Infinite Void", "127012663233191" },
  }) do
    local v37 = value7

    f27(v28.Music, "Copy " .. v37[1], function()
      if setclipboard then
        setclipboard(v37[2])
      end
    end)
  end

  f25(v28.Misc, "Anti-Admin", function(antiAdmin) v3.AntiAdmin = antiAdmin end)

  f27(v28.Misc, "Copy Discord Invite", function()
    if setclipboard then
      setclipboard("https://discord.gg/9tRqbgr8y")
    end
  end)

  local function f29(p25)
    for key, value8 in pairs(v28) do
      value8.Visible = key == p25
    end

    v24.BackgroundColor3 = p25 == "Auto" and Color3.fromRGB(0, 145, 100)
      or Color3.fromRGB(35, 35, 45)

    v25.BackgroundColor3 = p25 == "Player" and Color3.fromRGB(0, 145, 100)
      or Color3.fromRGB(35, 35, 45)

    v26.BackgroundColor3 = p25 == "Music" and Color3.fromRGB(0, 145, 100)
      or Color3.fromRGB(35, 35, 45)

    v27.BackgroundColor3 = p25 == "Misc" and Color3.fromRGB(0, 145, 100)
      or Color3.fromRGB(35, 35, 45)

    f7()
  end

  v24.MouseButton1Click:Connect(function() f29("Auto") end)
  v25.MouseButton1Click:Connect(function() f29("Player") end)
  v26.MouseButton1Click:Connect(function() f29("Music") end)
  v27.MouseButton1Click:Connect(function() f29("Misc") end)

  runService.RenderStepped:Connect(function()
    if not v3.PlayerESP then
      for key2, value9 in pairs(v9) do
        local v38 = value9

        pcall(function()
          v38.Name:Remove()
          v38.Dist:Remove()
        end)
      end

      v9 = {}
      return
    else
      local v39 = {}

      for index8, value10 in ipairs(players:GetPlayers()) do
        if value10 ~= localPlayer and value10.Character then
          local humanoidRootPart4 = value10.Character:FindFirstChild("HumanoidRootPart")
          local humanoid6 = value10.Character:FindFirstChildOfClass("Humanoid")

          if humanoidRootPart4 and humanoid6 and humanoid6.Health > 0 then
            v39[value10] = true

            if not v9[value10] then
              v9[value10] = { Name = Drawing.new("Text"), Dist = Drawing.new("Text") }
              v9[value10].Name.Size = 14
              v9[value10].Name.Center = true
              v9[value10].Name.Outline = true
              v9[value10].Dist.Size = 12
              v9[value10].Dist.Center = true
              v9[value10].Dist.Outline = true
            end

            local v40 = v9[value10]

            local v41, v42 = currentCamera:WorldToViewportPoint(humanoidRootPart4.Position
              + Vector3.new(0, 3, 0))

            if v42 then
              v40.Name.Text = value10.Name
              v40.Name.Position = Vector2.new(v41.X, v41.Y - 16)
              v40.Name.Visible = true

              v40.Dist.Text = math.floor((humanoidRootPart4.Position
                  - currentCamera.CFrame.Position).Magnitude)
                .. "m"

              v40.Dist.Position = Vector2.new(v41.X, v41.Y)
              v40.Dist.Visible = true
            else
              v40.Name.Visible = false
              v40.Dist.Visible = false
            end
          end
        end
      end

      for key3, value11 in pairs(v9) do
        local v43 = value11

        if not v39[key3] then
          pcall(function()
            v43.Name:Remove()
            v43.Dist:Remove()
          end)

          v9[key3] = nil
        end
      end

      return
    end
  end)

  local udim = UDim2.new(0, 640, 0, 680)

  local function f30()
    if v4 then
      return
    end

    v4 = true
    frame.Visible = true
    tweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), { Size = udim }):Play()
    f7()
  end

  local function f31()
    if not v4 then
      return
    else
      v4 = false

      local create = tweenService:Create(frame, TweenInfo.new(0.22, Enum.EasingStyle.Quint), {
        Size = UDim2.new(0, 0, 0, 0),
      })

      create:Play()

      create.Completed:Connect(function()
        if not v4 then
          frame.Visible = false
        end
      end)

      f7()
      return
    end
  end

  textButton.MouseButton1Click:Connect(f31)

  userInputService.InputBegan:Connect(function(input4, p26)
    if p26 then
      return
    end

    if input4.KeyCode == Enum.KeyCode.RightControl then
      if v4 then
        f31()
      else
        f30()
      end
    end
  end)

  task.wait(0.1)
  f30()
  print("Oretachi's Sell Ores! | Full + CPS/Interval restored")
end

function f22()
  if v5.Luck then
    return
  end

  v5.Luck = task.spawn(function()
    while v3.AutoOreLuck and not v8 do
      f12("RollerUpgradeOreLuck")
      task.wait(v3.LuckInterval / math.max(v3.LuckCPS, 1))
    end

    v5.Luck = nil
  end)
end

local screenGui, textBox2

if f1() then
  f23()
else
  screenGui = Instance.new("ScreenGui")
  screenGui.Parent = coreGui

  local frame9 = Instance.new("Frame")
  frame9.Size = UDim2.new(0, 360, 0, 230)
  frame9.Position = UDim2.new(0.5, -180, 0.5, -115)
  frame9.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
  frame9.Parent = screenGui

  Instance.new("UICorner", frame9).CornerRadius = UDim.new(0, 12)

  local textLabel5 = Instance.new("TextLabel")
  textLabel5.Size = UDim2.new(1, 0, 0, 28)
  textLabel5.Position = UDim2.new(0, 0, 0, 10)
  textLabel5.BackgroundTransparency = 1
  textLabel5.Text = "Made by Oretachi"
  textLabel5.TextColor3 = Color3.fromRGB(0, 200, 120)
  textLabel5.TextSize = 15
  textLabel5.Font = Enum.Font.GothamBold
  textLabel5.Parent = frame9

  local textLabel6 = Instance.new("TextLabel")
  textLabel6.Size = UDim2.new(1, 0, 0, 28)
  textLabel6.Position = UDim2.new(0, 0, 0, 38)
  textLabel6.BackgroundTransparency = 1
  textLabel6.Text = "Oretachi's Sell Ores! - Key"
  textLabel6.TextColor3 = Color3.fromRGB(240, 240, 250)
  textLabel6.TextSize = 17
  textLabel6.Font = Enum.Font.GothamBold
  textLabel6.Parent = frame9

  textBox2 = Instance.new("TextBox")
  textBox2.Size = UDim2.new(0.8, 0, 0, 36)
  textBox2.Position = UDim2.new(0.1, 0, 0.42, 0)
  textBox2.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
  textBox2.PlaceholderText = "Enter Key..."
  textBox2.Text = ""
  textBox2.TextColor3 = Color3.fromRGB(230, 230, 240)
  textBox2.Parent = frame9

  Instance.new("UICorner", textBox2).CornerRadius = UDim.new(0, 8)

  local textButton5 = Instance.new("TextButton")
  textButton5.Size = UDim2.new(0.8, 0, 0, 36)
  textButton5.Position = UDim2.new(0.1, 0, 0.62, 0)
  textButton5.BackgroundColor3 = Color3.fromRGB(0, 140, 95)
  textButton5.Text = "Submit"
  textButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton5.Font = Enum.Font.GothamBold
  textButton5.Parent = frame9

  Instance.new("UICorner", textButton5).CornerRadius = UDim.new(0, 8)

  local textLabel7 = Instance.new("TextLabel")
  textLabel7.Size = UDim2.new(1, 0, 0, 20)
  textLabel7.Position = UDim2.new(0, 0, 0.88, 0)
  textLabel7.BackgroundTransparency = 1
  textLabel7.Text = "discord.gg/9tRqbgr8y"
  textLabel7.TextColor3 = Color3.fromRGB(150, 150, 170)
  textLabel7.TextSize = 13
  textLabel7.Parent = frame9

  textButton5.MouseButton1Click:Connect(function()
    if textBox2.Text == "ORETACHI2026" then
      screenGui:Destroy()
      f23()
    end
  end)
end6" then
      screenGui:Destroy()
      f23()
    end
  end)
end