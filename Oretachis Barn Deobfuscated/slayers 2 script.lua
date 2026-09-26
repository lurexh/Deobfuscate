local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local lighting = game:GetService("Lighting")
local coreGui = game:GetService("CoreGui")
local replicatedStorage = game:GetService("ReplicatedStorage")
local workspaceService = game:GetService("Workspace")
local localPlayer = players.LocalPlayer
local currentCamera = workspace.CurrentCamera
print("[Oretachi's Slayers 2] Script starting...")

local v1 = {
  Speed = false,
  SpeedValue = 50,
  Fly = false,
  FlyValue = 50,
  FlyKey = Enum.KeyCode.F,
  FlyKeyIsMouse = false,
  FlyMouseButton = nil,
  FreeCam = false,
  NoClip = false,
  FullBright = false,
  NoFog = false,
  InfiniteJump = false,
  StickHeight = 4.2,
  AutoSerpentKeys = false,
  AutoDeliverPackage = false,
  AutoBookOfGuidance = false,
  AutoDefeatBandits = false,
  AutoDefeatZuko = false,
  AutoBearCub = false,
  AutoStoneTrainee = false,
  AutoGyorei = false,
  AutoFlameTrainee = false,
  AutoRengu = false,
  AutoHoyuzo = false,
  AutoYahari = false,
  AntiAdmin = false,
}

local v2 = true
local v3 = false
local vector = Vector3.new(-688.51, 856.25, 71.51)
local vector2 = Vector3.new(-424.89, 1243, -949.62)
local vector3 = Vector3.new(-786.86, 1262.2, -1135.19)
local vector4 = Vector3.new(-700.06, 1245.7, -983.18)
local vector5 = Vector3.new(423.9, 943.56, 507.24)
local vector6 = Vector3.new(506.8, 1123.77, -974.17)
local vector7 = Vector3.new(-589.83, 1245.23, -1088.2)
local connect

local function f1()
  if connect then
    connect:Disconnect()
  end

  connect = runService.Stepped:Connect(function()
    if not v1.NoClip then
      return
    else
      local character = localPlayer.Character

      if character then
        for index, value in ipairs(character:GetDescendants()) do
          if value:IsA("BasePart") then
            value.CanCollide = false
          end
        end
      end

      return
    end
  end)
end

local vector8 = Vector3.new(-1534.48, 315.2, -108.71)
local connect2, bodyVelocity, bodyGyro

local function f2()
  if connect2 then
    connect2:Disconnect()
    connect2 = nil
  end

  if bodyVelocity then
    bodyVelocity:Destroy()
    bodyVelocity = nil
  end

  if bodyGyro then
    bodyGyro:Destroy()
    bodyGyro = nil
  end

  local character2 = localPlayer.Character

  if character2 then
    local humanoid = character2:FindFirstChildOfClass("Humanoid")

    if humanoid then
      humanoid.PlatformStand = false
    end
  end
end

local v4 = {
  { Name = "Aim Training", Pos = vector8 },
  { Name = "Boulder Push", Pos = Vector3.new(-298.01, 1070.5, -575.34) },
  { Name = "Boulder Split", Pos = Vector3.new(-1054.44, 1130.5, -625.64) },
  { Name = "Cup Game", Pos = Vector3.new(-1899.86, 315.25, 0.09) },
  { Name = "Meditation", Pos = Vector3.new(-1637.87, 315.75, -209.47) },
  { Name = "Parkour Dungeon", Pos = Vector3.new(127.59, 1066.25, -1293.42) },
  { Name = "Push-Ups", Pos = Vector3.new(-1887.93, 315.25, 69.31) },
  { Name = "Squat", Pos = Vector3.new(-1800.21, 314, 220.25) },
}

local v5 = {
  { Name = "Stone Trainer", Pos = Vector3.new(2579.62, 1091.5, -823.34) },
  { Name = "Flame Trainer", Pos = Vector3.new(-967.57, 1022.16, 1192.1) },
  { Name = "Thunder Trainer", Pos = Vector3.new(1970.72, 1662.5, -612.7) },
  { Name = "Kuro", Pos = Vector3.new(0, 0, 0) },
}

local vector9 = Vector3.new(-688.51, 856.25, 71.51)
local vector10 = Vector3.new(-1266.54, 981.55, -3354.59)
local vector11 = Vector3.new(2232.91, 604.04, -498.91)

local function f3()
  if connect2 then
    return
  else
    local character3 = localPlayer.Character

    if not character3 then
      return
    else
      local humanoidRootPart = character3:FindFirstChild("HumanoidRootPart")
      local v6 = not humanoidRootPart
      local humanoid2 = character3:FindFirstChildOfClass("Humanoid")

      if v6 or not humanoid2 then
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

      connect2 = runService.RenderStepped:Connect(function()
        if not v1.Fly or not bodyVelocity or v1.FreeCam then
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

          local v7 = bodyVelocity
          v7.Velocity = zero.Magnitude > 0 and zero.Unit * v1.FlyValue or Vector3.zero

          bodyGyro.CFrame = cframe
          return
        end
      end)

      return
    end
  end
end

local vector12 = Vector3.new(-890.16, 981.55, -3952.65)
local vector13 = Vector3.new(1079.14, 1426.04, -782.08)
local vector14 = Vector3.new(-1244.95, 1366.53, -3234.33)
local vector15 = Vector3.new(-1808, -38.66, 437.17)
local vector16 = Vector3.new(1084.61, 1584.37, -803.86)
local connect3

local function f4()
  if connect3 then
    connect3:Disconnect()
    connect3 = nil
  end

  local character4 = localPlayer.Character

  if character4 then
    local humanoid3 = character4:FindFirstChildOfClass("Humanoid")

    if humanoid3 then
      humanoid3.WalkSpeed = 16
    end
  end
end

local vector17 = Vector3.new(-570.39, 814.25, 118.93)
local vector18 = Vector3.new(-1631.21, 1230.65, 1143.07)

local function f5()
  if connect3 then
    connect3:Disconnect()
  end

  connect3 = runService.Heartbeat:Connect(function()
    if not v1.Speed or v1.FreeCam then
      return
    else
      local character5 = localPlayer.Character

      if not character5 then
        return
      else
        local humanoid4 = character5:FindFirstChildOfClass("Humanoid")

        if humanoid4 and humanoid4.WalkSpeed ~= v1.SpeedValue then
          humanoid4.WalkSpeed = v1.SpeedValue
        end

        return
      end
    end
  end)
end

local vector19 = Vector3.new(-1206.54, 975.94, -3184.87)

local function f6()
  if connect then
    connect:Disconnect()
    connect = nil
  end
end

local vector20 = Vector3.new(-1020.61, 812.27, 632.32)
local v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19

local function f7()
  for index2, value2 in ipairs({
    "AutoSerpentKeys", "AutoDeliverPackage", "AutoBookOfGuidance", "AutoDefeatBandits",
    "AutoDefeatZuko", "AutoBearCub", "AutoStoneTrainee", "AutoGyorei", "AutoFlameTrainee",
    "AutoRengu", "AutoHoyuzo", "AutoYahari",
  }) do
    v1[value2] = false
  end

  if v8 then
    v8(false)
  end

  if v9 then
    v9(false)
  end

  if v10 then
    v10(false)
  end

  if v11 then
    v11(false)
  end

  if v12 then
    v12(false)
  end

  if v13 then
    v13(false)
  end

  if v14 then
    v14(false)
  end

  if v15 then
    v15(false)
  end

  if v16 then
    v16(false)
  end

  if v17 then
    v17(false)
  end

  if v18 then
    v18(false)
  end

  if v19 then
    v19(false)
  end

  print("[Panic] All Auto stopped")
