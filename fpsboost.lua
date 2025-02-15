-- سكربت زيادة FPS بواسطة عزوز 🚀
local function BoostFPS()
    print("تم تفعيل سكربت زيادة FPS بواسطة عزوز 🚀")

    -- تعطيل التأثيرات غير الضرورية
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level1
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").FogEnd = 9e9

    -- تعطيل أجزاء غير ضرورية من اللعبة
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        end
    end

    print("✅ تم تحسين FPS بنجاح!")
end

-- تشغيل الوظيفة
BoostFPS()
