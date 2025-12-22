require("data")
require("ship")

function readFlightInput(dt, ship)
    if love.keyboard.isDown("up") then
        revShip(dt * battle.guispeed, ship)
    end
    if love.keyboard.isDown("down") then
        revShip(dt * battle.guispeed * -1, ship)
    end
    if love.keyboard.isDown("right") then
        turnShip(dt, ship)
    end
    if love.keyboard.isDown("left") then
        turnShip(dt * - 1, ship)
    end
end