end

local vector21 = Vector3.new(899.02, 882.2, 739.61)

local function f8(p1)
  if not p1 then
    return nil
  elseif p1:IsA("BasePart") then
    return p1
  else
    if p1:IsA("Model") then
      return p1.PrimaryPart or p1:FindFirstChild("HumanoidRootPart")
        or p1:FindFirstChild("Head") or p1:FindFirstChildWhichIsA("BasePart", true)
    end

    return p1:FindFirstChildWhichIsA("BasePart", true)
  end
end

local function f9(p2)
  if not p2 or not p2.Parent then
    return false
  else
    local humanoid5 = p2:FindFirstChildOfClass("Humanoid")

    if humanoid5 and humanoid5.Health <= 0 then
      return false
    end

    return true
  end
end

local v20 = {
  { Label = "FL Insect Katana", Pos = vector9 }, { Label = "FL Katana", Pos = vector10 },
  { Label = "FL Mask Structure", Pos = vector11 }, { Label = "FL Spear", Pos = vector12 },
  { Label = "FL Lantern Plates", Pos = vector13 },
  { Label = "Ice Veil Foot Prints", Pos = vector14 }, { Label = "NF Claws", Pos = vector15 },
  { Label = "NF Axe and Mace", Pos = vector16 }, { Label = "NF Katana", Pos = vector17 },
  { Label = "NF Mask", Pos = vector18 }, { Label = "NF Scythe", Pos = vector19 },
  { Label = "NF Sickle", Pos = vector20 }, { Label = "Serpent Box", Pos = vector21 },
}

local function f10()
  local map = workspaceService:FindFirstChild("Map")

  if map then
    local puzzles = map:FindFirstChild("Puzzles")

    if puzzles then
      return puzzles
    end

    return workspaceService:FindFirstChild("Puzzles")
  end

  return workspaceService:FindFirstChild("Puzzles")
end

local v21

local function f11()
  if v21 then
    return v21
  else
    local v22, v23 = pcall(function()
      local communication = replicatedStorage:FindFirstChild("Communication")

      if not communication then
        return nil
      else
        local serverAndClient = communication:FindFirstChild("ServerAndClient")

        if not serverAndClient then
          return nil
        else
          local signals = serverAndClient:FindFirstChild("Signals")

          if not signals then
            return nil
          else
            local signalFunction = signals:FindFirstChild("SignalFunction")

            if not signalFunction then
              return nil
            end

            return signalFunction:FindFirstChild("Function") or signalFunction
          end
        end
      end
    end)

    if v22 and v23 then
      v21 = v23
    end

    return v21
  end
end

local v24 = { "EVILARTSPINS", "SORRYFORSHUTDOWN", "RELEASE26", "POINTSRESET" }
local f12

local function f13()
  task.spawn(function()
    for index3, value3 in ipairs(v24) do
      f12("RedeemCode", value3)
      print("[Redeem]", value3)

      if index3 < #v24 then
        task.wait(4)
      end
    end
  end)
end

local v25

local function f14()
  if v25 then
    return v25
  else
    local v26, v27 = pcall(function()
      local communication2 = replicatedStorage:FindFirstChild("Communication")

      if not communication2 then
        return nil
      else
        local serverAndClient2 = communication2:FindFirstChild("ServerAndClient")

        if not serverAndClient2 then
          return nil
        else
          local signals2 = serverAndClient2:FindFirstChild("Signals")

          if not signals2 then
            return nil
          else
            local signalEvent = signals2:FindFirstChild("SignalEvent")

            if not signalEvent then
              return nil
            end

            return signalEvent:FindFirstChild("Event") or signalEvent
          end
        end
      end
    end)

    if v26 and v27 then
      v25 = v27
    end

    return v25
  end
end

local function f15()
  if v1.FlyKeyIsMouse and v1.FlyMouseButton then
    return ({
      [Enum.UserInputType.MouseButton1] = "Mouse1",
      [Enum.UserInputType.MouseButton2] = "Mouse2",
      [Enum.UserInputType.MouseButton3] = "Mouse3",
    })[v1.FlyMouseButton] or "Mouse"
  end

  return v1.FlyKey and v1.FlyKey.Name or "F"
end

local function f16()
  local character6 = localPlayer.Character
  return character6 and character6:FindFirstChild("HumanoidRootPart")
end

function f12(...)
  if not f11() then
    return
  end
end

local function f17()
  local v28 = "Unknown"

  pcall(function()
    if identifyexecutor then
      local v29, v30 = pcall(identifyexecutor)

      if v29 and v30 then
        v28 = tostring(v30)
      end
    elseif getexecutorname then
      local v31, v32 = pcall(getexecutorname)

      if v31 and v32 then
        v28 = tostring(v32)
      end
    end
  end)

  return v28
end

local function f18(p3)
  local v33 = f16()

  if v33 then
    pcall(function() v33.CFrame = CFrame.new(p3) end)
  end
end

local v34 = f17()
local v35

local function f19(p4, p5, p6)
  if not v35 then
    return
  else
    local count = 0

    while true do
      count = 1 + count

      if not (p5 >= count) then
        break
      end

      if not v1.AutoBookOfGuidance then
        break
      end

      pcall(function()
        v35:SendKeyEvent(true, p4, false, game)
        task.wait(0.03)
        v35:SendKeyEvent(false, p4, false, game)
      end)

      task.wait(p6 or 0.08)
    end

    return
  end
end

local function f20(p7, p8)
  local stickHeight = p8
  stickHeight = stickHeight or v1.StickHeight

  local v36 = f16()

  if v36 then
    pcall(function()
      v36.CFrame = CFrame.new(p7 + Vector3.new(0, stickHeight, 0))
        * CFrame.Angles(math.rad(-90), 0, 0)
    end)
  end
end

local function f21(p9, p10)
  if not v35 then
    return
  else
    pcall(function() v35:SendKeyEvent(true, p9, false, game) end)
    local total = 0

    while total < p10 and v1.AutoSerpentKeys do
      task.wait(0.1)
      total = total + 0.1
      pcall(function() v35:SendKeyEvent(true, p9, false, game) end)
    end

    pcall(function() v35:SendKeyEvent(false, p9, false, game) end)
    return
  end
end

local function f22()
  local v37 = {}
  local v38 = f10()

  if not v38 then
    return v37
  else
    local serpentKeys = v38:FindFirstChild("SerpentKeys") or v38:FindFirstChild("Serpent Keys")

    if not serpentKeys then
      return v37
    end

    for i = 1, 25 do
      local findFirstChild = serpentKeys:FindFirstChild("Key" .. i)

      if findFirstChild then
        local v39 = f8(findFirstChild)

        if v39 then
          table.insert(v37, { Name = "Key" .. i, Part = v39 })
        end
      end
    end

    return v37
  end
end

local function f23(p11, p12)
  local total2 = 0

  while total2 < p11 do
    if p12 == "keys" and not v1.AutoSerpentKeys then
      break
    end

    if p12 == "package" and not v1.AutoDeliverPackage then
      break
    end

    if p12 == "book" and not v1.AutoBookOfGuidance then
      break
    end

    if p12 == "bandits" and not v1.AutoDefeatBandits then
      break
    end

    if p12 == "zuko" and not v1.AutoDefeatZuko then
      break
    end

    if p12 == "bear" and not v1.AutoBearCub then
      break
    end

    task.wait(0.25)
    total2 = total2 + 0.25
  end
end

