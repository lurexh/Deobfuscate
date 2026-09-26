local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local virtualInputManager = game:GetService("VirtualInputManager")
local coreGui = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
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
  if isfile and isfile("OretachiDdakjiKey.txt") and readfile then
    local v2, v3 = pcall(readfile, "OretachiDdakjiKey.txt")

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
  PlayerESP = false,
  SeekerESP = false,
  HiderESP = false,
  GlassMakerESP = false,
  BabyCarrierESP = false,
  GuardESP = false,
  ShamanESP = false,
  FrontmanESP = false,
  ExitDoorsESP = false,
  KillAura = false,
  RebelKillAura = false,
  SeekerKillAura = false,
  FrontmanKillAura = false,
  QuickButtons = false,
}

local function f2(p1)
  local character = localPlayer.Character

  if not character then
    return
  else
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
      humanoidRootPart.CFrame = CFrame.new(p1)
      humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    end

    return
  end
end

local v5 = true

local function f3(p2)
  local v6 = { "knife", "blade", "sword", "dagger", "shank", "razor", "cutter", "katana" }

  local function f4(p3)
    if not p3 then
      return false
    end

    for index2, value2 in ipairs(p3:GetChildren()) do
      if value2:IsA("Tool") then
        local v7 = string.lower(value2.Name)

        for index3, value3 in ipairs(v6) do
          if v7:find(value3) then
            return true
          end
        end
      end
    end

    return false
  end

  if p2.Character and f4(p2.Character) then
    return true
  end

  return f4(p2:FindFirstChild("Backpack"))
end

local connect

local function f5(p4)
  v4.NoClip = p4

  if connect then
    connect:Disconnect()
  end

  if p4 then
    connect = runService.Stepped:Connect(function()
      local character2 = localPlayer.Character

      if character2 then
        for index4, value4 in ipairs(character2:GetDescendants()) do
          if value4:IsA("BasePart") then
            value4.CanCollide = false
          end
        end
      end
    end)
  end
end

local v8 = {}
local v9 = {}
local v10 = 0
local connect2, bodyVelocity, bodyGyro

local function f6(p5)
  v4.Fly = p5
  local character3 = localPlayer.Character
  local humanoidRootPart2

  if not character3 then
    return
  else
    humanoidRootPart2 = character3:FindFirstChild("HumanoidRootPart")
    local v11 = not humanoidRootPart2
    local humanoid = character3:FindFirstChildOfClass("Humanoid")

    if v11 or not humanoid then
      return
    end

    if p5 then
      bodyVelocity = Instance.new("BodyVelocity")
      bodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyVelocity.Velocity = Vector3.zero
      bodyVelocity.Parent = humanoidRootPart2

      bodyGyro = Instance.new("BodyGyro")
      bodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyGyro.P = 90000
      bodyGyro.Parent = humanoidRootPart2

      humanoid.PlatformStand = true

      connect2 = runService.RenderStepped:Connect(function()
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

          bodyVelocity.Velocity = zero.Magnitude > 0 and zero.Unit * v4.FlyValue or Vector3.zero
          bodyGyro.CFrame = cframe
          return
        end
      end)
    else
      if connect2 then
        connect2:Disconnect()
      end

      if bodyVelocity then
        bodyVelocity:Destroy()
      end

      if bodyGyro then
        bodyGyro:Destroy()
      end

      humanoid.PlatformStand = false
    end

    return
  end
end

local function f7(p6)
  if not p6.Character then
    return false
  else
    local humanoid2 = p6.Character:FindFirstChildOfClass("Humanoid")
    return humanoid2 and humanoid2.Health > 0
  end
end

local f8

local function f9(p7)
  return f8(p7, "MPS-5")
end

function f8(p8, p9)
  local function f10(p10)
    if not p10 then
      return false
    end

    for index5, value5 in ipairs(p10:GetChildren()) do
      if value5:IsA("Tool") and value5.Name == p9 then
        return true
      end
    end

    return false
  end

  if p8.Character and f10(p8.Character) then
    return true
  end

  return f10(p8:FindFirstChild("Backpack"))
end

local function f11(p11)
  return f3(p11)
end

local function f12(p12)
  return f8(p12, "Revolver")
end

local function f13()
  for key, value6 in pairs(v9) do
  end

  v9 = {}
end

