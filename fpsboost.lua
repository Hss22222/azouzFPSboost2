-- متغيرات لتحديد حالة الطيران
local flying = false

-- تحديد السرعة
local speedMultiplier = 2

-- تحديد وقت الشفاء التلقائي
local healTime = 10  -- بالثواني

-- الحصول على اللاعب والشخصية
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- تغيير سرعة الشخصية
character:WaitForChild("Humanoid").WalkSpeed = 16 * speedMultiplier  -- تعيين سرعة جديدة
print("تم زيادة السرعة!")

-- دالة للطيران
local function startFlying()
    if not flying then
        flying = true
        print("الطيران مفعل!")

        -- تغيير موقع الشخصية (مثال على الطيران)
        local newPosition = character.HumanoidRootPart.Position + Vector3.new(0, 50, 0) -- رفع الشخصية للأعلى
        character:MoveTo(newPosition)
    else
        -- إيقاف الطيران
        flying = false
        print("الطيران معطل!")

        -- إعادة الشخصية لموقعها الأصلي (أو أي منطق آخر)
        local originalPosition = Vector3.new(0, 5, 0)  -- مثال لموقع إرجاع الشخصية
        character:MoveTo(originalPosition)
    end
end

-- دالة لإخفاء الشخصية
local function hideCharacter()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("MeshPart") or part:IsA("Part") then
            part.Transparency = 1  -- جعل الجزء غير مرئي
            part.CanCollide = false  -- تعطيل الاصطدام
        end
    end
    print("الشخصية مخفية!")
end

-- دالة لاظهار الشخصية
local function showCharacter()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("MeshPart") or part:IsA("Part") then
            part.Transparency = 0  -- جعل الجزء مرئي
            part.CanCollide = true  -- إعادة تمكين الاصطدام
        end
    end
    print("الشخصية ظاهرة!")
end

-- دالة لتغيير اللون
local function changeColor()
    local newColor = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("MeshPart") or part:IsA("Part") then
            part.BrickColor = BrickColor.new(newColor)  -- تغيير اللون
        end
    end
    print("تم تغيير اللون!")
end

-- دالة لبدء الشفاء التلقائي
local function autoHeal()
    while true do
        wait(healTime)  -- الانتظار لعدد معين من الثواني
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = humanoid.MaxHealth  -- شفاء اللاعب إلى الحد الأقصى
            print("تم الشفاء التلقائي!")
        end
    end
end

-- بدء الشفاء التلقائي
autoHeal()

-- تنفيذ الطيران عند الضغط على مفتاح "F"
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        startFlying()
    end
end)

-- تنفيذ إخفاء الشخصية عند الضغط على "H"
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.H then
        hideCharacter()
    end
end)

-- تنفيذ إظهار الشخصية عند الضغط على "S"
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.S then
        showCharacter()
    end
end)

-- تنفيذ تغيير اللون عند الضغط على "L"
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.L then
        changeColor()
    end
end)
