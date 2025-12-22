function newShip(sprite, x, y, r)
    ship = {}
    ship.sprite = love.graphics.newImage(sprite)
    ship.x = x or 300
    ship.y = y or 400
    ship.r = r or 0
    ship.speed = 300
    ship.manuever = moves.NO_TURN
    ship.maxturn = moves.HARD_TURN
    ship.maxspeed = 300
    ship.minspeed = 100
    ship.scale = 0.3
    
    ship.cursor = {}
    ship.cursor.sprite = love.graphics.newImage("IMG/pointer_ai.png")
    ship.cursor.x = -100
    ship.cursor.y = -100
    ship.cursor.speed = 0
    ship.cursor.r = 0
    ship.cursor.manuever = moves.NO_TURN
    ship.cursor.path = {}
    ship.cursor.scale = 0.2

    return ship
end

function moveShip (dt, ship, timer, playspeed)
    if (timer > 0.25 * playspeed) and (timer < 0.75 * playspeed) then
        ship.r = ship.r + ship.manuever * dt * playspeed * 2
    end

    ship.x = ship.x + ship.speed * math.sin(ship.r) * dt * playspeed
    ship.y = ship.y - ship.speed * math.cos(ship.r) * dt * playspeed
end

function drawShip(ship)
    offX = ship.sprite:getWidth()/2
    offY = ship.sprite:getHeight()/2
    love.graphics.draw(ship.sprite,ship.x, ship.y, ship.r, ship.scale, ship.scale,offX, offY)
end


function revShip(delta, ship)
    ship.speed = ship.speed + delta
    if ship.speed > ship.maxspeed then
        ship.speed = ship.maxspeed
    elseif ship.speed < ship.minspeed  then
        ship.speed = ship.minspeed
    end
    updateFlightPlan(ship)
end

function turnShip (delta, ship)
    ship.manuever = ship.manuever + delta
    if ship.manuever > ship.maxturn then
        ship.manuever = ship.maxturn
    elseif ship.manuever < (ship.maxturn * -1) then
        ship.manuever = (ship.maxturn * -1)
    end
    updateFlightPlan(ship)
end
