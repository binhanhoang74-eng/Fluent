-- ANDZHUD HUB - DELTA LITE

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

getgenv().ANDZHUD = {
    AutoFarm = true,
    Weapon = "Melee"
}

-- AUTO EQUIP
local function Equip()
    local char = LP.Character
    if not char then return end
    for _,v in pairs(LP.Backpack:GetChildren()) do
        if v.ToolTip == ANDZHUD.Weapon then
            char.Humanoid:EquipTool(v)
        end
    end
end

-- AUTO FARM
task.spawn(function()
    while task.wait(0.6) do
        if ANDZHUD.AutoFarm then
            for _,mob in pairs(workspace.Enemies:GetChildren()) do
                if mob:FindFirstChild("HumanoidRootPart")
                and mob.Humanoid.Health > 0 then
                    repeat
                        Equip()
                        LP.Character.HumanoidRootPart.CFrame =
                            mob.HumanoidRootPart.CFrame * CFrame.new(0,18,0)
                        task.wait(0.2)
                    until mob.Humanoid.Health <= 0
                end
            end
        end
    end
end)

print("✅ ANDZHUD HUB DELTA LOADED")
