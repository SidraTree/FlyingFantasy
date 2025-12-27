require("data")
require("ship")

function readFlightInput(dt, ship)
    if love.keyboard.isDown("up") then
        revSceneObject(dt * battle.guispeed, ship)
    end
    if love.keyboard.isDown("down") then
        revSceneObject(dt * battle.guispeed * -1, ship)
    end
    if love.keyboard.isDown("right") then
        turnSceneObject(dt, ship)
    end
    if love.keyboard.isDown("left") then
        turnSceneObject(dt * - 1, ship)
    end
end