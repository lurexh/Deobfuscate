local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local virtualInputManager = game:GetService("VirtualInputManager")
local tweenService = game:GetService("TweenService")
local soundService = game:GetService("SoundService")
local lighting = game:GetService("Lighting")
local coreGui = game:GetService("CoreGui")
local workspaceService = game:GetService("Workspace")
local debris = game:GetService("Debris")
local localPlayer = players.LocalPlayer
local currentCamera = workspace.CurrentCamera

local function f1()
  local sound = Instance.new("Sound")
  sound.SoundId = "rbxassetid://88442833509532"
  sound.Volume = 2.5
  sound.Parent = soundService
  sound:Play()

  debris:AddItem(sound, 1)
end

local function f2()
  if isfile and readfile and isfile("OretachiDemonfallKey.txt") then
    local v1, v2 = pcall(readfile, "OretachiDemonfallKey.txt")

    if v1 and v2 == "ORETACHI2026" then
      return true
    end

    return false
  end

  return false
end

local v3 = {
  Speed = false,
  SpeedValue = 50,
  Fly = false,
  FlyValue = 50,
  NoClip = false,
  NoFog = false,
  AutoBreathing = false,
  TrinketFarm = false,
  PlayerESP = false,
  ESPDistance = 5000,
  KillAura = false,
  KaigakuESP = false,
  GyutaroESP = false,
  GreenDemonESP = false,
  BlueDemonESP = false,
}

local v4 = false
local v5 = {}
local v6 = {}
local v7 = {}

local function f3(p1)
  local character = localPlayer.Character

  if not character then
    return
  else
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
      humanoidRootPart.CFrame = CFrame.new(p1)
      humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
      humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
    end

    return
  end
end

local connect

local function f4(p2)
  v3.NoClip = p2

  if connect then
    connect:Disconnect()
    connect = nil
  end

  if p2 then
    connect = runService.Stepped:Connect(function()
      local character2 = localPlayer.Character

      if character2 then
        for index, value in ipairs(character2:GetChildren()) do
          if value:IsA("BasePart") then
            value.CanCollide = false
          end
        end
      end
    end)
  end
end

local function f5(p3, p4)
  virtualInputManager:SendKeyEvent(p4, p3, false, game)
end

local function f6(p5)
  return CFrame.new(
    p5.Position + p5.CFrame.LookVector * -3.5 + Vector3.new(0, 0.5, 0), p5.Position
  )
end

local v8 = {
  Kaigaku = nil,
  Gyutaro = nil,
  GreenDemon = nil,
  BlueDemon = nil,
}

local connect2, bodyVelocity, bodyGyro

local function f7(p6)
  v3.Fly = p6
  local character3 = localPlayer.Character
  local humanoidRootPart2

  if not character3 then
    return
  else
    humanoidRootPart2 = character3:FindFirstChild("HumanoidRootPart")
    local humanoid = character3:FindFirstChildOfClass("Humanoid")

    if not humanoidRootPart2 or not humanoid then
      return
    end

    if connect2 then
      connect2:Disconnect()
    end

    if bodyVelocity then
      bodyVelocity:Destroy()
    end

    if bodyGyro then
      bodyGyro:Destroy()
    end

    if p6 then
      bodyVelocity = Instance.new("BodyVelocity")
      bodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyVelocity.Parent = humanoidRootPart2

      bodyGyro = Instance.new("BodyGyro")
      bodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyGyro.P = 90000
      bodyGyro.Parent = humanoidRootPart2

      humanoid.PlatformStand = true

      connect2 = runService.RenderStepped:Connect(function()
        if not v3.Fly or not humanoidRootPart2.Parent then
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
            zero = zero - Vector3.new(0, 1, 0)
          end

          bodyVelocity.Velocity = zero.Magnitude > 0 and zero.Unit * v3.FlyValue or Vector3.zero
          bodyGyro.CFrame = cframe
          return
        end
      end)
    else
      humanoid.PlatformStand = false
    end

    return
  end
end

local connect3

local function f8(p7)
  v3.NoFog = p7

  if connect3 then
    connect3:Disconnect()
    connect3 = nil
  end

  if p7 then
    connect3 = runService.RenderStepped:Connect(function()
      lighting.FogEnd = 9000000000
      lighting.FogStart = 9000000000

      pcall(function()
        local atmosphere = lighting:FindFirstChildOfClass("Atmosphere")

        if atmosphere then
          atmosphere.Density = 0
          atmosphere.Haze = 0
          atmosphere.Glare = 0
        end
      end)
    end)
  else
    lighting.FogEnd = 1000
    lighting.FogStart = 0
  end
