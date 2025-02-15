-- متغير لتحديد حالة الطيران
local flying = false

-- الحصول على اللاعب والشخصية
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- وظيفة للطيران
local function startFlying()
    if not flying then
        flying = true
        print("الطيران مفعل!")
        
        -- إضافة جسم طائر إلى الشخصية (مثلاً BodyVelocity للطيران)
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
        bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- تعيين سرعة الطيران
        bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
        
        -- تعطيل الجاذبية
        character:WaitForChild("Humanoid").PlatformStand = true
    else
        -- إيقاف الطيران
        flying = false
        print("الطيران معطل!")
        
        -- إزالة جسم الطيران
        for _, v in pairs(character:WaitForChild("HumanoidRootPart"):GetChildren()) do
            if v:IsA("BodyVelocity") then
                v:Destroy()
            end
        end
        
        -- إعادة الجاذبية
        character:WaitForChild("Humanoid").PlatformStand = false
    end
end

-- تنفيذ الطيران عند الضغط على مفتاح "F"
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        startFlying()
    end
end)
