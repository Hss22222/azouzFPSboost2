-- متغيرات للطيران، الإخفاء، اللون
local flying = false
local speedMultiplier = 2
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- زيادة سرعة المشي
character:WaitForChild("Humanoid").WalkSpeed = 16 * speedMultiplier

-- دالة للطيران
local function startFlying()
    if not flying then
        flying = true
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- تعيين سرعة الطيران
        bodyVelocity.Parent = character.HumanoidRootPart
        print("الطيران مفعل!")
    else
        flying = false
        for _, v in pairs(character.HumanoidRootPart:GetChildren()) do
            if v:IsA("BodyVelocity") then
                v:Destroy()  -- إيقاف الطيران
            end
        end
        print("الطيران معطل!")
    end
end

-- دالة لإخفاء الشخصية
local function hideCharacter()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("MeshPart") or part:IsA("Part") then
            part.Transparency = 1  -- إخفاء الأجزاء
            part.CanCollide = false  -- تعطيل الاصطدام
        end
    end
    print("الشخصية مخفية!")
end

-- دالة لإظهار الشخصية
local function showCharacter()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("MeshPart") or part:IsA("Part") then
            part.Transparency = 0  -- إظهار الأجزاء
            part.CanCollide = true  -- إعادة الاصطدام
        end
    end
    print("الشخصية ظاهرة!")
end

-- دالة لتغيير لون الشخصية
local function changeColor()
    local newColor = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("MeshPart") or part:IsA("Part") then
            part.BrickColor = BrickColor.new(newColor)  -- تغيير اللون
        end
    end
    print("تم تغيير اللون!")
end

-- دالة للشفاء التلقائي
local function autoHeal()
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Health = humanoid.MaxHealth  -- إعادة الصحة إلى الحد الأقصى
        print("تم الشفاء التلقائي!")
    end
end

-- الاستماع للمدخلات من لوحة المفاتيح
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        startFlying()  -- تفعيل الطيران عند الضغط على F
    elseif input.KeyCode == Enum.KeyCode.H then
        hideCharacter()  -- إخفاء الشخصية عند الضغط على H
    elseif input.KeyCode == Enum.KeyCode.S then
        showCharacter()  -- إظهار الشخصية عند الضغط على S
    elseif input.KeyCode == Enum.KeyCode.L then
        changeColor()  -- تغيير اللون عند الضغط على L
    elseif input.KeyCode == Enum.KeyCode.T then
        autoHeal()  -- الشفاء التلقائي عند الضغط على T
    end
end)

print("تم تفعيل السكربت الأمني!")