local function f24()
  local v40 = {}

  local v41, v42 = pcall(function()
    local humanoids = workspaceService:FindFirstChild("Humanoids")

    if not humanoids then
      return {}
    else
      local regions = humanoids:FindFirstChild("Regions")

      if not regions then
        return {}
      end

      for index4, value4 in ipairs(regions:GetChildren()) do
        local activeNpcs = value4:FindFirstChild("ActiveNpcs")

        if activeNpcs then
          for index5, value5 in ipairs(activeNpcs:GetDescendants()) do
            if value5:IsA("Model") then
              local v43 = string.lower(value5.Name)

              if (v43:find("cub") or v43:find("bear cub")) and not v43:find("mother") then
                local v44 = f8(value5)

                if v44 then
                  table.insert(v40, { Model = value5, Part = v44 })
                end
              end
            end
          end
        end
      end

      return v40
    end
  end)

  if v41 and v42 then
    return v42
  end

  return v40
end

local function f25()
  for index6, value6 in ipairs(players:GetPlayers()) do
  end

  players.PlayerAdded:Connect(function(player) task.wait(0.2) end)
end

local function f26()
  f18(vector3)
  task.wait(0.55)
  local v45 = f14()

  if v45 then
    pcall(function() v45:FireServer("NpcTalking", "Ended") end)
    task.wait(0.4)
    pcall(function() v45:FireServer("AddQuest", "Ill find the pages") end)
  end
end

local function f27()
  f18(vector6)
  task.wait(0.6)
  local v46 = f14()

  if v46 then
    pcall(function() v46:FireServer("NpcTalking", "Ended") end)
    task.wait(0.4)
    pcall(function() v46:FireServer("AddQuest", "Ill drive the bears back(Lv 10)") end)
  end
end

local fogEnd, fogStart, fogColor

local function f28(p13)
  if p13 then
    fogEnd = lighting.FogEnd
    fogStart = lighting.FogStart
    fogColor = lighting.FogColor

    lighting.FogEnd = 1000000
    lighting.FogStart = 0

    pcall(function()
      for index7, value7 in ipairs(lighting:GetChildren()) do
        if value7:IsA("Atmosphere") then
          value7.Density = 0
          value7.Haze = 0
          value7.Glare = 0
        end
      end
    end)
  else
    if fogEnd then
      lighting.FogEnd = fogEnd
    end

    if fogStart then
      lighting.FogStart = fogStart
    end

    if fogColor then
      lighting.FogColor = fogColor
    end
  end
end

local function f29()
  f18(vector2)
  task.wait(0.6)
  local v47 = f14()

  if v47 then
    pcall(function() v47:FireServer("NpcTalking", "Ended") end)
    task.wait(0.4)
    pcall(function() v47:FireServer("AddQuest", "Ill take 3 bandits") end)
  end
end

local cframe2 = CFrame.new()

local function f30()
  local v48 = {}

  for index8, value8 in ipairs(workspaceService:GetDescendants()) do
    local v49 = string.lower(value8.Name)

    if v49:find("lostpage") or v49:find("lost page") then
      local v50 = f8(value8)

      if v50 then
        table.insert(v48, { Part = v50 })
      end
    end
  end

  return v48
end

local cframe3 = cframe2

local function f31(p14)
  if p14 then
    lighting.Brightness = 2.2
    lighting.ClockTime = 14
    lighting.Ambient = Color3.fromRGB(140, 140, 150)
    lighting.OutdoorAmbient = Color3.fromRGB(140, 140, 150)
    lighting.GlobalShadows = false
    lighting.ExposureCompensation = 0.35
  else
    lighting.Brightness = 1
    lighting.Ambient = Color3.fromRGB(70, 70, 70)
    lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
    lighting.GlobalShadows = true
    lighting.ExposureCompensation = 0
  end
end

local connect4, humanoidRootPart2, cameraType, cameraSubject, f32

local function f33()
  if connect4 then
    return
  else
    cameraType = currentCamera.CameraType
    cameraSubject = currentCamera.CameraSubject
    currentCamera.CameraType = Enum.CameraType.Scriptable
    f32(true)
    local character7 = localPlayer.Character

    humanoidRootPart2 = character7 and character7:FindFirstChild("HumanoidRootPart")
        and character7.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
      or currentCamera.CFrame.Position

    cframe3 = currentCamera.CFrame

    connect4 = runService.RenderStepped:Connect(function(delta)
      if not v1.FreeCam then
        return
      else
        local character8 = localPlayer.Character

        if character8 then
          local humanoidRootPart3 = character8:FindFirstChild("HumanoidRootPart")
          local humanoid6 = character8:FindFirstChildOfClass("Humanoid")

          if humanoidRootPart3 then
            humanoidRootPart3.Anchored = true
            humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero
          end

          if humanoid6 then
            humanoid6.WalkSpeed = 0
            humanoid6.PlatformStand = true
          end
        end

        local zero2 = Vector3.zero
        local lookVector = cframe3.LookVector
        local rightVector = cframe3.RightVector

        if userInputService:IsKeyDown(Enum.KeyCode.W) then
          zero2 = zero2 + lookVector
        end

        if userInputService:IsKeyDown(Enum.KeyCode.S) then
          zero2 = zero2 - lookVector
        end

        if userInputService:IsKeyDown(Enum.KeyCode.A) then
          zero2 = zero2 - rightVector
        end

        if userInputService:IsKeyDown(Enum.KeyCode.D) then
          zero2 = zero2 + rightVector
        end

        if userInputService:IsKeyDown(Enum.KeyCode.E) then
          zero2 = zero2 + Vector3.new(0, 1, 0)
        end

        if userInputService:IsKeyDown(Enum.KeyCode.Q) then
          zero2 = zero2 - Vector3.new(0, 1, 0)
        end

        local isKeyDown = userInputService:IsKeyDown(Enum.KeyCode.LeftShift) and 7.5 or 2.5

        if zero2.Magnitude > 0 then
          humanoidRootPart2 = humanoidRootPart2 + zero2.Unit * isKeyDown * (delta * 60)
        end

        local getMouseDelta = userInputService:GetMouseDelta()
        local v51, v52 = cframe3:ToEulerAnglesYXZ()

        cframe3 = CFrame.new(humanoidRootPart2)
          * CFrame.Angles(0, v52 - getMouseDelta.X * 0.003, 0)
          * CFrame.Angles(v51 - getMouseDelta.Y * 0.003, 0, 0)

        currentCamera.CFrame = cframe3
        return
      end
    end)

    userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    return
  end
end

function f32(p15)
  local character9 = localPlayer.Character
  local humanoid7

  if not character9 then
    return
  else
    local humanoidRootPart4 = character9:FindFirstChild("HumanoidRootPart")
    local v53 = not humanoidRootPart4
    humanoid7 = character9:FindFirstChildOfClass("Humanoid")

    if v53 or not humanoid7 then
      return
    end

    if p15 then
      humanoid7.WalkSpeed = 0
      humanoid7.JumpPower = 0

      pcall(function() humanoid7.JumpHeight = 0 end)
      humanoid7.PlatformStand = true

      humanoidRootPart4.Anchored = true
      humanoidRootPart4.AssemblyLinearVelocity = Vector3.zero
    else
      humanoidRootPart4.Anchored = false

      humanoid7.PlatformStand = false
      humanoid7.JumpPower = 50

      pcall(function() humanoid7.JumpHeight = 7.2 end)
      humanoid7.WalkSpeed = v1.Speed and v1.SpeedValue or 16
    end

    return
  end
end

local function f34()
  f18(vector2)
  task.wait(0.6)
  local v54 = f14()

  if v54 then
    pcall(function() v54:FireServer("Item_Equip", 1) end)
    task.wait(0.25)
    pcall(function() v54:FireServer("NpcTalking", "Ended") end)
    task.wait(0.4)
    pcall(function() v54:FireServer("AddQuest", "Ill take the bandit boss(Lv 7)") end)
  end
end

