local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local workspaceService = game:GetService("Workspace")
local coreGui = game:GetService("CoreGui")
local virtualUser = game:GetService("VirtualUser")
local soundService = game:GetService("SoundService")
local debris = game:GetService("Debris")

while true do
  task.wait()

  if game:IsLoaded() then
    break
  end
end

task.wait(0.2)
local localPlayer = players.LocalPlayer
local gothamBold = Enum.Font.GothamBold

local v1 = {
  Role = nil,
  Farming = false,
  Attacking = false,
  AntiAFK = true,
  FastMode = false,
  FlySpeed = 8.75,
  ResetDelay = 30,
  TargetCoords = Vector3.new(0.61, 137.33, 1493.32),
}

local v2 = true

local function f1(p1)
  if not p1 then
    return nil
  end

  return p1:FindFirstChild("HumanoidRootPart") or p1:FindFirstChild("Torso")
    or p1:FindFirstChild("UpperTorso")
end

local textLabel = nil

local function f2(text, p2)
  if textLabel then
    textLabel.Text = text
    local v3 = textLabel
    v3.TextColor3 = p2 or Color3.fromRGB(200, 200, 220)
  end
end

local v4 = false
local v5

local function f3()
  if v5 then
    pcall(function()
      v5:SendMouseButtonEvent(0, 0, 0, true, game, 1)
      task.wait(0.03)
      v5:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end)
  end

  local character = localPlayer.Character
  local tool

  if character then
    tool = character:FindFirstChildOfClass("Tool")

    if tool then
      pcall(function() tool:Activate() end)
    end
  end
end

local function f4(p3)
  if not p3 then
    return
  end

  pcall(function()
    p3.AssemblyLinearVelocity = Vector3.zero
    p3.AssemblyAngularVelocity = Vector3.zero

    if p3:IsA("BasePart") then
      p3.Velocity = Vector3.zero
    end
  end)
end

local function f5()
  local v6, v7 = pcall(function()
    if isfile and isfile("Oretachicooking_Configs/saved_key.txt") and readfile then
      return readfile("Oretachicooking_Configs/saved_key.txt")
    end
  end)

  if v6 and v7 and v7 ~= "" then
    return v7
  end

  return nil
end

local idled = localPlayer.Idled
local v8

local function f6()
  if v8 then
    task.cancel(v8)
    v8 = nil
  end

  v8 = task.delay(v1.ResetDelay, function()
    if v1.Farming and v1.Role == "Alt" then
      pcall(function()
        local knit = replicatedStorage:FindFirstChild("Knit")

        if not knit then
          return
        else
          local services = knit:FindFirstChild("Knit") and knit.Knit:FindFirstChild("Services")
          local joinService = services and services:FindFirstChild("JoinService")
          local re = joinService and joinService:FindFirstChild("RE")
          local change = re and re:FindFirstChild("Change")

          if change then
            change:FireServer("Hakari")
          end

          return
        end
      end)
    end

    v8 = nil
  end)
end

idled:Connect(function()
  if v1.AntiAFK then
    pcall(function()
      virtualUser:CaptureController()
      virtualUser:ClickButton2(Vector2.new())
    end)
  end
end)

local v9, v10