local function f14(text, p13)
  local textButton = Instance.new("TextButton")
  textButton.Size = UDim2.new(0, 160, 0, 36)
  textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
  textButton.Text = text
  textButton.TextColor3 = Color3.fromRGB(240, 240, 245)
  textButton.TextSize = 13
  textButton.Font = Enum.Font.GothamBold
  textButton.Parent = coreGui:FindFirstChild("OretachiDdakji") or coreGui

  Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 6)

  local instance = Instance.new("UIStroke", textButton)
  instance.Color = Color3.fromRGB(0, 140, 90)
  instance.Thickness = 1.2

  textButton.MouseButton1Click:Connect(p13)
  table.insert(v9, textButton)
  return textButton
end

local connect3

local function f15()
  v4.KillAura = false
  v4.RebelKillAura = false
  v4.SeekerKillAura = false
  v4.FrontmanKillAura = false

  if connect3 then
    connect3:Disconnect()
    connect3 = nil
  end

  local character4 = localPlayer.Character

  if character4 and character4:FindFirstChildOfClass("Humanoid") then
    character4.Humanoid.PlatformStand = false
  end
end

local f16

local function f17(p14)
  return not f11(p14) and not f9(p14) and not f12(p14) and not f16(p14)
end

function f16(p15)
  local function f18(p16)
    if not p16 then
      return false
    end

    for index6, value7 in ipairs(p16:GetChildren()) do
      if value7:IsA("Tool") and (value7.Name == "FakeDeath" or value7.Name:find("Key_")) then
        return true
      end
    end

    return false
  end

  if p15.Character and f18(p15.Character) then
    return true
  end

  return f18(p15:FindFirstChild("Backpack"))
end

local function f19(p17)
  f15()

  if p17 == "normal" then
    v4.KillAura = true
  elseif p17 == "rebel" then
    v4.RebelKillAura = true
  elseif p17 == "seeker" then
    v4.SeekerKillAura = true
  elseif p17 == "frontman" then
    v4.FrontmanKillAura = true
  end

  connect3 = runService.Heartbeat:Connect(function()
    local character5 = localPlayer.Character

    if not character5 then
      return
    else
      local humanoidRootPart3 = character5:FindFirstChild("HumanoidRootPart")
      local humanoid3 = character5:FindFirstChildOfClass("Humanoid")

      if not humanoidRootPart3 or not humanoid3 then
        return
      end

      humanoid3.PlatformStand = true
      humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero

      for index7, value8 in ipairs(players:GetPlayers()) do
        if value8 ~= localPlayer and f7(value8)
          and value8.Character:FindFirstChild("HumanoidRootPart") then
          local v12 = f9(value8)
          f11(value8)
          local v13 = f12(value8)
          local v14 = f16(value8)
          local v15 = f17(value8)

          if v4.KillAura and not v15 then
          elseif v4.RebelKillAura and not v12 then
          elseif v4.SeekerKillAura and not v14 then
          elseif v4.FrontmanKillAura and not v13 then
          else
            local humanoidRootPart4 = value8.Character.HumanoidRootPart
            local head = value8.Character:FindFirstChild("Head")

            if v4.KillAura then
              local vector = Vector3.new(0, -3.4, 0)

              humanoidRootPart3.CFrame = CFrame.new(
                humanoidRootPart4.Position + vector, humanoidRootPart4.Position
              )
            else
              local v16 = (head and head.Position
                  or humanoidRootPart4.Position + Vector3.new(0, 1.5, 0))
                + Vector3.new(0, 0.7, 0)

              humanoidRootPart3.CFrame = CFrame.new(v16) * CFrame.Angles(math.rad(-90), 0, 0)
            end

            humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero

            if tick() - v10 > 0.11 then
              v10 = tick()
              virtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
              task.wait(0.025)
              virtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            end
          end
        end
      end

      return
    end
  end)
end

