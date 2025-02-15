-- طباعة رسالة عند بداية تنفيذ السكربت
print("السكربت بدأ في التنفيذ!")

-- تشغيل العملية الأولى (زيادة FPS مثلاً)
local function BoostFPS()
    print("بدأت عملية تحسين FPS...")
    
    -- تعطيل التأثيرات غير الضرورية لتحسين الأداء
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level1
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").FogEnd = 9e9

    -- تعطيل الأجزاء غير الضرورية من اللعبة
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        end
    end

    print("تم تحسين FPS بنجاح!")
end

-- تأكد من أن الوظيفة يتم تشغيلها
BoostFPS()

-- تأخير 1 ثانية ثم طباعة رسالة
wait(1)
print("السكربت اكتمل بنجاح!")