local function f35()
  if connect4 then
    connect4:Disconnect()
    connect4 = nil
  end

  currentCamera.CameraType = cameraType or Enum.CameraType.Custom

  if cameraSubject then
    currentCamera.CameraSubject = cameraSubject
  end

  userInputService.MouseBehavior = Enum.MouseBehavior.Default
  f32(false)
end

runService.RenderStepped:Connect(function()
  if v1.FullBright then
    f31(true)
  end

  if v1.NoFog then
    lighting.FogEnd = 1000000
    lighting.FogStart = 0
  end
end)

local function f36()
  f18(vector5)
  task.wait(0.55)
  local v55 = f14()

  if v55 then
    pcall(function() v55:FireServer("Item_Equip", 2) end)
    task.wait(0.2)
    pcall(function() v55:FireServer("NpcTalking", "Ended") end)
    task.wait(0.25)
    pcall(function() v55:FireServer("Item_Equip", 2) end)
    task.wait(0.2)

    pcall(function()
      v55:FireServer("QuestProgress", "Ill deliver the package", "Package delivered")
    end)
  end
end

userInputService.JumpRequest:Connect(function()
  local freeCam = not v1.InfiniteJump or v1.FreeCam
  local humanoid8

  if freeCam then
    return
  else
    local character10 = localPlayer.Character

    if character10 then
      humanoid8 = character10:FindFirstChildOfClass("Humanoid")

      if humanoid8 then
        pcall(function() humanoid8:ChangeState(Enum.HumanoidStateType.Jumping) end)
      end
    end

    return
  end
end)

local function f37(p16, p17)
  local v56 = tick()
  local heartbeat = runService.Heartbeat

  local connect5

  connect5 = heartbeat:Connect(function()
    if not v1[p17] or not f9(p16.Model) then
      if connect5 then
        connect5:Disconnect()
      end

      return
    else
      local part = f8(p16.Model) or p16.Part

      if part and part.Parent then
        f20(part.Position, v1.StickHeight)
      elseif connect5 then
        connect5:Disconnect()
      end

      if v35 and tick() - v56 > 0.14 then
        v56 = tick()
      end

      return
    end
  end)

  while v1[p17] and f9(p16.Model) do
    task.wait(0.2)
  end

  if connect5 then
    connect5:Disconnect()
  end
end

local function f38(p18, p19, p20)
  local v57 = {}

  local v58, v59 = pcall(function()
    local humanoids2 = workspaceService:FindFirstChild("Humanoids")

    if not humanoids2 then
      return {}
    else
      local regions2 = humanoids2:FindFirstChild("Regions")

      if not regions2 then
        return {}
      else
        local findFirstChild2 = regions2:FindFirstChild(p18)

        if not findFirstChild2 then
          return {}
        else
          local activeNpcs2 = findFirstChild2:FindFirstChild("ActiveNpcs")

          if not activeNpcs2 then
            return {}
          else
            local findFirstChild3 = activeNpcs2:FindFirstChild(p19)

            if findFirstChild3 then
              if findFirstChild3:IsA("Model") then
                local v60 = f8(findFirstChild3)

                if v60 then
                  table.insert(v57, { Model = findFirstChild3, Part = v60 })
                end
              else
                for index9, value9 in ipairs(findFirstChild3:GetChildren()) do
                  if value9:IsA("Model") then
                    local v61 = f8(value9)

                    if v61 then
                      table.insert(v57, { Model = value9, Part = v61 })
                    end
                  end
                end
              end
            end

            if #v57 == 0 then
              for index10, value10 in ipairs(activeNpcs2:GetDescendants()) do
                if value10:IsA("Model") then
                  local v62 = string.lower(value10.Name)
                  local v63 = string.lower(p19)

                  if p20 and v62 == v63 or not p20 and v62:find(v63) then
                    local v64 = f8(value10)

                    if v64 then
                      table.insert(v57, { Model = value10, Part = v64 })
                    end
                  end
                end
              end
            end

            return v57
          end
        end
      end
    end
  end)

  if v58 and v59 then
    return v59
  end

  return v57
end

local function f39()
  f18(vector4)
  task.wait(0.55)
  local v65 = f14()

  if v65 then
    pcall(function() v65:FireServer("Item_Equip", 2) end)
    task.wait(0.2)
    pcall(function() v65:FireServer("NpcTalking", "Ended") end)
    task.wait(0.35)
    pcall(function() v65:FireServer("AddQuest", "Ill deliver the package") end)
  end
end

local function f40()
  task.spawn(function()
    while v1.AutoSerpentKeys do
      f18(Vector3.new(-679.11, 856.25, 77.27))
      f23(5, "keys")
      if not v1.AutoSerpentKeys then
        break
      end

      f18(Vector3.new(-147.38, 798.9, 539.78))
      f23(5, "keys")

      if not v1.AutoSerpentKeys then
        break
      else
        local v66 = f22()
        local count2 = 0

        while true do
          count2 = 1 + count2

          if not (count2 <= 25) then
            break
          end

          local v67 = count2

          if not v1.AutoSerpentKeys then
            break
          else
            local part2 = nil

            for index11, value11 in ipairs(v66) do
              if value11.Name == "Key" .. v67 then
                part2 = value11.Part
                break
              end
            end

            if not part2 then
              v66 = f22()

              for index12, value12 in ipairs(v66) do
                if value12.Name == "Key" .. v67 then
                  part2 = value12.Part
                  break
                end
              end
            end

            if part2 and part2.Parent then
              f18(part2.Position + Vector3.new(0, 3, 0))
              f21(Enum.KeyCode.T, 4)

              if not v1.AutoSerpentKeys then
                break
              end

              f18(vector)
              f23(3, "keys")
            else
              task.wait(0.15)
            end
          end
        end

        task.wait(1)
      end
    end
  end)
end

local function f41(p21)
  return f38("Misc", p21, false)
end

local function f42(p22, fn)
  task.spawn(function()
    while v1[p22] do
      local v68 = nil

      for index13, value13 in ipairs((fn())) do
        if f9(value13.Model) then
          v68 = value13
          break
        end
      end

      if v68 then
        f37(v68, p22)
        task.wait(0.4)
      else
        task.wait(1.1)
      end
    end
  end)
end

local function f43()
  task.spawn(function()
    while v1.AutoDeliverPackage do
      f39()
      task.wait(0.7)

      if not v1.AutoDeliverPackage then
        break
      end

      f36()
      task.wait(1.4)
    end
  end)
end

local function f44()
  task.spawn(function()
    while v1.AutoBookOfGuidance do
      f26()
      task.wait(0.6)

      if not v1.AutoBookOfGuidance then
        break
      else
        local v69 = f30()

        if #v69 == 0 then
          task.wait(1.5)
        else
          for index14, value14 in ipairs(v69) do
            if not v1.AutoBookOfGuidance then
              break
            end

            if value14.Part and value14.Part.Parent then
              f18(value14.Part.Position + Vector3.new(0, 2, 0))
              task.wait(0.35)
              f19(Enum.KeyCode.T, 12, 0.08)
              task.wait(0.45)
            end
          end
        end

        task.wait(1.2)
      end
    end
  end)
end

local function f45()
  return f38("Windy Peak", "Zuko", false)[1]
end

local function f46()
  f18(vector7)
  task.wait(0.6)
  local v70 = f14()

  if v70 then
    pcall(function() v70:FireServer("PurchaseFromShop", "Regular Katana", 1) end)
    task.wait(0.35)
    pcall(function() v70:FireServer("NpcTalking", "Ended") end)
  end
end

local function f47()
  return f38("Windy Peak", "Bandit", false)
end

