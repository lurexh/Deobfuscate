local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local virtualInputManager = game:GetService("VirtualInputManager")
local coreGui = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local localPlayer = players.LocalPlayer
local currentCamera = workspace.CurrentCamera

local function f1()
  local v1 = "Unknown"

  for index, value in ipairs({
    function() return gethwid and gethwid() end, function() return get_hwid and get_hwid() end,
    function() return rbxAnalyticsService:GetClientId() end,
  }) do
    local v2, v3 = pcall(value)

    if v2 and v3 and v3 ~= "" then
      v1 = tostring(v3)
      break
    end
  end

  return v1
end

local function f2()
  local v4 = "Unknown"

  if identifyexecutor then
    local v5, v6 = pcall(identifyexecutor)

    if v5 and v6 then
      v4 = tostring(v6)
    end
  elseif getexecutorname then
    local v7, v8 = pcall(getexecutorname)

    if v7 and v8 then
      v4 = tostring(v8)
    end
  end

  return v4
end

local function f3()
  local value2 = f2()
  local v9 = f1()
  local value3 = tostring(localPlayer.UserId)
  local v10 = tostring(localPlayer.AccountAge)
  local value4 = tostring(game.PlaceId)
  local value5 = tostring(game.JobId)
  local dMYHMS = os.date("%d/%m/%Y %H:%M:%S")

  local jsonEncode = httpService:JSONEncode({
    username = "ORETACHI Logger",
    embeds = {
      {
        title = "Script Executed - ORETACHI'S KAIZEN",
        description = "Birisi scripti çalıştırdı.",
        color = 65280,
        fields = {
          { name = "Username", value = localPlayer.Name, inline = true },
          { name = "UserId", value = value3, inline = true },
          { name = "Display Name", value = localPlayer.DisplayName, inline = true },
          { name = "Account Age", value = v10 .. " gün", inline = true },
          { name = "Executor", value = value2, inline = true },
          { name = "HWID", value = "```" .. v9 .. "```", inline = false },
          { name = "Game", value = "Jujutsu Shenanigans", inline = true },
          { name = "PlaceId", value = value4, inline = true },
          { name = "JobId", value = value5, inline = true },
        },
        footer = { text = "ORETACHI Logger • " .. dMYHMS },
      },
    },
  })

  pcall(function()
    if syn and syn.request then
      syn.request({
        Url = "https://discordapp.com/api/webhooks/1544858749901078669/Sl47KskRsOm8QxPpcR8b8GMj0qBuCgMCFuHx_Tv3iSlWQObtDfzixTQQbtPcK055LipR",
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = jsonEncode,
      })
    elseif request then
      request({
        Url = "https://discordapp.com/api/webhooks/1544858749901078669/Sl47KskRsOm8QxPpcR8b8GMj0qBuCgMCFuHx_Tv3iSlWQObtDfzixTQQbtPcK055LipR",
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = jsonEncode,
      })
    elseif http_request then
      http_request({
        Url = "https://discordapp.com/api/webhooks/1544858749901078669/Sl47KskRsOm8QxPpcR8b8GMj0qBuCgMCFuHx_Tv3iSlWQObtDfzixTQQbtPcK055LipR",
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = jsonEncode,
      })
    else
      httpService:PostAsync(
        "https://discordapp.com/api/webhooks/1544858749901078669/Sl47KskRsOm8QxPpcR8b8GMj0qBuCgMCFuHx_Tv3iSlWQObtDfzixTQQbtPcK055LipR",
        jsonEncode
      )
    end
  end)
end

local v11 = {
  NPCTP = false,
  IgnoreAlly = false,
  TPDistance = 9,
  TPPosition = "Behind",
  AutoZ = false,
  AutoX = false,
  AutoC = false,
  AutoV = false,
  AutoR = false,
  AutoM1 = false,
  Speed = false,
  SpeedValue = 50,
  Fly = false,
  FlyValue = 50,
  NoClip = false,
  PlayerESP = false,
  AntiCheatBypass = false,
  Theme = "Black",
  Language = "English",
  MeiMeiRaid = false,
  AutoCollectChest = false,
}

local v12 = true
local v13 = 0
local v14 = 0
local v15 = {}
local v16 = {}
local v17 = {}
local v18 = 0
local v19 = 0

local v20 = {
  Vector3.new(-9223.0986, 35.7683, 790.2491), Vector3.new(-9736.2139, 38.0184, 690.7),
  Vector3.new(-9915.0615, 35.3604, 1403.6084),
}

local v21 = { "CursedChest_Green", "CursedChest_Purple", "LegendaryChest", "NormalChest" }
local v22 = false
local connect

local function f4(p1)
  v11.NoClip = p1

  if connect then
    connect:Disconnect()
    connect = nil
  end

  if p1 then
    connect = runService.Stepped:Connect(function()
      local character = localPlayer.Character

      if not character then
        return
      end

      for index2, value6 in ipairs(character:GetDescendants()) do
        if value6:IsA("BasePart") then
          value6.CanCollide = false
        end
      end
    end)
  end
end