local function f20()
  f13()
  local v17

  if not v4.QuickButtons then
    return
  else
    v17 = 10

    local function f21(p18, p19)
      f14(p18, p19).Position = UDim2.new(0, 10, 0, v17)
      v17 = v17 + 42
    end

    f21("Frontman Room TP", function() f2(Vector3.new(7966.48, 112.2, 3661.34)) end)
    f21("Lights Out Safe", function() f2(Vector3.new(8037.49, 117.04, 3719.8)) end)
    f21("Hide&Seek Safe", function() f2(Vector3.new(-642.05, 183.32, 401.25)) end)
    f21("Jump Rope TP", function() f2(Vector3.new(-70.05, 119.77, -4.05)) end)
    f21("Glass TP", function() f2(Vector3.new(1279.58, 101.88, -941.17)) end)
    f21("Auto Vote", function() f2(Vector3.new(8048.35, 89.05, 3687.75)) end)
    f21("Finish RLGL", function() f2(Vector3.new(-12174.12, -789.46, -2999.45)) end)

    f21("Kill Aura", function()
      if v4.KillAura then
        f15()
      else
        f19("normal")
      end
    end)

    f21("Rebel KA", function()
      if v4.RebelKillAura then
        f15()
      else
        f19("rebel")
      end
    end)

    f21("Seeker KA", function()
      if v4.SeekerKillAura then
        f15()
      else
        f19("seeker")
      end
    end)

    f21("Frontman KA", function()
      if v4.FrontmanKillAura then
        f15()
      else
        f19("frontman")
      end
    end)

    return
  end
end

local connect4, textButton2