local function f48()
  task.spawn(function()
    while v1.AutoDefeatBandits do
      f29()
      task.wait(0.8)

      if not v1.AutoDefeatBandits then
        break
      else
        local count3 = 0
        local count4 = 0

        while v1.AutoDefeatBandits and count3 < 3 and count4 < 40 do
          count4 = count4 + 1
          local v71 = nil

          for index15, value15 in ipairs((f47())) do
            if f9(value15.Model) then
              v71 = value15
              break
            end
          end

          if v71 then
            f37(v71, "AutoDefeatBandits")
            count3 = count3 + 1
            task.wait(0.5)
          else
            task.wait(0.9)
          end
        end

        task.wait(1)
      end
    end
  end)
end

local function f49()
  task.spawn(function()
    while v1.AutoDefeatZuko do
      f34()
      task.wait(0.8)

      if not v1.AutoDefeatZuko then
        break
      else
        local v72 = 0

        while v1.AutoDefeatZuko and v72 < 60 do
          local v73 = v72 + 1
          local v74 = f45()
          v72 = v73

          if v74 and f9(v74.Model) then
            f37(v74, "AutoDefeatZuko")
            task.wait(0.8)
          else
            task.wait(1.2)
          end
        end

        task.wait(1.5)
      end
    end
  end)
end

local function f50()
  task.spawn(function()
    while v1.AutoBearCub do
      f27()
      task.wait(0.8)

      if not v1.AutoBearCub then
        break
      else
        local count5 = 0

        while v1.AutoBearCub and count5 < 50 do
          count5 = count5 + 1
          local v75 = nil

          for index16, value16 in ipairs((f24())) do
            if f9(value16.Model) then
              v75 = value16
              break
            end
          end

          if v75 then
            f37(v75, "AutoBearCub")
            task.wait(0.5)
          else
            task.wait(1)
          end
        end

        task.wait(1.2)
      end
    end
  end)
end

local function f51()
  f42("AutoStoneTrainee", function() return f38("Misc", "Stone Trainee", false) end)
end

local function f52()
  f42("AutoGyorei", function() return f41("Gyorei") end)
end

local function f53()
  f42("AutoRengu", function() return f41("Rengu") end)
end

local function f54()
  f42("AutoHoyuzo", function() return f38("Bamboo Grove", "Hoyuzo Subordinate", false) end)
end

local function f55()
  f42("AutoYahari", function() return f41("Yahari") end)
end

local function f56()
  f42("AutoFlameTrainee", function() return f41("Flame Trainee") end)
end

local v76