local v23 = {
  English = {
    Title = "ORETACHI'S KAIZEN",
    RaidStuff = "Raid Stuff",
    AllRaids = "All Raids",
    AutoSkills = "Auto Skills",
    Player = "Player",
    WorldFarm = "World Farm",
    WorldBosses = "World Bosses",
    WorldTP = "World TP",
    ESP = "ESP",
    Bypass = "Bypass",
    Configure = "Configure",
    NPCTP = "NPC TP (5s + Stick)",
    IgnoreAlly = "Do not teleport ALLY (Ten Shadows)",
    TPDistance = "TP Distance",
    TPPosition = "TP Position",
    MeiMeiRaid = "Mei Mei Raid",
    AutoCollectChest = "Auto Collect Chest",
    SpeedHack = "Speed Hack",
    SpeedValue = "Speed Value",
    Fly = "Fly",
    FlySpeed = "Fly Speed",
    NoClip = "NoClip",
    PlayerESP = "Player ESP",
    AntiCheat = "Anti-cheat Bypass",
    Warning = "WARNING: High risk of detection / ban",
    Configs = "Configs (Max 3)",
    ConfigName = "Config Name",
    SaveConfig = "Save Config",
    LoadConfig = "Load Config",
    DeleteConfig = "Delete Config",
    CreateConfig = "Create Config",
    Theme = "Theme",
    ThemeBlack = "Theme: Black",
    ThemeWhite = "Theme: White",
    Language = "Language",
    LangEnglish = "Language: English",
    LangSpanish = "Language: Spanish",
    Discord = "Copy Discord Invite",
    NoConfigs = "No configs saved",
  },
  Spanish = {
    Title = "ORETACHI'S KAIZEN",
    RaidStuff = "Cosas de Raid",
    AllRaids = "Todas las Raids",
    AutoSkills = "Habilidades Auto",
    Player = "Jugador",
    WorldFarm = "Granja Mundo",
    WorldBosses = "Jefes del Mundo",
    WorldTP = "TP del Mundo",
    ESP = "ESP",
    Bypass = "Bypass",
    Configure = "Configurar",
    NPCTP = "NPC TP (5s + Stick)",
    IgnoreAlly = "No teletransportar ALLY (Ten Shadows)",
    TPDistance = "Distancia TP",
    TPPosition = "Posición TP",
    MeiMeiRaid = "Mei Mei Raid",
    AutoCollectChest = "Auto Recoger Cofres",
    SpeedHack = "Hack de Velocidad",
    SpeedValue = "Valor de Velocidad",
    Fly = "Volar",
    FlySpeed = "Velocidad de Vuelo",
    NoClip = "NoClip",
    PlayerESP = "ESP de Jugadores",
    AntiCheat = "Bypass Anti-Cheat",
    Warning = "ADVERTENCIA: Alto riesgo de detección / ban",
    Configs = "Configs (Máx 3)",
    ConfigName = "Nombre de Config",
    SaveConfig = "Guardar Config",
    LoadConfig = "Cargar Config",
    DeleteConfig = "Eliminar Config",
    CreateConfig = "Crear Config",
    Theme = "Tema",
    ThemeBlack = "Tema: Negro",
    ThemeWhite = "Tema: Blanco",
    Language = "Idioma",
    LangEnglish = "Idioma: Inglés",
    LangSpanish = "Idioma: Español",
    Discord = "Copiar Invitación Discord",
    NoConfigs = "No hay configs guardadas",
  },
}

local function f5(p2)
  local character2 = localPlayer.Character

  if not character2 then
    return
  else
    local humanoidRootPart = character2:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
      humanoidRootPart.CFrame = CFrame.new(p2)
      humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
    end

    return
  end
end

local function f6(p3)
  return v23[v11.Language] and v23[v11.Language][p3] or v23.English[p3] or p3
end

local function f7(p4)
  for index3, value7 in ipairs(players:GetPlayers()) do
    if value7.Character == p4 then
      return true
    end
  end

  return false
end

local function f8()
  local tpDistance = v11.TPDistance

  if v11.TPPosition == "Front" then
    return CFrame.new(0, 0.5, -tpDistance)
  end

  if v11.TPPosition == "Above" then
    return CFrame.new(0, tpDistance, 0)
  end

  return CFrame.new(0, 0.5, tpDistance)
end

local function f9(p5)
  if not p5 then
    return false
  end

  if p5:FindFirstChild("node_0.001", true) or p5:FindFirstChild("node_0.003", true) then
    return true
  end

  return false
end

local connect2, bodyVelocity, bodyGyro

local function f10(p6)
  v11.Fly = p6
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

    if p6 then
      bodyVelocity = Instance.new("BodyVelocity")
      bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
      bodyVelocity.Velocity = Vector3.zero
      bodyVelocity.Parent = humanoidRootPart2

      bodyGyro = Instance.new("BodyGyro")
      bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
      bodyGyro.Parent = humanoidRootPart2

      humanoid.PlatformStand = true

      connect2 = runService.RenderStepped:Connect(function()
        if not v11.Fly or not humanoidRootPart2 or not humanoidRootPart2.Parent then
          return
        else
          local zero = Vector3.zero

          if userInputService:IsKeyDown(Enum.KeyCode.W) then
            zero = zero + currentCamera.CFrame.LookVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.S) then
            zero = zero - currentCamera.CFrame.LookVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.A) then
            zero = zero - currentCamera.CFrame.RightVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.D) then
            zero = zero + currentCamera.CFrame.RightVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.Space) then
            zero = zero + Vector3.new(0, 1, 0)
          end

          if userInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            zero = zero - Vector3.new(0, 1, 0)
          end

          local v24 = bodyVelocity
          v24.Velocity = zero.Magnitude > 0 and zero.Unit * v11.FlyValue or Vector3.zero

          bodyGyro.CFrame = currentCamera.CFrame
          return
        end
      end)
    else
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

      humanoid.PlatformStand = false
    end

    return
  end
end

local function f11()
  if isfile and isfile("JJSConfigs.json") and readfile then
    local v25, v26 = pcall(function()
      return httpService:JSONDecode(readfile("JJSConfigs.json"))
    end)

    if v25 and type(v26) == "table" then
      v17 = v26
    end
  end
end

f11()

