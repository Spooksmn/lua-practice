local Lighting = game:GetService("Lighting")



FullBright = bool
local r = FullBright and 1 or 0
Lighting.Ambient = Color3.new(r, r, r)
Lighting.ColorShift_Bottom = Color3.new(r, r, r)
Lighting.ColorShift_Top = Color3.new(r, r, r)

Lighting.Changed:Connect(function()
local r = FullBright and 1 or 0
Lighting.Ambient = Color3.new(r, r, r)
Lighting.ColorShift_Bottom = Color3.new(r, r, r)
Lighting.ColorShift_Top = Color3.new(r, r, r)
end)
