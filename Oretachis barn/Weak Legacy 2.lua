-- ============================================================================
-- Deobfuscated by @Arozely on Discord
-- Key system removed by the person using this script
-- Original file was obfuscated — no key required anymore
-- ============================================================================
-- Credit to @Arozely on Discord for the deobfuscation.
-- Key system has been stripped out — script boots directly to the UI.
-- ============================================================================

local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local lighting = game:GetService("Lighting")
local coreGui = game:GetService("CoreGui")
local replicatedStorage = game:GetService("ReplicatedStorage")
local workspaceService = game:GetService("Workspace")
local httpService = game:GetService("HttpService")

-- Deobfuscated by @Arozely on Discord — key system removed
while true do
  task.wait()

  if game:IsLoaded() then
    break
  end
end

task.wait(0.25)
local v1 = true -- [Deobfuscated by @Arozely on Discord] Premium always ON (key system removed)
local localPlayer = players.LocalPlayer
local currentCamera = workspace.CurrentCamera
local arcade = Enum.Font.Arcade

local v2 = {
  Speed = false,
  SpeedValue = 50,
  FlyEnabled = false,
  FlyActive = false,
  FlyValue = 50,
  FlyKey = Enum.KeyCode.F,
  FlyKeyIsMouse = false,
  FlyMouseButton = nil,
  FreeCamEnabled = false,
  FreeCamActive = false,
  FreeCamKey = Enum.KeyCode.X,
  FreeCamKeyIsMouse = false,
  FreeCamMouseButton = nil,
  NoClip = false,
  FullBright = false,
  InfiniteJump = false,
  AutoQuest = false,
  AutoQuestFarm = false,
  LoopQuest = false,
  SelectedQuest = 1,
  TPMode = "Behind",
  TP_X = 3,
  TP_Y = 3,
  TP_Z = 1,
  AutoM1 = false,
  AutoZ = false,
  AutoX = false,
  AutoC = false,
  AutoV = false,
  AutoB = false,
  SkillGap = 2,
  AntiAdmin = false,
  AntiAdminAction = "Kick",
  RageBot = false,
  RageSpeed = 200,
  FPSCounter = false,
  FPSLimit = 60,
  FPSLimitEnabled = false,
  PlayerESP = false,
  ESPName = false,
  ESPNameColor = Color3.fromRGB(255, 255, 255),
  ESPSkeleton = false,
  ESPSkeletonColor = Color3.fromRGB(255, 200, 50),
  ESPHealth = false,
  ESPHealthColor = Color3.fromRGB(0, 255, 80),
  ESPInventory = false,
  AutoSlayerMark = false,
  AutoDemonRegen = false,
  AutoAuraChest = false,
  AutoRabbits = false,
  ForceRespawn = false,
  GP_SkipSpinAnimation = false,
  AutoLoadConfig = false,
  PvP_FarmPlayer = false,
  PvP_Mode = "Behind",
  PvP_X = 3,
  PvP_Y = 3,
  PvP_Z = 1,
  PvP_AutoM1 = false,
  PvP_AutoZ = false,
  PvP_AutoX = false,
  PvP_AutoC = false,
  PvP_AutoV = false,
  PvP_AutoB = false,
  InstaKill = false,
  AutoDungeon = false,
  Dungeon_TPMode = "Behind",
  Dungeon_TP_X = 3,
  Dungeon_TP_Y = 3,
  Dungeon_TP_Z = 1,
  Dungeon_AutoM1 = false,
  Dungeon_AutoZ = false,
  Dungeon_AutoX = false,
  Dungeon_AutoC = false,
  Dungeon_AutoV = false,
  Dungeon_AutoB = false,
  Dungeon_PanicTP = false,
  Dungeon_PanicHP = 5000,
  Dungeon_BackHP = 15000,
}

local v3 = {}
local v4 = {}
local v5 = {}
local v6 = 0
local v7 = false
local v8 = false
local v9 = false
local v10 = true
local v11 = false
local v12 = false
local cframe = CFrame.new()
local v13 = false
local v14 = {}
local v15 = {}
local v16 = {}
local v17 = {}
local v18 = false
local v19 = {}
local v20 = 0
local v21 = 0
local v22 = 0
local vector = Vector3.new(-538.86, 62.09, 588.38)
local vector2 = Vector3.new(-4.12, 3.17, 4.14)
local vector3 = Vector3.new(-399.93, -13.93, -384.7)

local v23 = {
  ["Dungeon Bandit"] = true,
  ["Dungeon Akaza"] = true,
  ["Dungeon Nezuko"] = true,
  ["Dungeon Sanemi"] = true,
  ["Dungeon Zenitsu"] = true,
}

local v24 = {
  { Name = "Zenitsu", Pos = Vector3.new(1299.13, 9.31, -1521.63) },
  { Name = "Muichiro", Pos = Vector3.new(1358.48, 11.85, -1587.57) },
  { Name = "Rengoku", Pos = Vector3.new(662.85, 9.32, 589.4) },
  { Name = "Kokushibo", Pos = Vector3.new(127.77, 112.89, 172.49) },
  { Name = "Yoriichi", Pos = Vector3.new(158.24, 112.89, -343.56) },
  { Name = "Obanai", Pos = Vector3.new(298.32, 104.86, 181.84) },
  { Name = "Sanemi", Pos = Vector3.new(-905.96, 11.86, -905.89) },
  { Name = "Shinobu", Pos = Vector3.new(-919.78, 13.02, -738.32) },
  { Name = "Mitsuri", Pos = Vector3.new(-823.93, 13.02, -741.24) },
  { Name = "Uzui", Pos = Vector3.new(-578.06, 11.86, -541.94) },
  { Name = "Kanao", Pos = Vector3.new(-715.72, 11.43, -481.45) },
  { Name = "Urokodaki", Pos = Vector3.new(-800.12, 13.66, -693.4) },
}

local v25 = {
  { Name = "Douma", Pos = Vector3.new(903.89, 9.8, -1411.3) },
  { Name = "Yahaba & Susamaru", Pos = Vector3.new(967.32, 10.31, -1689.57) },
  { Name = "Nezuko", Pos = Vector3.new(1126.28, 12.35, -1531.32) },
  { Name = "Kaigaku", Pos = Vector3.new(1550.39, 9.41, -1256) },
  { Name = "Enmu", Pos = Vector3.new(1582.69, 9.41, -1246.22) },
  { Name = "Akaza", Pos = Vector3.new(1654.71, 9.41, -1265.25) },
  { Name = "Rui", Pos = Vector3.new(1688.35, 9.41, -1190.62) },
  { Name = "Daki", Pos = Vector3.new(1683.68, 12.72, -1066.8) },
  { Name = "Zohakuten", Pos = Vector3.new(1625.45, 9.41, -1112.52) },
  { Name = "Gyutaro", Pos = Vector3.new(1593.2, 9.41, -1147.92) },
}

local v26 = {
  { Name = "Main Village", Pos = Vector3.new(384.94, 9.4, 639) },
  { Name = "Final Selection", Pos = Vector3.new(-670.5, 9.33, 929.09) },
  { Name = "Black Market", Pos = Vector3.new(-388.24, 77.35, 229.12) },
  { Name = "Demon Slayer Corp", Pos = Vector3.new(-628.89, 9.32, -450.9) },
  { Name = "Danger Zone", Pos = Vector3.new(95.72, 9.32, -881.6) },
  { Name = "Snow Village", Pos = Vector3.new(1020.99, 9.8, -1572.15) },
  { Name = "Demon Cave", Pos = Vector3.new(1608.91, 12.05, -1206.08) },
}

local v27 = {
  { Name = "Ascetic Blade", Pos = Vector3.new(113.9, 9.32, 752) },
  { Name = "Soryu Master", Pos = Vector3.new(-522.67, 58.55, 162.35) },
  { Name = "Kagaya Claus", Pos = Vector3.new(0, 0, 0) },
}