local function f7()
  if v4 then
    return
  end

  v4 = true

  task.spawn(function()
    while v1.Farming and v1.Role == "Alt" do
      local character2 = localPlayer.Character
      local v11 = character2 and f1(character2)

      local humanoid = character2
      humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")

      local character3 = nil
      local v12 = humanoid

      if v9 == "Player" and v10 and v10.Parent then
        character3 = v10.Character
      elseif v9 == "NPC" and v10 and v10.Parent then
        character3 = v10
      end

      if not (v11 and v12 and character3) then
        f2("Waiting for target / character...", Color3.fromRGB(255, 180, 80))
        task.wait(0.3)
      else
        local v13 = f1(character3)

        if not v13 then
          task.wait(0.2)
        else
          pcall(function()
            if v12.Health > 1 then
              v12.Health = 1
            end
          end)

          local flySpeed = v1.FlySpeed
          local v14 = flySpeed * 0.22857142857143
          local v15 = flySpeed * 0.34285714285714
          local seatPart = v12.SeatPart or v11
          f2("Rising...", Color3.fromRGB(100, 200, 255))
          local v16 = seatPart.Position.Y + 400

          while v1.Farming and seatPart and seatPart.Parent and seatPart.Position.Y < v16 do
            if v12.Parent and v12.Health ~= 1 then
              pcall(function() v12.Health = 1 end)
            end

            seatPart.CFrame = seatPart.CFrame + Vector3.new(0, v15, 0)
            f4(seatPart)
            runService.Heartbeat:Wait()
          end

          f2("Aligning above target...", Color3.fromRGB(100, 220, 180))

          while v1.Farming and character3.Parent and v13.Parent and seatPart.Parent do
            if v12.Parent and v12.Health ~= 1 then
              pcall(function() v12.Health = 1 end)
            end

            local position = seatPart.Position
            local vector = Vector3.new(v13.Position.X, position.Y, v13.Position.Z)
            local magnitude = (position - vector).Magnitude

            if magnitude <= 6 then
              break
            end

            seatPart.CFrame = CFrame.new(position
              + (vector - position).Unit * math.min(flySpeed, magnitude))

            f4(seatPart)
            runService.Heartbeat:Wait()
          end

          f2("Locked on target (air)", Color3.fromRGB(80, 255, 120))
          local v17 = false
          local v18 = false

          while v1.Farming and character3.Parent and v13.Parent and seatPart.Parent do
            local v19 = runService.Heartbeat:Wait()

            if v12.Parent and v12.Health ~= 1 then
              pcall(function() v12.Health = 1 end)
            end

            if v18 then
              seatPart.CFrame = seatPart.CFrame - Vector3.new(0, 1000 * v19, 0)
              f4(seatPart)
            else
              local v20 = v13.CFrame * CFrame.new(0, 0, -3.5)
              local magnitude2 = (seatPart.Position - v20.Position).Magnitude

              if magnitude2 > 2 then
                seatPart.CFrame = CFrame.new(seatPart.Position
                  + (v20.Position - seatPart.Position).Unit * math.min(v14, magnitude2), v13.Position)
              else
                seatPart.CFrame = CFrame.new(v20.Position, v13.Position)
                  * CFrame.Angles(0, math.rad(180), 0)

                if v1.FastMode then
                  local characters = workspaceService:FindFirstChild("Characters")

                  local findFirstChild = characters
                  findFirstChild = characters and characters:FindFirstChild(localPlayer.Name)

                  local info = findFirstChild
                  info = findFirstChild and findFirstChild:FindFirstChild("Info")

                  if v12.Health <= 0
                    and (info and info:FindFirstChild("Stun")
                      or info and info:FindFirstChild("Knockback")) then
                    v18 = true
                  end
                end

                if not v17 and v12.Parent and v12.Health > 0 then
                  v17 = true
                  pcall(function() v12:ChangeState(Enum.HumanoidStateType.Dead) end)
                end
              end

              f4(seatPart)
            end
          end

          task.wait(0.15)
        end
      end
    end

    v4 = false
    f2("Farm stopped", Color3.fromRGB(180, 180, 200))
  end)
end

