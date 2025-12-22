require("data")
require("ship")
require("input")
require("flight_plan")

function love.load()
    love.window.setTitle("Flying Fantasy")
    initGameData()

     player1 = newShip("IMG/spaceship_ai.png", 100, 500)
     player2 = newShip("IMG/spaceship2_ai.png", 600, 100, moves.DOWN)
     player2.scale = 0.08
     active_ship = player1

    updateFlightPlan(active_ship)
    
end

function love.update(dt)
    if love.keyboard.isDown("space") then
        if battle.movetimer <= 0 then
            battle.phase = "move"
            battle.movetimer = battle.playspeed
        end
    end

    if battle.movetimer > 0 then
        moveShip(dt, active_ship, battle.movetimer, battle.playspeed)
        battle.movetimer = battle.movetimer - dt
    else
        if battle.phase == "move" then
            if active_ship == player1 then
                active_ship = player2
            else
                active_ship = player1
            end
            battle.phase = "plan"
        end
        readFlightInput(dt, active_ship)
        updateFlightPlan(active_ship)
    end
    
end


function love.draw()
    drawFlightPlan(active_ship)
    drawShip(player1)
    drawShip(player2)
end