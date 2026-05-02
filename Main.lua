-- ╔══════════════════════════════════════════════╗
-- ║          ABACATUDO HUB  v3.0             ║
-- ║   Interface Painel Lateral | Auto Farm       ║
-- ╚══════════════════════════════════════════════╝

-- Load the SystemUI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/kingz7x/AbacatudoHub/refs/heads/main/SystemUI.lua"))()

-- Create Window
local Window = Library:CreateWindow('Abacatudo Hub')

-- Create Tabs
local Tab = {
    Tab_1 = Window:addTab('#Home'),
    Tab_Setting = Window:addTab('#Settings'),
    Tab_Event = Window:addTab('#Events'),
    Tab_2 = Window:addTab('#Main Farm'),
    Tab_SubFarm = Window:addTab('#Subs Farm'),
    Tab_3 = Window:addTab('#Quest'),
    Tab_3_1 = Window:addTab('#Dragon Dojo'),
    Tab_Sea = Window:addTab('#Sea Event'),
    Tab_RaceV4 = Window:addTab('#Race V4'),
    Tab_4 = Window:addTab('#Raids'),
    Tab_Combat = Window:addTab('#PVP'),
    Tab_5 = Window:addTab('#Teleport & Status'),
    Tab_6 = Window:addTab('#Shop'),
    Tab_7 = Window:addTab('#Misc')
}

-- ══ SERVIÇOS ══
local Players = game:GetService('Players')
local RS = game:GetService('ReplicatedStorage')
local TweenService = game:GetService('TweenService')
local RunService = game:GetService('RunService')
local VIM = game:GetService('VirtualInputManager')
local VU = game:GetService('VirtualUser')

local LP = Players.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()
local HRP = Char:WaitForChild('HumanoidRootPart')
local Hum = Char:WaitForChild('Humanoid')
local CommF_ = RS:WaitForChild('Remotes'):WaitForChild('CommF_')

-- ══ FLAGS ══
_G.AutoFarm = false
_G.AutoCombat = false
_G.AutoClick = false
_G.FastAttack = false
_G.AutoQuest = true

-- ══ HOME TAB - CHANGELOG ══
local Home_Left = Tab.Tab_1:addSection()
local Changelog = Home_Left:addMenu("#Changelog")
Changelog:addChangelog('[December, 26 2024]')
Changelog:addChangelog('- Fixed Auto Collect Gift')
Changelog:addChangelog('- Fixed Auto Store Gift')
Changelog:addChangelog('')

Changelog:addChangelog('[December, 25 2024]')
Changelog:addChangelog('- Added NPC Teleport')
Changelog:addChangelog('- Added Candies Shop on Shop')
Changelog:addChangelog('')

Changelog:addChangelog('[December, 25 2024]')
Changelog:addChangelog('- Improve Farming when AFK')
Changelog:addChangelog('- Make it too stable')
Changelog:addChangelog('')

Changelog:addChangelog('[December, 25 2024]')
Changelog:addChangelog('- Added Fast Attack Delay')
Changelog:addChangelog('- Fixed Level Farm 1500-1750')
Changelog:addChangelog('')

Changelog:addChangelog('[December, 25 2024]')
Changelog:addChangelog('- Added Dragon Dojo Tab')
Changelog:addChangelog('- Added Teleport to Prehistoric Island')
Changelog:addChangelog('- Added Prehistoric Island ESP')
Changelog:addChangelog('- Added Auto Farm Tree (Blaze Ember)')
Changelog:addChangelog('- Added Dragon Talon Upgrade')
Changelog:addChangelog('- Fixed Sea Events Selection')
Changelog:addChangelog('- Fixed Aimbot PVP')
Changelog:addChangelog('- Fixed Collect Azure Ember')
Changelog:addChangelog('- Fixed Fast Attack Sword')
Changelog:addChangelog('')

Changelog:addChangelog('[December, 23 2024]')
Changelog:addChangelog('- Remaking Sea Event')
Changelog:addChangelog('- Improve Aimbot Mastery Farm')
Changelog:addChangelog('- Added Dojo Trainer Quest (Beta)')
Changelog:addChangelog('- Added Auto Collect Ember')
Changelog:addChangelog('- Fixing Fast Attack')
Changelog:addChangelog('- Fixing some bug')
Changelog:addChangelog('')

Changelog:addChangelog('[December, 19 2024]')
Changelog:addChangelog('- Fixed Auto Start Raid (Third World)')
Changelog:addChangelog('- Fixed Auto Next Island')
Changelog:addChangelog('- Reduce Lag on Raid')
Changelog:addChangelog('- Fixed Aimbot Mastery Farm')
Changelog:addChangelog('- Fixed Chest Farm')
Changelog:addChangelog('- Added Fast Shoot for Gun')
Changelog:addChangelog('- Improve Fast Attack')
Changelog:addChangelog('')