local function f57()
  f25()

  local function f58(p23)
    if not pcall(function() p23.Parent = coreGui end) then
      pcall(function() p23.Parent = localPlayer:WaitForChild("PlayerGui") end)
    end
  end

  local oretachiSlayers2 = Instance.new("ScreenGui")
  oretachiSlayers2.Name = "OretachiSlayers2"
  oretachiSlayers2.ResetOnSpawn = false
  oretachiSlayers2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

  f58(oretachiSlayers2)

  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, 680, 0, 580)
  frame.Position = UDim2.new(0.5, -340, 0.5, -290)
  frame.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
  frame.BorderSizePixel = 0
  frame.Active = true
  frame.Parent = oretachiSlayers2

  Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
  Instance.new("UIStroke", frame).Color = Color3.fromRGB(40, 40, 50)

  local frame2 = Instance.new("Frame")
  frame2.Size = UDim2.new(1, 0, 0, 48)
  frame2.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
  frame2.BorderSizePixel = 0
  frame2.Parent = frame

  Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 12)

  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, -55, 1, 0)
  textLabel.Position = UDim2.new(0, 16, 0, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "Oretachi's Slayers 2 (WIP)"
  textLabel.TextColor3 = Color3.fromRGB(240, 240, 250)
  textLabel.TextSize = 17
  textLabel.Font = Enum.Font.GothamBold
  textLabel.TextXAlignment = Enum.TextXAlignment.Left
  textLabel.Parent = frame2

  local textButton = Instance.new("TextButton")
  textButton.Size = UDim2.new(0, 34, 0, 26)
  textButton.Position = UDim2.new(1, -44, 0.5, -13)
  textButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
  textButton.Text = "-"
  textButton.TextColor3 = Color3.fromRGB(230, 230, 230)
  textButton.Font = Enum.Font.GothamBold
  textButton.TextSize = 18
  textButton.Parent = frame2

  Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 6)
  local v77, position, position2

  frame2.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
      v77 = true
      position = input.Position
      position2 = frame.Position
    end
  end)

  frame2.InputEnded:Connect(function(input2)
    if input2.UserInputType == Enum.UserInputType.MouseButton1 then
      v77 = false
    end
  end)

  userInputService.InputChanged:Connect(function(input3)
    if v77 and input3.UserInputType == Enum.UserInputType.MouseMovement then
      local v78 = input3.Position - position

      frame.Position = UDim2.new(
        position2.X.Scale, position2.X.Offset + v78.X, position2.Y.Scale,
        position2.Y.Offset + v78.Y
      )
    end
  end)

  local frame3 = Instance.new("Frame")
  frame3.Size = UDim2.new(1, -20, 0, 34)
  frame3.Position = UDim2.new(0, 10, 0, 56)
  frame3.BackgroundTransparency = 1
  frame3.Parent = frame

  local function f59(text, p24)
    local textButton2 = Instance.new("TextButton")
    textButton2.Size = UDim2.new(0, 95, 1, 0)
    textButton2.Position = UDim2.new(0, p24, 0, 0)
    textButton2.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    textButton2.Text = text
    textButton2.TextColor3 = Color3.fromRGB(220, 220, 230)
    textButton2.Font = Enum.Font.GothamMedium
    textButton2.TextSize = 13
    textButton2.Parent = frame3

    Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 7)
    return textButton2
  end

  local v79 = f59("Player", 0)
  local v80 = f59("Auto", 100)
  local v81 = f59("Teleport", 200)
  local v82 = f59("Misc", 300)
  local v83 = f59("Config", 400)
  v79.BackgroundColor3 = Color3.fromRGB(0, 140, 95)

  local frame4 = Instance.new("Frame")
  frame4.Size = UDim2.new(1, -20, 1, -100)
  frame4.Position = UDim2.new(0, 10, 0, 98)
  frame4.BackgroundTransparency = 1
  frame4.Parent = frame

  local v84 = {}

  for index17, value17 in ipairs({ "Player", "Auto", "Teleport", "Misc", "Config" }) do
    local frame5 = Instance.new("Frame")
    frame5.Size = UDim2.new(1, 0, 1, 0)
    frame5.BackgroundTransparency = 1
    frame5.Visible = value17 == "Player"
    frame5.Parent = frame4

    v84[value17] = frame5
  end

  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(0, 360, 0, 18)
  textLabel2.Position = UDim2.new(0, 12, 1, -22)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = "Executor: " .. v34 .. "  |  K = Panic (Stop All Auto)"
  textLabel2.TextColor3 = Color3.fromRGB(120, 120, 140)
  textLabel2.TextSize = 11
  textLabel2.Font = Enum.Font.Gotham
  textLabel2.TextXAlignment = Enum.TextXAlignment.Left
  textLabel2.Parent = frame

  local function f60(parent)
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Size = UDim2.new(0.48, 0, 1, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.ScrollBarThickness = 3
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollingFrame.Parent = parent

    local scrollingFrame2 = Instance.new("ScrollingFrame")
    scrollingFrame2.Size = UDim2.new(0.48, 0, 1, 0)
    scrollingFrame2.Position = UDim2.new(0.52, 0, 0, 0)
    scrollingFrame2.BackgroundTransparency = 1
    scrollingFrame2.BorderSizePixel = 0
    scrollingFrame2.ScrollBarThickness = 3
    scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollingFrame2.Parent = parent

    local instance = Instance.new("UIListLayout", scrollingFrame)
    instance.Padding = UDim.new(0, 8)

    instance:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, instance.AbsoluteContentSize.Y + 15)
    end)

    local instance2 = Instance.new("UIListLayout", scrollingFrame2)
    instance2.Padding = UDim.new(0, 8)

    instance2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, instance2.AbsoluteContentSize.Y + 15)
    end)

    return scrollingFrame, scrollingFrame2
  end

  local function f61(parent2, text2, fn2)
    local frame6 = Instance.new("Frame")
    frame6.Size = UDim2.new(1, 0, 0, 40)
    frame6.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
    frame6.BorderSizePixel = 0
    frame6.Parent = parent2

    Instance.new("UICorner", frame6).CornerRadius = UDim.new(0, 8)

    local textLabel3 = Instance.new("TextLabel")
    textLabel3.Size = UDim2.new(1, -65, 1, 0)
    textLabel3.Position = UDim2.new(0, 10, 0, 0)
    textLabel3.BackgroundTransparency = 1
    textLabel3.Text = text2
    textLabel3.TextColor3 = Color3.fromRGB(235, 235, 245)
    textLabel3.TextSize = 12
    textLabel3.Font = Enum.Font.Gotham
    textLabel3.TextXAlignment = Enum.TextXAlignment.Left
    textLabel3.Parent = frame6

    local textButton3 = Instance.new("TextButton")
    textButton3.Size = UDim2.new(0, 46, 0, 22)
    textButton3.Position = UDim2.new(1, -54, 0.5, -11)
    textButton3.BackgroundColor3 = Color3.fromRGB(50, 50, 62)
    textButton3.Text = ""
    textButton3.Parent = frame6

    Instance.new("UICorner", textButton3).CornerRadius = UDim.new(1, 0)
    local v85 = false

    textButton3.MouseButton1Click:Connect(function()
      v85 = not v85

      textButton3.BackgroundColor3 = v85 and Color3.fromRGB(0, 160, 100)
        or Color3.fromRGB(50, 50, 62)

      fn2(v85)
    end)

    return function(p25)
      v85 = p25

      textButton3.BackgroundColor3 = v85 and Color3.fromRGB(0, 160, 100)
        or Color3.fromRGB(50, 50, 62)
    end
  end

  local function f62(parent3, p26, p27, p28, p29, fn3)
    local frame7 = Instance.new("Frame")
    frame7.Size = UDim2.new(1, 0, 0, 58)
    frame7.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
    frame7.BorderSizePixel = 0
    frame7.Parent = parent3

    Instance.new("UICorner", frame7).CornerRadius = UDim.new(0, 8)

    local textLabel4 = Instance.new("TextLabel")
    textLabel4.Size = UDim2.new(1, -12, 0, 16)
    textLabel4.Position = UDim2.new(0, 10, 0, 5)
    textLabel4.BackgroundTransparency = 1
    textLabel4.Text = p26 .. ": " .. p29
    textLabel4.TextColor3 = Color3.fromRGB(235, 235, 245)
    textLabel4.TextSize = 12
    textLabel4.Font = Enum.Font.Gotham
    textLabel4.TextXAlignment = Enum.TextXAlignment.Left
    textLabel4.Parent = frame7

    local frame8 = Instance.new("Frame")
    frame8.Size = UDim2.new(1, -20, 0, 7)
    frame8.Position = UDim2.new(0, 10, 0, 32)
    frame8.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
    frame8.BorderSizePixel = 0
    frame8.Parent = frame7

    Instance.new("UICorner", frame8).CornerRadius = UDim.new(1, 0)

    local frame9 = Instance.new("Frame")
    frame9.Size = UDim2.new((p29 - p27) / (p28 - p27), 0, 1, 0)
    frame9.BackgroundColor3 = Color3.fromRGB(0, 160, 100)
    frame9.BorderSizePixel = 0
    frame9.Parent = frame8

    Instance.new("UICorner", frame9).CornerRadius = UDim.new(1, 0)

    local frame10 = Instance.new("Frame")
    frame10.Size = UDim2.new(0, 16, 0, 16)
    frame10.Position = UDim2.new((p29 - p27) / (p28 - p27), -8, 0.5, -8)
    frame10.BackgroundColor3 = Color3.fromRGB(0, 200, 130)
    frame10.BorderSizePixel = 0
    frame10.Parent = frame8

    Instance.new("UICorner", frame10).CornerRadius = UDim.new(1, 0)
    local v86 = false

    local function f63(p30)
      local v87 = math.clamp((p30.X - frame8.AbsolutePosition.X)
        / math.max(frame8.AbsoluteSize.X, 1), 0, 1)

      frame9.Size = UDim2.new(v87, 0, 1, 0)
      frame10.Position = UDim2.new(v87, -8, 0.5, -8)
      local v88 = math.floor(p27 + (p28 - p27) * v87)
      textLabel4.Text = p26 .. ": " .. v88
      fn3(v88)
    end

    frame10.InputBegan:Connect(function(input4)
      if input4.UserInputType == Enum.UserInputType.MouseButton1 then
        v86 = true
      end
    end)

    frame8.InputBegan:Connect(function(input5)
      if input5.UserInputType == Enum.UserInputType.MouseButton1 then
        v86 = true
        f63(input5.Position)
      end
    end)

    userInputService.InputEnded:Connect(function(input6)
      if input6.UserInputType == Enum.UserInputType.MouseButton1 then
        v86 = false
      end
    end)

    userInputService.InputChanged:Connect(function(input7)
      if v86 and input7.UserInputType == Enum.UserInputType.MouseMovement then
        f63(input7.Position)
      end
    end)
  end

  local function f64(parent4, text3)
    local textLabel5 = Instance.new("TextLabel")
    textLabel5.Size = UDim2.new(1, 0, 0, 42)
    textLabel5.BackgroundColor3 = Color3.fromRGB(30, 28, 20)
    textLabel5.BorderSizePixel = 0
    textLabel5.Text = text3
    textLabel5.TextColor3 = Color3.fromRGB(255, 200, 100)
    textLabel5.TextSize = 11
    textLabel5.Font = Enum.Font.Gotham
    textLabel5.TextWrapped = true
    textLabel5.TextXAlignment = Enum.TextXAlignment.Left
    textLabel5.Parent = parent4

    Instance.new("UICorner", textLabel5).CornerRadius = UDim.new(0, 8)
    return textLabel5
  end

  local function f65(parent5, text4, fn4)
    local textButton4 = Instance.new("TextButton")
    textButton4.Size = UDim2.new(1, 0, 0, 34)
    textButton4.BackgroundColor3 = Color3.fromRGB(35, 55, 75)
    textButton4.BorderSizePixel = 0
    textButton4.Text = text4
    textButton4.TextColor3 = Color3.fromRGB(230, 240, 255)
    textButton4.TextSize = 12
    textButton4.Font = Enum.Font.GothamMedium
    textButton4.Parent = parent5

    Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 7)
    textButton4.MouseButton1Click:Connect(function() fn4() end)
    return textButton4
  end

  local function f66(parent6, text5)
    local textLabel6 = Instance.new("TextLabel")
    textLabel6.Size = UDim2.new(1, 0, 0, 20)
    textLabel6.BackgroundTransparency = 1
    textLabel6.Text = text5
    textLabel6.TextColor3 = Color3.fromRGB(0, 200, 140)
    textLabel6.TextSize = 13
    textLabel6.Font = Enum.Font.GothamBold
    textLabel6.TextXAlignment = Enum.TextXAlignment.Left
    textLabel6.Parent = parent6

    return textLabel6
  end

  local v89, v90 = f60(v84.Player)

  f61(v89, "Speed Hack", function(p31)
    v1.Speed = p31

    if p31 then
      f5()
    else
      f4()
    end
  end)

  f62(v89, "Speed Value", 1, 1000, 50, function(speedValue) v1.SpeedValue = speedValue end)

  f61(v89, "Fly", function(p32)
    v1.Fly = p32

    if p32 then
      f3()
    else
      f2()
    end
  end)

  f62(v89, "Fly Speed", 1, 1000, 50, function(flyValue) v1.FlyValue = flyValue end)

  local frame11 = Instance.new("Frame")
  frame11.Size = UDim2.new(1, 0, 0, 40)
  frame11.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
  frame11.Parent = v89

  Instance.new("UICorner", frame11).CornerRadius = UDim.new(0, 8)

  local textLabel7 = Instance.new("TextLabel")
  textLabel7.Size = UDim2.new(0.55, 0, 1, 0)
  textLabel7.Position = UDim2.new(0, 10, 0, 0)
  textLabel7.BackgroundTransparency = 1
  textLabel7.Text = "Fly Key: F"
  textLabel7.TextColor3 = Color3.fromRGB(235, 235, 245)
  textLabel7.TextSize = 12
  textLabel7.Font = Enum.Font.Gotham
  textLabel7.TextXAlignment = Enum.TextXAlignment.Left
  textLabel7.Parent = frame11

  local textButton5 = Instance.new("TextButton")
  textButton5.Size = UDim2.new(0, 85, 0, 24)
  textButton5.Position = UDim2.new(1, -95, 0.5, -12)
  textButton5.BackgroundColor3 = Color3.fromRGB(50, 90, 160)
  textButton5.Text = "Set Key"
  textButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton5.Font = Enum.Font.GothamBold
  textButton5.TextSize = 12
  textButton5.Parent = frame11

  Instance.new("UICorner", textButton5).CornerRadius = UDim.new(0, 6)

  textButton5.MouseButton1Click:Connect(function()
    v3 = true
    textLabel7.Text = "Press key/mouse..."
    textLabel7.TextColor3 = Color3.fromRGB(255, 200, 80)
  end)

  f61(v90, "NoClip", function(p33)
    v1.NoClip = p33

    if p33 then
      f1()
    else
      f6()
    end
  end)

  f61(v90, "Full Bright", function(p34)
    v1.FullBright = p34
    f31(p34)
  end)

  f61(v90, "No Fog", function(p35)
    v1.NoFog = p35
    f28(p35)
  end)

  f61(v90, "Infinite Jump", function(infiniteJump) v1.InfiniteJump = infiniteJump end)

  v76 = f61(v90, "Free Cam (X)", function(p36)
    v1.FreeCam = p36

    if p36 then
      f33()
    else
      f35()
    end
  end)

  f62(v90, "Stick Height", 1, 12, 4.2, function(stickHeight2) v1.StickHeight = stickHeight2 end)
  local v91, v92 = f60(v84.Auto)

  v8 = f61(v91, "Auto Serpent Keys", function(p37)
    v1.AutoSerpentKeys = p37

    if p37 then
      f40()
    end
  end)

  v9 = f61(v91, "Deliver Package (Elara)", function(p38)
    v1.AutoDeliverPackage = p38

    if p38 then
      f43()
    end
  end)

  v10 = f61(v91, "Book of Guidance", function(p39)
    v1.AutoBookOfGuidance = p39

    if p39 then
      f44()
    end
  end)

  v13 = f61(v91, "Auto Bear Cub", function(p40)
    v1.AutoBearCub = p40

    if p40 then
      f50()
    end
  end)

  v14 = f61(v91, "Auto Stone Trainee", function(p41)
    v1.AutoStoneTrainee = p41

    if p41 then
      f51()
    end
  end)

  v16 = f61(v91, "Auto Flame Trainee", function(p42)
    v1.AutoFlameTrainee = p42

    if p42 then
      f56()
    end
  end)

  v11 = f61(v92, "Auto 3 Bandits", function(p43)
    v1.AutoDefeatBandits = p43

    if p43 then
      f48()
    end
  end)

  v12 = f61(v92, "Auto Zuko Boss", function(p44)
    v1.AutoDefeatZuko = p44

    if p44 then
      f49()
    end
  end)

  v15 = f61(v92, "Auto Gyorei", function(p45)
    v1.AutoGyorei = p45

    if p45 then
      f52()
    end
  end)

  v17 = f61(v92, "Auto Rengu", function(p46)
    v1.AutoRengu = p46

    if p46 then
      f53()
    end
  end)

  v18 = f61(v92, "Auto Hoyuzo Subordinate", function(p47)
    v1.AutoHoyuzo = p47

    if p47 then
      f54()
    end
  end)

  v19 = f61(v92, "Auto Yahari", function(p48)
    v1.AutoYahari = p48

    if p48 then
      f55()
    end
  end)

  f64(v92, [[
K = Panic (Stop All Auto)
Stick Height slider is in Player tab]])

  local v93, v94 = f60(v84.Teleport)
  f66(v93, "— Training —")

  for index18, value18 in ipairs(v4) do
    local v95 = value18
    f65(v93, v95.Name, function() f18(v95.Pos) end)
  end

  f66(v93, "— Trainers —")

  for index19, value19 in ipairs(v5) do
    local v96 = value19
    f65(v93, v96.Name, function() f18(v96.Pos) end)
  end

  f66(v94, "— Special Items —")

  for index20, value20 in ipairs(v20) do
    local v97 = value20
    f65(v94, v97.Label, function() f18(v97.Pos) end)
  end

  local v98 = f60(v84.Misc)

  f61(v98, "Anti-Admin", function(p49)
    v1.AntiAdmin = p49

    if p49 then
      for index21, value21 in ipairs(players:GetPlayers()) do
      end
    end
  end)

  f64(v98, "Kicks if blacklisted Admin joins")
  f65(v98, "Purchase Regular Katana", function() f46() end)
  f64(v98, "TP to shop → PurchaseFromShop")
  f65(v98, "Auto Redeem All Codes", function() f13() end)

  f64(v98, "4s delay between codes")
  f64(v84.Config, "Config coming soon...")

  local function f67(p50)
    for key, value22 in pairs(v84) do
      value22.Visible = key == p50
    end

    v79.BackgroundColor3 = p50 == "Player" and Color3.fromRGB(0, 140, 95)
      or Color3.fromRGB(35, 35, 45)

    v80.BackgroundColor3 = p50 == "Auto" and Color3.fromRGB(0, 140, 95)
      or Color3.fromRGB(35, 35, 45)

    v81.BackgroundColor3 = p50 == "Teleport" and Color3.fromRGB(0, 140, 95)
      or Color3.fromRGB(35, 35, 45)

    v82.BackgroundColor3 = p50 == "Misc" and Color3.fromRGB(0, 140, 95)
      or Color3.fromRGB(35, 35, 45)

    v83.BackgroundColor3 = p50 == "Config" and Color3.fromRGB(0, 140, 95)
      or Color3.fromRGB(35, 35, 45)
  end

  v79.MouseButton1Click:Connect(function() f67("Player") end)
  v80.MouseButton1Click:Connect(function() f67("Auto") end)
  v81.MouseButton1Click:Connect(function() f67("Teleport") end)
  v82.MouseButton1Click:Connect(function() f67("Misc") end)
  v83.MouseButton1Click:Connect(function() f67("Config") end)

  local function f68()
    v2 = not v2
    frame.Visible = v2
  end

  userInputService.InputBegan:Connect(function(input8, p51)
    if v3 then
      if input8.UserInputType == Enum.UserInputType.Keyboard then
        v1.FlyKey = input8.KeyCode
        v1.FlyKeyIsMouse = false
        v1.FlyMouseButton = nil

        textLabel7.Text = "Fly Key: " .. input8.KeyCode.Name
        textLabel7.TextColor3 = Color3.fromRGB(235, 235, 245)

        v3 = false
        return
      end

      if input8.UserInputType == Enum.UserInputType.MouseButton1
        or input8.UserInputType == Enum.UserInputType.MouseButton2
        or input8.UserInputType == Enum.UserInputType.MouseButton3 then
        v1.FlyKeyIsMouse = true
        v1.FlyMouseButton = input8.UserInputType
        v1.FlyKey = nil

        textLabel7.Text = "Fly Key: " .. f15()
        textLabel7.TextColor3 = Color3.fromRGB(235, 235, 245)

        v3 = false
        return
      elseif p51 then
        return
      else
        if input8.KeyCode == Enum.KeyCode.RightControl then
          f68()
        end

        if input8.KeyCode == Enum.KeyCode.K then
          f7()
        end

        if input8.KeyCode == Enum.KeyCode.X then
          v1.FreeCam = not v1.FreeCam

          if v1.FreeCam then
            f33()
          else
            f35()
          end

          if v76 then
            v76(v1.FreeCam)
          end
        end

        local v99 = false

        if not v1.FlyKeyIsMouse and v1.FlyKey and input8.KeyCode == v1.FlyKey then
          v99 = true
        end

        if v1.FlyKeyIsMouse and v1.FlyMouseButton and input8.UserInputType == v1.FlyMouseButton then
          v99 = true
        end

        if v99 and not v3 then
          v1.Fly = not v1.Fly

          if v1.Fly then
            f3()
          else
            f2()
          end
        end

        return
      end
    elseif p51 then
      return
    else
      if input8.KeyCode == Enum.KeyCode.RightControl then
        f68()
      end

      if input8.KeyCode == Enum.KeyCode.K then
        f7()
      end

      if input8.KeyCode == Enum.KeyCode.X then
        v1.FreeCam = not v1.FreeCam

        if v1.FreeCam then
          f33()
        else
          f35()
        end

        if v76 then
          v76(v1.FreeCam)
        end
      end

      local v100 = false

      if not v1.FlyKeyIsMouse and v1.FlyKey and input8.KeyCode == v1.FlyKey then
        v100 = true
      end

      if v1.FlyKeyIsMouse and v1.FlyMouseButton and input8.UserInputType == v1.FlyMouseButton then
        v100 = true
      end

      if v100 and not v3 then
        v1.Fly = not v1.Fly

        if v1.Fly then
          f3()
        else
          f2()
        end
      end

      return
    end
  end)

  textButton.MouseButton1Click:Connect(function()
    v2 = false
    frame.Visible = false
  end)

  print("[Oretachi's Slayers 2] Loaded | RightControl = Menu | K = Panic")