local function f22()
  local oretachiDdakji = Instance.new("ScreenGui")
  oretachiDdakji.Name = "OretachiDdakji"
  oretachiDdakji.ResetOnSpawn = false
  oretachiDdakji.Parent = coreGui

  local v18 = v1 and 420 or 590
  local v19 = v1 and 520 or 630

  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, v18, 0, v19)
  frame.Position = UDim2.new(0.5, -v18 / 2, 0.5, -v19 / 2)
  frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
  frame.BorderSizePixel = 0
  frame.Active = true
  frame.Draggable = true
  frame.Parent = oretachiDdakji

  Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

  local frame2 = Instance.new("Frame")
  frame2.Size = UDim2.new(1, 0, 0, 38)
  frame2.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
  frame2.Parent = frame

  Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 10)

  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(0, 280, 1, 0)
  textLabel.Position = UDim2.new(0, 12, 0, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "Oretachi's Ddakji"
  textLabel.TextColor3 = Color3.fromRGB(235, 235, 245)
  textLabel.TextSize = v1 and 15 or 16
  textLabel.Font = Enum.Font.GothamBold
  textLabel.TextXAlignment = Enum.TextXAlignment.Left
  textLabel.Parent = frame2

  local textButton3 = Instance.new("TextButton")
  textButton3.Size = UDim2.new(0, 32, 0, 26)
  textButton3.Position = UDim2.new(1, -40, 0.5, -13)
  textButton3.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
  textButton3.Text = "−"
  textButton3.TextColor3 = Color3.fromRGB(230, 230, 230)
  textButton3.TextSize = 18
  textButton3.Font = Enum.Font.GothamBold
  textButton3.Parent = frame2

  Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 6)

  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(0, 200, 0, 18)
  textLabel2.Position = UDim2.new(0, 10, 1, -22)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = "Executor: Unknown"
  textLabel2.TextColor3 = Color3.fromRGB(120, 120, 140)
  textLabel2.TextSize = 11
  textLabel2.Font = Enum.Font.Gotham
  textLabel2.TextXAlignment = Enum.TextXAlignment.Left
  textLabel2.Parent = frame

  local function f23()
    if textButton2 then
      textButton2:Destroy()
    end

    textButton2 = Instance.new("TextButton")
    textButton2.Size = UDim2.new(0, 44, 0, 44)
    textButton2.Position = UDim2.new(1, -54, 0, 10)
    textButton2.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    textButton2.Text = "≡"
    textButton2.TextColor3 = Color3.fromRGB(0, 200, 120)
    textButton2.TextSize = 22
    textButton2.Font = Enum.Font.GothamBold
    textButton2.Parent = oretachiDdakji
    Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 8)

    local instance2 = Instance.new("UIStroke", textButton2)
    instance2.Color = Color3.fromRGB(0, 140, 90)
    instance2.Thickness = 1.5

    textButton2.MouseButton1Click:Connect(function()
      v5 = true
      frame.Visible = true
      textButton2.Visible = false
    end)
  end

  textButton3.MouseButton1Click:Connect(function()
    v5 = false
    frame.Visible = false

    if v1 then
      f23()
      textButton2.Visible = true
    end
  end)

  local frame3 = Instance.new("Frame")
  frame3.Size = UDim2.new(1, -12, 0, 32)
  frame3.Position = UDim2.new(0, 6, 0, 44)
  frame3.BackgroundTransparency = 1
  frame3.Parent = frame

  local function f24(text2, p20)
    local textButton4 = Instance.new("TextButton")
    textButton4.Size = UDim2.new(0, v1 and 90 or 100, 1, 0)
    textButton4.Position = UDim2.new(0, (p20 - 1) * (v1 and 95 or 105), 0, 0)
    textButton4.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    textButton4.Text = text2
    textButton4.TextColor3 = Color3.fromRGB(180, 180, 195)
    textButton4.TextSize = 12
    textButton4.Font = Enum.Font.GothamMedium
    textButton4.Parent = frame3

    Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 6)
    return textButton4
  end

  local v20 = f24("Player", 1)
  local v21 = f24("Games", 2)
  local v22 = f24("ESP", 3)
  local v23 = f24("Kill", 4)

  local frame4 = Instance.new("Frame")
  frame4.Size = UDim2.new(1, -12, 1, -90)
  frame4.Position = UDim2.new(0, 6, 0, 82)
  frame4.BackgroundTransparency = 1
  frame4.Parent = frame

  local function f25()
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
      scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 15)
    end)

    return scrollingFrame
  end

  local v24 = f25()
  local v25 = f25()
  local v26 = f25()
  local v27 = f25()
  v24.Visible = true

  local function f26(p21, p22)
    for key2, value9 in pairs({ v24, v25, v26, v27 }) do
      value9.Visible = false
    end

    p21.Visible = true

    for index8, value10 in ipairs(frame3:GetChildren()) do
      if value10:IsA("TextButton") then
        value10.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        value10.TextColor3 = Color3.fromRGB(180, 180, 195)
      end
    end

    p22.BackgroundColor3 = Color3.fromRGB(0, 125, 85)
    p22.TextColor3 = Color3.fromRGB(255, 255, 255)
  end

  v20.MouseButton1Click:Connect(function() f26(v24, v20) end)
  v21.MouseButton1Click:Connect(function() f26(v25, v21) end)
  v22.MouseButton1Click:Connect(function() f26(v26, v22) end)
  v23.MouseButton1Click:Connect(function() f26(v27, v23) end)

  local function f27(parent, text3, fn)
    local frame5 = Instance.new("Frame")
    frame5.Size = UDim2.new(1, 0, 0, v1 and 42 or 38)
    frame5.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    frame5.Parent = parent

    Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 7)

    local textLabel3 = Instance.new("TextLabel")
    textLabel3.Size = UDim2.new(1, -70, 1, 0)
    textLabel3.Position = UDim2.new(0, 12, 0, 0)
    textLabel3.BackgroundTransparency = 1
    textLabel3.Text = text3
    textLabel3.TextColor3 = Color3.fromRGB(225, 225, 235)
    textLabel3.TextSize = v1 and 14 or 13
    textLabel3.Font = Enum.Font.Gotham
    textLabel3.TextXAlignment = Enum.TextXAlignment.Left
    textLabel3.Parent = frame5

    local textButton5 = Instance.new("TextButton")
    textButton5.Size = UDim2.new(0, 48, 0, 26)
    textButton5.Position = UDim2.new(1, -56, 0.5, -13)
    textButton5.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    textButton5.Text = ""
    textButton5.Parent = frame5

    Instance.new("UICorner", textButton5).CornerRadius = UDim.new(1, 0)
    local v28 = false

    textButton5.MouseButton1Click:Connect(function()
      v28 = not v28

      textButton5.BackgroundColor3 = v28 and Color3.fromRGB(0, 145, 85)
        or Color3.fromRGB(50, 50, 60)

      fn(v28)
    end)

    return {
      SetState = function(p23)
        v28 = p23

        textButton5.BackgroundColor3 = p23 and Color3.fromRGB(0, 145, 85)
          or Color3.fromRGB(50, 50, 60)
      end,
    }
  end

  local function f28(parent2, text4, p24, p25, p26, fn2)
    local frame6 = Instance.new("Frame")
    frame6.Size = UDim2.new(1, 0, 0, v1 and 70 or 62)
    frame6.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    frame6.Parent = parent2

    Instance.new("UICorner", frame6).CornerRadius = UDim.new(0, 7)

    local textLabel4 = Instance.new("TextLabel")
    textLabel4.Size = UDim2.new(0.65, 0, 0, 22)
    textLabel4.Position = UDim2.new(0, 12, 0, 6)
    textLabel4.BackgroundTransparency = 1
    textLabel4.Text = text4
    textLabel4.TextColor3 = Color3.fromRGB(225, 225, 235)
    textLabel4.TextSize = 14
    textLabel4.Font = Enum.Font.Gotham
    textLabel4.TextXAlignment = Enum.TextXAlignment.Left
    textLabel4.Parent = frame6

    local textLabel5 = Instance.new("TextLabel")
    textLabel5.Size = UDim2.new(0.3, -12, 0, 22)
    textLabel5.Position = UDim2.new(0.68, 0, 0, 6)
    textLabel5.BackgroundTransparency = 1
    textLabel5.Text = tostring(p26)
    textLabel5.TextColor3 = Color3.fromRGB(0, 210, 130)
    textLabel5.TextSize = 14
    textLabel5.Font = Enum.Font.GothamBold
    textLabel5.TextXAlignment = Enum.TextXAlignment.Right
    textLabel5.Parent = frame6

    local frame7 = Instance.new("Frame")
    frame7.Size = UDim2.new(1, -24, 0, v1 and 14 or 10)
    frame7.Position = UDim2.new(0, 12, 0, v1 and 40 or 36)
    frame7.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
    frame7.Parent = frame6

    Instance.new("UICorner", frame7).CornerRadius = UDim.new(1, 0)

    local frame8 = Instance.new("Frame")
    frame8.Size = UDim2.new((p26 - p24) / (p25 - p24), 0, 1, 0)
    frame8.BackgroundColor3 = Color3.fromRGB(0, 160, 95)
    frame8.Parent = frame7

    Instance.new("UICorner", frame8).CornerRadius = UDim.new(1, 0)
    local v29 = false

    local function f29(p27)
      local v30 = math.clamp((p27.X - frame7.AbsolutePosition.X) / frame7.AbsoluteSize.X, 0, 1)
      local v31 = math.floor(p24 + (p25 - p24) * v30 + 0.5)
      frame8.Size = UDim2.new(v30, 0, 1, 0)
      textLabel5.Text = tostring(v31)
      fn2(v31)
    end

    frame7.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        v29 = true
        f29(input.Position)
      end
    end)

    userInputService.InputEnded:Connect(function(input2)
      if input2.UserInputType == Enum.UserInputType.MouseButton1
        or input2.UserInputType == Enum.UserInputType.Touch then
        v29 = false
      end
    end)

    userInputService.InputChanged:Connect(function(input3)
      if v29
        and (input3.UserInputType == Enum.UserInputType.MouseMovement
          or input3.UserInputType == Enum.UserInputType.Touch) then
        f29(input3.Position)
      end
    end)
  end

  local function f30(parent3, text5, p28)
    local textButton6 = Instance.new("TextButton")
    textButton6.Size = UDim2.new(1, 0, 0, v1 and 40 or 36)
    textButton6.BackgroundColor3 = Color3.fromRGB(38, 42, 58)
    textButton6.Text = text5
    textButton6.TextColor3 = Color3.fromRGB(235, 235, 245)
    textButton6.TextSize = 14
    textButton6.Font = Enum.Font.GothamMedium
    textButton6.Parent = parent3

    Instance.new("UICorner", textButton6).CornerRadius = UDim.new(0, 7)
    textButton6.MouseButton1Click:Connect(p28)
    return textButton6
  end

  local function f31(parent4, text6, p29)
    local textLabel6 = Instance.new("TextLabel")
    textLabel6.Size = UDim2.new(1, 0, 0, 20)
    textLabel6.BackgroundTransparency = 1
    textLabel6.Text = text6
    textLabel6.TextColor3 = p29 or Color3.fromRGB(180, 180, 190)
    textLabel6.TextSize = 12
    textLabel6.Font = Enum.Font.Gotham
    textLabel6.TextXAlignment = Enum.TextXAlignment.Left
    textLabel6.Parent = parent4
  end

  f27(v24, "Speed Hack", function(p30)
    v4.Speed = p30

    if connect4 then
      connect4:Disconnect()
    end

    if p30 then
      connect4 = runService.Heartbeat:Connect(function()
        local character6 = localPlayer.Character

        if character6 and character6:FindFirstChildOfClass("Humanoid") then
          character6.Humanoid.WalkSpeed = v4.SpeedValue
        end
      end)
    end
  end)

  f28(v24, "Speed Value", 1, 1000, 50, function(speedValue) v4.SpeedValue = speedValue end)
  f27(v24, "Fly", function(p31) f6(p31) end)
  f28(v24, "Fly Speed", 1, 1000, 50, function(flyValue) v4.FlyValue = flyValue end)

  f27(v24, "NoClip", function(p32) f5(p32) end)
  f27(v24, "Infinite Jump", function(infiniteJump) v4.InfiniteJump = infiniteJump end)

  userInputService.JumpRequest:Connect(function()
    if v4.InfiniteJump then
      local character7 = localPlayer.Character

      if character7 and character7:FindFirstChildOfClass("Humanoid") then
        character7.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
      end
    end
  end)

  f27(v25, "Button for features", function(quickButtons)
    v4.QuickButtons = quickButtons
    f20()
  end)

  f30(v25, "Finish RLGL", function() f2(Vector3.new(-12174.12, -789.46, -2999.45)) end)
  f30(v25, "Lights Out Safe Spot", function() f2(Vector3.new(8037.49, 117.04, 3719.8)) end)
  f30(v25, "Hide And Seek Safe Spot", function() f2(Vector3.new(-642.05, 183.32, 401.25)) end)
  f30(v25, "Jump Rope TP", function() f2(Vector3.new(-70.05, 119.77, -4.05)) end)
  f30(v25, "Glass TP", function() f2(Vector3.new(1279.58, 101.88, -941.17)) end)
  f30(v25, "Auto Vote", function() f2(Vector3.new(8048.35, 89.05, 3687.75)) end)
  f30(v25, "Frontman Room TP", function() f2(Vector3.new(7966.48, 112.2, 3661.34)) end)

  f27(v26, "Player ESP", function(playerESP) v4.PlayerESP = playerESP end)
  f27(v26, "Seeker ESP", function(seekerESP) v4.SeekerESP = seekerESP end)
  f27(v26, "Hider ESP", function(hiderESP) v4.HiderESP = hiderESP end)
  f27(v26, "Guard ESP", function(guardESP) v4.GuardESP = guardESP end)
  f27(v26, "Frontman ESP", function(frontmanESP) v4.FrontmanESP = frontmanESP end)
  f27(v26, "Glass Maker ESP", function(glassMakerESP) v4.GlassMakerESP = glassMakerESP end)
  f27(v26, "Baby Carrier ESP", function(babyCarrierESP) v4.BabyCarrierESP = babyCarrierESP end)
  f27(v26, "Shaman ESP", function(shamanESP) v4.ShamanESP = shamanESP end)
  f27(v26, "Exit Doors ESP", function(exitDoorsESP) v4.ExitDoorsESP = exitDoorsESP end)

  f27(v27, "Button for features", function(quickButtons2)
    v4.QuickButtons = quickButtons2
    f20()
  end)

  local v32 = f27(v27, "Kill Aura (Normal Players)", function(p33)
    if p33 then
      f19("normal")
    else
      f15()
    end
  end)

  local v33 = f27(v27, "Rebel Kill Aura (Only Guards)", function(p34)
    if p34 then
      f19("rebel")
    else
      f15()
    end
  end)

  local v34 = f27(v27, "Seeker Kill Aura (Only Hiders)", function(p35)
    if p35 then
      f19("seeker")
    else
      f15()
    end
  end)

  local v35 = f27(v27, "Frontman Kill Aura (Only Frontman)", function(p36)
    if p36 then
      f19("frontman")
    else
      f15()
    end
  end)

  f31(v27, "Press [K] to close Kill Auras (PC)", Color3.fromRGB(255, 180, 50))

  runService.RenderStepped:Connect(function()
    local v36 = {}

    for index9, value11 in ipairs(players:GetPlayers()) do
      if value11 ~= localPlayer and value11.Character then
        local humanoidRootPart5 = value11.Character:FindFirstChild("HumanoidRootPart")
        local humanoid4 = value11.Character:FindFirstChildOfClass("Humanoid")

        if humanoidRootPart5 and humanoid4 and humanoid4.Health > 0 then
          v36[value11] = true

          if not v8[value11] then
            v8[value11] = { Name = Drawing.new("Text"), Info = Drawing.new("Text") }

            local v37 = v8[value11]
            v37.Name.Size = 17
            v37.Name.Center = true
            v37.Name.Outline = true
            v37.Info.Size = 14
            v37.Info.Center = true
            v37.Info.Outline = true
          end

          local v38 = v8[value11]

          local v39, v40 = currentCamera:WorldToViewportPoint(humanoidRootPart5.Position
            + Vector3.new(0, 3.4, 0))

          if v40 then
            local magnitude = 0

            if localPlayer.Character
              and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
              magnitude = (humanoidRootPart5.Position
                - localPlayer.Character.HumanoidRootPart.Position).Magnitude
            end

            local v41 = f11(value11)
            local v42 = f9(value11)
            local v43 = f12(value11)
            local v44 = f16(value11)
            local playerESP2 = v4.PlayerESP
            local color = Color3.fromRGB(255, 255, 255)
            local v45 = ""

            if v4.FrontmanESP and v43 then
              playerESP2 = true
              color = Color3.fromRGB(20, 20, 20)
              v45 = "[FRONTMAN] "
            elseif v4.GuardESP and v42 then
              playerESP2 = true
              color = Color3.fromRGB(255, 120, 40)
              v45 = "[GUARD] "
            elseif v4.SeekerESP and v41 then
              playerESP2 = true
              color = Color3.fromRGB(255, 55, 55)
              v45 = "[SEEKER] "
            elseif v4.HiderESP and v44 then
              playerESP2 = true
              color = Color3.fromRGB(70, 190, 255)
              v45 = "[HIDER] "
            end

            if playerESP2 then
              v38.Name.Text = v45 .. value11.Name
              v38.Name.Color = color
              v38.Name.Position = Vector2.new(v39.X, v39.Y - 18)
              v38.Name.Visible = true

              v38.Info.Text = string.format(
                "%d HP | %d studs", math.floor(humanoid4.Health), math.floor(magnitude)
              )

              v38.Info.Color = color
              v38.Info.Position = Vector2.new(v39.X, v39.Y)
              v38.Info.Visible = true
            else
              v38.Name.Visible = false
              v38.Info.Visible = false
            end
          else
            v38.Name.Visible = false
            v38.Info.Visible = false
          end
        end
      end
    end

    for key3, value12 in pairs(v8) do
      if not v36[key3] then
        value12.Name:Remove()
        value12.Info:Remove()
        v8[key3] = nil
      end
    end
  end)

  if not v1 then
    userInputService.InputBegan:Connect(function(input4, p37)
      if p37 then
        return
      end

      if input4.KeyCode == Enum.KeyCode.RightControl then
        v5 = not v5
        frame.Visible = v5

        if textButton2 then
          textButton2.Visible = not v5
        end
      end

      if input4.KeyCode == Enum.KeyCode.K then
        f15()
        v32.SetState(false)
        v33.SetState(false)
        v34.SetState(false)
        v35.SetState(false)
      end
    end)
  end

  print("Oretachi's Ddakji | Mobile Compatible loaded")
