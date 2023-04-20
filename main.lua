-- DESTROY COLLECT SOUND
if game:GetService("SoundService"):FindFirstChild("Collect") then
    game:GetService("SoundService").Collect:Destroy()
end



-- GLOBAL VARIABLES
_G.autofarm = false -- AUTOFARM TOGGLE
_G.buttonspam = false -- AUTO CLICK TOGGLE
_G.autocollect = false -- AUTO COLLECT TOGGLE



-- VARIABLES
local player = game:GetService("Players").LocalPlayer -- LOCAL PLAYER
local tycoon = game:GetService("Workspace")["Ruixey's Tycoonkit 1.12"].Tycoons[player.Tycoon.Value.Name] -- PLAYERS PERSONAL TYCOON
local no = {"Buy VIPUpgrader", "Buy VIPDropper", "Buy DoubleCash", "Buy Autocollect", "BuyGroupMember", "Buy Railgun"} -- OMITTED BUTTONS
local dropper1 = tycoon.Purchased["Dropper 1"].Decoration.Grey.Part.CFrame -- PLAYERS FIRST DROPPER



-- IMPORTS
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))() -- UI LIB



-- WINDOWS
local Window = OrionLib:MakeWindow({Name = "Military Tycoon 2", HidePremium = true, SaveConfig = false, IntroText = "Military Tycoon 2", IntroIcon = "rbxassetid://1620440636", Icon = "rbxassetid://1620440636"}) -- MAIN WINDOW



-- TABS
local tab = {}

tab.main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://7539983773",
	PremiumOnly = false
})

tab.teleport = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://10481501007",
	PremiumOnly = false
})

tab.farm = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://11498457000",
	PremiumOnly = false
})

tab.nuke = Window:MakeTab({
	Name = "Nuke",
	Icon = "rbxassetid://6860832738",
	PremiumOnly = false
})





-- MAIN TAB

tab.main:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
		_G.buttonspam = Value
		while wait() and _G.buttonspam do
		    local button = tycoon.Purchased["Dropper 1"].Clicker.ClickerPrompt
		    fireproximityprompt(button, 3)
		end
	end    
})


tab.main:AddToggle({
	Name = "Auto Collect",
	Default = false,
	Callback = function(Value)
		_G.autocollect = Value
		local touch = tycoon.Essentials.CurrencyCollector.Giver
        
        while _G.autocollect and wait() do
            local touch2 = player.Character.HumanoidRootPart
            if toggle == 0 then
                toggle = 1
            else
                toggle = 0
            end
            
            firetouchinterest(touch2, touch, toggle)
        end
	end    
})

tab.main:AddButton({
	Name = "Purchase Buttons",
	Callback = function()
      	local buttons = tycoon.Buttons:GetChildren()
		for i, v in pairs(buttons) do
            if not table.find(no, v.name) then
                local child = v:FindFirstChild("Head")
                newcf = child.CFrame
                player.Character.HumanoidRootPart.CFrame = newcf
                wait()
            end
		end
  	end    
})



-- TELEPORT TAB

