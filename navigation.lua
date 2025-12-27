require("ship")
function newFlightPlan(sceneObject)
    local flightPlan = newSceneObject ("IMG/pointer_ai.png")
    flightPlan.parent = sceneObject
    flightPlan.path = {}
    updateFlightPlan(flightPlan)
    return flightPlan
end

function updateFlightPlan(flightPlan)
    flightPlan.path = {}
    flightPlan.x = flightPlan.parent.x
    flightPlan.y = flightPlan.parent.y
    flightPlan.r = flightPlan.parent.r
    flightPlan.speed = flightPlan.parent.speed
    flightPlan.manuever = flightPlan.parent.manuever

    local steps = 100
    for i = 1, steps do
        moveSceneObject(1/steps, flightPlan, i/steps, 1)
        if i%10 == 0  then 
            flightPlan.path[#flightPlan.path+1] = {x = flightPlan.x, y = flightPlan.y} 
        end
    end
end

function drawFlightPlan(flightPlan)
    for i, dot in ipairs(flightPlan.path) do
        love.graphics.circle("fill",dot.x, dot.y, 3)
    end
    drawShip(flightPlan)
end