local v28 = {
  {
    Id = 1,
    Display = "Quest 1 - Weak Demons",
    Args = { "Quest Dummy 1", 5, "100 YEN, 500 XP", "WEAK DEMONS", "WEAK DEMON ATTACK" },
    NPCName = "Weak Demon",
    KillNeed = 5,
  },
  {
    Id = 2,
    Display = "Quest 2 - Demons",
    Args = { "Quest Dummy 2", 5, "250 YEN, 3K XP", "DEMONS", "DEMON ATTACK" },
    NPCName = "Demon",
    KillNeed = 5,
  },
  {
    Id = 3,
    Display = "Quest 3 - Winter Demons",
    Args = { "Quest Dummy 3", 5, "400 YEN, 5K XP", "WINTER DEMONS", "WINTER DEMON ATTACK" },
    NPCName = "Winter Demon",
    KillNeed = 5,
  },
  {
    Id = 4,
    Display = "Quest 4 - Strong Demons",
    Args = { "Quest Dummy 4", 5, "700 YEN, 7K XP", "STRONG DEMONS", "STRONG DEMON ATTACK" },
    NPCName = "Strong Demon",
    KillNeed = 5,
  },
  {
    Id = 5,
    Display = "Quest 5 - Lower Moon 6",
    Args = {
      "Quest Dummy 5", 5, "1K YEN, 10K XP", "LOWER MOON DEMONS 6", "LOWER MOON DEMON 6 ATTACK",
    },
    NPCName = "Lower Moon Demon 6",
    KillNeed = 5,
  },
  {
    Id = 6,
    Display = "Quest 6 - Lower Moon 5",
    Args = {
      "Quest Dummy 6", 5, "1.5K YEN, 15K XP", "LOWER MOON DEMONS 5",
      "LOWER MOON DEMON 5 ATTACK",
    },
    NPCName = "Lower Moon Demon 5",
    KillNeed = 5,
  },
  {
    Id = 7,
    Display = "Quest 7 - Lower Moon 4",
    Args = {
      "Quest Dummy 7", 5, "2.5K YEN, 20K XP", "LOWER MOON DEMONS 4",
      "LOWER MOON DEMON 4 ATTACK",
    },
    NPCName = "Lower Moon Demon 4",
    KillNeed = 5,
  },
  {
    Id = 8,
    Display = "Quest 8 - Mutated Demon",
    Args = {
      "Quest Dummy 8", 6, "27.5K YEN, 125.5K XP", "MUTATED DEMON", "MUTATED DEMON ATTACK",
    },
    NPCName = "Mutated Demon",
    KillNeed = 6,
  },
  {
    Id = 9,
    Display = "Quest 9 - Half Speed Art User",
    Args = {
      "Quest Dummy 9", 6, "28K YEN, 131.2K XP", "HALF SPEED ART USER",
      "HALF SPEED ART USER ATTACK",
    },
    NPCName = "Half Speed Art User",
    KillNeed = 6,
  },
  {
    Id = 10,
    Display = "Quest 10 - Speed Art User",
    Args = {
      "Quest Dummy 10", 6, "28.7K YEN, 136.8K XP", "SPEED ART USER", "SPEED ART USER ATTACK",
    },
    NPCName = "Speed Art User",
    KillNeed = 6,
  },
  {
    Id = 11,
    Display = "Quest 11 - Half Dream Manipulation User",
    Args = {
      "Quest Dummy 11", 6, "29K YEN, 140K XP", "HALF DREAM MANIPULATION USER",
      "HALF DREAM MANIPULATION USER ATTACK",
    },
    NPCName = "Half Dream Manipulation User",
    KillNeed = 6,
  },
  {
    Id = 12,
    Display = "Quest 12 - Dream Manipulation User",
    Args = {
      "Quest Dummy 12", 6, "30K YEN, 145K XP", "DREAM MANIPULATION USER",
      "DREAM MANIPULATION USER ATTACK",
    },
    NPCName = "Dream Manipulation User",
    KillNeed = 6,
  },
  {
    Id = 13,
    Display = "Boss Quest 1 - Water Tanjiro",
    Args = { "Quest Boss Dummy 1", 1, "2K YEN, 20K XP", "TANJIRO", "TANJIRO ATTACK" },
    NPCName = "Tanjiro (Water)",
    KillNeed = 1,
  },
  {
    Id = 14,
    Display = "Boss Quest 2 - Rengoku",
    Args = { "Quest Boss Dummy 2", 1, "4K YEN, 25K XP", "RENGOKU", "RENGOKU ATTACK" },
    NPCName = "Rengoku",
    KillNeed = 1,
  },
  {
    Id = 15,
    Display = "Boss Quest 3 - Nezuko",
    Args = { "Quest Boss Dummy 3", 1, "5K YEN, 30K XP", "NEZUKO", "NEZUKO ATTACK" },
    NPCName = "Nezuko",
    KillNeed = 1,
  },
  {
    Id = 16,
    Display = "Boss Quest 4 - Zenitsu",
    Args = { "Quest Boss Dummy 4", 1, "6K YEN, 35K XP", "ZENITSU", "ZENITSU ATTACK" },
    NPCName = "Zenitsu",
    KillNeed = 1,
  },
  {
    Id = 17,
    Display = "Boss Quest 5 - Muichiro",
    Args = { "Quest Boss Dummy 5", 1, "7K YEN, 40K XP", "TOKITO", "TOKITO ATTACK" },
    NPCName = "Tokito",
    KillNeed = 1,
  },
  {
    Id = 18,
    Display = "Boss Quest 6 - Akaza",
    Args = { "Quest Boss Dummy 6", 1, "8K YEN, 45K XP", "AKAZA", "AKAZA ATTACK" },
    NPCName = "Akaza",
    KillNeed = 1,
  },
  {
    Id = 19,
    Display = "Boss Quest 7 - Kaigaku",
    Args = { "Quest Boss Dummy 7", 1, "9K YEN, 50K XP", "KAIGAKU", "KAIGAKU ATTACK" },
    NPCName = "Kaigaku",
    KillNeed = 1,
  },
  {
    Id = 20,
    Display = "Boss Quest 8 - Tengen",
    Args = { "Quest Boss Dummy 8", 1, "10K YEN, 55K XP", "TENGEN", "TENGEN ATTACK" },
    NPCName = "Tengen",
    KillNeed = 1,
  },
  {
    Id = 21,
    Display = "Boss Quest 9 - Gyutaro",
    Args = { "Quest Boss Dummy 9", 1, "12K YEN, 60K XP", "GYUTARO", "GYUTARO ATTACK" },
    NPCName = "Gyutaro",
    KillNeed = 1,
  },
  {
    Id = 22,
    Display = "Boss Quest 10 - Hantengu",
    Args = { "Quest Boss Dummy 10", 1, "15K YEN, 65K XP", "HANTENGU", "HANTENGU ATTACK" },
    NPCName = "Hantengu",
    KillNeed = 1,
  },
  {
    Id = 23,
    Display = "Boss Quest 11 - Shinobu",
    Args = { "Quest Boss Dummy 11", 1, "18K YEN, 70K XP", "SHINOBU", "SHINOBU ATTACK" },
    NPCName = "Shinobu",
    KillNeed = 1,
  },
  {
    Id = 24,
    Display = "Boss Quest 12 - Mitsuri",
    Args = { "Quest Boss Dummy 12", 1, "20K YEN, 80K XP", "MITSURI", "MITSURI ATTACK" },
    NPCName = "Mitsuri",
    KillNeed = 1,
  },
  {
    Id = 25,
    Display = "Boss Quest 13 - Rui",
    Args = { "Quest Boss Dummy 13", 1, "23K YEN, 90K XP", "RUI", "RUI ATTACK" },
    NPCName = "Rui",
    KillNeed = 1,
  },
  {
    Id = 26,
    Display = "Boss Quest 14 - Sanemi",
    Args = { "Quest Boss Dummy 14", 1, "25K YEN, 100K XP", "SANEMI", "SANEMI ATTACK" },
    NPCName = "Sanemi",
    KillNeed = 1,
  },
  {
    Id = 27,
    Display = "Boss Quest 15 - Obanai",
    Args = { "Quest Boss Dummy 15", 1, "27K YEN, 120K XP", "OBANAI", "OBANAI ATTACK" },
    NPCName = "Obanai",
    KillNeed = 1,
  },
  {
    Id = 28,
    Display = "Boss Quest 16 - Tanjiro (Sun)",
    Args = {
      "Quest Boss Dummy 16", 1, "31K YEN, 150K XP", "TANJIRO (SUN)", "TANJIRO (SUN) ATTACK",
    },
    NPCName = "Tanjiro (Sun)",
    KillNeed = 1,
  },
  {
    Id = 29,
    Display = "Boss Quest 17 - Daki",
    Args = { "Quest Boss Dummy 17", 1, "31.5K YEN, 155K XP", "DAKI", "DAKI ATTACK" },
    NPCName = "Daki",
    KillNeed = 1,
  },
  {
    Id = 30,
    Display = "Boss Quest 18 - Kanao",
    Args = { "Quest Boss Dummy 18", 1, "32K YEN, 160K XP", "KANAO", "KANAO ATTACK" },
    NPCName = "Kanao",
    KillNeed = 1,
  },
  {
    Id = 31,
    Display = "Boss Quest 19 - Tomioka",
    Args = { "Quest Boss Dummy 19", 1, "33K YEN, 165K XP", "TOMIOKA", "TOMIOKA ATTACK" },
    NPCName = "Tomioka",
    KillNeed = 1,
  },
  {
    Id = 32,
    Display = "Boss Quest 20 - Yoriichi (Half Form)",
    Args = {
      "Quest Boss Dummy 20", 1, "33.5K YEN, 170K XP", "YORIICHI (HALF FORM)",
      "YORIICHI (HALF FORM) ATTACK",
    },
    NPCName = "Yoriichi (Half Form)",
    KillNeed = 1,
  },
  {
    Id = 33,
    Display = "Boss Quest 21 - Douma",
    Args = { "Quest Boss Dummy 21", 1, "35K YEN, 175K XP", "DOUMA", "DOUMA ATTACK" },
    NPCName = "Douma",
    KillNeed = 1,
  },
  {
    Id = 34,
    Display = "Boss Quest 22 - Susamaru",
    Args = { "Quest Boss Dummy 22", 1, "37K YEN, 180K XP", "SUSAMARU", "SUSAMARU ATTACK" },
    NPCName = "Susamaru",
    KillNeed = 1,
  },
  {
    Id = 35,
    Display = "Boss Quest 23 - Yahaba",
    Args = { "Quest Boss Dummy 23", 1, "39K YEN, 185K XP", "YAHABA", "YAHABA ATTACK" },
    NPCName = "Yahaba",
    KillNeed = 1,
  },
  {
    Id = 36,
    Display = "Boss Quest 24 - Awakened Kaigaku",
    Args = {
      "Quest Boss Dummy 24", 1, "40K YEN, 190K XP", "AWAKENED KAIGAKU",
      "AWAKENED KAIGAKU ATTACK",
    },
    NPCName = "Awakened Kaigaku",
    KillNeed = 1,
  },
  {
    Id = 37,
    Display = "Boss Quest 25 - Awakened Akaza",
    Args = {
      "Quest Boss Dummy 25", 1, "40.5K YEN, 200K XP", "AWAKENED AKAZA", "AWAKENED AKAZA ATTACK",
    },
    NPCName = "Awakened Akaza",
    KillNeed = 1,
  },
  {
    Id = 38,
    Display = "Boss Quest 26 - Awakened Rengoku",
    Args = {
      "Quest Boss Dummy 26", 1, "40.75K YEN, 205K XP", "AWAKENED RENGOKU",
      "AWAKENED RENGOKU ATTACK",
    },
    NPCName = "Awakened Rengoku",
    KillNeed = 1,
  },
  {
    Id = 39,
    Display = "Boss Quest 27 - Inosuke",
    Args = {
      "Quest Boss Dummy 27", 1, "41.25K YEN, 215K XP", "INOSUKE BOSS", "INOSUKE BOSS ATTACK",
    },
    NPCName = "Inosuke",
    KillNeed = 1,
  },
  {
    Id = 40,
    Display = "Farm Only - Kokushibo",
    Args = nil,
    NPCName = "Kokushibo",
    KillNeed = 1,
    NoQuest = true,
  },
  {
    Id = 41,
    Display = "Farm Only - Obanai (Awakened Form)",
    Args = nil,
    NPCName = "Obanai (Awakened Form)",
    KillNeed = 1,
    NoQuest = true,
  },
}

local v29 = {}
local v30 = {}

for index, value in ipairs(v28) do
  if not v30[value.NPCName] then
    v30[value.NPCName] = true
    table.insert(v29, value.NPCName)
  end
end

local function f1(p1)
  if p1 then
    table.insert(v17, p1)
  end

  return p1
end

local function f2()
  local v31 = {}
  local map = workspaceService:FindFirstChild("Map")
  local gifts = map and map:FindFirstChild("Gifts")

  if not gifts then
    return v31
  end

  for index2, value2 in ipairs(gifts:GetChildren()) do
    if value2.Name == "Rabbit" then
      local basePart = value2:IsA("BasePart") and value2

      local findFirstChildWhichIsA = basePart
      findFirstChildWhichIsA = basePart or value2:FindFirstChildWhichIsA("BasePart", true)

      if findFirstChildWhichIsA then
        table.insert(v31, { Part = findFirstChildWhichIsA })
      end
    end
  end

  return v31
end

local function f3(p2, p3, p4, p5, p6)
  local cframe2 = p2.CFrame
  local position = p2.Position

  if p3 == "Front" then
    return cframe2 * CFrame.new(p6, p5, -p4)
  elseif p3 == "Behind" then
    return cframe2 * CFrame.new(p6, p5, p4)
  elseif p3 == "Above" then
    return cframe2 * CFrame.new(p6, p5 + p4, 0) * CFrame.Angles(math.rad(-90), 0, 0)
  else
    if p3 == "Under" then
      return CFrame.new(position + Vector3.new(p6, -(p5 + 2.5), 0), position)
    end

    return cframe2 * CFrame.new(0, p5, p4)
  end
end

local function f4(p7)
  if typeof(isnetworkowner) == "function" then
    local v32, v33 = pcall(function() return isnetworkowner(p7) end)
    return v32 and v33 == true
  end

  return false
end

local f5

local function f6(cframe3)
  local v34 = f5(localPlayer.Character)

  if v34 then
    pcall(function()
      v34.CFrame = cframe3
      v34.AssemblyLinearVelocity = Vector3.zero
      v34.AssemblyAngularVelocity = Vector3.zero
    end)
  end
end

function f5(p8)
  if not p8 then
    return nil
  end

  return p8:FindFirstChild("HumanoidRootPart") or p8:FindFirstChild("Torso")
    or p8:FindFirstChild("UpperTorso") or p8:FindFirstChildWhichIsA("BasePart", true)
end

local function f7()
  local character = localPlayer.Character

  if not character then
    return 0, 0
  else
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if not humanoid then
      return 0, 0
    end

    return humanoid.Health, humanoid.MaxHealth
  end
end

local function f8()
  local v35 = f5(localPlayer.Character)
  return v35 and v35.CFrame or CFrame.new()
end

local v36

local function f9(p9, p10)
  if not v36 then
    return
  end

  pcall(function() v36:SendKeyEvent(true, p9, false, game) end)
  task.wait(p10)
  pcall(function() v36:SendKeyEvent(false, p9, false, game) end)
end

local function f10(p11)
  local character2 = localPlayer.Character

  if not character2 then
    return
  end

  local v37 = f5(character2)

  if not v37 then
    return
  end

  pcall(function()
    v37.AssemblyLinearVelocity = Vector3.zero
    v37.AssemblyAngularVelocity = Vector3.zero
    v37.CFrame = CFrame.new(p11 + Vector3.new(0, 3, 0))
  end)
end

local frame

local function f11()
  if not frame or not frame.Visible then
    return false
  else
    local getMouseLocation = userInputService:GetMouseLocation()
    local absolutePosition = frame.AbsolutePosition
    local absoluteSize = frame.AbsoluteSize

    return getMouseLocation.X >= absolutePosition.X
      and getMouseLocation.X <= absolutePosition.X + absoluteSize.X
      and getMouseLocation.Y >= absolutePosition.Y
      and getMouseLocation.Y <= absolutePosition.Y + absoluteSize.Y
  end
end

local function f12(p12)
  if not p12 or not p12.Model or not p12.Model.Parent then
    return false
  else
    local humanoid2 = p12.Model:FindFirstChildOfClass("Humanoid") or p12.Hum

    if humanoid2 and humanoid2.Health <= 0 then
      return false
    end

    return true
  end
end

local function f13()
  v2.AutoDungeon = false
  v7 = false
  v8 = false
  v9 = false
end

-- NOTE: f14 (saved key reader) removed — deobfuscated by @Arozely on Discord

local function f15()
  local v40 = "Unknown"

  pcall(function()
    if identifyexecutor then
      v40 = identifyexecutor() or "Unknown"
    elseif getexecutorname then
      v40 = getexecutorname() or "Unknown"
    end
  end)

  return tostring(v40)
end

local function f16(p13)
  local v41 = {}
  local charactersAndNPCs = workspaceService:FindFirstChild("CharactersAndNPCs")

  if not charactersAndNPCs then
    return v41
  end

  for index3, value3 in ipairs(charactersAndNPCs:GetChildren()) do
    if value3:IsA("Model") and value3.Name == p13 then
      local humanoid3 = value3:FindFirstChildOfClass("Humanoid")

      if humanoid3 and humanoid3.Health > 0 then
        local root = f5(value3)
        table.insert(v41, { Model = value3, Root = root, Hum = humanoid3 })
      end
    end
  end

  return v41
end

local function f17()
  local v42 = {}
  local charactersAndNPCs2 = workspaceService:FindFirstChild("CharactersAndNPCs")

  if not charactersAndNPCs2 then
    return v42
  end

  for index4, value4 in ipairs(charactersAndNPCs2:GetChildren()) do
    if value4:IsA("Model") and v23[value4.Name] then
      local humanoid4 = value4:FindFirstChildOfClass("Humanoid")

      if humanoid4 and humanoid4.Health > 0 then
        local v43 = f5(value4)

        if v43 then
          table.insert(v42, {
            Model = value4,
            Root = v43,
            Hum = humanoid4,
            Name = value4.Name,
          })
        end
      end
    end
  end

  return v42
end

local function f18(p14)
  local v44 = not p14 or not p14.Args
  local questTake

  if v44 then
    return false
  else
    local events = replicatedStorage:FindFirstChild("Events")
    questTake = events and events:FindFirstChild("QuestTake")

    if not questTake then
      return false
    end

    return pcall(function()
      questTake:FireServer(p14.Args[1], p14.Args[2], p14.Args[3], p14.Args[4], p14.Args[5])
    end)
  end
end

local function f19()
  local v45 = {}
  local map2 = workspaceService:FindFirstChild("Map")
  local gifts2 = map2 and map2:FindFirstChild("Gifts")

  if not gifts2 then
    return v45
  end

  for index5, value5 in ipairs(gifts2:GetChildren()) do
    if value5.Name == "Aura Chest Pickup" then
      local basePart2 = value5:IsA("BasePart") and value5

      local findFirstChildWhichIsA2 = basePart2
      findFirstChildWhichIsA2 = basePart2 or value5:FindFirstChildWhichIsA("BasePart", true)

      if findFirstChildWhichIsA2 then
        table.insert(v45, { Part = findFirstChildWhichIsA2 })
      end
    end
  end

  return v45
