function love.load()
    love.window.setTitle("Simple GUI by me_ozone")
    text = "1"
    font = love.graphics.newFont(24)
    love.graphics.setFont(font)
end

function love.draw()
    love.graphics.print(text, 400, 300)
end

function love.keypressed(key)
    if key == "up" then
        text = "UP"
    elseif key == "down" then
        text = "DOWN"
    end
end