local function f8()
  if v4 then
    return
  end

  v4 = true

  task.spawn(function()
    while v1.Farming and v1.Role == "Killer" do
      local character4 = localPlayer.Character
      local v21 = character4 and f1(character4)

      if not (v21 and character4 and character4:FindFirstChildOfClass("Humanoid")) then
        f2("Waiting for character...", Color3.fromRGB(255, 180, 80))
        task.wait(0.3)
      else
        local targetCoords = v1.TargetCoords
        f2("Rising...", Color3.fromRGB(100, 200, 255))
        local v22 = v21.Position.Y + 250

        while v1.Farming and v21 and v21.Parent and v21.Position.Y < v22 do
          v21.CFrame = v21.CFrame + Vector3.new(0, 5, 0)
          f4(v21)
          runService.Heartbeat:Wait()
        end

        f2("Aligning to coordinates...", Color3.fromRGB(100, 220, 180))

        while v1.Farming and v21 and v21.Parent do
          local vector2 = Vector3.new(targetCoords.X, v21.Position.Y, targetCoords.Z)
          local magnitude3 = (v21.Position - vector2).Magnitude

          if magnitude3 <= 6 then
            break
          end

          v21.CFrame = CFrame.new(v21.Position
            + (vector2 - v21.Position).Unit * math.min(5, magnitude3))

          f4(v21)
          runService.Heartbeat:Wait()
        end

        while v1.Farming and v21 and v21.Parent do
          local magnitude4 = (v21.Position - targetCoords).Magnitude

          if magnitude4 <= 2 then
            v21.CFrame = CFrame.new(targetCoords)
            break
          end

          v21.CFrame = CFrame.new(v21.Position
            + (targetCoords - v21.Position).Unit * math.min(8, magnitude4))

          f4(v21)
          runService.Heartbeat:Wait()
        end

        f2(
          "Holding in air | Attack: " .. (v1.Attacking and "ON" or "OFF"),
          Color3.fromRGB(80, 255, 120)
        )

        while v1.Farming and v21 and v21.Parent and character4.Parent do
          v21.CFrame = CFrame.new(targetCoords + Vector3.new(0, 4, 0))
          f4(v21)

          if v1.Attacking then
            f3()
          end

          runService.Heartbeat:Wait()
        end

        task.wait(0.1)
      end
    end

    v4 = false
    f2("Farm stopped", Color3.fromRGB(180, 180, 200))
  end)
end

local oretachiSJJSFarm, frame, f9