end

local v46

local function f20()
  if v46 then
    v46:Disconnect()
    v46 = nil
  end
end

-- NOTE: f21 (saved key writer) removed — deobfuscated by @Arozely on Discord

local function f22()
  local remotes = replicatedStorage:FindFirstChild("Remotes")
  return remotes and remotes:FindFirstChild("LearningAbility")
end

local function f23(p16, value6)
  local gamepasses = localPlayer:FindFirstChild("Gamepasses")

  if not gamepasses then
    return
  end

  local findFirstChild = gamepasses:FindFirstChild(p16)

  if findFirstChild and findFirstChild:IsA("BoolValue") then
    pcall(function() findFirstChild.Value = value6 end)
  end
end

local function f24(p17)
  if f11() then
    return
  end

  if v36 then
    pcall(function()
      v36:SendKeyEvent(true, p17, false, game)
      task.wait(0.05)
      v36:SendKeyEvent(false, p17, false, game)
    end)
  end
end

local function f25(p18, p19)
  if v4[p18] then
    v4[p18]:Disconnect()
    v4[p18] = nil
  end

  local gamepasses2 = localPlayer:FindFirstChild("Gamepasses")

  if not gamepasses2 then
    return
  else
    local findFirstChild2 = gamepasses2:FindFirstChild(p18)

    if not findFirstChild2 or not findFirstChild2:IsA("BoolValue") then
      return
    end

    f23(p18, v2[p19])

    v4[p18] = f1(findFirstChild2.Changed:Connect(function(p20)
      if v2[p19] and p20 == false then
        f23(p18, true)
      end
    end))

    return
  end
end

local function f26(p21)
  if v4[p21] then
    v4[p21]:Disconnect()
    v4[p21] = nil
  end

  f23(p21, false)
end

local v47

local function f27()
  if v47 then
    v47:Disconnect()
    v47 = nil
  end
end

local function f28()
  if v47 then
    return
  end

  v47 = f1(runService.Heartbeat:Connect(function()
    local v48 = not v2.ForceRespawn or v18
    local humanoid5

    if v48 then
      return
    else
      local character3 = localPlayer.Character

      if character3 then
        humanoid5 = character3:FindFirstChildOfClass("Humanoid")

        if humanoid5 and humanoid5.Health > 0 then
          pcall(function() humanoid5.Health = 0 end)
        end
      end

      return
    end
  end))
end

local v49

local function f29()
  if v49 then
    v49:Disconnect()
    v49 = nil
  end
end

local function f30()
  local tool

  if f11() then
    return
  else
    if v36 then
      pcall(function()
        v36:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait(0.02)
        v36:SendMouseButtonEvent(0, 0, 0, false, game, 1)
      end)
    end

    local character4 = localPlayer.Character

    if character4 then
      tool = character4:FindFirstChildOfClass("Tool")

      if tool then
        pcall(function() tool:Activate() end)
      end
    end

    return
  end
end

local function f31(p22)
  if not p22 or p22.NoQuest or not p22.Args then
    return
  else
    local v50 = tick()

    if v50 - v6 < 3.2 then
      task.wait(3.2 - (v50 - v6))
    end

    f18(p22)
    task.wait(3)
    f18(p22)
    v6 = tick()
    return
  end
end

local f32

local function f33(p23)
  if not p23 then
    return
  end

  if v2.AutoQuest and not p23.NoQuest then
    f31(p23)
    task.wait(0.5)
  end

  if not v2.AutoQuestFarm then
    return
  else
    local count = 0
    local count2 = 0

    while v2.AutoQuestFarm and count < p23.KillNeed and count2 < 220 and not v18 do
      count2 = count2 + 1
      local v51 = f16(p23.NPCName)

      if #v51 == 0 then
        task.wait(1)
      else
        local v52 = f5(localPlayer.Character)

        if v52 then
          table.sort(v51, function(p24, p25)
            local position2 = p24.Root and p24.Root.Position or Vector3.zero
            local position3 = p25.Root and p25.Root.Position or Vector3.zero
            return (position2 - v52.Position).Magnitude < (position3 - v52.Position).Magnitude
          end)
        end

        local v53 = v51[1]

        if v53 and f12(v53) then
          if f32(v53, 55, v2.TPMode, v2.TP_X, v2.TP_Y, v2.TP_Z, v2.AutoM1) then
            count = count + 1
          end

          task.wait(0.25)
        else
          task.wait(0.4)
        end
      end

      if not v2.LoopQuest and count >= p23.KillNeed then
        break
      end
    end

    if v2.AutoQuest and not p23.NoQuest and count >= p23.KillNeed then
      task.wait(0.6)
      f31(p23)
    end

    return
  end
end

function f32(p26, p27, p28, p29, p30, p31, p32)
  local v54 = p27 or 60
  local v55 = tick()
  local heartbeat = runService.Heartbeat

  local v56

  v56 = f1(heartbeat:Connect(function()
    if v18 then
      if v56 then
        v56:Disconnect()
      end

      return
    elseif not f12(p26) then
      if v56 then
        v56:Disconnect()
      end

      return
    else
      local root2 = f5(p26.Model) or p26.Root

      if root2 then
        f6(f3(root2, p28 or "Behind", p29 or 3, p30 or 3, p31 or 1))
      end

      return
    end
  end))

  while f12(p26) and tick() - v55 < v54 and not v18 do
    if p32 then
      f30()
    end

    task.wait(0.1)
  end

  if v56 then
    v56:Disconnect()
  end

  return not f12(p26)
end

local f34

local function f35()
  if v2.AutoQuest or v2.AutoQuestFarm then
    f34()
  end
end

function f34()
  if v13 then
    return
  end

  v13 = true

  task.spawn(function()
    while not v18 and (v2.AutoQuest or v2.AutoQuestFarm) do
      local v57 = v28[v2.SelectedQuest]

      if v57 then
        if v2.LoopQuest then
          f33(v57)
          task.wait(0.6)
        else
          f33(v57)

          while not v18 and not v2.LoopQuest and (v2.AutoQuest or v2.AutoQuestFarm) do
            if v2.AutoQuestFarm then
              local v58 = f16(v57.NPCName)

              if #v58 > 0 then
                f32(v58[1], 45, v2.TPMode, v2.TP_X, v2.TP_Y, v2.TP_Z, v2.AutoM1)
              else
                task.wait(1)
              end
            else
              task.wait(2)
            end

            task.wait(0.15)
          end
        end
      else
        task.wait(1)
      end

      task.wait(0.1)
    end

    v13 = false
  end)
end

local v59

local function f36()
  if v59 then
    return
  end

  v59 = f1(runService.Heartbeat:Connect(function()
    if v18 or f11() then
      return
    else
      local v60 = tick()

      if v60 - v20 < v2.SkillGap then
        return
      else
        local v61 = false

        if v2.AutoZ then
          f24(Enum.KeyCode.Z)
          v61 = true
        end

        if v2.AutoX then
          f24(Enum.KeyCode.X)
          v61 = true
        end

        if v2.AutoC then
          f24(Enum.KeyCode.C)
          v61 = true
        end

        if v2.AutoV then
          f24(Enum.KeyCode.V)
          v61 = true
        end

        if v2.AutoB then
          f24(Enum.KeyCode.B)
          v61 = true
        end

        if v61 then
          v20 = v60
        end

        return
      end
    end
  end))
end

local f37

local function f38()
  if v7 then
    return
  end

  v7 = true
  v8 = false
  v9 = false

  task.spawn(function()
    local v62

    while v2.AutoDungeon and not v18 do
      local v63 = f7()

      if v2.Dungeon_PanicTP then
        if not v9 and v63 > 0 and v63 <= v2.Dungeon_PanicHP then
          v9 = true
          f10(vector3)
          task.wait(0.5)
        end

        if v9 then
          if v63 >= v2.Dungeon_BackHP then
            v9 = false
            ::L14628670::
            ::L14705645::

            if not v8 then
              if f37() then
                v8 = true
              else
                for i = 1, 6 do
                  f10(vector)
                  task.wait(0.2)
                end

                task.wait(13)
                v8 = true
              end
            end

            v62 = f17()

            if #v62 == 0 then
              task.wait(1)
            else
              local v64 = f5(localPlayer.Character)

              if v64 then
                table.sort(v62, function(p33, p34)
                  return (p33.Root.Position - v64.Position).Magnitude
                    < (p34.Root.Position - v64.Position).Magnitude
                end)
              end

              local v65 = v62[1]

              if v65 and f12(v65) then
                local connect

                connect = runService.Heartbeat:Connect(function()
                  if not v2.AutoDungeon or v18 or not f12(v65) or v9 then
                    if connect then
                      connect:Disconnect()
                    end

                    return
                  else
                    local root3 = f5(v65.Model) or v65.Root

                    if root3 then
                      f6(f3(
                        root3, v2.Dungeon_TPMode, v2.Dungeon_TP_X, v2.Dungeon_TP_Y,
                        v2.Dungeon_TP_Z
                      ))
                    end

                    return
                  end
                end)

                local v66 = tick()

                while v2.AutoDungeon and f12(v65) and tick() - v66 < 60 and not v18 and not v9 do
                  if v2.Dungeon_AutoM1 then
                    f30()
                  end

                  local v67 = tick()

                  if v67 - v22 >= v2.SkillGap then
                    local v68 = false

                    if v2.Dungeon_AutoZ then
                      f24(Enum.KeyCode.Z)
                      v68 = true
                    end

                    if v2.Dungeon_AutoX then
                      f24(Enum.KeyCode.X)
                      v68 = true
                    end

                    if v2.Dungeon_AutoC then
                      f24(Enum.KeyCode.C)
                      v68 = true
                    end

                    if v2.Dungeon_AutoV then
                      f24(Enum.KeyCode.V)
                      v68 = true
                    end

                    if v2.Dungeon_AutoB then
                      f24(Enum.KeyCode.B)
                      v68 = true
                    end

                    if v68 then
                      v22 = v67
                    end
                  end

                  task.wait(0.1)
                end

                if connect then
                  connect:Disconnect()
                end
              else
                task.wait(0.4)
              end
            end

            task.wait(0.1)
          else
            task.wait(0.3)
          end
        else
          goto L14628670
        end
      else
        goto L14705645
      end
    end

    v7 = false
    v8 = false
    v9 = false
  end)
end

function f37()
  local v69 = f5(localPlayer.Character)

  if not v69 then
    return false
  end

  return (v69.Position - vector2).Magnitude <= 100
end

local function f39()
  if v49 then
    return
  end

  if not v1 then
    return
  end

  v49 = f1(runService.Heartbeat:Connect(function()
    if not v2.InstaKill or v18 then
      return
    else
      local charactersAndNPCs3 = workspaceService:FindFirstChild("CharactersAndNPCs")

      if not charactersAndNPCs3 then
        return
      end

      for key, value7 in pairs(charactersAndNPCs3:GetChildren()) do
        if value7:IsA("Model") and value7 ~= localPlayer.Character and v5[value7.Name] then
          local humanoidRootPart = value7:FindFirstChild("HumanoidRootPart")

          if humanoidRootPart and f4(humanoidRootPart) then
            local humanoid6 = value7:FindFirstChildOfClass("Humanoid")

            if humanoid6 and humanoid6.Health > 0
              and humanoid6.Health <= 0.75 * humanoid6.MaxHealth then
              pcall(function() humanoid6.Health = 0 end)
            end
          end
        end
      end

      return
    end
  end))
end

local name

local function f40()
  if v46 then
    return
  end

  v46 = f1(runService.Heartbeat:Connect(function()
    if not v2.PvP_FarmPlayer or v18 or not name then
      return
    else
      local findFirstChild3 = players:FindFirstChild(name)

      if not findFirstChild3 or not findFirstChild3.Character then
        return
      else
        local v70 = f5(findFirstChild3.Character)
        local character5 = findFirstChild3.Character
        local v71 = not v70
        local humanoid7 = character5:FindFirstChildOfClass("Humanoid")

        if v71 or not humanoid7 or humanoid7.Health <= 0 then
          return
        else
          f6(f3(v70, v2.PvP_Mode, v2.PvP_X, v2.PvP_Y, v2.PvP_Z))

          if v2.PvP_AutoM1 and not f11() then
            f30()
          end

          local v72 = tick()

          if v72 - v21 >= v2.SkillGap and not f11() then
            local v73 = false

            if v2.PvP_AutoZ then
              f24(Enum.KeyCode.Z)
              v73 = true
            end

            if v2.PvP_AutoX then
              f24(Enum.KeyCode.X)
              v73 = true
            end

            if v2.PvP_AutoC then
              f24(Enum.KeyCode.C)
              v73 = true
            end

            if v2.PvP_AutoV then
              f24(Enum.KeyCode.V)
              v73 = true
            end

            if v2.PvP_AutoB then
              f24(Enum.KeyCode.B)
              v73 = true
            end

            if v73 then
              v21 = v72
            end
          end

          return
        end
      end
    end
  end))
end

local v74

local function f41()
  if v74 then
    return
  end

  v74 = f1(runService.Heartbeat:Connect(function()
    if v18 or not v2.AutoM1 or f11() then
      return
    end

    if not v2.AutoQuestFarm then
      f30()
      task.wait(0.08)
    end
  end))
end

local function f42(p35)
  if not p35 then
    return
  end

  f6(p35.CFrame)
  task.wait(1.5)
  f9(Enum.KeyCode.E, 3)
end

local f43

local function f44()
  local v75 = f43()

  if not v75 then
    return
  end

  pcall(function()
    v75:FireServer("Skill", "Demon Slayer Mark", "Release", "FirstPerk", nil, f8())
  end)
