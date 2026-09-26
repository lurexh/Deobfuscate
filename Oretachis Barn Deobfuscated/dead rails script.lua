local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local lighting = game:GetService("Lighting")
local coreGui = game:GetService("CoreGui")
local workspaceService = game:GetService("Workspace")
local soundService = game:GetService("SoundService")
local debris = game:GetService("Debris")
local lib = loadstring(game:HttpGet("https://secure.pandauth.com/pv4/lib"))()
local v1 = not lib or type(lib.configure) ~= "function"
local f1, f2, localPlayer, currentCamera, f3

if v1 then
  warn("[Panda] Library failed to initialize.")
  return
else
  lib.configure({ serviceId = "oretachimakingstuff" })
  localPlayer = players.LocalPlayer
  currentCamera = workspace.CurrentCamera

  function f2(p1)
    localPlayer:Kick(p1 or "Your key is timed out or you typed it wrong, please check twice")
  end

  function f1(p2)
    local v2 = lib.validate(p2)

    if v2 and v2.success then
      return true, v2
    end

    return false, v2
  end

  function f3()
    local v3 = {
      Speed = false,
      SpeedValue = 30,
      Fly = false,
      FlyValue = 40,
      FullBright = false,
      FOV = 90,
      FreeCam = false,
      ItemESP = false,
      MonsterESP = false,
      HumanEnemyESP = false,
      HorseESP = false,
      OreESP = false,
      ESPDistance = 1000,
      AntiAdmin = false,
    }

    local v4 = false
    local v5 = {}
    local v6 = {}
    local v7 = {}
    local v8 = false
    local v9 = 0

    local v10 = {
      "tiredsanti", "suu4ve", "krissdevv", "m4niiiiiii", "Itz_Wrecker", "SMUSH21", "Naruvus",
      "BB_Analytics", "devils21091", "RiccoMiller", "a4quedpe4dbcmuirc8u2", "Squru", "EMSVCS3",
      "ruddev_ethan", "GigantamaxWailord", "ITexyc", "PROD_MARROW", "Epic_v2", "Six5Creedmore",
      "RealNodi", "itz_horroriscool", "1cloudymatt", "DefinitelyCheatin", "WoozyNate",
      "fghe534f", "Deadrailstest19", "Labu_Deadrails", "Helloman6949", "L3v1_Deadrails",
      "s2kaye", "BreakfastCandy", "chewbeccca", "AtriusAmeranth", "YouGotG4mes", "IanElSujeto",
      "og_rayya", "Pelleu10", "dylan87458", "Mister_McKee", "1Gamerguy555", "Itz_V1ron",
      "labuenapersona1", "KingKrazy_124", "dunswap", "Crqmx", "abia20", "DarkWizard60606",
      "ClydeorCrafty", "SkhypeXD", "ignotuscaligo", "moon_monono", "SirCharles514", "Pixelpac0",
      "abalone_22", "pokedragon100000", "Duddedud", "evan_theprofessional", "meme_supreme",
      "beliefly", "Spaceballerina150", "chesse94", "anhasnt", "Rio_sutty8", "75nw",
      "Heleavethematching", "kronos9669", "TheMrRainy", "marcksASM", "3DesignD", "Salt_GmbH",
      "Pelleu11", "Nagrov", "themegil", "ItsFlairon", "AbranLabs", "Blxckby", "dawiid_kamel",
      "Chaintic", "flareiea", "Ronny3510",
    }

    local function f4(p3)
      local v11 = string.lower(p3.Name)
      local v12 = string.lower(p3.DisplayName)

      for index, value in ipairs(v10) do
        if string.find(v11, string.lower(value)) or string.find(v12, string.lower(value)) then
          return true
        end
      end

      return false
    end

    task.spawn(function()
      while true do
        if v3.AntiAdmin then
          local v13 = false

          for index2, value2 in ipairs(players:GetPlayers()) do
            if value2 ~= localPlayer and f4(value2) then
              v13 = true
              break
            end
          end

          v8 = v13

          if v13 then
            v3.Speed = false
            v3.Fly = false

            if StopSpeed then
              StopSpeed()
            end

            if StopFly then
              StopFly()
            end
          end
        else
          v8 = false
        end

        task.wait(2.5)
      end
    end)

    local function f5()
      local sound = Instance.new("Sound")
      sound.SoundId = "rbxassetid://88442833509532"
      sound.Volume = 2.5
      sound.Parent = soundService
      sound:Play()

      debris:AddItem(sound, 1)
    end

    local connect

    local function f6()
      if connect then
        connect:Disconnect()
      end

      connect = runService.Heartbeat:Connect(function()
        if not v3.Speed or v8 then
          return
        else
          local character = localPlayer.Character

          if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")

            if humanoid then
              humanoid.WalkSpeed = v3.SpeedValue
            end
          end

          return
        end
      end)
    end

    local function f7()
      if connect then
        connect:Disconnect()
        connect = nil
      end

      local character2 = localPlayer.Character

      if character2 then
        local humanoid2 = character2:FindFirstChildOfClass("Humanoid")

        if humanoid2 then
          humanoid2.WalkSpeed = 16
        end
      end
    end

    local connect2, bodyVelocity, bodyGyro

    local function f8()
      if connect2 then
        return
      else
        local character3 = localPlayer.Character

        if not character3 then
          return
        else
          local humanoidRootPart = character3:FindFirstChild("HumanoidRootPart")
          local v14 = not humanoidRootPart
          local humanoid3 = character3:FindFirstChildOfClass("Humanoid")

          if v14 or not humanoid3 then
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

          humanoid3.PlatformStand = true

          connect2 = runService.RenderStepped:Connect(function()
            if not v3.Fly or not bodyVelocity or v8 or v3.FreeCam then
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

              local v15 = bodyVelocity
              v15.Velocity = zero.Magnitude > 0 and zero.Unit * v3.FlyValue or Vector3.zero

              bodyGyro.CFrame = cframe
              return
            end
          end)

          return
        end
      end
    end

    local function f9()
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

      local character4 = localPlayer.Character

      if character4 then
        local humanoid4 = character4:FindFirstChildOfClass("Humanoid")

        if humanoid4 then
          humanoid4.PlatformStand = false
        end
      end
    end

    local cframe2 = CFrame.new()
    local connect3, position, cameraType, cameraSubject

    local function f10()
      if connect3 then
        return
      else
        cameraType = currentCamera.CameraType
        cameraSubject = currentCamera.CameraSubject
        currentCamera.CameraType = Enum.CameraType.Scriptable
        local character5 = localPlayer.Character

        if character5 then
          local humanoid5 = character5:FindFirstChildOfClass("Humanoid")

          if humanoid5 then
            humanoid5.WalkSpeed = 0
          end

          local humanoidRootPart2 = character5:FindFirstChild("HumanoidRootPart")

          if humanoidRootPart2 then
            position = humanoidRootPart2.Position + Vector3.new(0, 5, 0)
          else
            position = currentCamera.CFrame.Position
          end
        else
          position = currentCamera.CFrame.Position
        end

        cframe2 = currentCamera.CFrame

        connect3 = runService.RenderStepped:Connect(function(delta)
          if not v3.FreeCam then
            return
          else
            local zero2 = Vector3.zero
            local lookVector = cframe2.LookVector
            local rightVector = cframe2.RightVector

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

            local v16 = 2.5

            if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
              v16 = 7.5
            end

            if zero2.Magnitude > 0 then
              position = position + zero2.Unit * v16 * (delta * 60)
            end

            local getMouseDelta = userInputService:GetMouseDelta()
            local v17 = cframe2

            cframe2 = CFrame.new(position) * CFrame.Angles(
              0, select(2, v17:ToEulerAnglesYXZ()) + -getMouseDelta.X * 0.003, 0
            ) * CFrame.Angles(v17:ToEulerAnglesYXZ() + -getMouseDelta.Y * 0.003, 0, 0)

            currentCamera.CFrame = cframe2
            return
          end
        end)

        userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
        return
      end
    end

    local function f11()
      if connect3 then
        connect3:Disconnect()
        connect3 = nil
      end

      currentCamera.CameraType = cameraType or Enum.CameraType.Custom

      if cameraSubject then
        currentCamera.CameraSubject = cameraSubject
      end

      userInputService.MouseBehavior = Enum.MouseBehavior.Default
      local character6 = localPlayer.Character

      if character6 then
        local humanoid6 = character6:FindFirstChildOfClass("Humanoid")

        if humanoid6 and not v3.Speed then
          humanoid6.WalkSpeed = 16
        elseif humanoid6 and v3.Speed then
          humanoid6.WalkSpeed = v3.SpeedValue
        end
      end

      position = nil
    end

    local function f12(p4)
      if p4 then
        lighting.Brightness = 8
        lighting.ClockTime = 12
        lighting.Ambient = Color3.fromRGB(255, 255, 255)
        lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
        lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
        lighting.GlobalShadows = false
        lighting.ExposureCompensation = 1.5
        lighting.FogEnd = 100000
        lighting.FogStart = 0

        pcall(function()
          for index3, value3 in ipairs(lighting:GetChildren()) do
            if value3:IsA("Atmosphere") then
              value3.Density = 0
              value3.Haze = 0
            elseif value3:IsA("BloomEffect") or value3:IsA("BlurEffect")
              or value3:IsA("ColorCorrectionEffect") or value3:IsA("SunRaysEffect") then
              value3.Enabled = false
            end
          end
        end)
      else
        lighting.Brightness = 1
        lighting.Ambient = Color3.fromRGB(70, 70, 70)
        lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
        lighting.GlobalShadows = true
        lighting.ExposureCompensation = 0
        lighting.FogEnd = 100000
      end
    end

    runService.RenderStepped:Connect(function()
      if not v3.FreeCam then
        currentCamera.FieldOfView = v3.FOV
      end

      if v3.FullBright then
        f12(true)
      end
    end)

    local function f13()
      for key, value4 in pairs(v5) do
        local v18 = value4
        pcall(function() v18:Destroy() end)
      end

      v5 = {}
    end

    local function f14(p5)
      if p5:IsA("BasePart") then
        return p5
      elseif p5.PrimaryPart then
        return p5.PrimaryPart
      else
        local humanoidRootPart3 = p5:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart3 then
          return humanoidRootPart3
        end

        for index4, value5 in ipairs(p5:GetChildren()) do
          if value5:IsA("BasePart") then
            return value5
          end
        end

        return nil
      end
    end

    local function f15()
      local v19 = math.clamp((v3.FOV or 90) / 90, 1, 1.6)
      return math.floor(17 * v19), math.floor(15 * v19)
    end

    local function f16(p6, text, textColor3)
      if v5[p6] then
        return
      else
        local v20 = f14(p6)

        if not v20 then
          return
        else
          local textSize, textSize2 = f15()

          local oretachiESP = Instance.new("BillboardGui")
          oretachiESP.Name = "OretachiESP"
          oretachiESP.Adornee = v20
          oretachiESP.Size = UDim2.new(0, 180, 0, 56)
          oretachiESP.StudsOffset = Vector3.new(0, 2.4, 0)
          oretachiESP.AlwaysOnTop = true
          oretachiESP.MaxDistance = v3.ESPDistance
          oretachiESP.Parent = v20

          local frame = Instance.new("Frame")
          frame.Size = UDim2.new(1, 0, 1, 0)
          frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
          frame.BackgroundTransparency = 0.35
          frame.BorderSizePixel = 0
          frame.Parent = oretachiESP

          Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

          local nameLabel = Instance.new("TextLabel")
          nameLabel.Name = "NameLabel"
          nameLabel.Size = UDim2.new(1, -4, 0.55, 0)
          nameLabel.Position = UDim2.new(0, 2, 0, 2)
          nameLabel.BackgroundTransparency = 1
          nameLabel.Text = text
          nameLabel.TextColor3 = textColor3
          nameLabel.TextStrokeTransparency = 0
          nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
          nameLabel.Font = Enum.Font.GothamBold
          nameLabel.TextSize = textSize
          nameLabel.Parent = frame

          local distLabel = Instance.new("TextLabel")
          distLabel.Name = "DistLabel"
          distLabel.Size = UDim2.new(1, -4, 0.4, 0)
          distLabel.Position = UDim2.new(0, 2, 0.55, 0)
          distLabel.BackgroundTransparency = 1
          distLabel.Text = ""
          distLabel.TextColor3 = Color3.fromRGB(245, 245, 245)
          distLabel.TextStrokeTransparency = 0
          distLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
          distLabel.Font = Enum.Font.Gotham
          distLabel.TextSize = textSize2
          distLabel.Parent = frame

          v5[p6] = oretachiESP
          return
        end
      end
    end

    local function f17()
      local v21 = tick()
      local position2 = currentCamera.CFrame.Position
      local textSize3, textSize4 = f15()

      if v21 - v9 >= 1.2 then
        local v22 = {}
        v9 = v21

        if v3.ItemESP then
          local objectModels = workspaceService:FindFirstChild("ObjectModels")

          if objectModels then
            for index5, value6 in ipairs(objectModels:GetChildren()) do
              if value6:IsA("Model") then
                f16(value6, value6.Name, Color3.fromRGB(80, 220, 255))
                v22[value6] = true
              end
            end
          end
        end

        if v3.OreESP then
          local ore = workspaceService:FindFirstChild("Ore")

          if ore then
            for index6, value7 in ipairs(ore:GetChildren()) do
              if value7:IsA("Model") or value7:IsA("BasePart") then
                local name = value7.Name
                local color = Color3.fromRGB(200, 200, 100)
                local v23 = name

                if name == "CoalOre" then
                  v23 = "Coal Ore"
                  color = Color3.fromRGB(160, 160, 160)
                elseif name == "SilverOre" then
                  v23 = "Silver Ore"
                  color = Color3.fromRGB(220, 220, 240)
                end

                f16(value7, v23, color)
                v22[value7] = true
              end
            end
          end
        end

        if v3.MonsterESP then
          for index7, value8 in ipairs(workspaceService:GetDescendants()) do
            if value8:IsA("Model") then
              local name2 = value8.Name

              if name2 == "Model_ZombieMiner" then
                f16(value8, "Zombie Miner", Color3.fromRGB(255, 90, 90))
                v22[value8] = true
              elseif name2 == "Model_ZombieSheriff" then
                f16(value8, "Zombie Sheriff", Color3.fromRGB(255, 160, 60))
                v22[value8] = true
              elseif name2 == "Model_Runner" then
                f16(value8, "Runner Zombie", Color3.fromRGB(255, 70, 70))
                v22[value8] = true
              elseif name2 == "Model_Walker" then
                f16(value8, "Walker Zombie", Color3.fromRGB(240, 120, 90))
                v22[value8] = true
              elseif name2 == "Model_Werewolf" then
                f16(value8, "Werewolf", Color3.fromRGB(200, 80, 255))
                v22[value8] = true
              elseif string.find(string.lower(name2), "zombie") then
                f16(value8, "Zombie", Color3.fromRGB(240, 80, 80))
                v22[value8] = true
              end
            end
          end
        end

        if v3.HumanEnemyESP then
          for index8, value9 in ipairs(workspaceService:GetDescendants()) do
            if value9:IsA("Model") then
              local name3 = value9.Name

              if name3 == "Model_RevolverOutlaw" then
                f16(value9, "Revolver Outlaw", Color3.fromRGB(255, 180, 50))
                v22[value9] = true
              elseif name3 == "Model_RifleOutlaw" then
                f16(value9, "Rifle Outlaw", Color3.fromRGB(255, 140, 40))
                v22[value9] = true
              elseif name3 == "Model_ShotgunOutlaw" then
                f16(value9, "Outlaw", Color3.fromRGB(255, 160, 60))
                v22[value9] = true
              end
            end
          end
        end

        if v3.HorseESP then
          local viewmodelContainer = workspaceService:FindFirstChild("ViewmodelContainer")

          if viewmodelContainer then
            for index9, value10 in ipairs(viewmodelContainer:GetDescendants()) do
              if value10:IsA("Model") and value10.Name == "Model_Horse" then
                f16(value10, "Horse", Color3.fromRGB(180, 140, 90))
                v22[value10] = true
              end
            end
          end

          for index10, value11 in ipairs(workspaceService:GetDescendants()) do
            if value11:IsA("Model") and value11.Name == "Model_Horse" then
              f16(value11, "Horse", Color3.fromRGB(180, 140, 90))
              v22[value11] = true
            end
          end
        end

        for key2, value12 in pairs(v5) do
          local v24 = value12

          if not v22[key2] or not key2.Parent then
            pcall(function() v24:Destroy() end)
            v5[key2] = nil
          end
        end
      end

      for key3, value13 in pairs(v5) do
        if key3 and key3.Parent and value13 and value13.Parent then
          local adornee = value13.Adornee

          if adornee then
            local magnitude = (adornee.Position - position2).Magnitude
            local findFirstChild = value13:FindFirstChild("DistLabel", true)
            local findFirstChild2 = value13:FindFirstChild("NameLabel", true)

            if findFirstChild then
              findFirstChild.Text = math.floor(magnitude) .. "m"
              findFirstChild.TextSize = textSize4
            end

            if findFirstChild2 then
              findFirstChild2.TextSize = textSize3
            end

            value13.Enabled = magnitude <= v3.ESPDistance
            value13.MaxDistance = v3.ESPDistance
          end
        end
      end
    end

    local oretachiDeadRails = Instance.new("ScreenGui")
    oretachiDeadRails.Name = "OretachiDeadRails"
    oretachiDeadRails.ResetOnSpawn = false
    oretachiDeadRails.Parent = coreGui

    local frame2 = Instance.new("Frame")
    frame2.Size = UDim2.new(0, 0, 0, 0)
    frame2.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame2.AnchorPoint = Vector2.new(0.5, 0.5)
    frame2.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
    frame2.BorderSizePixel = 0
    frame2.Active = true
    frame2.Parent = oretachiDeadRails

    Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 12)

    local instance = Instance.new("UIStroke", frame2)
    instance.Color = Color3.fromRGB(40, 40, 50)
    instance.Thickness = 1.4

    local frame3 = Instance.new("Frame")
    frame3.Size = UDim2.new(1, 0, 0, 48)
    frame3.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    frame3.Parent = frame2

    Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 12)

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -55, 1, 0)
    textLabel.Position = UDim2.new(0, 16, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "Oretachi's Dead Rails"
    textLabel.TextColor3 = Color3.fromRGB(240, 240, 250)
    textLabel.TextSize = 18
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.Parent = frame3

    local textButton = Instance.new("TextButton")
    textButton.Size = UDim2.new(0, 34, 0, 26)
    textButton.Position = UDim2.new(1, -44, 0.5, -13)
    textButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    textButton.Text = "−"
    textButton.TextColor3 = Color3.fromRGB(230, 230, 230)
    textButton.Font = Enum.Font.GothamBold
    textButton.Parent = frame3

    Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 6)
    local v25 = false
    local position3, position4

    frame3.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 then
        v25 = true
        position3 = input.Position
        position4 = frame2.Position
      end
    end)
    frame3.InputEnded:Connect(function(input2)
      if input2.UserInputType == Enum.UserInputType.MouseButton1 then
        v25 = false
      end
    end)

    userInputService.InputChanged:Connect(function(input3)
      if v25 and input3.UserInputType == Enum.UserInputType.MouseMovement then
        local v26 = input3.Position - position3

        frame2.Position = UDim2.new(
          position4.X.Scale, position4.X.Offset + v26.X, position4.Y.Scale,
          position4.Y.Offset + v26.Y
        )
      end
    end)

    local frame4 = Instance.new("Frame")
    frame4.Size = UDim2.new(1, -20, 0, 34)
    frame4.Position = UDim2.new(0, 10, 0, 56)
    frame4.BackgroundTransparency = 1
    frame4.Parent = frame2

    local function f18(text2, p7)
      local textButton2 = Instance.new("TextButton")
      textButton2.Size = UDim2.new(0, 110, 1, 0)
      textButton2.Position = UDim2.new(0, p7, 0, 0)
      textButton2.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
      textButton2.Text = text2
      textButton2.TextColor3 = Color3.fromRGB(220, 220, 230)
      textButton2.Font = Enum.Font.GothamMedium
      textButton2.TextSize = 14
      textButton2.Parent = frame4

      Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 7)
      return textButton2
    end

    local v27 = f18("Player", 0)
    local v28 = f18("ESP", 120)
    local v29 = f18("Config", 240)
    v27.BackgroundColor3 = Color3.fromRGB(0, 140, 95)

    local frame5 = Instance.new("Frame")
    frame5.Size = UDim2.new(1, -20, 1, -100)
    frame5.Position = UDim2.new(0, 10, 0, 98)
    frame5.BackgroundTransparency = 1
    frame5.Parent = frame2

    local v30 = {}

    for index11, value14 in ipairs({ "Player", "ESP", "Config" }) do
      local frame6 = Instance.new("Frame")
      frame6.Size = UDim2.new(1, 0, 1, 0)
      frame6.BackgroundTransparency = 1
      frame6.Visible = value14 == "Player"
      frame6.Parent = frame5

      v30[value14] = frame6
    end

    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Size = UDim2.new(0, 200, 0, 18)
    textLabel2.Position = UDim2.new(0, 12, 1, -22)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Text = "Executor: Unknown"
    textLabel2.TextColor3 = Color3.fromRGB(120, 120, 140)
    textLabel2.TextSize = 11
    textLabel2.Font = Enum.Font.Gotham
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.Parent = frame2

    local function f19(parent)
      local scrollingFrame = Instance.new("ScrollingFrame")
      scrollingFrame.Size = UDim2.new(0.48, 0, 1, 0)
      scrollingFrame.BackgroundTransparency = 1
      scrollingFrame.ScrollBarThickness = 3
      scrollingFrame.Parent = parent

      local scrollingFrame2 = Instance.new("ScrollingFrame")
      scrollingFrame2.Size = UDim2.new(0.48, 0, 1, 0)
      scrollingFrame2.Position = UDim2.new(0.52, 0, 0, 0)
      scrollingFrame2.BackgroundTransparency = 1
      scrollingFrame2.ScrollBarThickness = 3
      scrollingFrame2.Parent = parent

      local instance2 = Instance.new("UIListLayout", scrollingFrame)
      instance2.Padding = UDim.new(0, 8)

      instance2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, instance2.AbsoluteContentSize.Y + 15)
      end)

      local instance3 = Instance.new("UIListLayout", scrollingFrame2)
      instance3.Padding = UDim.new(0, 8)

      instance3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, instance3.AbsoluteContentSize.Y + 15)
      end)

      return scrollingFrame, scrollingFrame2
    end

    local function f20(parent2, text3, fn)
      local frame7 = Instance.new("Frame")
      frame7.Size = UDim2.new(1, 0, 0, 42)
      frame7.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
      frame7.Parent = parent2

      Instance.new("UICorner", frame7).CornerRadius = UDim.new(0, 8)

      local textLabel3 = Instance.new("TextLabel")
      textLabel3.Size = UDim2.new(1, -70, 1, 0)
      textLabel3.Position = UDim2.new(0, 12, 0, 0)
      textLabel3.BackgroundTransparency = 1
      textLabel3.Text = text3
      textLabel3.TextColor3 = Color3.fromRGB(235, 235, 245)
      textLabel3.TextSize = 13
      textLabel3.Font = Enum.Font.Gotham
      textLabel3.TextXAlignment = Enum.TextXAlignment.Left
      textLabel3.Parent = frame7

      local textButton3 = Instance.new("TextButton")
      textButton3.Size = UDim2.new(0, 48, 0, 24)
      textButton3.Position = UDim2.new(1, -58, 0.5, -12)
      textButton3.BackgroundColor3 = Color3.fromRGB(50, 50, 62)
      textButton3.Text = ""
      textButton3.Parent = frame7

      Instance.new("UICorner", textButton3).CornerRadius = UDim.new(1, 0)
      local v31 = false

      textButton3.MouseButton1Click:Connect(function()
        v31 = not v31

        textButton3.BackgroundColor3 = v31 and Color3.fromRGB(0, 160, 100)
          or Color3.fromRGB(50, 50, 62)

        f5()
        fn(v31)
      end)

      return function(p8)
        v31 = p8

        textButton3.BackgroundColor3 = v31 and Color3.fromRGB(0, 160, 100)
          or Color3.fromRGB(50, 50, 62)
      end
    end

    local function f21(parent3, p9, p10, p11, p12, fn2)
      local frame8 = Instance.new("Frame")
      frame8.Size = UDim2.new(1, 0, 0, 62)
      frame8.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
      frame8.Parent = parent3

      Instance.new("UICorner", frame8).CornerRadius = UDim.new(0, 8)

      local textLabel4 = Instance.new("TextLabel")
      textLabel4.Size = UDim2.new(1, -16, 0, 18)
      textLabel4.Position = UDim2.new(0, 12, 0, 6)
      textLabel4.BackgroundTransparency = 1
      textLabel4.Text = p9 .. ": " .. p12
      textLabel4.TextColor3 = Color3.fromRGB(235, 235, 245)
      textLabel4.TextSize = 12
      textLabel4.Font = Enum.Font.Gotham
      textLabel4.TextXAlignment = Enum.TextXAlignment.Left
      textLabel4.Parent = frame8

      local frame9 = Instance.new("Frame")
      frame9.Size = UDim2.new(1, -24, 0, 8)
      frame9.Position = UDim2.new(0, 12, 0, 34)
      frame9.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
      frame9.Parent = frame8

      Instance.new("UICorner", frame9).CornerRadius = UDim.new(1, 0)

      local frame10 = Instance.new("Frame")
      frame10.Size = UDim2.new((p12 - p10) / (p11 - p10), 0, 1, 0)
      frame10.BackgroundColor3 = Color3.fromRGB(0, 160, 100)
      frame10.Parent = frame9

      Instance.new("UICorner", frame10).CornerRadius = UDim.new(1, 0)

      local frame11 = Instance.new("Frame")
      frame11.Size = UDim2.new(0, 18, 0, 18)
      frame11.Position = UDim2.new((p12 - p10) / (p11 - p10), -9, 0.5, -9)
      frame11.BackgroundColor3 = Color3.fromRGB(0, 200, 130)
      frame11.Parent = frame9

      Instance.new("UICorner", frame11).CornerRadius = UDim.new(1, 0)

      local instance4 = Instance.new("UIStroke", frame11)
      instance4.Color = Color3.fromRGB(255, 255, 255)
      instance4.Thickness = 1.5

      local v32 = false

      local function f22(p13)
        local v33 = math.clamp(
          (p13.X - frame9.AbsolutePosition.X) / frame9.AbsoluteSize.X, 0, 1
        )

        frame10.Size = UDim2.new(v33, 0, 1, 0)
        frame11.Position = UDim2.new(v33, -9, 0.5, -9)
        local v34 = math.floor(p10 + (p11 - p10) * v33)
        textLabel4.Text = p9 .. ": " .. v34
        fn2(v34)
      end

      frame11.InputBegan:Connect(function(input4)
        if input4.UserInputType == Enum.UserInputType.MouseButton1 then
          v32 = true
        end
      end)

      frame9.InputBegan:Connect(function(input5)
        if input5.UserInputType == Enum.UserInputType.MouseButton1 then
          v32 = true
          f22(input5.Position)
        end
      end)

      userInputService.InputEnded:Connect(function(input6)
        if input6.UserInputType == Enum.UserInputType.MouseButton1 then
          v32 = false
        end
      end)

      userInputService.InputChanged:Connect(function(input7)
        if v32 and input7.UserInputType == Enum.UserInputType.MouseMovement then
          f22(input7.Position)
        end
      end)
    end

    local function f23(parent4, text4, fn3)
      local textButton4 = Instance.new("TextButton")
      textButton4.Size = UDim2.new(1, 0, 0, 36)
      textButton4.BackgroundColor3 = Color3.fromRGB(0, 130, 90)
      textButton4.Text = text4
      textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
      textButton4.Font = Enum.Font.GothamBold
      textButton4.TextSize = 13
      textButton4.Parent = parent4

      Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 8)

      textButton4.MouseButton1Click:Connect(function()
        f5()
        fn3()
      end)
    end

    local function f24(parent5, text5)
      local textLabel5 = Instance.new("TextLabel")
      textLabel5.Size = UDim2.new(1, 0, 0, 55)
      textLabel5.BackgroundColor3 = Color3.fromRGB(30, 28, 20)
      textLabel5.Text = text5
      textLabel5.TextColor3 = Color3.fromRGB(255, 200, 100)
      textLabel5.TextSize = 11
      textLabel5.Font = Enum.Font.Gotham
      textLabel5.TextWrapped = true
      textLabel5.TextXAlignment = Enum.TextXAlignment.Left
      textLabel5.Parent = parent5

      Instance.new("UICorner", textLabel5).CornerRadius = UDim.new(0, 8)
    end

    local v35, v36 = f19(v30.Player)

    f20(v35, "Speed Hack", function(p14)
      v3.Speed = p14

      if p14 then
        f6()
      else
        f7()
      end
    end)

    f21(v35, "Speed Value", 1, 100, 30, function(speedValue) v3.SpeedValue = speedValue end)

    f20(v35, "Fly", function(p15)
      v3.Fly = p15

      if p15 then
        f8()
      else
        f9()
      end
    end)

    f21(v35, "Fly Speed", 1, 100, 40, function(flyValue) v3.FlyValue = flyValue end)

    f24(
      v35,
      "Since Dead Rails has good server-side check, you cant just use fly or speed however you want. Go small distances and do it step by step, same for fly. If you do it correctly, it wont teleport you to your old place."
    )

    f20(v36, "Full Bright", function(p16)
      v3.FullBright = p16
      f12(p16)
    end)

    f21(v36, "FOV", 90, 120, 90, function(fov) v3.FOV = fov end)

    local v37 = f20(v36, "Free Cam (X)", function(p17)
      v3.FreeCam = p17

      if p17 then
        f10()
      else
        f11()
      end
    end)

    f20(v36, "Anti-Admin", function(antiAdmin) v3.AntiAdmin = antiAdmin end)
    local v38, v39 = f19(v30.ESP)

    f20(v38, "Item ESP", function(p18)
      v3.ItemESP = p18

      if not p18 then
        f13()
      end
    end)

    f20(v38, "Ore ESP", function(p19)
      v3.OreESP = p19

      if not p19 then
        f13()
      end
    end)

    f20(v38, "Horse ESP", function(p20)
      v3.HorseESP = p20

      if not p20 then
        f13()
      end
    end)

    f20(v39, "Zombie / Monster ESP", function(p21)
      v3.MonsterESP = p21

      if not p21 then
        f13()
      end
    end)

    f20(v39, "Human Enemy ESP", function(p22)
      v3.HumanEnemyESP = p22

      if not p22 then
        f13()
      end
    end)

    f21(v39, "ESP Draw Distance", 100, 2000, 1000, function(espDistance)
      v3.ESPDistance = espDistance
    end)

    local v40, parent6 = f19(v30.Config)

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, 0, 0, 34)
    textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    textBox.PlaceholderText = "Config Name..."
    textBox.Text = ""
    textBox.TextColor3 = Color3.fromRGB(230, 230, 240)
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 13
    textBox.Parent = v40

    Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 8)

    f23(v40, "Create Config", function()
      local text6 = textBox.Text

      if text6 == "" or #v6 >= 3 then
        return
      end

      table.insert(v6, { Name = text6, Data = table.clone(v3) })
      RefreshConfigList()
    end)

    local v41

    f23(v40, "Overwrite Selected", function()
      if v41 then
        v41.Data = table.clone(v3)
      end
    end)

    f23(v40, "Delete Selected", function()
      if v41 then
        for index12, value15 in ipairs(v6) do
          if value15 == v41 then
            table.remove(v6, index12)
            break
          end
        end

        v41 = nil
        RefreshConfigList()
      end
    end)

    f23(v40, "Copy Discord Invite", function()
      if setclipboard then
        setclipboard("https://discord.gg/tcgqzRW2z")
      end
    end)

    f24(
      v40, "Contact me at Discord if you have any suggestions. Also script is not finished yet."
    )

    local scrollingFrame3 = Instance.new("ScrollingFrame")
    scrollingFrame3.Size = UDim2.new(1, 0, 0, 180)
    scrollingFrame3.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    scrollingFrame3.ScrollBarThickness = 4
    scrollingFrame3.Parent = parent6

    Instance.new("UICorner", scrollingFrame3).CornerRadius = UDim.new(0, 8)

    local instance5 = Instance.new("UIListLayout", scrollingFrame3)
    instance5.Padding = UDim.new(0, 6)

    function RefreshConfigList()
      for index13, value16 in ipairs(scrollingFrame3:GetChildren()) do
        if value16:IsA("TextButton") then
          value16:Destroy()
        end
      end

      v7 = {}

      for index14, value17 in ipairs(v6) do
        local v42 = value17

        local textButton5 = Instance.new("TextButton")
        textButton5.Size = UDim2.new(1, -10, 0, 32)
        textButton5.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
        textButton5.Text = v42.Name
        textButton5.TextColor3 = Color3.fromRGB(230, 230, 240)
        textButton5.Font = Enum.Font.Gotham
        textButton5.TextSize = 13
        textButton5.Parent = scrollingFrame3

        Instance.new("UICorner", textButton5).CornerRadius = UDim.new(0, 6)
        v7[v42] = textButton5

        textButton5.MouseButton1Click:Connect(function()
          v41 = v42

          for key4, value18 in pairs(v7) do
            value18.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
          end

          textButton5.BackgroundColor3 = Color3.fromRGB(0, 130, 90)

          for key5, value19 in pairs(v42.Data) do
            v3[key5] = value19
          end

          f5()
        end)
      end

      scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, instance5.AbsoluteContentSize.Y + 10)
    end

    local function f25(p23)
      for key6, value20 in pairs(v30) do
        value20.Visible = key6 == p23
      end

      v27.BackgroundColor3 = p23 == "Player" and Color3.fromRGB(0, 140, 95)
        or Color3.fromRGB(35, 35, 45)

      v28.BackgroundColor3 = p23 == "ESP" and Color3.fromRGB(0, 140, 95)
        or Color3.fromRGB(35, 35, 45)

      v29.BackgroundColor3 = p23 == "Config" and Color3.fromRGB(0, 140, 95)
        or Color3.fromRGB(35, 35, 45)

      f5()
    end

    v27.MouseButton1Click:Connect(function() f25("Player") end)
    v28.MouseButton1Click:Connect(function() f25("ESP") end)
    v29.MouseButton1Click:Connect(function() f25("Config") end)

    runService.Heartbeat:Connect(function()
      if v3.ItemESP or v3.MonsterESP or v3.HumanEnemyESP or v3.HorseESP or v3.OreESP then
        f17()
      else
        f13()
      end
    end)

    local udim = UDim2.new(0, 580, 0, 480)

    local function f26()
      if v4 then
        return
      end

      v4 = true
      frame2.Visible = true
      tweenService:Create(frame2, TweenInfo.new(0.28, Enum.EasingStyle.Quint), { Size = udim }):Play()
      f5()
    end

    local function f27()
      if not v4 then
        return
      else
        v4 = false

        local create = tweenService:Create(frame2, TweenInfo.new(0.22, Enum.EasingStyle.Quint), {
          Size = UDim2.new(0, 0, 0, 0),
        })

        create:Play()

        create.Completed:Connect(function()
          if not v4 then
            frame2.Visible = false
          end
        end)

        f5()
        return
      end
    end

    textButton.MouseButton1Click:Connect(f27)

    userInputService.InputBegan:Connect(function(input8, p24)
      if p24 then
        return
      end

      if input8.KeyCode == Enum.KeyCode.RightControl then
        if v4 then
          f27()
        else
          f26()
        end
      end

      if input8.KeyCode == Enum.KeyCode.X then
        v3.FreeCam = not v3.FreeCam

        if v3.FreeCam then
          f10()
        else
          f11()
        end

        if v37 then
          v37(v3.FreeCam)
        end
      end
    end)

    task.wait(0.1)
    f26()
  end

  local function f28(fn4)
    local oretachiKeySystem = Instance.new("ScreenGui")
    oretachiKeySystem.Name = "OretachiKeySystem"
    oretachiKeySystem.ResetOnSpawn = false
    oretachiKeySystem.Parent = coreGui

    local frame12 = Instance.new("Frame")
    frame12.Size = UDim2.new(0, 380, 0, 340)
    frame12.Position = UDim2.new(0.5, -190, 0.5, -170)
    frame12.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
    frame12.BorderSizePixel = 0
    frame12.Parent = oretachiKeySystem

    Instance.new("UICorner", frame12).CornerRadius = UDim.new(0, 12)

    local instance6 = Instance.new("UIStroke", frame12)
    instance6.Color = Color3.fromRGB(40, 40, 50)
    instance6.Thickness = 1.4

    local textLabel6 = Instance.new("TextLabel")
    textLabel6.Size = UDim2.new(1, 0, 0, 40)
    textLabel6.Position = UDim2.new(0, 0, 0, 12)
    textLabel6.BackgroundTransparency = 1
    textLabel6.Text = "Oretachi's Dead Rails"
    textLabel6.TextColor3 = Color3.fromRGB(240, 240, 250)
    textLabel6.TextSize = 20
    textLabel6.Font = Enum.Font.GothamBold
    textLabel6.Parent = frame12

    local textLabel7 = Instance.new("TextLabel")
    textLabel7.Size = UDim2.new(1, -40, 0, 20)
    textLabel7.Position = UDim2.new(0, 20, 0, 52)
    textLabel7.BackgroundTransparency = 1
    textLabel7.Text = "Panda Auth"
    textLabel7.TextColor3 = Color3.fromRGB(160, 160, 180)
    textLabel7.TextSize = 13
    textLabel7.Font = Enum.Font.Gotham
    textLabel7.Parent = frame12

    local textBox2 = Instance.new("TextBox")
    textBox2.Size = UDim2.new(1, -40, 0, 40)
    textBox2.Position = UDim2.new(0, 20, 0, 85)
    textBox2.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    textBox2.PlaceholderText = "Paste your Panda key here..."
    textBox2.Text = ""
    textBox2.TextColor3 = Color3.fromRGB(230, 230, 240)
    textBox2.Font = Enum.Font.Gotham
    textBox2.TextSize = 14
    textBox2.ClearTextOnFocus = false
    textBox2.Parent = frame12

    Instance.new("UICorner", textBox2).CornerRadius = UDim.new(0, 8)

    local textButton6 = Instance.new("TextButton")
    textButton6.Size = UDim2.new(1, -40, 0, 36)
    textButton6.Position = UDim2.new(0, 20, 0, 140)
    textButton6.BackgroundColor3 = Color3.fromRGB(50, 90, 180)
    textButton6.Text = "Get Key (Panda Auth)"
    textButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
    textButton6.Font = Enum.Font.GothamBold
    textButton6.TextSize = 14
    textButton6.Parent = frame12

    Instance.new("UICorner", textButton6).CornerRadius = UDim.new(0, 8)

    local textButton7 = Instance.new("TextButton")
    textButton7.Size = UDim2.new(1, -40, 0, 36)
    textButton7.Position = UDim2.new(0, 20, 0, 185)
    textButton7.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    textButton7.Text = "Discord Invite"
    textButton7.TextColor3 = Color3.fromRGB(255, 255, 255)
    textButton7.Font = Enum.Font.GothamBold
    textButton7.TextSize = 14
    textButton7.Parent = frame12

    Instance.new("UICorner", textButton7).CornerRadius = UDim.new(0, 8)

    local textButton8 = Instance.new("TextButton")
    textButton8.Size = UDim2.new(1, -40, 0, 42)
    textButton8.Position = UDim2.new(0, 20, 0, 235)
    textButton8.BackgroundColor3 = Color3.fromRGB(0, 140, 95)
    textButton8.Text = "Submit Key"
    textButton8.TextColor3 = Color3.fromRGB(255, 255, 255)
    textButton8.Font = Enum.Font.GothamBold
    textButton8.TextSize = 15
    textButton8.Parent = frame12

    Instance.new("UICorner", textButton8).CornerRadius = UDim.new(0, 8)

    local textLabel8 = Instance.new("TextLabel")
    textLabel8.Size = UDim2.new(1, -40, 0, 30)
    textLabel8.Position = UDim2.new(0, 20, 0, 290)
    textLabel8.BackgroundTransparency = 1
    textLabel8.Text = ""
    textLabel8.TextColor3 = Color3.fromRGB(255, 80, 80)
    textLabel8.TextSize = 12
    textLabel8.Font = Enum.Font.Gotham
    textLabel8.TextWrapped = true
    textLabel8.Parent = frame12

    textButton6.MouseButton1Click:Connect(function()
      if setclipboard then
        setclipboard("https://ads.pandauth.com/getkey/oretachimakingstuff?hwid=unknown")

        textLabel8.TextColor3 = Color3.fromRGB(100, 220, 140)
        textLabel8.Text = "HWID key link copied!"

        print("[Panda] Key URL: https://ads.pandauth.com/getkey/oretachimakingstuff?hwid=unknown")
      else
        textLabel8.TextColor3 = Color3.fromRGB(255, 200, 100)
        textLabel8.Text = "Copy manually from F9 console"
        print("[Panda] Key URL: https://ads.pandauth.com/getkey/oretachimakingstuff?hwid=unknown")
      end
    end)

    textButton7.MouseButton1Click:Connect(function()
      if setclipboard then
        setclipboard("https://discord.gg/tcgqzRW2z")
        textLabel8.TextColor3 = Color3.fromRGB(100, 220, 140)
        textLabel8.Text = "Discord invite copied!"
      else
        textLabel8.Text = "Could not copy Discord link"
      end
    end)

    textButton8.MouseButton1Click:Connect(function()
      local gsub = textBox2.Text:gsub("%s+", "")

      if gsub == "" or #gsub < 4 then
        textLabel8.TextColor3 = Color3.fromRGB(255, 80, 80)
        textLabel8.Text = "Please enter a valid key"
        return
      end

      textLabel8.TextColor3 = Color3.fromRGB(200, 200, 100)
      textLabel8.Text = "Validating with Panda Auth..."

      task.spawn(function()
        if f1(gsub) then
          oretachiKeySystem:Destroy()
          fn4()
        else
          textLabel8.TextColor3 = Color3.fromRGB(255, 80, 80)
          textLabel8.Text = "Invalid or expired key"

          task.wait(1.8)
          f2("Your key is timed out or you typed it wrong, please check twice")
        end
      end)
    end)
  end

  f28(function() f3() end)

  return
end   end)
    end)
  end

  f28(function() f3() end)

  return
end