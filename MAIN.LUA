-- تهيئة النص
text = "1"

-- دالة لمعالجة الضغط على الأزرار
function love.keypressed(key)
    if key == "up" then
        text = "UP"
    elseif key == "down" then
        text = "DOWN"
    end
end

-- دالة الرسم
function love.draw()
    love.graphics.print(text, 400, 300)
end