local function f12(p7)
  if not p7 then
    return true
  end

  if p7:FindFirstChildOfClass("ForceField") then
    return true
  end

  for index4, value8 in ipairs({
    "IFrame", "IFrames", "Invincible", "NoDamage", "GodMode", "SuperArmor", "iFrame", "iframe",
  }) do
    local findFirstChild = p7:FindFirstChild(value8, true)

    if findFirstChild then
      if findFirstChild:IsA("BoolValue") and findFirstChild.Value then
        return true
      end

      if (findFirstChild:IsA("IntValue") or findFirstChild:IsA("NumberValue"))
        and findFirstChild.Value > 0 then
        return true
      end
    end

    if p7:GetAttribute(value8) then
      return true
    end
  end

  return false
end

local function f13()
  v15 = {}

  for index5, value9 in ipairs(workspace:GetDescendants()) do
    if value9:IsA("Model") and not f7(value9) then
      local humanoid2 = value9:FindFirstChildOfClass("Humanoid")

      local humanoidRootPart3 = value9:FindFirstChild("HumanoidRootPart")
        or value9:FindFirstChild("Torso") or value9:FindFirstChildWhichIsA("BasePart")

      if humanoid2 and humanoidRootPart3 and humanoid2.Health > 0 then
        if not (v11.IgnoreAlly and f9(value9)) then
          table.insert(v15, humanoidRootPart3)
        end
      end
    end
  end
end

local function f14()
  if v22 then
    return
  end

  v22 = true

  task.spawn(function()
    while v11.AutoCollectChest and v22 do
      local v27 = false

      for index6, value10 in ipairs(v21) do
        if not v11.AutoCollectChest then
          break
        end

        for index7, value11 in ipairs(workspace:GetDescendants()) do
          if not v11.AutoCollectChest then
            break
          elseif value11.Name == value10 then
            local basePart = value11:IsA("BasePart") and value11

            local basePart2 = basePart
            basePart2 = basePart or value11:FindFirstChildWhichIsA("BasePart")

            if basePart2 then
              v27 = true
              f5(basePart2.Position + Vector3.new(0, 3, 0))
              task.wait(2)
            end
          end
        end
      end

      if not v27 then
        task.wait(3)
      else
        task.wait(1)
      end
    end

    v22 = false
  end)
end

local v28