end

local function f45()
  local v76 = f43()

  if not v76 then
    return
  end

  pcall(function() v76:FireServer("Skill", "Demon Regeneration", "Hold", "FirstPerk") end)
  task.wait(0.05)

  pcall(function()
    v76:FireServer("Skill", "Demon Regeneration", "Release", "FirstPerk", nil, f8())
  end)
end

function f43()
  local remotes2 = replicatedStorage:FindFirstChild("Remotes")
  return remotes2 and remotes2:FindFirstChild("Attack")
end

local function f46()
  local v77 = f22()

  if not v77 then
    return
  end

  pcall(function() v77:FireServer("TeacherLearning", "Demon Perks", "FirstLearning") end)
end

local function f47()
  local v78 = f22()

  if not v78 then
    return
  end

  pcall(function() v78:FireServer("TeacherLearning", "Human Perks", "FirstLearning") end)
end

local v79

local function f48()
  if v79 then
    return
  end

  task.spawn(function()
    while not v18 do
      if v2.AutoSlayerMark then
        f44()
        task.wait(0.35)
      else
        task.wait(0.4)
      end
    end
  end)

  task.spawn(function()
    while not v18 do
      if v2.AutoDemonRegen then
        f45()
        task.wait(0.5)
      else
        task.wait(0.4)
      end
    end
  end)

  task.spawn(function()
    while not v18 do
      if v2.AutoAuraChest then
        for index6, value8 in ipairs(f19()) do
          if not v2.AutoAuraChest or v18 then
            break
          end

          f42(value8.Part)
          task.wait(0.4)
        end
      end

      task.wait(1)
    end
  end)

  task.spawn(function()
    while not v18 do
      if v2.AutoRabbits then
        for index7, value9 in ipairs(f2()) do
          if not v2.AutoRabbits or v18 then
            break
          end

          f42(value9.Part)
          task.wait(0.4)
        end
      end

      task.wait(1)
    end
  end)

  v79 = true
end

f1(players.PlayerAdded:Connect(function(player) task.wait(0.15) end))

for index8, value10 in ipairs(players:GetPlayers()) do
end

local function f49()
  for key2, value11 in pairs(v19) do
    for key3, value12 in pairs(value11) do
      local v80 = value12

      if key3 == "Lines" then
        for index9, value13 in ipairs(v80) do
          local v81 = value13
          pcall(function() v81:Remove() end)
        end
      else
        pcall(function() v80:Remove() end)
      end
    end
  end

  v19 = {}
end

local v82

local function f50()
  if v82 then
    v82:Disconnect()
    v82 = nil
  end

  local humanoid8 = localPlayer.Character
    and localPlayer.Character:FindFirstChildOfClass("Humanoid")

  if humanoid8 then
    humanoid8.WalkSpeed = 16
  end
end

local v83

local function f51()
  if v83 then
    return
  end

  v83 = f1(runService.RenderStepped:Connect(function(delta)
    if not v2.RageBot or v18 then
      return
    end

    local v84 = f5(localPlayer.Character)

    if v84 then
      pcall(function()
        v84.CFrame = v84.CFrame * CFrame.Angles(0, math.rad(v2.RageSpeed * 6 * delta), 0)
      end)
    end
  end))
end

local v85, bodyVelocity, bodyGyro

local function f52()
  if v85 then
    return
  else
    local character6 = localPlayer.Character

    if not character6 then
      return
    else
      local humanoidRootPart2 = character6:FindFirstChild("HumanoidRootPart")
      local humanoid9 = character6:FindFirstChildOfClass("Humanoid")

      if not humanoidRootPart2 or not humanoid9 then
        return
      end

      bodyVelocity = Instance.new("BodyVelocity")
      bodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyVelocity.Velocity = Vector3.zero
      bodyVelocity.Parent = humanoidRootPart2

      bodyGyro = Instance.new("BodyGyro")
      bodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyGyro.P = 90000
      bodyGyro.Parent = humanoidRootPart2

      humanoid9.PlatformStand = true

      v85 = f1(runService.RenderStepped:Connect(function()
        if not v2.FlyEnabled or not v2.FlyActive or not bodyVelocity or v2.FreeCamActive then
          return
        else
          local cframe4 = currentCamera.CFrame
          local zero = Vector3.zero

          if userInputService:IsKeyDown(Enum.KeyCode.W) then
            zero = zero + cframe4.LookVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.S) then
            zero = zero - cframe4.LookVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.A) then
            zero = zero - cframe4.RightVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.D) then
            zero = zero + cframe4.RightVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.Space) then
            zero = zero + Vector3.new(0, 1, 0)
          end

          if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            zero = zero - Vector3.new(0, 1, 0)
          end

          local v86 = bodyVelocity
          v86.Velocity = zero.Magnitude > 0 and zero.Unit * v2.FlyValue or Vector3.zero

          bodyGyro.CFrame = cframe4
          return
        end
      end))

      return
    end
  end
end

local function f53()
  if v83 then
    v83:Disconnect()
    v83 = nil
  end
end

local function f54()
  if v85 then
    v85:Disconnect()
    v85 = nil
  end

  if bodyVelocity then
    bodyVelocity:Destroy()
    bodyVelocity = nil
  end

  if bodyGyro then
    bodyGyro:Destroy()
    bodyGyro = nil
  end

  local humanoid10 = localPlayer.Character
    and localPlayer.Character:FindFirstChildOfClass("Humanoid")

  if humanoid10 then
    humanoid10.PlatformStand = false
  end
end

local function f55(p36)
  local character7 = localPlayer.Character
  local humanoid11

  if not character7 then
    return
  else
    local humanoidRootPart3 = character7:FindFirstChild("HumanoidRootPart")
    local v87 = not humanoidRootPart3
    humanoid11 = character7:FindFirstChildOfClass("Humanoid")

    if v87 or not humanoid11 then
      return
    end

    if p36 then
      humanoid11.WalkSpeed = 0
      humanoid11.JumpPower = 0

      pcall(function() humanoid11.JumpHeight = 0 end)
      humanoid11.PlatformStand = true

      humanoidRootPart3.Anchored = true
      humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero
    else
      humanoidRootPart3.Anchored = false

      humanoid11.PlatformStand = false
      humanoid11.JumpPower = 50

      pcall(function() humanoid11.JumpHeight = 7.2 end)
      humanoid11.WalkSpeed = v2.Speed and v2.SpeedValue or 16
    end

    return
  end
end

local oretachiFPS, textLabel

local function f56()
  local v88, v89

  if oretachiFPS then
    oretachiFPS.Enabled = true
    return
  else
    oretachiFPS = Instance.new("ScreenGui")
    oretachiFPS.Name = "OretachiFPS"
    oretachiFPS.ResetOnSpawn = false

    pcall(function() oretachiFPS.Parent = coreGui end)

    if not oretachiFPS.Parent then
      oretachiFPS.Parent = localPlayer:WaitForChild("PlayerGui")
    end

    local frame2 = Instance.new("Frame")
    frame2.Size = UDim2.new(0, 90, 0, 28)
    frame2.Position = UDim2.new(0, 12, 0, 12)
    frame2.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    frame2.BorderSizePixel = 0
    frame2.Parent = oretachiFPS

    Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 6)

    textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "FPS: --"
    textLabel.TextColor3 = Color3.fromRGB(80, 255, 140)
    textLabel.TextSize = 14
    textLabel.Font = arcade
    textLabel.Parent = frame2

    local v90 = tick()
    v88 = 0
    v89 = v90

    f1(runService.RenderStepped:Connect(function()
      if not v2.FPSCounter then
        return
      else
        v88 = v88 + 1
        local v91 = tick()

        if v91 - v89 >= 0.5 then
          if textLabel then
            textLabel.Text = "FPS: " .. tostring(math.floor(v88 / (v91 - v89)))
          end

          v88 = 0
          v89 = v91
        end

        return
      end
    end))

    return
  end
end

local function f57()
  if v82 then
    v82:Disconnect()
  end

  v82 = f1(runService.Heartbeat:Connect(function()
    if not v2.Speed or v2.FreeCamActive then
      return
    else
      local humanoid12 = localPlayer.Character
        and localPlayer.Character:FindFirstChildOfClass("Humanoid")

      if humanoid12 and humanoid12.WalkSpeed ~= v2.SpeedValue then
        humanoid12.WalkSpeed = v2.SpeedValue
      end

      return
    end
  end))
end

local function f58()
  if oretachiFPS then
    oretachiFPS.Enabled = false
  end
end

local function f59()
  pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
  lighting.GlobalShadows = false
end

local v92, cameraType, cameraSubject

local function f60()
  if v92 then
    v92:Disconnect()
    v92 = nil
  end

  currentCamera.CameraType = cameraType or Enum.CameraType.Custom

  if cameraSubject then
    currentCamera.CameraSubject = cameraSubject
  end

  userInputService.MouseBehavior = Enum.MouseBehavior.Default
  local character8 = localPlayer.Character

  if character8 then
    local humanoidRootPart4 = character8:FindFirstChild("HumanoidRootPart")
    local humanoid13 = character8:FindFirstChildOfClass("Humanoid")

    if humanoidRootPart4 then
      humanoidRootPart4.Anchored = false
    end

    if humanoid13 then
      humanoid13.PlatformStand = false
      humanoid13.WalkSpeed = 16
    end
  end
end

local v93

local function f61()
  if v93 then
    v93:Disconnect()
    v93 = nil
  end
end

local function f62()
  if v93 then
    v93:Disconnect()
  end

  v93 = f1(runService.Stepped:Connect(function()
    if not v2.NoClip then
      return
    else
      local character9 = localPlayer.Character

      if character9 then
        for index10, value14 in ipairs(character9:GetDescendants()) do
          if value14:IsA("BasePart") then
            value14.CanCollide = false
          end
        end
      end

      return
    end
  end))
end

local function f63(p37)
  if p37 then
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
local wl2

local function f64()
  v18 = true

  for key4 in pairs(v2) do
    if type(v2[key4]) == "boolean" then
      v2[key4] = false
    end
  end

  f26("SkipSpinAnimation")

  pcall(f54)
  pcall(f60)
  pcall(f50)
  pcall(f61)
  pcall(f53)
  pcall(f27)
  pcall(f29)
  pcall(f20)
  pcall(f13)

  f49()

  for index11, value15 in ipairs(v17) do
  end

  if oretachiFPS then
    pcall(function() oretachiFPS:Destroy() end)
  end

  if wl2 then
    pcall(function() wl2:Destroy() end)
  end

  wl2 = nil
  frame = nil
end

local humanoidRootPart5

local function f65()
  if v92 then
    return
  else
    cameraType = currentCamera.CameraType
    cameraSubject = currentCamera.CameraSubject
    currentCamera.CameraType = Enum.CameraType.Scriptable
    f55(true)
    local character10 = localPlayer.Character

    humanoidRootPart5 = character10 and character10:FindFirstChild("HumanoidRootPart")
        and character10.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
      or currentCamera.CFrame.Position

    cframe = currentCamera.CFrame

    v92 = f1(runService.RenderStepped:Connect(function(delta2)
      if not v2.FreeCamEnabled or not v2.FreeCamActive then
        return
      else
        local character11 = localPlayer.Character

        if character11 then
          local humanoidRootPart6 = character11:FindFirstChild("HumanoidRootPart")
          local humanoid14 = character11:FindFirstChildOfClass("Humanoid")

          if humanoidRootPart6 then
            humanoidRootPart6.Anchored = true
            humanoidRootPart6.AssemblyLinearVelocity = Vector3.zero
          end

          if humanoid14 then
            humanoid14.WalkSpeed = 0
            humanoid14.PlatformStand = true
          end
        end

        local zero2 = Vector3.zero
        local rightVector = cframe.RightVector
        local lookVector = cframe.LookVector

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
          humanoidRootPart5 = humanoidRootPart5 + zero2.Unit * isKeyDown * (delta2 * 60)
        end

        local getMouseDelta = userInputService:GetMouseDelta()
        local v94, v95 = cframe:ToEulerAnglesYXZ()

        cframe = CFrame.new(humanoidRootPart5)
          * CFrame.Angles(0, v95 - getMouseDelta.X * 0.003, 0)
          * CFrame.Angles(v94 - getMouseDelta.Y * 0.003, 0, 0)

        currentCamera.CFrame = cframe
        return
      end
    end))

    userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    return
  end
end

local function f66()
  for key5, value16 in pairs(v3) do
    local v96 = key5
    local v97 = value16

    if v2[v96] ~= nil then
      pcall(function() v97(v2[v96] == true) end)
    end
  end

  if v2.Speed then
    f57()
  else
    f50()
  end

  if v2.NoClip then
    f62()
  else
    f61()
  end

  if v2.FullBright then
    f63(true)
  else
    f63(false)
  end

  if v2.RageBot then
    f51()
  else
    f53()
  end

  if v2.FPSCounter then
    f56()
  else
    f58()
  end

  if v2.ForceRespawn then
    f28()
  else
    f27()
  end

  if v2.InstaKill and v1 then
    f39()
  else
    f29()
  end

  if v2.PvP_FarmPlayer then
    f40()
  else
    f20()
  end

  if v2.AutoM1 then
    f41()
  end

  if v2.AutoZ or v2.AutoX or v2.AutoC or v2.AutoV or v2.AutoB then
    f36()
  end

  if v2.AutoQuest or v2.AutoQuestFarm then
    f35()
  end

  if v2.AutoDungeon then
    f38()
  else
    f13()
  end

  if v2.GP_SkipSpinAnimation then
    f25("SkipSpinAnimation", "GP_SkipSpinAnimation")
  else
    f26("SkipSpinAnimation")
  end
