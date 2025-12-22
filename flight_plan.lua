require("ship")

function updateFlightPlan(ship)
    ship.cursor.r = ship.r
    ship.cursor.x = ship.x
    ship.cursor.y = ship.y
    ship.cursor.manuever = ship.manuever
    ship.cursor.speed = ship.speed
    ship.cursor.path = {}

    steps = 100
    for i = 1, steps do
        moveShip(1/steps, ship.cursor, i/steps, 1)
        if i%10 == 0  then 
            ship.cursor.path[#ship.cursor.path+1] = {x = ship.cursor.x, y = ship.cursor.y} 
        end
    end
end

function drawFlightPlan(ship)
    for i, dot in ipairs(ship.cursor.path) do
        love.graphics.circle("fill",dot.x, dot.y, 3)
    end
    drawShip(ship.cursor)
end