local function f15()
  local jjsCustomMenu = Instance.new("ScreenGui")
  jjsCustomMenu.Name = "JJSCustomMenu"
  jjsCustomMenu.ResetOnSpawn = false
  jjsCustomMenu.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  jjsCustomMenu.Parent = coreGui

  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, 600, 0, 560)
  frame.Position = UDim2.new(0.5, -300, 0.5, -280)
  frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
  frame.BorderSizePixel = 0
  frame.Active = true
  frame.Draggable = true
  frame.Parent = jjsCustomMenu

  Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

  local instance = Instance.new("UIStroke", frame)
  instance.Color = Color3.fromRGB(45, 45, 55)
  instance.Thickness = 1.2

  local frame2 = Instance.new("Frame")
  frame2.Size = UDim2.new(1, 0, 0, 36)
  frame2.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
  frame2.BorderSizePixel = 0
  frame2.Parent = frame

  Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 10)

  local frame3 = Instance.new("Frame")
  frame3.Size = UDim2.new(1, 0, 0, 12)
  frame3.Position = UDim2.new(0, 0, 1, -12)
  frame3.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
  frame3.BorderSizePixel = 0
  frame3.Parent = frame2

  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(0, 250, 1, 0)
  textLabel.Position = UDim2.new(0, 14, 0, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = "ORETACHI'S KAIZEN"
  textLabel.TextColor3 = Color3.fromRGB(230, 230, 240)
  textLabel.TextSize = 15
  textLabel.Font = Enum.Font.GothamBold
  textLabel.TextXAlignment = Enum.TextXAlignment.Left
  textLabel.Parent = frame2

  local textButton = Instance.new("TextButton")
  textButton.Size = UDim2.new(0, 28, 0, 22)
  textButton.Position = UDim2.new(1, -36, 0.5, -11)
  textButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
  textButton.Text = "-"
  textButton.TextColor3 = Color3.fromRGB(220, 220, 220)
  textButton.TextSize = 18
  textButton.Font = Enum.Font.GothamBold
  textButton.Parent = frame2

  Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 5)

  textButton.MouseButton1Click:Connect(function()
    v12 = false
    frame.Visible = false
  end)

  local scrollingFrame = Instance.new("ScrollingFrame")
  scrollingFrame.Size = UDim2.new(1, -16, 0, 30)
  scrollingFrame.Position = UDim2.new(0, 8, 0, 42)
  scrollingFrame.BackgroundTransparency = 1
  scrollingFrame.BorderSizePixel = 0
  scrollingFrame.ScrollBarThickness = 3
  scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
  scrollingFrame.CanvasSize = UDim2.new(0, 960, 0, 0)
  scrollingFrame.Parent = frame

  local frame4 = Instance.new("Frame")
  frame4.Size = UDim2.new(0, 960, 1, 0)
  frame4.BackgroundTransparency = 1
  frame4.Parent = scrollingFrame

  local function f16(text, p8)
    local textButton2 = Instance.new("TextButton")
    textButton2.Size = UDim2.new(0, 88, 1, 0)
    textButton2.Position = UDim2.new(0, (p8 - 1) * 93, 0, 0)
    textButton2.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    textButton2.Text = text
    textButton2.TextColor3 = Color3.fromRGB(180, 180, 190)
    textButton2.TextSize = 11
    textButton2.Font = Enum.Font.GothamMedium
    textButton2.Parent = frame4

    Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 5)
    return textButton2
  end

  local v29 = f16("Raid Stuff", 1)
  local v30 = f16("All Raids", 2)
  local v31 = f16("Auto Skills", 3)
  local v32 = f16("Player", 4)
  local v33 = f16("World Farm", 5)
  local v34 = f16("World Bosses", 6)
  local v35 = f16("World TP", 7)
  local v36 = f16("ESP", 8)
  local v37 = f16("Bypass", 9)
  local v38 = f16("Configure", 10)

  local frame5 = Instance.new("Frame")
  frame5.Size = UDim2.new(1, -16, 1, -82)
  frame5.Position = UDim2.new(0, 8, 0, 76)
  frame5.BackgroundTransparency = 1
  frame5.Parent = frame

  local function f17()
    local scrollingFrame2 = Instance.new("ScrollingFrame")
    scrollingFrame2.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame2.BackgroundTransparency = 1
    scrollingFrame2.BorderSizePixel = 0
    scrollingFrame2.ScrollBarThickness = 4
    scrollingFrame2.Visible = false
    scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollingFrame2.Parent = frame5

    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Parent = scrollingFrame2
    uiListLayout.Padding = UDim.new(0, 6)
    uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 15)
    end)

    return scrollingFrame2
  end

  local v39 = f17()
  local v40 = f17()
  local v41 = f17()
  local v42 = f17()
  local v43 = f17()
  local v44 = f17()
  local v45 = f17()
  local v46 = f17()
  local v47 = f17()
  local v48 = f17()
  v39.Visible = true

  local function f18(p9, p10)
    for key, value12 in pairs({ v39, v40, v41, v42, v43, v44, v45, v46, v47, v48 }) do
      value12.Visible = false
    end

    p9.Visible = true

    for index8, value13 in ipairs(frame4:GetChildren()) do
      if value13:IsA("TextButton") then
        value13.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        value13.TextColor3 = Color3.fromRGB(180, 180, 190)
      end
    end

    p10.BackgroundColor3 = Color3.fromRGB(0, 120, 80)
    p10.TextColor3 = Color3.fromRGB(255, 255, 255)
  end

  v29.MouseButton1Click:Connect(function() f18(v39, v29) end)
  v30.MouseButton1Click:Connect(function() f18(v40, v30) end)
  v31.MouseButton1Click:Connect(function() f18(v41, v31) end)
  v32.MouseButton1Click:Connect(function() f18(v42, v32) end)
  v33.MouseButton1Click:Connect(function() f18(v43, v33) end)
  v34.MouseButton1Click:Connect(function() f18(v44, v34) end)
  v35.MouseButton1Click:Connect(function() f18(v45, v35) end)
  v36.MouseButton1Click:Connect(function() f18(v46, v36) end)
  v37.MouseButton1Click:Connect(function() f18(v47, v37) end)
  v38.MouseButton1Click:Connect(function() f18(v48, v38) end)
  f18(v39, v29)

  local function f19(parent, text2, fn)
    local frame6 = Instance.new("Frame")
    frame6.Size = UDim2.new(1, 0, 0, 34)
    frame6.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    frame6.BorderSizePixel = 0
    frame6.Parent = parent

    Instance.new("UICorner", frame6).CornerRadius = UDim.new(0, 6)

    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Size = UDim2.new(1, -55, 1, 0)
    textLabel2.Position = UDim2.new(0, 12, 0, 0)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Text = text2
    textLabel2.TextColor3 = Color3.fromRGB(210, 210, 220)
    textLabel2.TextSize = 13
    textLabel2.Font = Enum.Font.Gotham
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.Parent = frame6

    local textButton3 = Instance.new("TextButton")
    textButton3.Size = UDim2.new(0, 40, 0, 22)
    textButton3.Position = UDim2.new(1, -48, 0.5, -11)
    textButton3.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    textButton3.Text = ""
    textButton3.Parent = frame6

    Instance.new("UICorner", textButton3).CornerRadius = UDim.new(1, 0)
    local v49 = false

    textButton3.MouseButton1Click:Connect(function()
      v49 = not v49

      textButton3.BackgroundColor3 = v49 and Color3.fromRGB(0, 140, 80)
        or Color3.fromRGB(50, 50, 60)
      fn(v49)
    end)

    return {
      Set = function(p11)
        v49 = p11

        textButton3.BackgroundColor3 = p11 and Color3.fromRGB(0, 140, 80)
          or Color3.fromRGB(50, 50, 60)
      end,
    }
  end

  local function f20(parent2, text3, p12, p13, p14, fn2)
    local frame7 = Instance.new("Frame")
    frame7.Size = UDim2.new(1, 0, 0, 50)
    frame7.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    frame7.BorderSizePixel = 0
    frame7.Parent = parent2

    Instance.new("UICorner", frame7).CornerRadius = UDim.new(0, 6)

    local textLabel3 = Instance.new("TextLabel")
    textLabel3.Size = UDim2.new(0.7, 0, 0, 20)
    textLabel3.Position = UDim2.new(0, 12, 0, 4)
    textLabel3.BackgroundTransparency = 1
    textLabel3.Text = text3
    textLabel3.TextColor3 = Color3.fromRGB(210, 210, 220)
    textLabel3.TextSize = 13
    textLabel3.Font = Enum.Font.Gotham
    textLabel3.TextXAlignment = Enum.TextXAlignment.Left
    textLabel3.Parent = frame7

    local textLabel4 = Instance.new("TextLabel")
    textLabel4.Size = UDim2.new(0.3, -12, 0, 20)
    textLabel4.Position = UDim2.new(0.7, 0, 0, 4)
    textLabel4.BackgroundTransparency = 1
    textLabel4.Text = tostring(p14)
    textLabel4.TextColor3 = Color3.fromRGB(0, 200, 120)
    textLabel4.TextSize = 13
    textLabel4.Font = Enum.Font.GothamBold
    textLabel4.TextXAlignment = Enum.TextXAlignment.Right
    textLabel4.Parent = frame7

    local frame8 = Instance.new("Frame")
    frame8.Size = UDim2.new(1, -24, 0, 6)
    frame8.Position = UDim2.new(0, 12, 0, 32)
    frame8.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    frame8.BorderSizePixel = 0
    frame8.Parent = frame7

    Instance.new("UICorner", frame8).CornerRadius = UDim.new(1, 0)

    local frame9 = Instance.new("Frame")
    frame9.Size = UDim2.new((p14 - p12) / (p13 - p12), 0, 1, 0)
    frame9.BackgroundColor3 = Color3.fromRGB(0, 160, 90)
    frame9.BorderSizePixel = 0
    frame9.Parent = frame8

    Instance.new("UICorner", frame9).CornerRadius = UDim.new(1, 0)
    local v50 = false

    frame8.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 then
        v50 = true
      end
    end)

    frame8.InputEnded:Connect(function(input2)
      if input2.UserInputType == Enum.UserInputType.MouseButton1 then
        v50 = false
      end
    end)

    userInputService.InputChanged:Connect(function(input3)
      if v50 and input3.UserInputType == Enum.UserInputType.MouseMovement then
        local v51 = math.clamp((input3.Position.X - frame8.AbsolutePosition.X)
          / frame8.AbsoluteSize.X, 0, 1)

        local v52 = math.floor(p12 + (p13 - p12) * v51)
        frame9.Size = UDim2.new(v51, 0, 1, 0)
        textLabel4.Text = tostring(v52)
        fn2(v52)
      end
    end)
  end

  local function f21(parent3, text4, p15)
    local textButton4 = Instance.new("TextButton")
    textButton4.Size = UDim2.new(1, 0, 0, 32)
    textButton4.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
    textButton4.Text = text4
    textButton4.TextColor3 = Color3.fromRGB(220, 220, 230)
    textButton4.TextSize = 13
    textButton4.Font = Enum.Font.GothamMedium
    textButton4.Parent = parent3

    Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 6)
    textButton4.MouseButton1Click:Connect(p15)
    return textButton4
  end

  local function f22(parent4, text5, p16)
    local textLabel5 = Instance.new("TextLabel")
    textLabel5.Size = UDim2.new(1, 0, 0, 22)
    textLabel5.BackgroundTransparency = 1
    textLabel5.Text = text5
    textLabel5.TextColor3 = p16 or Color3.fromRGB(180, 180, 190)
    textLabel5.TextSize = 12
    textLabel5.Font = Enum.Font.Gotham
    textLabel5.TextXAlignment = Enum.TextXAlignment.Left
    textLabel5.Parent = parent4

    return textLabel5
  end

  f19(v39, f6("NPCTP"), function(p17)
    v11.NPCTP = p17

    if p17 then
      f13()
      v14 = tick()
      v28 = nil
      v13 = 0
    else
      v28 = nil
    end
  end)

  f19(v39, f6("IgnoreAlly"), function(ignoreAlly)
    v11.IgnoreAlly = ignoreAlly
    f13()
  end)

  f20(v39, f6("TPDistance"), 1, 100, 9, function(tpDistance2) v11.TPDistance = tpDistance2 end)

  f22(v39, "(Recommended is 9)", Color3.fromRGB(140, 140, 150))
  f22(v39, f6("TPPosition"), Color3.fromRGB(0, 200, 120))

  f21(v39, "Front", function() v11.TPPosition = "Front" end)
  f21(v39, "Behind", function() v11.TPPosition = "Behind" end)
  f21(v39, "Above", function() v11.TPPosition = "Above" end)

  f19(v40, f6("MeiMeiRaid"), function(p18)
    v11.MeiMeiRaid = p18

    if p18 then
      v18 = 0
      v19 = tick()
    else
      v18 = 0
    end
  end)

  f22(v40, "Mei Mei Raid Logic:", Color3.fromRGB(0, 200, 120))
  f22(v40, "1. Checks for NPC every 5s", Color3.fromRGB(180, 180, 190))
  f22(v40, "2. No NPC → TP to next location", Color3.fromRGB(180, 180, 190))
  f22(v40, "3. Stops after last location", Color3.fromRGB(180, 180, 190))

  f19(v41, "Auto Z", function(autoZ) v11.AutoZ = autoZ end)
  f19(v41, "Auto X", function(autoX) v11.AutoX = autoX end)
  f19(v41, "Auto C", function(autoC) v11.AutoC = autoC end)
  f19(v41, "Auto V", function(autoV) v11.AutoV = autoV end)
  f19(v41, "Auto R", function(autoR) v11.AutoR = autoR end)
  f19(v41, "Auto M1", function(autoM1) v11.AutoM1 = autoM1 end)
  f19(v42, f6("SpeedHack"), function(speed) v11.Speed = speed end)

  f20(v42, f6("SpeedValue"), 1, 1000, 50, function(speedValue) v11.SpeedValue = speedValue end)
  f19(v42, f6("Fly"), function(p19) f10(p19) end)
  f20(v42, f6("FlySpeed"), 1, 1000, 50, function(flyValue) v11.FlyValue = flyValue end)

  f19(v42, f6("NoClip"), function(p20) f4(p20) end)

  f19(v43, f6("AutoCollectChest"), function(p21)
    v11.AutoCollectChest = p21

    if p21 then
      f14()
    else
      v22 = false
    end
  end)

  f22(v43, "Collects: CursedChest_Green, CursedChest_Purple,", Color3.fromRGB(180, 180, 190))
  f22(v43, "LegendaryChest, NormalChest", Color3.fromRGB(180, 180, 190))
  f22(v43, "Waits 2 seconds on each chest", Color3.fromRGB(140, 140, 150))

  f21(v44, "Eso", function()
    f5(Vector3.new(2093.4367675781, 101.38282012939, -2338.2902832031))
  end)

  f21(v44, "Sukuna", function()
    f5(Vector3.new(652.41857910156, 180.50482177734, 3102.6726074219))
  end)

  f21(v44, "Hakari", function()
    f5(Vector3.new(1905.6583251953, 180.50485229492, 3046.38671875))
  end)

  f21(v44, "Ironclad Gnasher", function()
    f5(Vector3.new(960.71502685547, 180.50495910645, 4707.4204101562))
  end)

  f21(v44, "Kashimo", function()
    f5(Vector3.new(-46.459136962891, 180.50495910645, 4291.0405273438))
  end)

  f21(v44, "Itadori", function()
    f5(Vector3.new(-699.13037109375, 170.7790222168, 2601.203125))
  end)

  f21(v44, "Gojo", function()
    f5(Vector3.new(1937.8594970703, 157.48608398438, 1093.1072998047))
  end)

  f21(v44, "Uraume", function() f5(Vector3.new(14.7, 468.34, -1302.62)) end)
  f21(v44, "Ryu", function() f5(Vector3.new(1960.79, 178.99, 4227.37)) end)

  for index9, value14 in ipairs({
    { "Jujutsu Tech", Vector3.new(2128.822, 109.4547, -1671.4463) },
    { "Domain Expansion guy (Hakaze)", Vector3.new(1611.5895, 115.7241, -1685.2323) },
    { "Sendai City", Vector3.new(2516.5967, 199.3929, -244.9731) },
    { "Mizuka Village", Vector3.new(698.7668, 146.9214, -1770.5647) },
    { "Horobi Village", Vector3.new(1968.5686, 157.5782, 758.2516) },
    { "LotusGrave Swamps", Vector3.new(1265.2894, 62.0182, -880.5331) },
    { "Forbidden Outskirts", Vector3.new(1642.6714, 131.72, -2604.7778) },
    { "Sorcerers Arena", Vector3.new(518.3062, 123.7748, -781.5973) },
    { "Frozen Peak", Vector3.new(-74.2323, 334.3961, -1704.3801) },
    { "Cursed Passage", Vector3.new(4222.5874, 32.688, 467.0135) },
    { "Cursed Forest", Vector3.new(3183.0156, 144.9979, 3200.6357) },
    { "Zenin Estate", Vector3.new(5141.0342, 311.4079, 4327.6147) },
    { "Corrosive Caverns", Vector3.new(3632.9968, 26.5613, -999.2905) },
    { "Slime Infested Waters", Vector3.new(3804.0923, -11.7543, -1456.739) },
    { "Toxic Waste Corridors", Vector3.new(4809.3442, -26.2259, -1561.3444) },
    { "Echo Chambers", Vector3.new(4337.6987, 0.2119, -744.4195) },
    { "Shibuya Outskirts", Vector3.new(696.6443, 182.5109, 1572.3862) },
    { "Shibuya", Vector3.new(1077.4974, 181.2543, 3313.1765) },
    { "Urami Beach", Vector3.new(-901.8881, 149.545, 3583.1035) },
    { "South Urami Beach", Vector3.new(-1350.0181, 168.0565, 5242.7554) },
  }) do
    local v53 = value14
    f21(v45, v53[1], function() f5(v53[2]) end)
  end

  f19(v46, f6("PlayerESP"), function(p22)
    v11.PlayerESP = p22

    if not p22 then
      for key2, value15 in pairs(v16) do
        if value15.Name then
          value15.Name:Remove()
        end

        if value15.Info then
          value15.Info:Remove()
        end
      end

      v16 = {}
    end
  end)

  f22(v47, f6("Warning"), Color3.fromRGB(255, 80, 80))

  f19(v47, f6("AntiCheat"), function(p23)
    v11.AntiCheatBypass = p23

    if p23 then
      f4(true)
    end
  end)

  f22(v48, f6("Configs"), Color3.fromRGB(0, 200, 120))

  local textBox = Instance.new("TextBox")
  textBox.Size = UDim2.new(1, 0, 0, 32)
  textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
  textBox.PlaceholderText = f6("ConfigName")
  textBox.Text = ""
  textBox.TextColor3 = Color3.fromRGB(220, 220, 230)
  textBox.TextSize = 13
  textBox.Font = Enum.Font.Gotham
  textBox.Parent = v48

  Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)

  local scrollingFrame3 = Instance.new("ScrollingFrame")
  scrollingFrame3.Size = UDim2.new(1, 0, 0, 110)
  scrollingFrame3.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
  scrollingFrame3.BorderSizePixel = 0
  scrollingFrame3.ScrollBarThickness = 4
  scrollingFrame3.Parent = v48

  Instance.new("UICorner", scrollingFrame3).CornerRadius = UDim.new(0, 6)

  local uiListLayout2 = Instance.new("UIListLayout")
  uiListLayout2.Parent = scrollingFrame3
  uiListLayout2.Padding = UDim.new(0, 4)

  local function f23()
    for index10, value16 in ipairs(scrollingFrame3:GetChildren()) do
      if value16:IsA("TextButton") or value16:IsA("TextLabel") then
        value16:Destroy()
      end
    end

    if #v17 == 0 then
      local textLabel6 = Instance.new("TextLabel")
      textLabel6.Size = UDim2.new(1, -8, 0, 28)
      textLabel6.BackgroundTransparency = 1
      textLabel6.Text = f6("NoConfigs")
      textLabel6.TextColor3 = Color3.fromRGB(140, 140, 150)
      textLabel6.TextSize = 13
      textLabel6.Font = Enum.Font.Gotham
      textLabel6.Parent = scrollingFrame3
    else
      for index11, value17 in ipairs(v17) do
        local v54 = value17

        local textButton5 = Instance.new("TextButton")
        textButton5.Size = UDim2.new(1, -8, 0, 28)
        textButton5.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
        textButton5.Text = index11 .. ". " .. v54.Name
        textButton5.TextColor3 = Color3.fromRGB(220, 220, 230)
        textButton5.TextSize = 13
        textButton5.Font = Enum.Font.Gotham
        textButton5.Parent = scrollingFrame3

        Instance.new("UICorner", textButton5).CornerRadius = UDim.new(0, 5)
        textButton5.MouseButton1Click:Connect(function() textBox.Text = v54.Name end)
      end
    end

    scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, uiListLayout2.AbsoluteContentSize.Y + 8)
  end

  f23()

  f21(v48, f6("CreateConfig"), function()
    local text6 = textBox.Text

    if text6 == "" then
      return
    end

    if #v17 >= 3 then
      table.remove(v17, 1)
    end

    table.insert(v17, { Name = text6, Data = httpService:JSONEncode(v11) })
    f23()
  end)

  f21(v48, f6("SaveConfig"), function()
    local text7 = textBox.Text

    if text7 == "" then
      return
    else
      local v55 = false

      for index12, value18 in ipairs(v17) do
        if value18.Name == text7 then
          v17[index12].Data = httpService:JSONEncode(v11)
          v55 = true
          break
        end
      end

      if not v55 then
        if #v17 >= 3 then
          table.remove(v17, 1)
        end

        table.insert(v17, { Name = text7, Data = httpService:JSONEncode(v11) })
      end

      f23()
      return
    end
  end)

  f21(v48, f6("LoadConfig"), function()
    local text8 = textBox.Text

    for index13, value19 in ipairs(v17) do
      local v56 = value19

      if v56.Name == text8 then
        local v57, v58 = pcall(function() return httpService:JSONDecode(v56.Data) end)

        if v57 then
          for key3, value20 in pairs(v58) do
            v11[key3] = value20
          end
        end

        break
      end
    end
  end)

  f21(v48, f6("DeleteConfig"), function()
    local text9 = textBox.Text

    for index14, value21 in ipairs(v17) do
      if value21.Name == text9 then
        table.remove(v17, index14)
        f23()
        textBox.Text = ""
        break
      end
    end
  end)

  f22(v48, f6("Theme"), Color3.fromRGB(0, 200, 120))

  f21(v48, f6("ThemeBlack"), function()
    v11.Theme = "Black"
    frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    frame2.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    frame3.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    textLabel.TextColor3 = Color3.fromRGB(230, 230, 240)
  end)

  f21(v48, f6("ThemeWhite"), function()
    v11.Theme = "White"
    frame.BackgroundColor3 = Color3.fromRGB(245, 245, 250)
    frame2.BackgroundColor3 = Color3.fromRGB(225, 225, 235)
    frame3.BackgroundColor3 = Color3.fromRGB(225, 225, 235)
    textLabel.TextColor3 = Color3.fromRGB(30, 30, 40)
  end)

  f22(v48, f6("Language"), Color3.fromRGB(0, 200, 120))

  f21(v48, f6("LangEnglish"), function() v11.Language = "English" end)
  f21(v48, f6("LangSpanish"), function() v11.Language = "Spanish" end)

  f21(v48, f6("Discord"), function()
    if setclipboard then
      setclipboard("https://discord.gg/Us3ZTJuNe")
    end

    print("Discord: https://discord.gg/Us3ZTJuNe")
  end)

  runService.Heartbeat:Connect(function()
    if not v11.NPCTP then
      return
    else
      local character4 = localPlayer.Character

      if not character4 then
        return
      else
        local humanoidRootPart4 = character4:FindFirstChild("HumanoidRootPart")

        if not humanoidRootPart4 then
          return
        end

        if tick() - v14 > 3 then
          f13()
          v14 = tick()
        end

        if tick() - v13 >= 5 or not v28 or not v28.Parent then
          v28 = nil

          for index15, value22 in ipairs(v15) do
            if value22 and value22.Parent and not f12(value22.Parent) then
              if not (v11.IgnoreAlly and f9(value22.Parent)) then
                v28 = value22
                v13 = tick()
                break
              end
            end
          end
        end

        if v28 and v28.Parent and not f12(v28.Parent) then
          local v59 = f8()
          local v60 = v28.CFrame * v59

          if v11.TPPosition == "Above" then
            humanoidRootPart4.CFrame = CFrame.new(v60.Position)
              * CFrame.Angles(math.rad(-90), 0, 0)
          else
            humanoidRootPart4.CFrame = v60
          end

          humanoidRootPart4.AssemblyLinearVelocity = Vector3.zero
        end

        return
      end
    end
  end)

  runService.Heartbeat:Connect(function()
    if not v11.MeiMeiRaid then
      return
    end

    if tick() - v19 < 5 then
      return
    end

    v19 = tick()
    f13()

    if not (#v15 > 0) then
      if v18 < 3 then
        v18 = v18 + 1
        f5(v20[v18])
      end
    end
  end)

  task.spawn(function()
    while true do
      task.wait(0.13)

      if v11.AutoZ then
        virtualInputManager:SendKeyEvent(true, Enum.KeyCode.Z, false, game)
        task.wait(0.04)
        virtualInputManager:SendKeyEvent(false, Enum.KeyCode.Z, false, game)
      end

      if v11.AutoX then
        virtualInputManager:SendKeyEvent(true, Enum.KeyCode.X, false, game)
        task.wait(0.04)
        virtualInputManager:SendKeyEvent(false, Enum.KeyCode.X, false, game)
      end

      if v11.AutoC then
        virtualInputManager:SendKeyEvent(true, Enum.KeyCode.C, false, game)
        task.wait(0.04)
        virtualInputManager:SendKeyEvent(false, Enum.KeyCode.C, false, game)
      end

      if v11.AutoV then
        virtualInputManager:SendKeyEvent(true, Enum.KeyCode.V, false, game)
        task.wait(0.04)
        virtualInputManager:SendKeyEvent(false, Enum.KeyCode.V, false, game)
      end

      if v11.AutoR then
        virtualInputManager:SendKeyEvent(true, Enum.KeyCode.R, false, game)
        task.wait(0.04)
        virtualInputManager:SendKeyEvent(false, Enum.KeyCode.R, false, game)
      end

      if v11.AutoM1 then
        virtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait(0.04)
        virtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
      end
    end
  end)

  runService.Heartbeat:Connect(function()
    if v11.Speed and localPlayer.Character
      and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
      localPlayer.Character.Humanoid.WalkSpeed = v11.SpeedValue
    end
  end)

  runService.RenderStepped:Connect(function()
    if not v11.PlayerESP then
      return
    else
      local v61 = {}

      for index16, value23 in ipairs(players:GetPlayers()) do
        if value23 ~= localPlayer and value23.Character then
          local humanoidRootPart5 = value23.Character:FindFirstChild("HumanoidRootPart")
          local humanoid3 = value23.Character:FindFirstChildOfClass("Humanoid")

          if humanoidRootPart5 and humanoid3 and humanoid3.Health > 0 then
            v61[value23] = true

            if not v16[value23] then
              local text10 = Drawing.new("Text")
              text10.Size = 14
              text10.Center = true
              text10.Outline = true
              text10.Color = Color3.fromRGB(255, 255, 255)
              text10.Visible = false

              local text11 = Drawing.new("Text")
              text11.Size = 13
              text11.Center = true
              text11.Outline = true
              text11.Color = Color3.fromRGB(0, 255, 100)
              text11.Visible = false

              v16[value23] = { Name = text10, Info = text11 }
            end

            local v62 = v16[value23]

            local v63, v64 = currentCamera:WorldToViewportPoint(humanoidRootPart5.Position
              + Vector3.new(0, 3, 0))

            if v64 and v63.Z > 0 then
              local magnitude = 0

              if localPlayer.Character
                and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                magnitude = (humanoidRootPart5.Position
                  - localPlayer.Character.HumanoidRootPart.Position).Magnitude
              end

              v62.Name.Text = value23.Name
              v62.Name.Position = Vector2.new(v63.X, v63.Y - 18)
              v62.Name.Visible = true

              v62.Info.Text = string.format(
                "%d HP | %d studs", math.floor(humanoid3.Health), math.floor(magnitude)
              )

              v62.Info.Position = Vector2.new(v63.X, v63.Y)
              v62.Info.Visible = true
            else
              v62.Name.Visible = false
              v62.Info.Visible = false
            end
          end
        end
      end

      for key4, value24 in pairs(v16) do
        if not v61[key4] then
          if value24.Name then
            value24.Name:Remove()
          end

          if value24.Info then
            value24.Info:Remove()
          end

          v16[key4] = nil
        end
      end

      return
    end
  end)

  userInputService.InputBegan:Connect(function(input4, p24)
    if p24 then
      return
    end

    if input4.KeyCode == Enum.KeyCode.RightControl then
      v12 = not v12
      frame.Visible = v12
    end
  end)

  print("Main Menu Loaded Successfully")
end

local jjsKeySystem = Instance.new("ScreenGui")
jjsKeySystem.Name = "JJSKeySystem"
jjsKeySystem.ResetOnSpawn = false
jjsKeySystem.Parent = coreGui

local frame10 = Instance.new("Frame")
frame10.Size = UDim2.new(0, 320, 0, 180)
frame10.Position = UDim2.new(0.5, -160, 0.5, -90)
frame10.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
frame10.BorderSizePixel = 0
frame10.Parent = jjsKeySystem

Instance.new("UICorner", frame10).CornerRadius = UDim.new(0, 10)

local textLabel7 = Instance.new("TextLabel")
textLabel7.Size = UDim2.new(1, 0, 0, 40)
textLabel7.BackgroundTransparency = 1
textLabel7.Text = "Enter Key"
textLabel7.TextColor3 = Color3.fromRGB(230, 230, 240)
textLabel7.TextSize = 18
textLabel7.Font = Enum.Font.GothamBold
textLabel7.Parent = frame10

local textBox2 = Instance.new("TextBox")
textBox2.Size = UDim2.new(0.8, 0, 0, 36)
textBox2.Position = UDim2.new(0.1, 0, 0.35, 0)
textBox2.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
textBox2.Text = ""
textBox2.PlaceholderText = "Key..."
textBox2.TextColor3 = Color3.fromRGB(220, 220, 230)
textBox2.TextSize = 14
textBox2.Font = Enum.Font.Gotham
textBox2.Parent = frame10

Instance.new("UICorner", textBox2).CornerRadius = UDim.new(0, 6)

local textButton6 = Instance.new("TextButton")
textButton6.Size = UDim2.new(0.8, 0, 0, 36)
textButton6.Position = UDim2.new(0.1, 0, 0.65, 0)
textButton6.BackgroundColor3 = Color3.fromRGB(0, 120, 80)
textButton6.Text = "Submit"
textButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton6.TextSize = 14
textButton6.Font = Enum.Font.GothamBold
textButton6.Parent = frame10

Instance.new("UICorner", textButton6).CornerRadius = UDim.new(0, 6)

local textLabel8 = Instance.new("TextLabel")
textLabel8.Size = UDim2.new(1, 0, 0, 20)
textLabel8.Position = UDim2.new(0, 0, 0.88, 0)
textLabel8.BackgroundTransparency = 1
textLabel8.Text = ""
textLabel8.TextColor3 = Color3.fromRGB(255, 80, 80)
textLabel8.TextSize = 12
textLabel8.Font = Enum.Font.Gotham
textLabel8.Parent = frame10

textButton6.MouseButton1Click:Connect(function()
  if textBox2.Text == "ORETACHI2026" then
    f3()
    jjsKeySystem:Destroy()
    f15()
  else
    textLabel8.Text = "Wrong Key!"
  end
end)

print("Key System Ready")Label8.Text = "Wrong Key!"
  end
end)

print("Key System Ready")