end

local v98 = {
  { "Head", "UpperTorso" }, { "UpperTorso", "LowerTorso" }, { "UpperTorso", "LeftUpperArm" },
  { "LeftUpperArm", "LeftLowerArm" }, { "LeftLowerArm", "LeftHand" },
  { "UpperTorso", "RightUpperArm" }, { "RightUpperArm", "RightLowerArm" },
  { "RightLowerArm", "RightHand" }, { "LowerTorso", "LeftUpperLeg" },
  { "LeftUpperLeg", "LeftLowerLeg" }, { "LeftLowerLeg", "LeftFoot" },
  { "LowerTorso", "RightUpperLeg" }, { "RightUpperLeg", "RightLowerLeg" },
  { "RightLowerLeg", "RightFoot" }, { "Head", "Torso" }, { "Torso", "Left Arm" },
  { "Torso", "Right Arm" }, { "Torso", "Left Leg" }, { "Torso", "Right Leg" },
}

local function f67(p38)
  local v99 = {}
  local backpack = p38:FindFirstChild("Backpack")

  if backpack then
    for index12, value17 in ipairs(backpack:GetChildren()) do
      if value17:IsA("Tool") then
        table.insert(v99, value17.Name)
      end
    end
  end

  if p38.Character then
    for index13, value18 in ipairs(p38.Character:GetChildren()) do
      if value18:IsA("Tool") then
        table.insert(v99, value18.Name)
      end
    end
  end

  return #v99 > 0 and table.concat(v99, ", ") or ""
end

local function f68(p39)
  if not p39 then
    return
  end

  p39.Name.Visible = false
  p39.Health.Visible = false
  p39.Inv.Visible = false

  for index14, value19 in ipairs(p39.Lines) do
    value19.Visible = false
  end
end

local function f69(p40)
  if v19[p40] then
    return v19[p40]
  else
    local v100 = {
      Name = Drawing.new("Text"),
      Health = Drawing.new("Text"),
      Inv = Drawing.new("Text"),
      Lines = {},
    }

    v100.Name.Center = true
    v100.Name.Outline = true
    v100.Name.OutlineColor = Color3.new(0, 0, 0)
    v100.Name.Visible = false
    v100.Health.Center = true
    v100.Health.Outline = true
    v100.Health.OutlineColor = Color3.new(0, 0, 0)
    v100.Health.Visible = false
    v100.Inv.Center = true
    v100.Inv.Outline = true
    v100.Inv.OutlineColor = Color3.new(0, 0, 0)
    v100.Inv.Visible = false

    local count3 = 0

    while true do
      count3 = 1 + count3

      if not (14 >= count3) then
        break
      end

      local line = Drawing.new("Line")
      line.Visible = false

      v100.Lines[count3] = line
    end

    v19[p40] = v100
    return v100
  end
end

local function f70()
  if not v2.PlayerESP then
    for key6, value20 in pairs(v19) do
      f68(value20)
    end

    return
  else
    local v101 = f5(localPlayer.Character)

    for index15, value21 in ipairs(players:GetPlayers()) do
      if value21 == localPlayer then
      else
        local v102 = f69(value21)
        local character12 = value21.Character
        local v103 = character12 and f5(character12)
        local humanoid15 = character12 and character12:FindFirstChildOfClass("Humanoid")

        if not v103 or not humanoid15 or humanoid15.Health <= 0 then
          f68(v102)
        else
          local v104, v105 = currentCamera:WorldToViewportPoint(v103.Position)

          if not v105 or v104.Z <= 0 then
            f68(v102)
          else
            local magnitude = v101 and (v103.Position - v101.Position).Magnitude or 50
            local v106 = math.clamp(11 + magnitude / 35, 11, 26)
            local head = character12:FindFirstChild("Head")

            local worldToViewportPoint = head and currentCamera:WorldToViewportPoint(head.Position + Vector3.new(
              0, 0.6, 0
            )) or v104

            local worldToViewportPoint2 = currentCamera:WorldToViewportPoint(v103.Position
              - Vector3.new(0, 3, 0))

            if v2.ESPName then
              v102.Name.Text = value21.Name
              v102.Name.Color = v2.ESPNameColor
              v102.Name.Size = v106
              v102.Name.Position = Vector2.new(v104.X, worldToViewportPoint.Y - v106 - 6)
              v102.Name.Visible = true
            else
              v102.Name.Visible = false
            end

            if v2.ESPHealth then
              v102.Health.Text = string.format(
                "HP %.0f | %dst", humanoid15.Health, math.floor(magnitude)
              )

              v102.Health.Color = v2.ESPHealthColor
              v102.Health.Size = math.max(10, v106 - 2)
              v102.Health.Position = Vector2.new(v104.X, worldToViewportPoint.Y - 2)
              v102.Health.Visible = true
            else
              v102.Health.Visible = false
            end

            if v2.ESPInventory then
              local v107 = f67(value21)

              if v107 ~= "" then
                v102.Inv.Text = v107
                v102.Inv.Color = Color3.fromRGB(255, 220, 120)
                v102.Inv.Size = math.max(10, v106 - 3)
                v102.Inv.Position = Vector2.new(v104.X, worldToViewportPoint2.Y + 4)
                v102.Inv.Visible = true
              else
                v102.Inv.Visible = false
              end
            else
              v102.Inv.Visible = false
            end

            if v2.ESPSkeleton then
              local v108 = 1

              for index16, value22 in ipairs(v98) do
                local findFirstChild4 = character12:FindFirstChild(value22[1], true)
                local findFirstChild5 = character12:FindFirstChild(value22[2], true)

                if findFirstChild4 and findFirstChild5 and findFirstChild4:IsA("BasePart")
                  and findFirstChild5:IsA("BasePart") and v108 <= #v102.Lines then
                  local v109, v110 = currentCamera:WorldToViewportPoint(findFirstChild4.Position)
                  local v111, v112 = currentCamera:WorldToViewportPoint(findFirstChild5.Position)
                  local v113 = v102.Lines[v108]

                  if v110 and v112 and v109.Z > 0 and v111.Z > 0 then
                    v113.From = Vector2.new(v109.X, v109.Y)
                    v113.To = Vector2.new(v111.X, v111.Y)
                    v113.Color = v2.ESPSkeletonColor
                    v113.Thickness = math.clamp(1 + magnitude / 200, 1, 2.5)
                    v113.Visible = true
                  else
                    v113.Visible = false
                  end

                  v108 = v108 + 1
                end
              end

              local v114 = #v102.Lines
              local v115 = v108 - 1

              while true do
                v115 = 1 + v115

                if not (v114 >= v115) then
                  break
                end

                v102.Lines[v115].Visible = false
              end
            else
              for index17, value23 in ipairs(v102.Lines) do
                value23.Visible = false
              end
            end
          end
        end
      end
    end

    return
  end
end

f1(runService.RenderStepped:Connect(function()
  if v2.FullBright then
    f63(true)
  end

  if v2.PlayerESP then
    f70()
  else
    for key7, value24 in pairs(v19) do
      f68(value24)
    end
  end
end))

f1(userInputService.JumpRequest:Connect(function()
  if not v2.InfiniteJump or v2.FreeCamActive then
    return
  end

  local humanoid16 = localPlayer.Character
    and localPlayer.Character:FindFirstChildOfClass("Humanoid")

  if humanoid16 then
    pcall(function() humanoid16:ChangeState(Enum.HumanoidStateType.Jumping) end)
  end
end))

local function f71(parent, text, backgroundColor3, fn)
  local textButton = Instance.new("TextButton")
  textButton.Size = UDim2.new(1, 0, 0, 36)
  textButton.BackgroundColor3 = backgroundColor3
  textButton.Text = text
  textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton.TextSize = 13
  textButton.Font = arcade
  textButton.Parent = parent

  Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 8)
  textButton.MouseButton1Click:Connect(function() fn() end)
end

local characterAdded = localPlayer.CharacterAdded

local function f72(parent2)
  local scrollingFrame = Instance.new("ScrollingFrame")
  scrollingFrame.Size = UDim2.new(0.48, 0, 1, 0)
  scrollingFrame.BackgroundTransparency = 1
  scrollingFrame.BorderSizePixel = 0
  scrollingFrame.ScrollBarThickness = 3
  scrollingFrame.Parent = parent2

  local scrollingFrame2 = Instance.new("ScrollingFrame")
  scrollingFrame2.Size = UDim2.new(0.48, 0, 1, 0)
  scrollingFrame2.Position = UDim2.new(0.52, 0, 0, 0)
  scrollingFrame2.BackgroundTransparency = 1
  scrollingFrame2.BorderSizePixel = 0
  scrollingFrame2.ScrollBarThickness = 3
  scrollingFrame2.Parent = parent2

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

f1(characterAdded:Connect(function()
  task.wait(0.3)

  if v2.FlyActive then
    v2.FlyActive = false
    f54()
  end

  if v2.FreeCamActive then
    v2.FreeCamActive = false
    f60()
  end
end))

local function f73(p41)
  if not pcall(function() p41.Parent = coreGui end) then
    pcall(function() p41.Parent = localPlayer:WaitForChild("PlayerGui") end)
  end
end

local function f74(parent3, text2, p42, fn2)
  local frame3 = Instance.new("Frame")
  frame3.Size = UDim2.new(1, 0, 0, 42)
  frame3.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
  frame3.BorderSizePixel = 0
  frame3.Parent = parent3

  Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 8)

  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(1, -70, 1, 0)
  textLabel2.Position = UDim2.new(0, 12, 0, 0)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = text2
  textLabel2.TextColor3 = Color3.fromRGB(235, 235, 245)
  textLabel2.TextSize = 13
  textLabel2.Font = arcade
  textLabel2.TextXAlignment = Enum.TextXAlignment.Left
  textLabel2.Parent = frame3

  local textButton2 = Instance.new("TextButton")
  textButton2.Size = UDim2.new(0, 48, 0, 24)
  textButton2.Position = UDim2.new(1, -58, 0.5, -12)
  textButton2.BackgroundColor3 = Color3.fromRGB(50, 50, 62)
  textButton2.Text = ""
  textButton2.Parent = frame3

  Instance.new("UICorner", textButton2).CornerRadius = UDim.new(1, 0)
  local v116 = false

  local function f75(p43)
    v116 = p43 and true or false

    textButton2.BackgroundColor3 = v116 and Color3.fromRGB(0, 160, 100)
      or Color3.fromRGB(50, 50, 62)
  end

  if p42 then
    v3[p42] = f75
  end

  textButton2.MouseButton1Click:Connect(function()
    v116 = not v116
    f75(v116)
    fn2(v116)
  end)

  return f75
end

local function f76(parent4, p44, p45, fn3)
  local frame4 = Instance.new("Frame")
  frame4.Size = UDim2.new(1, 0, 0, 42)
  frame4.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
  frame4.BorderSizePixel = 0
  frame4.Parent = parent4

  Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 8)

  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Size = UDim2.new(0.55, 0, 1, 0)
  textLabel3.Position = UDim2.new(0, 12, 0, 0)
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = p44 .. ": " .. p45
  textLabel3.TextColor3 = Color3.fromRGB(235, 235, 245)
  textLabel3.TextSize = 13
  textLabel3.Font = arcade
  textLabel3.TextXAlignment = Enum.TextXAlignment.Left
  textLabel3.Parent = frame4

  local textButton3 = Instance.new("TextButton")
  textButton3.Size = UDim2.new(0, 90, 0, 26)
  textButton3.Position = UDim2.new(1, -100, 0.5, -13)
  textButton3.BackgroundColor3 = Color3.fromRGB(50, 90, 160)
  textButton3.Text = "Set Key"
  textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
  textButton3.Font = arcade
  textButton3.TextSize = 12
  textButton3.Parent = frame4

  Instance.new("UICorner", textButton3).CornerRadius = UDim.new(0, 6)
  textButton3.MouseButton1Click:Connect(function() fn3(textLabel3) end)
  return textLabel3
end

local function f77(parent5, p46, p47, p48, p49, fn4)
  local frame5 = Instance.new("Frame")
  frame5.Size = UDim2.new(1, 0, 0, 62)
  frame5.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
  frame5.BorderSizePixel = 0
  frame5.Parent = parent5

  Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 8)

  local textLabel4 = Instance.new("TextLabel")
  textLabel4.Size = UDim2.new(1, -16, 0, 18)
  textLabel4.Position = UDim2.new(0, 12, 0, 6)
  textLabel4.BackgroundTransparency = 1
  textLabel4.Text = p46 .. ": " .. p49
  textLabel4.TextColor3 = Color3.fromRGB(235, 235, 245)
  textLabel4.TextSize = 13
  textLabel4.Font = arcade
  textLabel4.TextXAlignment = Enum.TextXAlignment.Left
  textLabel4.Parent = frame5

  local frame6 = Instance.new("Frame")
  frame6.Size = UDim2.new(1, -24, 0, 8)
  frame6.Position = UDim2.new(0, 12, 0, 34)
  frame6.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
  frame6.BorderSizePixel = 0
  frame6.Parent = frame5

  Instance.new("UICorner", frame6).CornerRadius = UDim.new(1, 0)

  local frame7 = Instance.new("Frame")
  frame7.Size = UDim2.new((p49 - p47) / (p48 - p47), 0, 1, 0)
  frame7.BackgroundColor3 = Color3.fromRGB(0, 160, 100)
  frame7.BorderSizePixel = 0
  frame7.Parent = frame6

  Instance.new("UICorner", frame7).CornerRadius = UDim.new(1, 0)

  local frame8 = Instance.new("Frame")
  frame8.Size = UDim2.new(0, 18, 0, 18)
  frame8.Position = UDim2.new((p49 - p47) / (p48 - p47), -9, 0.5, -9)
  frame8.BackgroundColor3 = Color3.fromRGB(0, 200, 130)
  frame8.BorderSizePixel = 0
  frame8.Parent = frame6

  Instance.new("UICorner", frame8).CornerRadius = UDim.new(1, 0)
  Instance.new("UIStroke", frame8).Color = Color3.fromRGB(255, 255, 255)

  local v117 = false

  local function f78(p50)
    local v118 = math.clamp((p50.X - frame6.AbsolutePosition.X)
      / math.max(frame6.AbsoluteSize.X, 1), 0, 1)

    frame7.Size = UDim2.new(v118, 0, 1, 0)
    frame8.Position = UDim2.new(v118, -9, 0.5, -9)
    local v119 = math.floor(p47 + (p48 - p47) * v118 + 0.5)
    textLabel4.Text = p46 .. ": " .. v119
    fn4(v119)
  end

  frame8.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
      v117 = true
    end
  end)

  frame6.InputBegan:Connect(function(input2)
    if input2.UserInputType == Enum.UserInputType.MouseButton1 then
      v117 = true
      f78(input2.Position)
    end
  end)

  userInputService.InputEnded:Connect(function(input3)
    if input3.UserInputType == Enum.UserInputType.MouseButton1 then
      v117 = false
    end
  end)

  userInputService.InputChanged:Connect(function(input4)
    if v117 and input4.UserInputType == Enum.UserInputType.MouseMovement then
      f78(input4.Position)
    end
  end)
