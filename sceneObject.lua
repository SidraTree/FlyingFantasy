function newSceneObject (sprite, x, y, r)
    sceneObject = {}
    sceneObject.sprite = love.graphics.newImage(sprite)
    sceneObject.x = x or 300
    sceneObject.y = y or 400
    sceneObject.r = r or 0
    sceneObject.speed = 0
    sceneObject.scale = 1
    sceneObject.manuever = moves.NO_TURN
    return sceneObject
end

function moveSceneObject (dt, sceneObject, timer, playspeed)
    if (timer > 0.25 * playspeed) and (timer < 0.75 * playspeed) then
        sceneObject.r = sceneObject.r + sceneObject.manuever * dt * playspeed * 2
    end

    sceneObject.x = sceneObject.x + sceneObject.speed * math.sin(sceneObject.r) * dt * playspeed
    sceneObject.y = sceneObject.y - sceneObject.speed * math.cos(sceneObject.r) * dt * playspeed
end

function revSceneObject(delta, sceneObject)
    sceneObject.speed = sceneObject.speed + delta
    if sceneObject.speed > sceneObject.maxspeed then
        sceneObject.speed = sceneObject.maxspeed
    elseif sceneObject.speed < sceneObject.minspeed  then
        sceneObject.speed = sceneObject.minspeed
    end
end

function turnSceneObject (delta, sceneObject)
    sceneObject.manuever = sceneObject.manuever + delta
    if sceneObject.manuever > sceneObject.maxturn then
        sceneObject.manuever = sceneObject.maxturn
    elseif sceneObject.manuever < (sceneObject.maxturn * -1) then
        sceneObject.manuever = (sceneObject.maxturn * -1)
    end
end