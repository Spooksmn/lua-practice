local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "spooks is best", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab:AddSlider({
	Name = "Speed",
	Min = 0,
	Max = 99999999999999999,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Studs P/s",
	Callback = function(Value)
        Value = tonumber(Value)
        _G.Speed = Value

        local mt = getrawmetatable(game)
        local old = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = function(self, ...)
           if getnamecallmethod() == 'Kick' then
               return wait(9e9)
           end
           return old(self, ...)
        end
        local oldd = mt.__index
        mt.__index = function(self, property)
           if property == 'WalkSpeed' then
               return 16
           end
           return oldd(self, property)
        end
        setreadonly(mt, true)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
		print(Value)
	end    
})



Tab:AddButton({
	Name = "2k Wins",
	Callback = function()
        --settings (make first two values values bigger if script often bugs for you)
local delay1 = 1
local delay2 = 0.1
local onlywhileround = true
--main
local plr = game:service'Players'.LocalPlayer
while task.wait() do
    pcall(function()
        if plr.PlayerGui.UI_Main.UI.TopMenu.RaceTimer.TextLabel.Text == '' and onlywhileround then
            repeat task.wait() until plr.PlayerGui.UI_Main.UI.TopMenu.RaceTimer.TextLabel.Text ~= ''
            task.wait(1)
        end
        for i,v in pairs(workspace.Environment:GetDescendants()) do
            if v:FindFirstChildWhichIsA'TouchTransmitter' then
                firetouchinterest(v, plr.Character.HumanoidRootPart, 0)
                task.wait((v.Parent.Name == 'Stage1K' and delay1) or delay2)
            end
        end
    end)
end
      		print("button pressed")
  	end    
})







