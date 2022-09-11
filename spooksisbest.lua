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