Changelog:addChangelog('[December, 16 2024]')
Changelog:addChangelog('- Fixed Level Farm 2550 and 2575')
Changelog:addChangelog('- Improve Fast Attack')
Changelog:addChangelog('- Improve Farming')
Changelog:addChangelog('')
Changelog:addChangelog('[December, 16 2024]')
Changelog:addChangelog('- Update Level to 2600')
Changelog:addChangelog('')
Changelog:addChangelog('[April, 06 2024]')
Changelog:addChangelog('- Added Webhook Notifier to Discord')
Changelog:addChangelog('- Added Subs Farming')
Changelog:addChangelog('- Added New Method Mastery Farm')
Changelog:addChangelog('- Added Pirate Raid Castle')
Changelog:addChangelog('- Added Mirage Island Feature')
Changelog:addChangelog('- Added Kitsune Island Feature')
Changelog:addChangelog('- Added PVP Feature')
Changelog:addChangelog('- Added Fruit Notifier (Shop-Devil Fruit)')
Changelog:addChangelog('- Fixed Auto Store Fruit')
Changelog:addChangelog('- Fixed All ESP')
Changelog:addChangelog('- Fixed Gun Mastery Skill')
Changelog:addChangelog('- Changed some function.')
Changelog:addChangelog('')
Changelog:addChangelog('[December, 19 2023]')
Changelog:addChangelog('- Sea Event Menu (Beta)')
Changelog:addChangelog('- Fixed 1st World Farm Lv 375 - 525')
Changelog:addChangelog('- Fixed 2nd World Farm Lv 1250 - 1375')
Changelog:addChangelog('- Fixed Raid Chip Buy')
Changelog:addChangelog('- Change Button to Toggle for Auto Raid')
Changelog:addChangelog('- Fixed Chest Farm')
Changelog:addChangelog('- Fixed Auto Dough King')
Changelog:addChangelog('- Fixed Auto Buy Fruit on Shop')
Changelog:addChangelog('')
Changelog:addChangelog('[November, 11 2023]')
Changelog:addChangelog('- Fixed Auto Farm Level')
Changelog:addChangelog('- Fixed Observation Farm')
Changelog:addChangelog('- Fixed Dough King Farm')
Changelog:addChangelog('')
Changelog:addChangelog('[October, 30 2023 - UPDATE 20]')
Changelog:addChangelog('- Fixed Mobs Index Farm')
Changelog:addChangelog('')
Changelog:addChangelog("[October, 25 2023 - UPDATE 20]")
Changelog:addChangelog('- Added Quest List')
Changelog:addChangelog('- Fast Attack Default Changed')
Changelog:addChangelog('- Fixed some minor bugs')
Changelog:addChangelog('')
Changelog:addChangelog("[October, 23 2023 - UPDATE 20]")
Changelog:addChangelog('- Changed UI')
Changelog:addChangelog('- New Level Farm')
Changelog:addChangelog('- Improve Farm')
Changelog:addChangelog('- Fixed Some bug issued')

-- Home Right Section
local Home_Right = Tab.Tab_1:addSection()
local Main_Home = Home_Right:addMenu("#Home")

-- Status Info
local Status = Home_Right:addMenu("#Status")
Status:addLabel('💫 Abacatudo Hub v3.0')
Status:addLabel('📊 Level: --')
Status:addLabel('⚔ Mob: --')
Status:addLabel('🌊 Sea: --')
Status:addLabel('⚙ Status: Parado')

-- Main Farm Section
local Farm_Section = Tab.Tab_2:addSection()
local Farm_Main = Farm_Section:addMenu("#Main Farm")

-- Add toggles for main farm features
Farm_Main:addToggle('Auto Farm', false, function(state)
    _G.AutoFarm = state
    if state then
        _G.FastAttack = true
    end
end)

Farm_Main:addToggle('Auto Quest', true, function(state)
    _G.AutoQuest = state
end)

Farm_Main:addToggle('Fast Attack', false, function(state)
    _G.FastAttack = state
end)

Farm_Main:addToggle('Auto Click', false, function(state)
    _G.AutoClick = state
end)

-- Combat Section
local Combat_Section = Tab.Tab_Combat:addSection()
local Combat_Menu = Combat_Section:addMenu("#PVP")

Combat_Menu:addToggle('Auto Combat', false, function(state)
    _G.AutoCombat = state
end)