end

local connect4, v9, connect5, v10, f9

local function f10()
  local oretachiDemonfall = Instance.new("ScreenGui")
  oretachiDemonfall.Name = "OretachiDemonfall"
  oretachiDemonfall.ResetOnSpawn = false
  oretachiDemonfall.Parent = coreGui

  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, 0, 0, 0)
  frame.Position = UDim2.new(0.5, 0, 0.5, 0)
  frame.AnchorPoint = Vector2.new(0.5, 0.5)
  frame.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
  frame.BorderSizePixel = 0
  frame.Active = true
  frame.Draggable = true
  frame.Parent = oretachiDemonfall

  Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

  local instance = Instance.new("UIStroke", frame)
  instance.Color = Color3.fromRGB(40, 40, 50)
  instance.Thickness = 1.3

  local frame2 = Instance.new("Frame")
  frame2.Size = UDim2.new(1, 0, 0, 44)
  frame2.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
  frame2.Parent = frame

  Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 12)

  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, -50, 1, 0)
  textLabel.Position = UDim2.new(0, 16, 0, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "Oretachi's Demonfall"
  textLabel.TextColor3 = Color3.fromRGB(235, 235, 245)
  textLabel.TextSize = 17
  textLabel.Font = Enum.Font.GothamBold
  textLabel.TextXAlignment = Enum.TextXAlignment.Left
  textLabel.Parent = frame2

  local textButton = Instance.new("TextButton")
  textButton.Size = UDim2.new(0, 34, 0, 26)
  textButton.Position = UDim2.new(1, -44, 0.5, -13)
  textButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
  textButton.Text = "−"
  textButton.TextColor3 = Color3.fromRGB(230, 230, 230)
  textButton.Font = Enum.Font.GothamBold
  textButton.Parent = frame2

  Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 6)

  local frame3 = Instance.new("Frame")
  frame3.Size = UDim2.new(1, -12, 0, 36)
  frame3.Position = UDim2.new(0, 6, 0, 54)
  frame3.BackgroundTransparency = 1
  frame3.Parent = frame

  local function f11(text, p8)
    local textButton2 = Instance.new("TextButton")
    textButton2.Size = UDim2.new(0, 115, 1, 0)
    textButton2.Position = UDim2.new(0, (p8 - 1) * 121, 0, 0)
    textButton2.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    textButton2.Text = text
    textButton2.TextColor3 = Color3.fromRGB(170, 170, 185)
    textButton2.TextSize = 13
    textButton2.Font = Enum.Font.GothamMedium
    textButton2.Parent = frame3

    Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 7)
    return textButton2
  end

  local v11 = f11("Player", 1)
  local v12 = f11("World TP", 2)
  local v13 = f11("World Farm", 3)
  local v14 = f11("Kill", 4)
  local v15 = f11("NPC ESP", 5)

  local frame4 = Instance.new("Frame")
  frame4.Size = UDim2.new(1, -12, 1, -105)
  frame4.Position = UDim2.new(0, 6, 0, 100)
  frame4.BackgroundTransparency = 1
  frame4.Parent = frame

  local function f12()
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.ScrollBarThickness = 5
    scrollingFrame.Visible = false
    scrollingFrame.Parent = frame4

    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Parent = scrollingFrame
    uiListLayout.Padding = UDim.new(0, 7)

    uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 20)
    end)

    return scrollingFrame
  end

  local v16 = f12()
  local v17 = f12()
  local v18 = f12()
  local v19 = f12()
  local v20 = f12()
  v16.Visible = true

  local function f13(p9, p10)
    f1()

    for key, value2 in pairs({ v16, v17, v18, v19, v20 }) do
      value2.Visible = false
    end

    p9.Visible = true

    for index2, value3 in ipairs(frame3:GetChildren()) do
      if value3:IsA("TextButton") then
        value3.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
        value3.TextColor3 = Color3.fromRGB(170, 170, 185)
      end
    end

    p10.BackgroundColor3 = Color3.fromRGB(0, 130, 90)
    p10.TextColor3 = Color3.fromRGB(255, 255, 255)
  end

  v11.MouseButton1Click:Connect(function() f13(v16, v11) end)
  v12.MouseButton1Click:Connect(function() f13(v17, v12) end)
  v13.MouseButton1Click:Connect(function() f13(v18, v13) end)
  v14.MouseButton1Click:Connect(function() f13(v19, v14) end)
  v15.MouseButton1Click:Connect(function() f13(v20, v15) end)

  local function f14(parent, text2, fn)
    local frame5 = Instance.new("Frame")
    frame5.Size = UDim2.new(1, 0, 0, 40)
    frame5.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
    frame5.Parent = parent

    Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 8)

    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Size = UDim2.new(1, -70, 1, 0)
    textLabel2.Position = UDim2.new(0, 14, 0, 0)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Text = text2
    textLabel2.TextColor3 = Color3.fromRGB(230, 230, 240)
    textLabel2.TextSize = 14
    textLabel2.Font = Enum.Font.Gotham
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.Parent = frame5

    local textButton3 = Instance.new("TextButton")
    textButton3.Size = UDim2.new(0, 48, 0, 26)
    textButton3.Position = UDim2.new(1, -58, 0.5, -13)
    textButton3.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    textButton3.Text = ""
    textButton3.Parent = frame5

    Instance.new("UICorner", textButton3).CornerRadius = UDim.new(1, 0)
    local v21 = false

    textButton3.MouseButton1Click:Connect(function()
      v21 = not v21

      textButton3.BackgroundColor3 = v21 and Color3.fromRGB(0, 150, 90)
        or Color3.fromRGB(50, 50, 60)

      f1()
      fn(v21)
    end)

    return {
      SetState = function(p11)
        v21 = p11

        textButton3.BackgroundColor3 = p11 and Color3.fromRGB(0, 150, 90)
          or Color3.fromRGB(50, 50, 60)
      end,
    }
  end

  local function f15(parent2, text3, p12, p13, p14, fn2)
    local frame6 = Instance.new("Frame")
    frame6.Size = UDim2.new(1, 0, 0, 64)
    frame6.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
    frame6.Parent = parent2

    Instance.new("UICorner", frame6).CornerRadius = UDim.new(0, 8)

    local textLabel3 = Instance.new("TextLabel")
    textLabel3.Size = UDim2.new(0.7, 0, 0, 22)
    textLabel3.Position = UDim2.new(0, 14, 0, 8)
    textLabel3.BackgroundTransparency = 1
    textLabel3.Text = text3
    textLabel3.TextColor3 = Color3.fromRGB(230, 230, 240)
    textLabel3.TextSize = 14
    textLabel3.Font = Enum.Font.Gotham
    textLabel3.TextXAlignment = Enum.TextXAlignment.Left
    textLabel3.Parent = frame6

    local textLabel4 = Instance.new("TextLabel")
    textLabel4.Size = UDim2.new(0.25, 0, 0, 22)
    textLabel4.Position = UDim2.new(0.72, 0, 0, 8)
    textLabel4.BackgroundTransparency = 1
    textLabel4.Text = tostring(p14)
    textLabel4.TextColor3 = Color3.fromRGB(0, 210, 130)
    textLabel4.TextSize = 14
    textLabel4.Font = Enum.Font.GothamBold
    textLabel4.TextXAlignment = Enum.TextXAlignment.Right
    textLabel4.Parent = frame6

    local frame7 = Instance.new("Frame")
    frame7.Size = UDim2.new(1, -28, 0, 10)
    frame7.Position = UDim2.new(0, 14, 0, 40)
    frame7.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    frame7.Parent = frame6

    Instance.new("UICorner", frame7).CornerRadius = UDim.new(1, 0)

    local frame8 = Instance.new("Frame")
    frame8.Size = UDim2.new((p14 - p12) / (p13 - p12), 0, 1, 0)
    frame8.BackgroundColor3 = Color3.fromRGB(0, 160, 95)
    frame8.Parent = frame7

    Instance.new("UICorner", frame8).CornerRadius = UDim.new(1, 0)
    local v22 = false

    local function f16(p15)
      local v23 = math.clamp((p15.X - frame7.AbsolutePosition.X) / frame7.AbsoluteSize.X, 0, 1)
      local v24 = math.floor(p12 + (p13 - p12) * v23 + 0.5)
      frame8.Size = UDim2.new(v23, 0, 1, 0)
      textLabel4.Text = tostring(v24)
      fn2(v24)
    end

    frame7.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 then
        v22 = true
        f16(input.Position)
        f1()
      end
    end)

    userInputService.InputEnded:Connect(function(input2)
      if input2.UserInputType == Enum.UserInputType.MouseButton1 then
        v22 = false
      end
    end)

    userInputService.InputChanged:Connect(function(input3)
      if v22 and input3.UserInputType == Enum.UserInputType.MouseMovement then
        f16(input3.Position)
      end
    end)
  end

  local function f17(parent3, text4, fn3)
    local textButton4 = Instance.new("TextButton")
    textButton4.Size = UDim2.new(1, 0, 0, 38)
    textButton4.BackgroundColor3 = Color3.fromRGB(35, 38, 52)
    textButton4.Text = text4
    textButton4.TextColor3 = Color3.fromRGB(235, 235, 245)
    textButton4.TextSize = 14
    textButton4.Font = Enum.Font.GothamMedium
    textButton4.Parent = parent3

    Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 8)

    textButton4.MouseButton1Click:Connect(function()
      f1()
      fn3()
    end)

    return textButton4
  end

  f14(v16, "Speed Hack", function(p16)
    v3.Speed = p16

    if connect4 then
      connect4:Disconnect()
    end

    if p16 then
      connect4 = runService.Heartbeat:Connect(function()
        local humanoid2 = localPlayer.Character
          and localPlayer.Character:FindFirstChildOfClass("Humanoid")

        if humanoid2 then
          humanoid2.WalkSpeed = v3.SpeedValue
        end
      end)
    else
      local character4 = localPlayer.Character

      local humanoid3 = character4
      humanoid3 = character4 and localPlayer.Character:FindFirstChildOfClass("Humanoid")

      if humanoid3 then
        humanoid3.WalkSpeed = 16
      end
    end
  end)

  f15(v16, "Speed Value", 1, 1000, 50, function(speedValue) v3.SpeedValue = speedValue end)
  f14(v16, "Fly", function(p17) f7(p17) end)
  f15(v16, "Fly Speed", 1, 1000, 50, function(flyValue) v3.FlyValue = flyValue end)

  f14(v16, "NoClip", function(p18) f4(p18) end)
  f14(v16, "No Fog", function(p19) f8(p19) end)
  f14(v16, "Auto Breathing (Hold G)", function(p20) f9(p20) end)

  for index3, value4 in ipairs({
    { "Black Merchant Teleport", "npc" },
    { "Blacksmith Teleport", Vector3.new(-1422.93, 871.48, -6306.75) },
    { "Breathing Trainer Teleport", Vector3.new(-1543.18, 874.77, -6467.7) },
    { "Crystal Cave Teleport", Vector3.new(-3047.84, 845.55, 1144.04) },
    { "Demon Part Seller Teleport", Vector3.new(-1533.3, 871.52, -6346.38) },
    { "Demon Slayer Corps Teleport", Vector3.new(-1986.7, 871.6, -6484.5) },
    { "Entertainment District Teleport", Vector3.new(-5963.33, 744.24, -6544.23) },
    { "Food Seller Teleport", Vector3.new(-3403.49, 705.17, -1581.72) },
    { "Hayakawa Village Teleport", Vector3.new(886.61, 757.75, -2262.95) },
    { "Kamakura Village Teleport", Vector3.new(-2384.92, 1161.67, -1690.96) },
    { "Okuya Village Teleport", Vector3.new(-3589.42, 717.8, -995.16) },
    { "Peaker Teleport", Vector3.new(-3484.39, 706.87, -961.38) },
    { "Raid Starter Teleport", Vector3.new(-2507.08, 1161.87, -1482.41) },
    { "Slayer Exam Teleport", Vector3.new(-5186.78, 792.62, -3042.18) },
    { "Sun Mansion Teleport", Vector3.new(-4835.55, 793.6, -4783.15) },
  }) do
    local v25 = value4

    if v25[2] == "npc" then
      f17(v17, v25[1], function()
        for index4, value5 in ipairs(workspaceService:GetDescendants()) do
          if value5.Name == "Black Merchant" or value5.Name == "BlackMerchant" then
            local basePart = value5:IsA("BasePart") and value5

            local basePart2 = basePart
            basePart2 = basePart or value5:FindFirstChildWhichIsA("BasePart")

            if basePart2 then
              f3(basePart2.Position + Vector3.new(0, 3, 0))
              break
            end
          end
        end
      end)
    else
      f17(v17, v25[1], function() f3(v25[2]) end)
    end
  end

  f14(v18, "Trinket / Item Farm", function(p21)
    v3.TrinketFarm = p21
    if p21 then
      v9 = task.spawn(function()
        while v3.TrinketFarm do
          local v26 = {}
          local trinkets = workspaceService:FindFirstChild("Trinkets")

          if trinkets then
            for index5, value6 in ipairs(trinkets:GetDescendants()) do
              if value6.Name == "Spawn" or value6.Name == "EpicSpawn"
                or value6.Name == "RareSpawn" then
                local spawned = value6:FindFirstChild("Spawned")

                if spawned and spawned:IsA("IntValue") then
                  local basePart3 = value6:IsA("BasePart") and value6

                  local basePart4 = basePart3
                  basePart4 = basePart3 or value6:FindFirstChildWhichIsA("BasePart")

                  if basePart4 then
                    table.insert(v26, basePart4)
                  end
                end
              end
            end
          end

          if #v26 > 0 then
            local v27 = v26[math.random(1, #v26)]
            f3(v27.Position)
            task.wait(0.12)
            local v28 = tick()

            while tick() - v28 < 2.2 and v3.TrinketFarm and v27 and v27.Parent do
              virtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
              task.wait(0.07)
              virtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
              task.wait(0.09)
            end
          else
            f3(Vector3.new(3148.42, 1552.9, -1818.22))
            task.wait(1.8)
          end

          task.wait(0.35)
        end
      end)
    elseif v9 then
      task.cancel(v9)
    end
  end)

  local v29 = {
    Vector3.new(1232.57, 961.85, -444.79), Vector3.new(1198.72, 942.87, -1456.19),
    Vector3.new(1473.31, 1148.97, -1206.79), Vector3.new(1646.42, 1207.25, -958.03),
    Vector3.new(-4257.07, 737.69, 1061.47), Vector3.new(-3774.22, 765.57, 1001.11),
  }

  f17(v18, "Ores Teleport (Random)", function() f3(v29[math.random(1, #v29)]) end)

  f14(v19, "Player ESP", function(p22)
    v3.PlayerESP = p22

    if not p22 then
      for key2, value7 in pairs(v5) do
        local v30 = value7

        pcall(function()
          v30.Name:Remove()
          v30.Health:Remove()
          v30.Breath:Remove()
          v30.Hunger:Remove()
          v30.Stamina:Remove()
          v30.Dist:Remove()
        end)
      end

      v5 = {}
    end
  end)

  f15(v19, "ESP Distance", 100, 20000, 5000, function(espDistance)
    v3.ESPDistance = espDistance
  end)

  local frame9 = Instance.new("Frame")
  frame9.Size = UDim2.new(1, 0, 0, 160)
  frame9.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
  frame9.Parent = v19

  Instance.new("UICorner", frame9).CornerRadius = UDim.new(0, 8)

  local scrollingFrame2 = Instance.new("ScrollingFrame")
  scrollingFrame2.Size = UDim2.new(1, -10, 1, -10)
  scrollingFrame2.Position = UDim2.new(0, 5, 0, 5)
  scrollingFrame2.BackgroundTransparency = 1
  scrollingFrame2.ScrollBarThickness = 4
  scrollingFrame2.Parent = frame9

  local uiListLayout2 = Instance.new("UIListLayout")
  uiListLayout2.Parent = scrollingFrame2
  uiListLayout2.Padding = UDim.new(0, 4)

  local function f18()
    for key3, value8 in pairs(v7) do
    end

    v7 = {}

    for index6, value9 in ipairs(players:GetPlayers()) do
      local v31 = value9

      if v31 ~= localPlayer then
        local textButton5 = Instance.new("TextButton")
        textButton5.Size = UDim2.new(1, -6, 0, 28)
        textButton5.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        textButton5.Text = "  " .. v31.Name
        textButton5.TextColor3 = Color3.fromRGB(220, 220, 230)
        textButton5.TextSize = 13
        textButton5.Font = Enum.Font.Gotham
        textButton5.TextXAlignment = Enum.TextXAlignment.Left
        textButton5.Parent = scrollingFrame2

        Instance.new("UICorner", textButton5).CornerRadius = UDim.new(0, 5)

        textButton5.MouseButton1Click:Connect(function()
          v10 = v31

          for key4, value10 in pairs(v7) do
            value10.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
          end

          textButton5.BackgroundColor3 = Color3.fromRGB(0, 100, 80)
          f1()
        end)

        table.insert(v7, textButton5)
      end
    end

    scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, uiListLayout2.AbsoluteContentSize.Y + 10)
  end

  f17(v19, "Refresh Player List", f18)

  f17(v19, "Teleport to Selected Player", function()
    if v10 and v10.Character and v10.Character:FindFirstChild("HumanoidRootPart") then
      f3(f6(v10.Character.HumanoidRootPart).Position)
    end
  end)

  f14(v19, "Player Kill Aura (Stick)", function(p23)
    v3.KillAura = p23

    if connect5 then
      connect5:Disconnect()
      connect5 = nil
    end

    if p23 then
      connect5 = runService.Heartbeat:Connect(function()
        if not v3.KillAura then
          return
        end

        if v10 and v10.Character and v10.Character:FindFirstChild("HumanoidRootPart") then
          local humanoidRootPart3 = v10.Character.HumanoidRootPart
          local character5 = localPlayer.Character

          if character5 and character5:FindFirstChild("HumanoidRootPart") then
            character5.HumanoidRootPart.CFrame = f6(humanoidRootPart3)
          end
        end
      end)

      task.spawn(function()
        while v3.KillAura do
          if v10 and v10.Character then
            for i = 1, 4 do
              virtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
              task.wait(0.05)
              virtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
              task.wait(0.04)
            end

            virtualInputManager:SendMouseButtonEvent(0, 0, 1, true, game, 1)
            task.wait(0.07)
            virtualInputManager:SendMouseButtonEvent(0, 0, 1, false, game, 1)
          end

          task.wait(0.3)
        end
      end)
    end
  end)

  f17(v19, "Spectate Selected", function()
    if v10 and v10.Character and v10.Character:FindFirstChildOfClass("Humanoid") then
      currentCamera.CameraSubject = v10.Character:FindFirstChildOfClass("Humanoid")
    end
  end)

  f17(v19, "Stop Spectating", function()
    if localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
      currentCamera.CameraSubject = localPlayer.Character:FindFirstChildOfClass("Humanoid")
    end
  end)

  f18()

  f14(v20, "Kaigaku ESP", function(kaigakuESP) v3.KaigakuESP = kaigakuESP end)
  f14(v20, "Gyutaro ESP", function(gyutaroESP) v3.GyutaroESP = gyutaroESP end)
  f14(v20, "Green Demon ESP", function(greenDemonESP) v3.GreenDemonESP = greenDemonESP end)
  f14(v20, "Blue Demon ESP", function(blueDemonESP) v3.BlueDemonESP = blueDemonESP end)

  task.spawn(function()
    while true do
      task.wait(2.5)

      v8.Kaigaku = nil
      v8.Gyutaro = nil
      v8.GreenDemon = nil
      v8.BlueDemon = nil

      for index7, value11 in ipairs(workspaceService:GetDescendants()) do
        if value11.Name == "Kaigaku" then
          local basePart5 = value11:IsA("BasePart") and value11

          local basePart6 = basePart5
          basePart6 = basePart5 or value11:FindFirstChildWhichIsA("BasePart")

          if basePart6 then
            v8.Kaigaku = basePart6
          end
        elseif value11.Name == "Gyutaro" then
          local basePart7 = value11:IsA("BasePart") and value11

          local basePart8 = basePart7
          basePart8 = basePart7 or value11:FindFirstChildWhichIsA("BasePart")

          if basePart8 then
            v8.Gyutaro = basePart8
          end
        elseif value11.Name == "GreenDemonEntertaiment" then
          local basePart9 = value11:IsA("BasePart") and value11

          local basePart10 = basePart9
          basePart10 = basePart9 or value11:FindFirstChildWhichIsA("BasePart")

          if basePart10 then
            v8.GreenDemon = basePart10
          end
        elseif value11.Name == "BlueDemonEntertaiment" then
          local basePart11 = value11:IsA("BasePart") and value11

          local basePart12 = basePart11
          basePart12 = basePart11 or value11:FindFirstChildWhichIsA("BasePart")

          if basePart12 then
            v8.BlueDemon = basePart12
          end
        end
      end
    end
  end)

  runService.RenderStepped:Connect(function()
    if v3.PlayerESP then
      local v32 = {}

      local humanoidRootPart4 = localPlayer.Character
        and localPlayer.Character:FindFirstChild("HumanoidRootPart")

      for index8, value12 in ipairs(players:GetPlayers()) do
        if value12 ~= localPlayer and value12.Character then
          local humanoidRootPart5 = value12.Character:FindFirstChild("HumanoidRootPart")

          if humanoidRootPart5 then
            local magnitude = humanoidRootPart4
                and (humanoidRootPart5.Position - humanoidRootPart4.Position).Magnitude
              or 0

            if magnitude <= v3.ESPDistance then
              v32[value12] = true

              if not v5[value12] then
                v5[value12] = {
                  Name = Drawing.new("Text"),
                  Health = Drawing.new("Text"),
                  Breath = Drawing.new("Text"),
                  Hunger = Drawing.new("Text"),
                  Stamina = Drawing.new("Text"),
                  Dist = Drawing.new("Text"),
                }

                local v33 = v5[value12]
                v33.Name.Size = 16
                v33.Name.Center = true
                v33.Name.Outline = true
                v33.Name.Color = Color3.fromRGB(255, 50, 50)
                v33.Health.Size = 13
                v33.Health.Center = true
                v33.Health.Outline = true
                v33.Health.Color = Color3.fromRGB(0, 255, 100)
                v33.Breath.Size = 13
                v33.Breath.Center = true
                v33.Breath.Outline = true
                v33.Breath.Color = Color3.fromRGB(80, 160, 255)
                v33.Hunger.Size = 13
                v33.Hunger.Center = true
                v33.Hunger.Outline = true
                v33.Hunger.Color = Color3.fromRGB(255, 160, 50)
                v33.Stamina.Size = 13
                v33.Stamina.Center = true
                v33.Stamina.Outline = true
                v33.Stamina.Color = Color3.fromRGB(180, 80, 255)
                v33.Dist.Size = 13
                v33.Dist.Center = true
                v33.Dist.Outline = true
                v33.Dist.Color = Color3.fromRGB(255, 220, 50)
              end

              local v34 = v5[value12]

              local v35, v36 = currentCamera:WorldToViewportPoint(humanoidRootPart5.Position
                + Vector3.new(0, 3.8, 0))

              if v36 then
                local value13 = 100
                local health = value12:FindFirstChild("Health")

                if health and (health:IsA("NumberValue") or health:IsA("IntValue")) then
                  value13 = health.Value
                else
                  local humanoid4 = value12.Character:FindFirstChildOfClass("Humanoid")

                  if humanoid4 then
                    value13 = humanoid4.Health
                  end
                end

                local value14 = value12:FindFirstChild("Breathing") and value12.Breathing.Value
                  or 0

                local value15 = value12:FindFirstChild("Hunger") and value12.Hunger.Value or 0
                local value16 = value12:FindFirstChild("Stamina") and value12.Stamina.Value or 0

                v34.Name.Text = value12.Name
                v34.Name.Position = Vector2.new(v35.X, v35.Y - 52)
                v34.Name.Visible = true
                v34.Health.Text = "HP: " .. math.floor(value13)
                v34.Health.Position = Vector2.new(v35.X, v35.Y - 34)
                v34.Health.Visible = true
                v34.Breath.Text = "Breath: " .. math.floor(value14)
                v34.Breath.Position = Vector2.new(v35.X, v35.Y - 20)
                v34.Breath.Visible = true
                v34.Hunger.Text = "Hunger: " .. math.floor(value15)
                v34.Hunger.Position = Vector2.new(v35.X, v35.Y - 6)
                v34.Hunger.Visible = true
                v34.Stamina.Text = "Stamina: " .. math.floor(value16)
                v34.Stamina.Position = Vector2.new(v35.X, v35.Y + 8)
                v34.Stamina.Visible = true
                v34.Dist.Text = math.floor(magnitude) .. " studs"
                v34.Dist.Position = Vector2.new(v35.X, v35.Y + 22)
                v34.Dist.Visible = true
              else
                v34.Name.Visible = false
                v34.Health.Visible = false
                v34.Breath.Visible = false
                v34.Hunger.Visible = false
                v34.Stamina.Visible = false
                v34.Dist.Visible = false
              end
            end
          end
        end
      end

      for key5, value17 in pairs(v5) do
        local v37 = value17

        if not v32[key5] then
          pcall(function()
            v37.Name:Remove()
            v37.Health:Remove()
            v37.Breath:Remove()
            v37.Hunger:Remove()
            v37.Stamina:Remove()
            v37.Dist:Remove()
          end)

          v5[key5] = nil
        end
      end
    end

    local function f19(p24, p25, p26, color, p27)
      if not p24 or not p25 or not p25.Parent then
        if v6[p27] then
          pcall(function() v6[p27]:Remove() end)
          v6[p27] = nil
        end

        return
      else
        if not v6[p27] then
          local text5 = Drawing.new("Text")
          text5.Size = 15
          text5.Center = true
          text5.Outline = true
          text5.Color = color

          v6[p27] = text5
        end

        local v38 = v6[p27]
        local v39, v40 = currentCamera:WorldToViewportPoint(p25.Position)
        local magnitude2 = 0

        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
          magnitude2 = (p25.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
        end

        if v40 and v39.Z > 0 then
          v38.Text = p26 .. " [" .. math.floor(magnitude2) .. " studs]"
          v38.Position = Vector2.new(v39.X, v39.Y)
          v38.Visible = true
        else
          v38.Visible = false
        end

        return
      end
    end

    f19(v3.KaigakuESP, v8.Kaigaku, "Kaigaku", Color3.fromRGB(255, 80, 80), "Kaigaku")
    f19(v3.GyutaroESP, v8.Gyutaro, "Gyutaro", Color3.fromRGB(255, 140, 50), "Gyutaro")

    f19(
      v3.GreenDemonESP, v8.GreenDemon, "Green Demon", Color3.fromRGB(80, 255, 120), "GreenDemon"
    )

    f19(v3.BlueDemonESP, v8.BlueDemon, "Blue Demon", Color3.fromRGB(80, 160, 255), "BlueDemon")
  end)

  local udim = UDim2.new(0, 660, 0, 540)

  local function f20()
    if v4 then
      return
    else
      v4 = true
      frame.Visible = true
      local tweenInfo = TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

      tweenService:Create(frame, tweenInfo, { Size = udim, BackgroundTransparency = 0 }):Play()
      tweenService:Create(instance, tweenInfo, { Transparency = 0 }):Play()

      f1()
      return
    end
  end

  local function f21()
    if not v4 then
      return
    else
      v4 = false
      local tweenInfo2 = TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.In)

      local create = tweenService:Create(frame, tweenInfo2, {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
      })

      tweenService:Create(instance, tweenInfo2, { Transparency = 1 }):Play()

      create:Play()

      create.Completed:Connect(function()
        if not v4 then
          frame.Visible = false
        end
      end)

      f1()
      return
    end
  end

  textButton.MouseButton1Click:Connect(f21)

  userInputService.InputBegan:Connect(function(input4, p28)
    if p28 then
      return
    end

    if input4.KeyCode == Enum.KeyCode.RightControl then
      if v4 then
        f21()
      else
        f20()
      end
    end
  end)

  task.wait(0.1)
  f20()
  print("Oretachi's Demonfall V1 | Final Version")
end

local connect6

function f9(p29)
  v3.AutoBreathing = p29

  if connect6 then
    connect6:Disconnect()
  end

  if p29 then
    connect6 = runService.Heartbeat:Connect(function() f5(Enum.KeyCode.G, true) end)
  else
    f5(Enum.KeyCode.G, false)
  end
end

local oretachiKey, textBox, textLabel5

if f2() then
  f10()
else
  oretachiKey = Instance.new("ScreenGui")
  oretachiKey.Name = "OretachiKey"
  oretachiKey.Parent = coreGui

  local frame10 = Instance.new("Frame")
  frame10.Size = UDim2.new(0, 320, 0, 180)
  frame10.Position = UDim2.new(0.5, -160, 0.5, -90)
  frame10.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
  frame10.Parent = oretachiKey

  Instance.new("UICorner", frame10).CornerRadius = UDim.new(0, 10)

  local textLabel6 = Instance.new("TextLabel")
  textLabel6.Size = UDim2.new(1, 0, 0, 40)
  textLabel6.BackgroundTransparency = 1
  textLabel6.Text = "Oretachi's Demonfall - Key"
  textLabel6.TextColor3 = Color3.fromRGB(230, 230, 240)
  textLabel6.TextSize = 16
  textLabel6.Font = Enum.Font.GothamBold
  textLabel6.Parent = frame10

  textBox = Instance.new("TextBox")
  textBox.Size = UDim2.new(0.8, 0, 0, 36)
  textBox.Position = UDim2.new(0.1, 0, 0.35, 0)
  textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
  textBox.PlaceholderText = "Enter Key..."
  textBox.Text = ""
  textBox.TextColor3 = Color3.fromRGB(220, 220, 230)
  textBox.Parent = frame10

  Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)

  local textButton6 = Instance.new("TextButton")
  textButton6.Size = UDim2.new(0.8, 0, 0, 36)
  textButton6.Position = UDim2.new(0.1, 0, 0.62, 0)
  textButton6.BackgroundColor3 = Color3.fromRGB(0, 120, 80)
  textButton6.Text = "Submit"
  textButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton6.Font = Enum.Font.GothamBold
  textButton6.Parent = frame10

  Instance.new("UICorner", textButton6).CornerRadius = UDim.new(0, 6)

  textLabel5 = Instance.new("TextLabel")
  textLabel5.Size = UDim2.new(1, 0, 0, 20)
  textLabel5.Position = UDim2.new(0, 0, 0.88, 0)
  textLabel5.BackgroundTransparency = 1
  textLabel5.Text = ""
  textLabel5.TextColor3 = Color3.fromRGB(255, 80, 80)
  textLabel5.Parent = frame10

  textButton6.MouseButton1Click:Connect(function()
    if textBox.Text == "ORETACHI2026" then
      oretachiKey:Destroy()
      f10()
    else
      textLabel5.Text = "Wrong Key!"
    end
  end)
end    else
      textLabel5.Text = "Wrong Key!"
    end
  end)
end