end

local textLabel5

local function f79(parent6, text3, p51, p52)
  local frame9 = Instance.new("Frame")
  frame9.Size = UDim2.new(1, 0, 0, 40)
  frame9.BackgroundTransparency = 1
  frame9.Parent = parent6

  local textButton4 = Instance.new("TextButton")
  textButton4.Size = UDim2.new(1, 0, 0, 36)
  textButton4.BackgroundColor3 = Color3.fromRGB(55, 55, 62)
  textButton4.Text = ""
  textButton4.AutoButtonColor = false
  textButton4.Parent = frame9

  Instance.new("UICorner", textButton4).CornerRadius = UDim.new(1, 0)

  local textLabel6 = Instance.new("TextLabel")
  textLabel6.Size = UDim2.new(1, -40, 1, 0)
  textLabel6.Position = UDim2.new(0, 16, 0, 0)
  textLabel6.BackgroundTransparency = 1
  textLabel6.Text = text3
  textLabel6.TextColor3 = Color3.fromRGB(230, 230, 235)
  textLabel6.TextSize = 14
  textLabel6.Font = arcade
  textLabel6.TextXAlignment = Enum.TextXAlignment.Left
  textLabel6.Parent = textButton4

  local textLabel7 = Instance.new("TextLabel")
  textLabel7.Size = UDim2.new(0, 24, 0, 24)
  textLabel7.Position = UDim2.new(1, -32, 0.5, -12)
  textLabel7.BackgroundTransparency = 1
  textLabel7.Text = "▼"
  textLabel7.TextColor3 = Color3.fromRGB(220, 40, 40)
  textLabel7.TextSize = 12
  textLabel7.Font = arcade
  textLabel7.Parent = textButton4

  local frame10 = Instance.new("Frame")
  frame10.Size = UDim2.new(1, 0, 0, 0)
  frame10.Position = UDim2.new(0, 0, 0, 40)
  frame10.BackgroundTransparency = 1
  frame10.Visible = false
  frame10.Parent = frame9

  local instance3 = Instance.new("UIListLayout", frame10)
  instance3.Padding = UDim.new(0, 6)

  for index18, value25 in ipairs(p51) do
    local v120 = value25

    local textButton5 = Instance.new("TextButton")
    textButton5.Size = UDim2.new(1, 0, 0, 32)
    textButton5.BackgroundColor3 = Color3.fromRGB(35, 55, 75)
    textButton5.TextColor3 = Color3.fromRGB(230, 240, 255)
    textButton5.TextSize = 12
    textButton5.Font = arcade
    textButton5.Parent = frame10

    Instance.new("UICorner", textButton5).CornerRadius = UDim.new(0, 7)

    if p52 == "quest" then
      textButton5.Text = v120.Display

      textButton5.MouseButton1Click:Connect(function()
        v2.SelectedQuest = v120.Id
        textLabel6.Text = "Select Quest: " .. v120.Display

        if textLabel5 then
          textLabel5.Text = "Selected: " .. v120.Display .. " | NPC: " .. v120.NPCName
        end
      end)
    elseif p52 == "tp" then
      textButton5.Text = v120.Name

      textButton5.MouseButton1Click:Connect(function()
        if v120.Name == "Kagaya Claus" then
          local talkNPC = workspaceService:FindFirstChild("TalkNPC")
          local kagayaClaus = talkNPC and talkNPC:FindFirstChild("KagayaClaus")

          if kagayaClaus then
            local v121 = f5(kagayaClaus)

            if v121 then
              f10(v121.Position)
            end
          end
        else
          f10(v120.Pos)
        end
      end)
    elseif p52 == "action" then
      textButton5.Text = v120.Name

      textButton5.MouseButton1Click:Connect(function()
        v2.AntiAdminAction = v120.Name
        textLabel6.Text = "When Joined: " .. v120.Name
      end)
    end
  end

  local v122 = false

  local function f80()
    if v122 then
      local y = instance3.AbsoluteContentSize.Y
      frame10.Size = UDim2.new(1, 0, 0, y)
      frame9.Size = UDim2.new(1, 0, 0, 40 + y + 4)
      frame10.Visible = true
      textLabel7.Text = "▲"
    else
      frame10.Size = UDim2.new(1, 0, 0, 0)
      frame9.Size = UDim2.new(1, 0, 0, 40)
      frame10.Visible = false
      textLabel7.Text = "▼"
    end
  end

  instance3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    if v122 then
      f80()
    end
  end)

  textButton4.MouseButton1Click:Connect(function()
    v122 = not v122
    f80()
  end)

  return frame9
end

local function f81(parent7, text4, backgroundColor32, fn5)
  local frame11 = Instance.new("Frame")
  frame11.Size = UDim2.new(1, 0, 0, 42)
  frame11.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
  frame11.BorderSizePixel = 0
  frame11.Parent = parent7

  Instance.new("UICorner", frame11).CornerRadius = UDim.new(0, 8)

  local textLabel8 = Instance.new("TextLabel")
  textLabel8.Size = UDim2.new(1, -50, 1, 0)
  textLabel8.Position = UDim2.new(0, 12, 0, 0)
  textLabel8.BackgroundTransparency = 1
  textLabel8.Text = text4
  textLabel8.TextColor3 = Color3.fromRGB(235, 235, 245)
  textLabel8.TextSize = 13
  textLabel8.Font = arcade
  textLabel8.TextXAlignment = Enum.TextXAlignment.Left
  textLabel8.Parent = frame11

  local textButton6 = Instance.new("TextButton")
  textButton6.Size = UDim2.new(0, 28, 0, 28)
  textButton6.Position = UDim2.new(1, -40, 0.5, -14)
  textButton6.BackgroundColor3 = backgroundColor32
  textButton6.Text = ""
  textButton6.Parent = frame11

  Instance.new("UICorner", textButton6).CornerRadius = UDim.new(0, 6)

  local v123 = {
    Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 255, 120), Color3.fromRGB(255, 80, 80),
    Color3.fromRGB(80, 160, 255), Color3.fromRGB(255, 200, 50), Color3.fromRGB(200, 100, 255),
    Color3.fromRGB(255, 140, 0), Color3.fromRGB(0, 220, 220),
  }

  local v124 = 1

  textButton6.MouseButton1Click:Connect(function()
    v124 = v124 % #v123 + 1
    textButton6.BackgroundColor3 = v123[v124]
    fn5(v123[v124])
  end)
end

local function f82(parent8, text5)
  local textLabel9 = Instance.new("TextLabel")
  textLabel9.Size = UDim2.new(1, 0, 0, 56)
  textLabel9.BackgroundColor3 = Color3.fromRGB(40, 32, 18)
  textLabel9.BorderSizePixel = 0
  textLabel9.Text = text5
  textLabel9.TextColor3 = Color3.fromRGB(255, 200, 100)
  textLabel9.TextSize = 11
  textLabel9.Font = arcade
  textLabel9.TextWrapped = true
  textLabel9.Parent = parent8

  Instance.new("UICorner", textLabel9).CornerRadius = UDim.new(0, 6)
  return textLabel9
end

local v125, v126, textLabel10