end

local function f69()
  local oretachiKey = Instance.new("ScreenGui")
  oretachiKey.Name = "OretachiKey"
  oretachiKey.ResetOnSpawn = false

  pcall(function() oretachiKey.Parent = coreGui end)

  if not oretachiKey.Parent then
    oretachiKey.Parent = localPlayer:WaitForChild("PlayerGui")
  end

  local frame12 = Instance.new("Frame")
  frame12.Size = UDim2.new(0, 340, 0, 230)
  frame12.Position = UDim2.new(0.5, -170, 0.5, -115)
  frame12.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
  frame12.BorderSizePixel = 0
  frame12.Parent = oretachiKey

  Instance.new("UICorner", frame12).CornerRadius = UDim.new(0, 12)

  local instance3 = Instance.new("UIStroke", frame12)
  instance3.Color = Color3.fromRGB(0, 140, 95)
  instance3.Thickness = 1.5

  local textLabel8 = Instance.new("TextLabel")
  textLabel8.Size = UDim2.new(1, 0, 0, 36)
  textLabel8.Position = UDim2.new(0, 0, 0, 12)
  textLabel8.BackgroundTransparency = 1
  textLabel8.Text = "Oretachi's Slayers 2 (WIP)"
  textLabel8.TextColor3 = Color3.fromRGB(240, 240, 250)
  textLabel8.TextSize = 16
  textLabel8.Font = Enum.Font.GothamBold
  textLabel8.Parent = frame12

  local textLabel9 = Instance.new("TextLabel")
  textLabel9.Size = UDim2.new(1, 0, 0, 18)
  textLabel9.Position = UDim2.new(0, 0, 0, 44)
  textLabel9.BackgroundTransparency = 1
  textLabel9.Text = "Made by Oretachi"
  textLabel9.TextColor3 = Color3.fromRGB(140, 140, 160)
  textLabel9.TextSize = 12
  textLabel9.Font = Enum.Font.Gotham
  textLabel9.Parent = frame12

  local textBox = Instance.new("TextBox")
  textBox.Size = UDim2.new(0.82, 0, 0, 36)
  textBox.Position = UDim2.new(0.09, 0, 0, 78)
  textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
  textBox.PlaceholderText = "Enter Key..."
  textBox.Text = ""
  textBox.TextColor3 = Color3.fromRGB(220, 220, 230)
  textBox.TextSize = 14
  textBox.Font = Enum.Font.Gotham
  textBox.Parent = frame12

  Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)

  local textButton6 = Instance.new("TextButton")
  textButton6.Size = UDim2.new(0.82, 0, 0, 34)
  textButton6.Position = UDim2.new(0.09, 0, 0, 128)
  textButton6.BackgroundColor3 = Color3.fromRGB(0, 130, 90)
  textButton6.Text = "Submit"
  textButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton6.TextSize = 14
  textButton6.Font = Enum.Font.GothamBold
  textButton6.Parent = frame12

  Instance.new("UICorner", textButton6).CornerRadius = UDim.new(0, 6)

  local textButton7 = Instance.new("TextButton")
  textButton7.Size = UDim2.new(0.82, 0, 0, 30)
  textButton7.Position = UDim2.new(0.09, 0, 0, 172)
  textButton7.BackgroundColor3 = Color3.fromRGB(55, 70, 140)
  textButton7.Text = "Copy Discord"
  textButton7.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton7.TextSize = 12
  textButton7.Font = Enum.Font.GothamMedium
  textButton7.Parent = frame12

  Instance.new("UICorner", textButton7).CornerRadius = UDim.new(0, 6)

  local textLabel10 = Instance.new("TextLabel")
  textLabel10.Size = UDim2.new(1, 0, 0, 18)
  textLabel10.Position = UDim2.new(0, 0, 1, -22)
  textLabel10.BackgroundTransparency = 1
  textLabel10.Text = ""
  textLabel10.TextColor3 = Color3.fromRGB(255, 80, 80)
  textLabel10.TextSize = 12
  textLabel10.Font = Enum.Font.Gotham
  textLabel10.Parent = frame12

  textButton7.MouseButton1Click:Connect(function()
    if setclipboard then
      setclipboard("https://discord.gg/xdwePEwvH")
      textLabel10.TextColor3 = Color3.fromRGB(80, 220, 120)
      textLabel10.Text = "Discord link copied!"
    else
      textLabel10.Text = "https://discord.gg/xdwePEwvH"
    end
  end)

  textButton6.MouseButton1Click:Connect(function()
    if textBox.Text == "ORETACHI2026" then
      oretachiKey:Destroy()
      f57()
    else
      textLabel10.TextColor3 = Color3.fromRGB(255, 80, 80)
      textLabel10.Text = "Wrong Key!"
    end
  end)
end

f69()
      textLabel10.Text = "Wrong Key!"
    end
  end)
end

f69()