tab.teleport:AddDropdown({
	Name = "Location",
	Default = "Location",
	Options = {"Home", "Bunker", "Abort Key Card", "Employee Key Card", "Warhead Key Card", "Nuke Control Panel"},
	Callback = function(Value)
		if Value == "Abort Key Card" then
		    local currentPOS = player.Character.HumanoidRootPart.CFrame
		    local targetPOS = CFrame.new(1054.6615, 6.66782379, -919.696838, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		    player.Character.HumanoidRootPart.CFrame = targetPOS
		    wait(1)
		    player.Character.HumanoidRootPart.CFrame = currentPOS
		end
		
		if Value == "Employee Key Card" then
		    local currentPOS = player.Character.HumanoidRootPart.CFrame
		    local targetPOS = CFrame.new(1007.5675, 6.20990753, -531.64624, 0, 0, -1, 0, 1, 0, 1, 0, 0)
		    player.Character.HumanoidRootPart.CFrame = targetPOS
		    wait(1)
		    player.Character.HumanoidRootPart.CFrame = currentPOS
		end
		
		if Value == "Warhead Key Card" then
		    local currentPOS = player.Character.HumanoidRootPart.CFrame
		    local targetPOS = CFrame.new(1188.42175, -8.72204781, -481.523804, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		    player.Character.HumanoidRootPart.CFrame = targetPOS
		    wait(1)
		    player.Character.HumanoidRootPart.CFrame = currentPOS
		end
		
		if Value == "Nuke Control Panel" then
		    local targetPOS = CFrame.new(953.015991, -39.6371651, -90.4285736, -0.999177337, 1.18017285e-09, -0.0405547768, -8.14977863e-10, 1, 4.91799099e-08, 0.0405547768, 4.91725025e-08, -0.999177337)
		    player.Character.HumanoidRootPart.CFrame = targetPOS
		end
		
		if Value == "Home" then
		    local floorr = tycoon.Essentials.Floor
		    local cf = floorr.CFrame + Vector3.new(0, 5, 0)
            player.Character.HumanoidRootPart.CFrame = cf
		end
		
		if Value == "Bunker" then
		    local bunker = game:GetService("Workspace")["Map Assets"].Bunker02["NUKE Bunker Door"].StatusLight.CFrame
            player.Character.HumanoidRootPart.CFrame = bunker
		end
	    
		    
		
		
	end    
})

local playertp = tab.teleport:AddDropdown({
    Name = "Players",
    Default = "Select a player",
    Options = {"Select a player"},
    Callback = function(Value)
        if Value == "Select a player" then
            return
        end
        _G.selected = Value
        player.Character.HumanoidRootPart.CFrame = game:GetService("Players")[Value].Character.HumanoidRootPart.CFrame
    end    
})


tab.teleport:AddToggle({
	Name = "Annoy",
	Default = false,
	Callback = function(Value)
		_G.annoy = Value
		while _G.annoy and wait() do
		    playerrr.Character.HumanoidRootPart.CFrame = game:GetService("Players")[_G.selected].Character.HumanoidRootPart.CFrame
		end
	end    
})

-- NUKE TAB

tab.nuke:AddButton({
	Name = "Nuke Status",
	Callback = function()
	    OrionLib:MakeNotification({
        	Name = "Nuke Status",
        	Content = game:GetService("Workspace").NUKE["Main Control"].WarheadMonitor.Message.SurfaceGui.SIGN.Text,
        	Image = "rbxassetid://6860832738",
        	Time = 5
        })
  	end    
})



-- AUTO FARM TAB

tab.farm:AddLabel("Ensure Auto Click and Auto Collect are turned on")

tab.farm:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		_G.autofarm = Value
        local touch = tycoon.Essentials.CurrencyCollector.Giver
        local touch2 = player.Character.HumanoidRootPart
        while _G.autofarm do
            local buttons = tycoon.Buttons:GetChildren()
        	for i, v in ipairs(buttons) do
                if not table.find(no, v.name) then
                    local child = v:FindFirstChild("Head")
                    newcf = child.CFrame
                    player.Character.HumanoidRootPart.CFrame = newcf
                    wait()
                end
        	end
        	
            player.Character.HumanoidRootPart.CFrame = dropper1
            game:GetService("ReplicatedStorage").TycoonEvent:FireServer("Rebirth")
            wait(60)
        	
        end
	end    
})

-- initially populate the player dropdown list
local playerList = {}
for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
    table.insert(playerList, player.Name)
    print(player.name)
end
playertp:Refresh(playerList, true)



-- refresh the player dropdown list every 5 seconds
spawn(function()
    while true do
    wait(5)
    local playerList = {}
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        table.insert(playerList, player.Name)
    end
    playertp:Refresh(playerList, true)
    end
end)

spawn(function()
    while true and wait(5) do
        local response = syn.request({
            Url = "https://verlox.cc/api/v3/auth/user/verify",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["Authorization"] = _G.token,
                ["AppId"] = "3",    
            },
        })
    
        local data = HttpService:JSONDecode(response.Body)
        
        if data.code ~= 200 then
            print('ERROR DURING VERIFICATION : ' .. data.message)
            break
        end
    end
end)


-- INIT

OrionLib:Init()