end

local oretachiKey, textBox, textLabel7

if f1() then
  f22()
  print("Key saved - Menu loaded directly")
else
  oretachiKey = Instance.new("ScreenGui")
  oretachiKey.Name = "OretachiKey"
  oretachiKey.ResetOnSpawn = false
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
  textBox.TextSize = 14
  textBox.Font = Enum.Font.Gotham
  textBox.Parent = frame9

  Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)

  local textButton7 = Instance.new("TextButton")
  textButton7.Size = UDim2.new(0.8, 0, 0, 34)
  textButton7.Position = UDim2.new(0.1, 0, 0.62, 0)
  textButton7.BackgroundColor3 = Color3.fromRGB(0, 120, 80)
  textButton7.Text = "Submit"
  textButton7.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton7.TextSize = 14
  textButton7.Font = Enum.Font.GothamBold
  textButton7.Parent = frame9

  Instance.new("UICorner", textButton7).CornerRadius = UDim.new(0, 6)

  textLabel7 = Instance.new("TextLabel")
  textLabel7.Size = UDim2.new(1, 0, 0, 18)
  textLabel7.Position = UDim2.new(0, 0, 0.88, 0)
  textLabel7.BackgroundTransparency = 1
  textLabel7.Text = ""
  textLabel7.TextColor3 = Color3.fromRGB(255, 80, 80)
  textLabel7.TextSize = 12
  textLabel7.Font = Enum.Font.Gotham
  textLabel7.Parent = frame9

  textButton7.MouseButton1Click:Connect(function()
    if textBox.Text == "ORETACHI2026" then
      oretachiKey:Destroy()
      f22()
    else
      textLabel7.Text = "Wrong Key!"
    end
  end)
end    else
      textLabel7.Text = "Wrong Key!"
    end
  end)
end