local function f10()
  if oretachiSJJSFarm then
    oretachiSJJSFarm:Destroy()
  end

  oretachiSJJSFarm = Instance.new("ScreenGui")
  oretachiSJJSFarm.Name = "Oretachi's JJS Farm"
  oretachiSJJSFarm.ResetOnSpawn = false
  oretachiSJJSFarm.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

  pcall(function() oretachiSJJSFarm.Parent = coreGui end)

  if not oretachiSJJSFarm.Parent then
    oretachiSJJSFarm.Parent = localPlayer:WaitForChild("PlayerGui")
  end

  frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, 300, 0, 450)
  frame.Position = UDim2.new(0.04, 0, 0.22, 0)
  frame.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
  frame.BorderSizePixel = 0
  frame.Active = true
  frame.Draggable = true
  frame.Parent = oretachiSJJSFarm
  Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(1, 0, 0, 36)
  textLabel2.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
  textLabel2.BorderSizePixel = 0
  textLabel2.Text = "Oretachi's JJS Farm"
  textLabel2.TextColor3 = Color3.fromRGB(240, 240, 250)
  textLabel2.TextSize = 14
  textLabel2.Font = gothamBold
  textLabel2.Parent = frame

  Instance.new("UICorner", textLabel2).CornerRadius = UDim.new(0, 10)

  textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, -16, 0, 40)
  textLabel.Position = UDim2.new(0, 8, 0, 42)
  textLabel.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
  textLabel.BorderSizePixel = 0
  textLabel.Text = "Select a role"
  textLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
  textLabel.TextSize = 12
  textLabel.Font = Enum.Font.Gotham
  textLabel.TextWrapped = true
  textLabel.Parent = frame

  Instance.new("UICorner", textLabel).CornerRadius = UDim.new(0, 6)

  f9(frame, "Role: Not Selected", UDim2.new(0, 8, 0, 90), Color3.fromRGB(50, 90, 150), function(p4)
    if v1.Role == "Alt" then
      v1.Role = "Killer"
      p4.Text = "Role: KILLER (Air Attack)"
      p4.BackgroundColor3 = Color3.fromRGB(160, 50, 50)
    else
      v1.Role = "Alt"
      p4.Text = "Role: ALT (Air Farm)"
      p4.BackgroundColor3 = Color3.fromRGB(40, 120, 80)
    end

    f2("Role: " .. v1.Role, Color3.fromRGB(100, 220, 180))
  end)

  local v23 = f9(
    frame, "Target: Not Selected", UDim2.new(0, 8, 0, 130), Color3.fromRGB(45, 45, 58),
    function() end
  )

  local scrollingFrame = Instance.new("ScrollingFrame")
  scrollingFrame.Size = UDim2.new(1, -16, 0, 110)
  scrollingFrame.Position = UDim2.new(0, 8, 0, 168)
  scrollingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
  scrollingFrame.BorderSizePixel = 0
  scrollingFrame.Visible = false
  scrollingFrame.ScrollBarThickness = 4
  scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
  scrollingFrame.Parent = frame

  Instance.new("UICorner", scrollingFrame).CornerRadius = UDim.new(0, 6)

  local uiListLayout = Instance.new("UIListLayout")
  uiListLayout.Padding = UDim.new(0, 3)
  uiListLayout.Parent = scrollingFrame

  local function f11()
    for index, value in ipairs(scrollingFrame:GetChildren()) do
      if value:IsA("TextButton") then
        value:Destroy()
      end
    end

    local count = 0

    for index2, value2 in ipairs(players:GetPlayers()) do
      local v24 = value2

      if v24 ~= localPlayer then
        count = count + 1

        local textButton = Instance.new("TextButton")
        textButton.Size = UDim2.new(1, -6, 0, 26)
        textButton.BackgroundColor3 = Color3.fromRGB(40, 55, 75)
        textButton.Text = "[PLR] " .. v24.Name
        textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        textButton.TextSize = 11
        textButton.Font = Enum.Font.Gotham
        textButton.Parent = scrollingFrame

        Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 4)

        textButton.MouseButton1Click:Connect(function()
          v9 = "Player"
          v10 = v24
          v23.Text = "Target: " .. v24.Name
          scrollingFrame.Visible = false
        end)
      end
    end

    for index3, value3 in ipairs(workspaceService:GetDescendants()) do
      local v25 = value3

      if v25:IsA("Model") and v25:FindFirstChildOfClass("Humanoid") and f1(v25) then
        if not players:GetPlayerFromCharacter(v25) and v25 ~= localPlayer.Character then
          count = count + 1

          local textButton2 = Instance.new("TextButton")
          textButton2.Size = UDim2.new(1, -6, 0, 26)
          textButton2.BackgroundColor3 = Color3.fromRGB(70, 50, 50)
          textButton2.Text = "[NPC] " .. v25.Name
          textButton2.TextColor3 = Color3.fromRGB(255, 220, 160)
          textButton2.TextSize = 11
          textButton2.Font = Enum.Font.Gotham
          textButton2.Parent = scrollingFrame

          Instance.new("UICorner", textButton2).CornerRadius = UDim.new(0, 4)

          textButton2.MouseButton1Click:Connect(function()
            v9 = "NPC"
            v10 = v25
            v23.Text = "Target: [NPC] " .. v25.Name
            scrollingFrame.Visible = false
          end)
        end
      end
    end

    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, count * 30)
  end

  v23.MouseButton1Click:Connect(function()
    scrollingFrame.Visible = not scrollingFrame.Visible

    if scrollingFrame.Visible then
      f11()
    end
  end)

  local textBox = Instance.new("TextBox")
  textBox.Size = UDim2.new(0.45, -10, 0, 30)
  textBox.Position = UDim2.new(0, 8, 0, 290)
  textBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
  textBox.Text = tostring(v1.FlySpeed)
  textBox.PlaceholderText = "Fly Speed"
  textBox.TextColor3 = Color3.fromRGB(230, 230, 240)
  textBox.TextSize = 12
  textBox.Font = Enum.Font.Gotham
  textBox.Parent = frame

  Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)

  textBox.FocusLost:Connect(function()
    local v26 = tonumber(textBox.Text)

    if v26 and v26 > 0 then
      v1.FlySpeed = v26
    end
  end)

  local textBox2 = Instance.new("TextBox")
  textBox2.Size = UDim2.new(0.45, -10, 0, 30)
  textBox2.Position = UDim2.new(0.55, 0, 0, 290)
  textBox2.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
  textBox2.Text = tostring(v1.ResetDelay)
  textBox2.PlaceholderText = "Reset (s)"
  textBox2.TextColor3 = Color3.fromRGB(230, 230, 240)
  textBox2.TextSize = 12
  textBox2.Font = Enum.Font.Gotham
  textBox2.Parent = frame

  Instance.new("UICorner", textBox2).CornerRadius = UDim.new(0, 6)

  textBox2.FocusLost:Connect(function()
    local v27 = tonumber(textBox2.Text)

    if v27 and v27 >= 0 then
      v1.ResetDelay = v27
    end
  end)

  f9(frame, "Fast Mode: OFF", UDim2.new(0, 8, 0, 328), Color3.fromRGB(70, 50, 50), function(p5)
    v1.FastMode = not v1.FastMode
    p5.Text = "Fast Mode: " .. (v1.FastMode and "ON" or "OFF")

    p5.BackgroundColor3 = v1.FastMode and Color3.fromRGB(40, 120, 70)
      or Color3.fromRGB(70, 50, 50)
  end)

  f9(frame, "Attack: OFF (Killer)", UDim2.new(0, 8, 0, 366), Color3.fromRGB(70, 50, 50), function(p6)
    v1.Attacking = not v1.Attacking
    p6.Text = "Attack: " .. (v1.Attacking and "ON" or "OFF") .. " (Killer)"

    p6.BackgroundColor3 = v1.Attacking and Color3.fromRGB(40, 120, 70)
      or Color3.fromRGB(70, 50, 50)
  end)

  f9(frame, "START FARM", UDim2.new(0, 8, 0, 404), Color3.fromRGB(180, 50, 50), function(p7)
    if v1.Farming then
      v1.Farming = false

      p7.Text = "START FARM"
      p7.BackgroundColor3 = Color3.fromRGB(180, 50, 50)

      if v8 then
        task.cancel(v8)
        v8 = nil
      end

      f2("Stopped", Color3.fromRGB(180, 180, 200))
      return
    end

    if not v1.Role then
      f2("Select a role first!", Color3.fromRGB(255, 100, 100))
      return
    end

    if v1.Role == "Alt" and not v10 then
      f2("Select a target for ALT!", Color3.fromRGB(255, 100, 100))
      return
    end

    v1.Farming = true

    p7.Text = "STOP FARM"
    p7.BackgroundColor3 = Color3.fromRGB(40, 140, 80)

    scrollingFrame.Visible = false

    if v1.Role == "Alt" then
      f6()
      f7()
    else
      f8()
    end
  end)

  userInputService.InputBegan:Connect(function(input, p8)
    if p8 then
      return
    end

    if input.KeyCode == Enum.KeyCode.RightControl then
      v2 = not v2
      frame.Visible = v2
    end
  end)

  localPlayer.CharacterAdded:Connect(function()
    if not v1.Farming then
      return
    end

    task.wait(0.5)

    if v1.Role == "Alt" and v10 then
      f6()
      f7()
    elseif v1.Role == "Killer" then
      f8()
    end
  end)

  print("Oretachi's JJS Farm Loaded")
