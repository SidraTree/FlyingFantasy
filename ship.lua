require("sceneObject")
function newWeapon(arc, range)
    local w = {}
    w.arc = math.rad(arc)
    w.range = range
    return w
end

function newShip(sprite, x, y, r)
    local ship = newSceneObject(sprite, x, y, r)
    ship.speed = 300
    ship.maxturn = moves.HARD_TURN
    ship.maxspeed = 300
    ship.minspeed = 100
    ship.scale = 0.3
    ship.flightPlan = newFlightPlan(ship)
    return ship
end

function drawShip(ship)
    local offX = ship.sprite:getWidth()/2 
    local offY = ship.sprite:getHeight()/2
    love.graphics.draw(ship.sprite,ship.x, ship.y, ship.r, ship.scale, ship.scale,offX, offY)
end

function drawArc (ship)

    local leftArc = ship.r - ship.weapon.arc/2
    local rightArc = ship.r + ship.weapon.arc/2

    local lx = math.sin(leftArc) * ship.weapon.range + ship.x
    local ly = -math.cos(leftArc) * ship.weapon.range + ship.y

    local rx = math.sin(rightArc) * ship.weapon.range + ship.x
    local ry = -math.cos(rightArc) * ship.weapon.range + ship.y
    
    love.graphics.line(ship.x, ship.y, lx, ly)
    love.graphics.line(ship.x, ship.y, rx, ry)
end