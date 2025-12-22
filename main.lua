

function love.load()
    love.window.setTitle("Flying Fantasy")

    battle = {}
    battle.playspeed = 1
    battle.movetimer = 0
    battle.guispeed = 100

    moves = {}
    moves.NO_TURN = 0
    moves.LIGHT_TURN = (math.pi * 24)/180
    moves.MEDIUM_TURN = (math.pi * 45)/180
    moves.HARD_TURN = (math.pi * 90)/180

    ship = {}
    ship.sprite = love.graphics.newImage("IMG/spaceship_ai.png")
    ship.x = 300
    ship.y = 400
    ship.speed = 300
    ship.r = 0
    ship.manuever = moves.NO_TURN
    ship.maxturn = moves.HARD_TURN
    ship.maxspeed = 500
    ship.minspeed = 100
    
    cursor = {}
    cursor.sprite = love.graphics.newImage("IMG/pointer_ai.png")
    cursor.x = -100
    cursor.y = -100
    cursor.speed = 0
    cursor.r = 0
    cursor.manuever = moves.NO_TURN
    cursor.path = {}
    
end

function love.update(dt)
    if love.keyboard.isDown("space") then
        if battle.movetimer <= 0 then
            battle.movetimer = battle.playspeed
        end
    end

    if love.keyboard.isDown("up") then
        ship.speed = ship.speed + dt * battle.guispeed
        if ship.speed > ship.maxspeed then 
            ship.speed = ship.maxspeed
        end
        updateFlightPlan()
    end
        if love.keyboard.isDown("down") then
        ship.speed = ship.speed - dt * battle.guispeed
        if ship.speed < ship.minspeed then
            ship.speed = ship.minspeed
        end
        updateFlightPlan()
    end
    if love.keyboard.isDown("right") then
        ship.manuever = ship.manuever + dt 
        if ship.manuever > ship.maxturn then 
            ship.manuever = ship.maxturn
        end
        updateFlightPlan()
    end
    if love.keyboard.isDown("left") then
        ship.manuever = ship.manuever - dt 
        if ship.manuever < -1 * ship.maxturn then 
            ship.manuever = -1 * ship.maxturn
        end
        updateFlightPlan()
    end

    if battle.movetimer > 0 then
        moveShip(dt, ship, battle.movetimer, battle.playspeed)
        battle.movetimer = battle.movetimer - dt
    end
    
end

function moveShip (dt, ship, timer, playspeed)
    if (timer > 0.25 * playspeed) and (timer < 0.75 * playspeed) then
        ship.r = ship.r + ship.manuever * dt * playspeed * 2
    end

    ship.x = ship.x + ship.speed * math.sin(ship.r) * dt * playspeed
    ship.y = ship.y - ship.speed * math.cos(ship.r) * dt * playspeed
end

function updateFlightPlan()
    cursor.r = ship.r
    cursor.x = ship.x
    cursor.y = ship.y
    cursor.manuever = ship.manuever
    cursor.speed = ship.speed
    cursor.path = {}

    steps = 100
    for i = 1, steps do
        moveShip(1/steps, cursor, i/steps, 1)
        if i%5 == 0  then 
            cursor.path[#cursor.path+1] = {x = cursor.x, y = cursor.y} 
        end
    end
end

function drawFlightPlan()
    for i, dot in ipairs(cursor.path) do
        love.graphics.circle("fill",dot.x, dot.y, 3)
    end
    love.graphics.draw(cursor.sprite,cursor.x, cursor.y, cursor.r, 0.1, 0.1)
end

function love.draw()
    drawFlightPlan()
    love.graphics.draw(ship.sprite,ship.x, ship.y, ship.r, 0.25, 0.25)
end