end

function f9(parent, text2, position2, backgroundColor3, fn)
  local textButton3 = Instance.new("TextButton")
  textButton3.Size = UDim2.new(1, -16, 0, 34)
  textButton3.Position = position2
  textButton3.BackgroundColor3 = backgroundColor3
  textButton3.Text = text2
  textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton3.TextSize = 12
  textButton3.Font = gothamBold
  textButton3.Parent = parent

  Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 7)
  textButton3.MouseButton1Click:Connect(function() fn(textButton3) end)
  return textButton3
end

local function f12()
  local key = Instance.new("ScreenGui")
  key.Name = "Key"
  key.ResetOnSpawn = false

  pcall(function() key.Parent = coreGui end)

  if not key.Parent then
    key.Parent = localPlayer:WaitForChild("PlayerGui")
  end

  local frame2 = Instance.new("Frame")
  frame2.Size = UDim2.new(0, 300, 0, 210)
  frame2.Position = UDim2.new(0.5, -150, 0.5, -105)
  frame2.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
  frame2.BorderSizePixel = 0
  frame2.Parent = key

  Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 10)

  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Size = UDim2.new(1, 0, 0, 36)
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = "Key"
  textLabel3.TextColor3 = Color3.fromRGB(240, 240, 250)
  textLabel3.TextSize = 15
  textLabel3.Font = gothamBold
  textLabel3.Parent = frame2

  local textBox3 = Instance.new("TextBox")
  textBox3.Size = UDim2.new(0.85, 0, 0, 34)
  textBox3.Position = UDim2.new(0.075, 0, 0, 50)
  textBox3.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
  textBox3.PlaceholderText = "Enter key..."
  textBox3.Text = ""
  textBox3.TextColor3 = Color3.fromRGB(230, 230, 240)
  textBox3.TextSize = 13
  textBox3.Font = Enum.Font.Gotham
  textBox3.Parent = frame2

  Instance.new("UICorner", textBox3).CornerRadius = UDim.new(0, 6)

  local textLabel4 = Instance.new("TextLabel")
  textLabel4.Size = UDim2.new(1, 0, 0, 18)
  textLabel4.Position = UDim2.new(0, 0, 0, 90)
  textLabel4.BackgroundTransparency = 1
  textLabel4.Text = ""
  textLabel4.TextColor3 = Color3.fromRGB(255, 80, 80)
  textLabel4.TextSize = 12
  textLabel4.Font = Enum.Font.Gotham
  textLabel4.Parent = frame2

  local textButton4 = Instance.new("TextButton")
  textButton4.Size = UDim2.new(0.85, 0, 0, 34)
  textButton4.Position = UDim2.new(0.075, 0, 0, 118)
  textButton4.BackgroundColor3 = Color3.fromRGB(0, 120, 80)
  textButton4.Text = "Submit"
  textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton4.TextSize = 13
  textButton4.Font = gothamBold
  textButton4.Parent = frame2

  Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 6)

  local textButton5 = Instance.new("TextButton")
  textButton5.Size = UDim2.new(0.85, 0, 0, 30)
  textButton5.Position = UDim2.new(0.075, 0, 0, 160)
  textButton5.BackgroundColor3 = Color3.fromRGB(55, 70, 140)
  textButton5.Text = "Copy Discord"
  textButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton5.TextSize = 12
  textButton5.Font = gothamBold
  textButton5.Parent = frame2

  Instance.new("UICorner", textButton5).CornerRadius = UDim.new(0, 6)

  textButton5.MouseButton1Click:Connect(function()
    if setclipboard then
      setclipboard("https://discord.gg/SfqAPVApd")
      textLabel4.TextColor3 = Color3.fromRGB(80, 220, 120)
      textLabel4.Text = "Discord link copied!"
    else
      textLabel4.TextColor3 = Color3.fromRGB(255, 200, 80)
      textLabel4.Text = "https://discord.gg/SfqAPVApd"
    end
  end)

  textButton4.MouseButton1Click:Connect(function()
    if textBox3.Text == "ORETACHI2026" then
      key:Destroy()
      f10()
    else
      textLabel4.TextColor3 = Color3.fromRGB(255, 80, 80)
      textLabel4.Text = "Wrong Key!"
    end
  end)
end

if f5() == "ORETACHI2026" then
  f10()
else
  f12()
end

print("[Oretachi's JJS Farm] Ready")n
  f10()
else
  f12()
end

print("[Oretachi's JJS Farm] Ready")