local function f83()
  f48()

  wl2 = Instance.new("ScreenGui")
  wl2.Name = "WL2"
  wl2.ResetOnSpawn = false
  wl2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

  f73(wl2)

  frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, 740, 0, 580)
  frame.Position = UDim2.new(0.5, -370, 0.5, -290)
  frame.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
  frame.BorderSizePixel = 0
  frame.Active = true
  frame.Visible = true
  frame.Parent = wl2

  Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
  Instance.new("UIStroke", frame).Color = Color3.fromRGB(40, 40, 50)

  local frame12 = Instance.new("Frame")
  frame12.Size = UDim2.new(1, 0, 0, 48)
  frame12.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
  frame12.BorderSizePixel = 0
  frame12.Parent = frame

  Instance.new("UICorner", frame12).CornerRadius = UDim.new(0, 12)

  local textLabel11 = Instance.new("TextLabel")
  textLabel11.Size = UDim2.new(1, -55, 1, 0)
  textLabel11.Position = UDim2.new(0, 16, 0, 0)
  textLabel11.BackgroundTransparency = 1
  -- [Deobfuscated by @Arozely on Discord] — key system removed
  textLabel11.Text = "Oretachi's Weak Legacy 2 [Premium Unlocked — Key Removed]"
  textLabel11.TextColor3 = Color3.fromRGB(240, 240, 250)
  textLabel11.TextSize = 16
  textLabel11.Font = arcade
  textLabel11.TextXAlignment = Enum.TextXAlignment.Left
  textLabel11.Parent = frame12

  local textButton7 = Instance.new("TextButton")
  textButton7.Size = UDim2.new(0, 34, 0, 26)
  textButton7.Position = UDim2.new(1, -44, 0.5, -13)
  textButton7.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
  textButton7.Text = "-"
  textButton7.TextColor3 = Color3.fromRGB(230, 230, 230)
  textButton7.Font = arcade
  textButton7.TextSize = 18
  textButton7.Parent = frame12

  Instance.new("UICorner", textButton7).CornerRadius = UDim.new(0, 6)
  local v127 = false
  local position4, position5

  frame12.InputBegan:Connect(function(input5)
    if input5.UserInputType == Enum.UserInputType.MouseButton1 then
      v127 = true
      position4 = input5.Position
      position5 = frame.Position
    end
  end)

  frame12.InputEnded:Connect(function(input6)
    if input6.UserInputType == Enum.UserInputType.MouseButton1 then
      v127 = false
    end
  end)

  userInputService.InputChanged:Connect(function(input7)
    if v127 and input7.UserInputType == Enum.UserInputType.MouseMovement then
      local v128 = input7.Position - position4

      frame.Position = UDim2.new(
        position5.X.Scale, position5.X.Offset + v128.X, position5.Y.Scale,
        position5.Y.Offset + v128.Y
      )
    end
  end)

  local scrollingFrame3 = Instance.new("ScrollingFrame")
  scrollingFrame3.Size = UDim2.new(1, -20, 0, 36)
  scrollingFrame3.Position = UDim2.new(0, 10, 0, 54)
  scrollingFrame3.BackgroundTransparency = 1
  scrollingFrame3.BorderSizePixel = 0
  scrollingFrame3.ScrollBarThickness = 3
  scrollingFrame3.ScrollingDirection = Enum.ScrollingDirection.X
  scrollingFrame3.CanvasSize = UDim2.new(0, 1200, 0, 0)
  scrollingFrame3.Parent = frame

  local v129 = {}
  local v130 = {}

  local function f84(text6, p53)
    local textButton8 = Instance.new("TextButton")
    textButton8.Size = UDim2.new(0, 100, 0, 30)
    textButton8.Position = UDim2.new(0, p53, 0, 2)
    textButton8.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    textButton8.Text = text6
    textButton8.TextColor3 = Color3.fromRGB(220, 220, 230)
    textButton8.Font = arcade
    textButton8.TextSize = 11
    textButton8.TextWrapped = true
    textButton8.Parent = scrollingFrame3

    Instance.new("UICorner", textButton8).CornerRadius = UDim.new(0, 7)
    return textButton8
  end

  local frame13 = Instance.new("Frame")
  frame13.Size = UDim2.new(1, -20, 1, -102)
  frame13.Position = UDim2.new(0, 10, 0, 96)
  frame13.BackgroundTransparency = 1
  frame13.Parent = frame

  for index19, value26 in ipairs({
    "Player", "Gamepasses", "Auto Quest Farm", "Auto Dungeon", "Auto [General]", "ESP", "PvP",
    "Insta-Kill", "Teleport", "Misc", "Config",
  }) do
    local v131 = value26

    v129[value26] = f84(v131, (index19 - 1) * 104)

    local frame14 = Instance.new("Frame")
    frame14.Size = UDim2.new(1, 0, 1, 0)
    frame14.BackgroundTransparency = 1
    frame14.Visible = value26 == "Player"
    frame14.Parent = frame13

    v130[value26] = frame14
  end

  v129.Player.BackgroundColor3 = Color3.fromRGB(0, 140, 95)

  textLabel10 = Instance.new("TextLabel")
  textLabel10.Size = UDim2.new(0, 400, 0, 18)
  textLabel10.Position = UDim2.new(0, 12, 1, -22)
  textLabel10.BackgroundTransparency = 1
  -- [Deobfuscated by @Arozely on Discord] — key system removed
  textLabel10.Text = "Executor: " .. f15() .. " | Deobfuscated by @Arozely on Discord | Key removed"
  textLabel10.TextColor3 = Color3.fromRGB(120, 120, 140)
  textLabel10.TextSize = 11
  textLabel10.Font = arcade
  textLabel10.TextXAlignment = Enum.TextXAlignment.Left
  textLabel10.Parent = frame

  local v132, v133 = f72(v130.Player)

  f74(v132, "Speed", "Speed", function(p54)
    v2.Speed = p54

    if p54 then
      f57()
    else
      f50()
    end
  end)

  f77(v132, "Speed Value", 1, 1000, 50, function(speedValue) v2.SpeedValue = speedValue end)

  f74(v132, "Fly", "FlyEnabled", function(p55)
    v2.FlyEnabled = p55

    if not p55 then
      v2.FlyActive = false
      f54()
    end
  end)

  f77(v132, "Fly Speed", 1, 1000, 50, function(flyValue) v2.FlyValue = flyValue end)

  v125 = f76(v132, "Fly Key", "F", function(p56)
    v11 = true
    v12 = false

    p56.Text = "Fly Key: ..."
    p56.TextColor3 = Color3.fromRGB(255, 200, 80)
  end)

  f74(v133, "Free Cam", "FreeCamEnabled", function(p57)
    v2.FreeCamEnabled = p57

    if not p57 then
      v2.FreeCamActive = false
      f60()
    end
  end)

  v126 = f76(v133, "Free Cam Key", "X", function(p58)
    v12 = true
    v11 = false

    p58.Text = "Free Cam Key: ..."
    p58.TextColor3 = Color3.fromRGB(255, 200, 80)
  end)

  f74(v133, "No Clip", "NoClip", function(p59)
    v2.NoClip = p59

    if p59 then
      f62()
    else
      f61()
    end
  end)

  f74(v133, "Full Bright", "FullBright", function(p60)
    v2.FullBright = p60
    f63(p60)
  end)

  f74(v133, "Infinite Jump", "InfiniteJump", function(infiniteJump)
    v2.InfiniteJump = infiniteJump
  end)

  f74(f72(v130.Gamepasses), "Skip Spin Animation", "GP_SkipSpinAnimation", function(p61)
    v2.GP_SkipSpinAnimation = p61

    if p61 then
      f25("SkipSpinAnimation", "GP_SkipSpinAnimation")
    else
      f26("SkipSpinAnimation")
    end
  end)

  local v134, v135 = f72(v130["Auto Quest Farm"])

  f82(
    v134,
    "Before opening auto-farm, go near the Boss or NPCs you want to kill. And you're good. Because when you're not near, script cannot teleport to NPCs."
  )

  f79(v134, "Select Quest", v28, "quest")

  f74(v135, "Auto Quest", "AutoQuest", function(autoQuest)
    v2.AutoQuest = autoQuest
    f35()
  end)

  f74(v135, "Auto Quest Farm", "AutoQuestFarm", function(autoQuestFarm)
    v2.AutoQuestFarm = autoQuestFarm
    f35()
  end)

  f74(v135, "Loop Quest", "LoopQuest", function(loopQuest)
    v2.LoopQuest = loopQuest
    f35()
  end)

  textLabel5 = Instance.new("TextLabel")
  textLabel5.Size = UDim2.new(1, 0, 0, 28)
  textLabel5.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
  textLabel5.Text = "Selected: Quest 1 - Weak Demons"
  textLabel5.TextColor3 = Color3.fromRGB(200, 220, 200)
  textLabel5.TextSize = 11
  textLabel5.Font = arcade
  textLabel5.Parent = v135

  Instance.new("UICorner", textLabel5).CornerRadius = UDim.new(0, 6)

  local frame15 = Instance.new("Frame")
  frame15.Size = UDim2.new(1, 0, 0, 36)
  frame15.BackgroundTransparency = 1
  frame15.Parent = v135

  for index20, value27 in ipairs({ "Front", "Behind", "Above", "Under" }) do
    local v136 = value27

    local textButton9 = Instance.new("TextButton")
    textButton9.Size = UDim2.new(0.23, 0, 1, 0)
    textButton9.Position = UDim2.new((index20 - 1) * 0.25, 0, 0, 0)

    textButton9.BackgroundColor3 = v136 == v2.TPMode and Color3.fromRGB(0, 120, 80)
      or Color3.fromRGB(40, 40, 52)

    textButton9.Text = v136
    textButton9.TextColor3 = Color3.fromRGB(230, 230, 240)
    textButton9.TextSize = 11
    textButton9.Font = arcade
    textButton9.Parent = frame15

    Instance.new("UICorner", textButton9).CornerRadius = UDim.new(0, 6)
    v14[v136] = textButton9

    textButton9.MouseButton1Click:Connect(function()
      v2.TPMode = v136

      for key8, value28 in pairs(v14) do
        value28.BackgroundColor3 = key8 == v136 and Color3.fromRGB(0, 120, 80)
          or Color3.fromRGB(40, 40, 52)
      end
    end)
  end

  f77(v135, "X Offset", 1, 10, 3, function(tpX) v2.TP_X = tpX end)
  f77(v135, "Y Offset", 1, 10, 3, function(tpY) v2.TP_Y = tpY end)
  f77(v135, "Z Offset", 1, 10, 1, function(tpZ) v2.TP_Z = tpZ end)

  f74(v135, "Auto M1", "AutoM1", function(p62)
    v2.AutoM1 = p62

    if p62 then
      f41()
    end
  end)

  f74(v135, "Auto Z", "AutoZ", function(p63)
    v2.AutoZ = p63

    if p63 then
      f36()
    end
  end)

  f74(v135, "Auto X", "AutoX", function(p64)
    v2.AutoX = p64

    if p64 then
      f36()
    end
  end)

  f74(v135, "Auto C", "AutoC", function(p65)
    v2.AutoC = p65

    if p65 then
      f36()
    end
  end)

  f74(v135, "Auto V", "AutoV", function(p66)
    v2.AutoV = p66

    if p66 then
      f36()
    end
  end)

  f74(v135, "Auto B", "AutoB", function(p67)
    v2.AutoB = p67

    if p67 then
      f36()
    end
  end)

  f77(v135, "Skill Gap", 1, 10, 2, function(skillGap) v2.SkillGap = skillGap end)
  local v137, v138 = f72(v130["Auto Dungeon"])

  f82(v137, [[
Farm Settings
Bandit / Akaza / Nezuko / Sanemi / Zenitsu]])

  local frame16 = Instance.new("Frame")
  frame16.Size = UDim2.new(1, 0, 0, 36)
  frame16.BackgroundTransparency = 1
  frame16.Parent = v137

  for index21, value29 in ipairs({ "Front", "Behind", "Above", "Under" }) do
    local v139 = value29

    local textButton10 = Instance.new("TextButton")
    textButton10.Size = UDim2.new(0.23, 0, 1, 0)
    textButton10.Position = UDim2.new((index21 - 1) * 0.25, 0, 0, 0)

    textButton10.BackgroundColor3 = v139 == v2.Dungeon_TPMode and Color3.fromRGB(0, 120, 80)
      or Color3.fromRGB(40, 40, 52)

    textButton10.Text = v139
    textButton10.TextColor3 = Color3.fromRGB(230, 230, 240)
    textButton10.TextSize = 11
    textButton10.Font = arcade
    textButton10.Parent = frame16

    Instance.new("UICorner", textButton10).CornerRadius = UDim.new(0, 6)
    v16[v139] = textButton10

    textButton10.MouseButton1Click:Connect(function()
      v2.Dungeon_TPMode = v139

      for key9, value30 in pairs(v16) do
        value30.BackgroundColor3 = key9 == v139 and Color3.fromRGB(0, 120, 80)
          or Color3.fromRGB(40, 40, 52)
      end
    end)
  end

  f77(v137, "X Offset", 1, 10, 3, function(dungeonTPX) v2.Dungeon_TP_X = dungeonTPX end)
  f77(v137, "Y Offset", 1, 10, 3, function(dungeonTPY) v2.Dungeon_TP_Y = dungeonTPY end)
  f77(v137, "Z Offset", 1, 10, 1, function(dungeonTPZ) v2.Dungeon_TP_Z = dungeonTPZ end)

  f74(v137, "Auto M1", "Dungeon_AutoM1", function(dungeonAutoM1)
    v2.Dungeon_AutoM1 = dungeonAutoM1
  end)

  f74(v137, "Auto Z", "Dungeon_AutoZ", function(dungeonAutoZ)
    v2.Dungeon_AutoZ = dungeonAutoZ
  end)

  f74(v137, "Auto X", "Dungeon_AutoX", function(dungeonAutoX)
    v2.Dungeon_AutoX = dungeonAutoX
  end)

  f74(v137, "Auto C", "Dungeon_AutoC", function(dungeonAutoC)
    v2.Dungeon_AutoC = dungeonAutoC
  end)

  f74(v137, "Auto V", "Dungeon_AutoV", function(dungeonAutoV)
    v2.Dungeon_AutoV = dungeonAutoV
  end)

  f74(v137, "Auto B", "Dungeon_AutoB", function(dungeonAutoB)
    v2.Dungeon_AutoB = dungeonAutoB
  end)

  f82(v138, [[
Entry check + 13s wait
Panic TP on low HP]])

  f74(v138, "Auto Dungeon", "AutoDungeon", function(p68)
    v2.AutoDungeon = p68

    if p68 then
      f38()
    else
      f13()
    end
  end)

  f74(v138, "Panic Teleport", "Dungeon_PanicTP", function(dungeonPanicTP)
    v2.Dungeon_PanicTP = dungeonPanicTP
  end)

  f77(v138, "Panic Teleport HP (If lower)", 100, 35000, 5000, function(dungeonPanicHP)
    v2.Dungeon_PanicHP = dungeonPanicHP
  end)

  f77(v138, "Teleport Back HP", 100, 35000, 15000, function(dungeonBackHP)
    v2.Dungeon_BackHP = dungeonBackHP
  end)

  local v140, v141 = f72(v130["Auto [General]"])

  f74(v140, "Auto Slaer Mark", "AutoSlayerMark", function(autoSlayerMark)
    v2.AutoSlayerMark = autoSlayerMark
  end)

  f71(v140, "Learn Slaer Mark", Color3.fromRGB(50, 90, 140), function() f47() end)

  f74(v140, "Auto Demon Regeneration", "AutoDemonRegen", function(autoDemonRegen)
    v2.AutoDemonRegen = autoDemonRegen
  end)

  f71(v140, "Learn Demon Regeneration", Color3.fromRGB(50, 90, 140), function() f46() end)

  f74(v141, "Auto Collect Aura Chest", "AutoAuraChest", function(autoAuraChest)
    v2.AutoAuraChest = autoAuraChest
  end)

  f74(v141, "Auto Collect Rabbits", "AutoRabbits", function(autoRabbits)
    v2.AutoRabbits = autoRabbits
  end)

  f71(v141, "Buy Mugen Ticket", Color3.fromRGB(50, 90, 140), function() end)
  local v142, v143 = f72(v130.ESP)

  f74(v142, "Player ESP", "PlayerESP", function(p69)
    v2.PlayerESP = p69

    if not p69 then
      f49()
    end
  end)

  f74(v142, "Player Name", "ESPName", function(espName) v2.ESPName = espName end)

  f81(v142, "Player Name Color", v2.ESPNameColor, function(espNameColor)
    v2.ESPNameColor = espNameColor
  end)

  f74(v143, "Player Skeleton", "ESPSkeleton", function(espSkeleton)
    v2.ESPSkeleton = espSkeleton
  end)

  f81(v143, "Player Skeleton Color", v2.ESPSkeletonColor, function(espSkeletonColor)
    v2.ESPSkeletonColor = espSkeletonColor
  end)

  f74(v143, "Player Health", "ESPHealth", function(espHealth) v2.ESPHealth = espHealth end)

  f81(v143, "Player Health Color", v2.ESPHealthColor, function(espHealthColor)
    v2.ESPHealthColor = espHealthColor
  end)

  f74(v143, "Player Inventory", "ESPInventory", function(espInventory)
    v2.ESPInventory = espInventory
  end)

  local v144, v145 = f72(v130.PvP)

  local textLabel12 = Instance.new("TextLabel")
  textLabel12.Size = UDim2.new(1, 0, 0, 22)
  textLabel12.BackgroundTransparency = 1
  textLabel12.Text = "Player List"
  textLabel12.TextColor3 = Color3.fromRGB(0, 200, 140)
  textLabel12.TextSize = 14
  textLabel12.Font = arcade
  textLabel12.TextXAlignment = Enum.TextXAlignment.Left
  textLabel12.Parent = v144

  local frame17 = Instance.new("Frame")
  frame17.Size = UDim2.new(1, 0, 0, 200)
  frame17.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
  frame17.BorderSizePixel = 0
  frame17.Parent = v144

  Instance.new("UICorner", frame17).CornerRadius = UDim.new(0, 8)

  local scrollingFrame4 = Instance.new("ScrollingFrame")
  scrollingFrame4.Size = UDim2.new(1, -8, 1, -8)
  scrollingFrame4.Position = UDim2.new(0, 4, 0, 4)
  scrollingFrame4.BackgroundTransparency = 1
  scrollingFrame4.BorderSizePixel = 0
  scrollingFrame4.ScrollBarThickness = 3
  scrollingFrame4.Parent = frame17

  local instance4 = Instance.new("UIListLayout", scrollingFrame4)
  instance4.Padding = UDim.new(0, 4)

  instance4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollingFrame4.CanvasSize = UDim2.new(0, 0, 0, instance4.AbsoluteContentSize.Y + 8)
  end)

  local function f85()
    for index22, value31 in ipairs(scrollingFrame4:GetChildren()) do
      if value31:IsA("TextButton") then
        value31:Destroy()
      end
    end

    for index23, value32 in ipairs(players:GetPlayers()) do
      local v146 = value32

      if v146 ~= localPlayer then
        local textButton11 = Instance.new("TextButton")
        textButton11.Size = UDim2.new(1, 0, 0, 28)

        textButton11.BackgroundColor3 = name == v146.Name and Color3.fromRGB(0, 120, 80)
          or Color3.fromRGB(35, 40, 50)

        textButton11.Text = v146.Name
        textButton11.TextColor3 = Color3.fromRGB(230, 230, 240)
        textButton11.TextSize = 12
        textButton11.Font = arcade
        textButton11.Parent = scrollingFrame4

        Instance.new("UICorner", textButton11).CornerRadius = UDim.new(0, 6)

        textButton11.MouseButton1Click:Connect(function()
          name = v146.Name
          f85()
        end)
      end
    end
  end

  f85()

  f71(v144, "Refresh List", Color3.fromRGB(50, 90, 140), function() f85() end)

  f71(v145, "Teleport to Player", Color3.fromRGB(40, 100, 70), function()
    if not name then
      return
    else
      local findFirstChild6 = players:FindFirstChild(name)

      if findFirstChild6 and findFirstChild6.Character then
        local v147 = f5(findFirstChild6.Character)

        if v147 then
          f10(v147.Position)
        end
      end

      return
    end
  end)

  f74(v145, "Farm Player", "PvP_FarmPlayer", function(p70)
    v2.PvP_FarmPlayer = p70

    if p70 then
      f40()
    else
      f20()
    end
  end)

  local frame18 = Instance.new("Frame")
  frame18.Size = UDim2.new(1, 0, 0, 36)
  frame18.BackgroundTransparency = 1
  frame18.Parent = v145

  for index24, value33 in ipairs({ "Front", "Behind", "Above", "Under" }) do
    local v148 = value33

    local textButton12 = Instance.new("TextButton")
    textButton12.Size = UDim2.new(0.23, 0, 1, 0)
    textButton12.Position = UDim2.new((index24 - 1) * 0.25, 0, 0, 0)

    textButton12.BackgroundColor3 = v148 == v2.PvP_Mode and Color3.fromRGB(0, 120, 80)
      or Color3.fromRGB(40, 40, 52)

    textButton12.Text = v148
    textButton12.TextColor3 = Color3.fromRGB(230, 230, 240)
    textButton12.TextSize = 11
    textButton12.Font = arcade
    textButton12.Parent = frame18

    Instance.new("UICorner", textButton12).CornerRadius = UDim.new(0, 6)
    v15[v148] = textButton12

    textButton12.MouseButton1Click:Connect(function()
      v2.PvP_Mode = v148

      for key10, value34 in pairs(v15) do
        value34.BackgroundColor3 = key10 == v148 and Color3.fromRGB(0, 120, 80)
          or Color3.fromRGB(40, 40, 52)
      end
    end)
  end

  f77(v145, "X Offset", 1, 10, 3, function(pvPX) v2.PvP_X = pvPX end)
  f77(v145, "Y Offset", 1, 10, 3, function(pvPY) v2.PvP_Y = pvPY end)
  f77(v145, "Z Offset", 1, 10, 1, function(pvPZ) v2.PvP_Z = pvPZ end)

  f74(v145, "Auto M1", "PvP_AutoM1", function(pvPAutoM1) v2.PvP_AutoM1 = pvPAutoM1 end)
  f74(v145, "Auto Z", "PvP_AutoZ", function(pvPAutoZ) v2.PvP_AutoZ = pvPAutoZ end)
  f74(v145, "Auto X", "PvP_AutoX", function(pvPAutoX) v2.PvP_AutoX = pvPAutoX end)
  f74(v145, "Auto C", "PvP_AutoC", function(pvPAutoC) v2.PvP_AutoC = pvPAutoC end)
  f74(v145, "Auto V", "PvP_AutoV", function(pvPAutoV) v2.PvP_AutoV = pvPAutoV end)
  f74(v145, "Auto B", "PvP_AutoB", function(pvPAutoB) v2.PvP_AutoB = pvPAutoB end)

  -- [Deobfuscated by @Arozely on Discord] — Insta-Kill unlocked, no key required
  local v149, v150 = f72(v130["Insta-Kill"])

  f82(
    v149,
    "Before opening insta-kill, go near the Boss or NPCs you want to kill. And you're good. Because when you're not near, script cannot teleport to NPCs."
  )

  local textLabel14 = Instance.new("TextLabel")
  textLabel14.Size = UDim2.new(1, 0, 0, 22)
  textLabel14.BackgroundTransparency = 1
  textLabel14.Text = "Select Mobs (incl. Bosses)"
  textLabel14.TextColor3 = Color3.fromRGB(0, 200, 140)
  textLabel14.TextSize = 14
  textLabel14.Font = arcade
  textLabel14.TextXAlignment = Enum.TextXAlignment.Left
  textLabel14.Parent = v149

  f82(v149, [[
Need damage first. Owner required.
Go near target before enabling.]])

  for index25, value35 in ipairs(v29) do
    local v151 = value35

    local frame19 = Instance.new("Frame")
    frame19.Size = UDim2.new(1, 0, 0, 36)
    frame19.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
    frame19.BorderSizePixel = 0
    frame19.Parent = v149

    Instance.new("UICorner", frame19).CornerRadius = UDim.new(0, 8)

    local textLabel15 = Instance.new("TextLabel")
    textLabel15.Size = UDim2.new(1, -50, 1, 0)
    textLabel15.Position = UDim2.new(0, 12, 0, 0)
    textLabel15.BackgroundTransparency = 1
    textLabel15.Text = v151
    textLabel15.TextColor3 = Color3.fromRGB(235, 235, 245)
    textLabel15.TextSize = 12
    textLabel15.Font = arcade
    textLabel15.TextXAlignment = Enum.TextXAlignment.Left
    textLabel15.Parent = frame19

    local textButton13 = Instance.new("TextButton")
    textButton13.Size = UDim2.new(0, 36, 0, 22)
    textButton13.Position = UDim2.new(1, -44, 0.5, -11)
    textButton13.BackgroundColor3 = Color3.fromRGB(50, 50, 62)
    textButton13.Text = ""
    textButton13.Parent = frame19

    Instance.new("UICorner", textButton13).CornerRadius = UDim.new(1, 0)

    textButton13.MouseButton1Click:Connect(function()
      v5[v151] = not v5[v151]

      textButton13.BackgroundColor3 = v5[v151] and Color3.fromRGB(0, 160, 100)
        or Color3.fromRGB(50, 50, 62)
    end)
  end

  f74(v150, "Insta Kill", "InstaKill", function(p71)
    v2.InstaKill = p71

    if p71 then
      f39()
    else
      f29()
    end
  end)

  local scrollingFrame5 = Instance.new("ScrollingFrame")
  scrollingFrame5.Size = UDim2.new(1, 0, 1, 0)
  scrollingFrame5.BackgroundTransparency = 1
  scrollingFrame5.BorderSizePixel = 0
  scrollingFrame5.ScrollBarThickness = 4
  scrollingFrame5.Parent = v130.Teleport

  local instance5 = Instance.new("UIListLayout", scrollingFrame5)
  instance5.Padding = UDim.new(0, 10)

  f79(scrollingFrame5, "Breathings", v24, "tp")
  f79(scrollingFrame5, "Demon Arts", v25, "tp")
  f79(scrollingFrame5, "General Teleportations", v26, "tp")
  f79(scrollingFrame5, "Styles & Special", v27, "tp")

  instance5:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollingFrame5.CanvasSize = UDim2.new(0, 0, 0, instance5.AbsoluteContentSize.Y + 20)
  end)

  local v152, v153 = f72(v130.Misc)
  f74(v152, "Anti-Admin", "AntiAdmin", function(antiAdmin) v2.AntiAdmin = antiAdmin end)

  f79(
    v152, "When Joined: Kick",
    { { Name = "Kick" }, { Name = "Disconnect" }, { Name = "Kick with name" } }, "action"
  )

  f74(v152, "Force Respawn", "ForceRespawn", function(p72)
    v2.ForceRespawn = p72

    if p72 then
      f28()
    else
      f27()
    end
  end)

  f71(v153, "Terminate Script", Color3.fromRGB(140, 40, 40), function() task.defer(f64) end)

  f74(v153, "Rage Bot", "RageBot", function(p73)
    v2.RageBot = p73

    if p73 then
      f51()
    else
      f53()
    end
  end)

  f77(v153, "Rage Spin Speed", 1, 1000, 200, function(rageSpeed) v2.RageSpeed = rageSpeed end)

  f74(v153, "FPS Counter", "FPSCounter", function(p74)
    v2.FPSCounter = p74

    if p74 then
      f56()
    else
      f58()
    end
  end)

  f71(v153, "Potato Graphics", Color3.fromRGB(60, 60, 40), function() f59() end)

  local scrollingFrame6 = Instance.new("ScrollingFrame")
  scrollingFrame6.Size = UDim2.new(1, 0, 1, 0)
  scrollingFrame6.BackgroundTransparency = 1
  scrollingFrame6.BorderSizePixel = 0
  scrollingFrame6.ScrollBarThickness = 4
  scrollingFrame6.Parent = v130.Config

  Instance.new("UIListLayout", scrollingFrame6).Padding = UDim.new(0, 8)

  local textLabel16 = Instance.new("TextLabel")
  textLabel16.Size = UDim2.new(1, 0, 0, 22)
  textLabel16.BackgroundTransparency = 1
  textLabel16.Text = "Configs (basic)"
  textLabel16.TextColor3 = Color3.fromRGB(0, 200, 140)
  textLabel16.TextSize = 14
  textLabel16.Font = arcade
  textLabel16.TextXAlignment = Enum.TextXAlignment.Left
  textLabel16.Parent = scrollingFrame6

  local function f86(p75)
    for key11, value36 in pairs(v130) do
      value36.Visible = key11 == p75
    end

    for key12, value37 in pairs(v129) do
      value37.BackgroundColor3 = key12 == p75 and Color3.fromRGB(0, 140, 95)
        or Color3.fromRGB(35, 35, 45)
    end
  end

  for key13, value38 in pairs(v129) do
    local v154 = key13
    value38.MouseButton1Click:Connect(function() f86(v154) end)
  end

  textButton7.MouseButton1Click:Connect(function()
    v10 = false
    frame.Visible = false
  end)

  userInputService.InputBegan:Connect(function(input8, p76)
    if v11 then
      if input8.UserInputType == Enum.UserInputType.Keyboard then
        v2.FlyKey = input8.KeyCode
        v2.FlyKeyIsMouse = false

        v125.Text = "Fly Key: " .. input8.KeyCode.Name
        v125.TextColor3 = Color3.fromRGB(235, 235, 245)

        v11 = false
        return
      end
    end

    if v12 then
      if input8.UserInputType == Enum.UserInputType.Keyboard then
        v2.FreeCamKey = input8.KeyCode
        v2.FreeCamKeyIsMouse = false

        v126.Text = "Free Cam Key: " .. input8.KeyCode.Name
        v126.TextColor3 = Color3.fromRGB(235, 235, 245)

        v12 = false
        return
      elseif p76 then
        return
      else
        if input8.KeyCode == Enum.KeyCode.RightControl then
          v10 = not v10

          if frame then
            frame.Visible = v10
          end
        end

        if not v2.FlyKeyIsMouse and v2.FlyKey and input8.KeyCode == v2.FlyKey and v2.FlyEnabled then
          v2.FlyActive = not v2.FlyActive

          if v2.FlyActive then
            f52()
          else
            f54()
          end
        end

        if not v2.FreeCamKeyIsMouse and v2.FreeCamKey and input8.KeyCode == v2.FreeCamKey
          and v2.FreeCamEnabled then
          v2.FreeCamActive = not v2.FreeCamActive

          if v2.FreeCamActive then
            f65()
          else
            f60()
          end
        end

        return
      end
    elseif p76 then
      return
    else
      if input8.KeyCode == Enum.KeyCode.RightControl then
        v10 = not v10

        if frame then
          frame.Visible = v10
        end
      end

      if not v2.FlyKeyIsMouse and v2.FlyKey and input8.KeyCode == v2.FlyKey and v2.FlyEnabled then
        v2.FlyActive = not v2.FlyActive

        if v2.FlyActive then
          f52()
        else
          f54()
        end
      end

      if not v2.FreeCamKeyIsMouse and v2.FreeCamKey and input8.KeyCode == v2.FreeCamKey
        and v2.FreeCamEnabled then
        v2.FreeCamActive = not v2.FreeCamActive

        if v2.FreeCamActive then
          f65()
        else
          f60()
        end
      end

      return
    end
  end)

  f66()
  -- [Deobfuscated by @Arozely on Discord] — Key system removed by arozely
  print("[Oretachi's Weak Legacy 2] Loaded | Deobfuscated by @Arozely on Discord | Key removed")
end

-- ============================================================================
-- [Deobfuscated by @Arozely on Discord] — Key system removed by arozely too lol.
-- No key needed. Premium features are unlocked. Boot straight to UI.
-- ============================================================================

v1 = true -- Premium unlocked — [Deobfuscated by @Arozely on Discord]
f83()

print("[Oretachi's Weak Legacy 2] Deobfuscated by @Arozely on Discord | Key system removed | Loaded successfully")