Combat_Menu:addToggle('Fast Attack', false, function(state)
    _G.FastAttack = state
end)

Combat_Menu:addToggle('Auto Click', false, function(state)
    _G.AutoClick = state
end)

-- Settings Section
local Settings_Section = Tab.Tab_Setting:addSection()
local Settings_Menu = Settings_Section:addMenu("#Settings")

Settings_Menu:addLabel('🥑 Abacatudo Hub v3.0')
Settings_Menu:addLabel('🎮 Blox Fruits — Sea 1 e Sea 2')
Settings_Menu:addLabel('⚔ Auto Farm do Lv 1 ao Lv 999')
Settings_Menu:addLabel('🌊 Troca automática para Sea 2 no Lv 700')
Settings_Menu:addLabel('🗡 Auto Combat com Skills Z X C V')
Settings_Menu:addLabel('⚡ Fast Attack reduz delay de ataque')

-- Quest Section
local Quest_Section = Tab.Tab_3:addSection()
local Quest_Menu = Quest_Section:addMenu("#Quest")

Quest_Menu:addToggle('Auto Quest', true, function(state)
    _G.AutoQuest = state
end)

Quest_Menu:addToggle('Auto Complete Quest', false, function(state)
    _G.AutoCompleteQuest = state
end)

-- Events Section
local Event_Section = Tab.Tab_Event:addSection()
local Event_Menu = Event_Section:addMenu("#Events")

Event_Menu:addToggle('Auto Sea Event', false, function(state)
    _G.AutoSeaEvent = state
end)

Event_Menu:addToggle('Auto Collect Gift', false, function(state)
    _G.AutoCollectGift = state
end)

-- Dragon Dojo Section
local Dojo_Section = Tab.Tab_3_1:addSection()
local Dojo_Menu = Dojo_Section:addMenu("#Dragon Dojo")

Dojo_Menu:addToggle('Auto Farm Tree', false, function(state)
    _G.AutoFarmTree = state
end)

Dojo_Menu:addToggle('Dragon Talon Upgrade', false, function(state)
    _G.DragonTalon = state
end)

-- Sea Event Section
local Sea_Section = Tab.Tab_Sea:addSection()
local Sea_Menu = Sea_Section:addMenu("#Sea Event")

Sea_Menu:addToggle('Auto Sea Event', false, function(state)
    _G.AutoSeaEvent = state
end)

Sea_Menu:addToggle('Auto Ship', false, function(state)
    _G.AutoShip = state
end)

-- Race V4 Section
local Race_Section = Tab.Tab_RaceV4:addSection()
local Race_Menu = Race_Section:addMenu("#Race V4")

Race_Menu:addToggle('Auto Race', false, function(state)
    _G.AutoRace = state
end)

-- Raids Section
local Raids_Section = Tab.Tab_4:addSection()
local Raids_Menu = Raids_Section:addMenu("#Raids")

Raids_Menu:addToggle('Auto Start Raid', false, function(state)
    _G.AutoStartRaid = state
end)

Raids_Menu:addToggle('Auto Join Raid', false, function(state)
    _G.AutoJoinRaid = state
end)

-- Teleport Section
local Teleport_Section = Tab.Tab_5:addSection()
local Teleport_Menu = Teleport_Section:addMenu("#Teleport")

Teleport_Menu:addButton('Teleport to Sea 1', function()
    -- Teleport logic here
end)

Teleport_Menu:addButton('Teleport to Sea 2', function()
    -- Teleport logic here
end)

Teleport_Menu:addButton('Teleport to Sea 3', function()
    -- Teleport logic here
end)

-- Shop Section
local Shop_Section = Tab.Tab_6:addSection()
local Shop_Menu = Shop_Section:addMenu("#Shop")

Shop_Menu:addToggle('Auto Buy Devil Fruit', false, function(state)
    _G.AutoBuyFruit = state
end)

Shop_Menu:addToggle('Auto Store Fruit', false, function(state)
    _G.AutoStoreFruit = state
end)

-- Misc Section
local Misc_Section = Tab.Tab_7:addSection()
local Misc_Menu = Misc_Section:addMenu("#Misc")

Misc_Menu:addToggle('ESP Mobs', false, function(state)
    _G.ESPMobs = state
end)

Misc_Menu:addToggle('ESP Fruits', false, function(state)
    _G.ESPFruits = state
end)

Misc_Menu:addToggle('Auto Collect Ember', false, function(state)
    _G.AutoCollectEmber = state
end)

print("Abacatudo Hub Loaded Successfully!")
