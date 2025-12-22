function initGameData()
    battle = {}
    battle.playspeed = 1
    battle.phase = "plan"
    battle.movetimer = 0
    battle.guispeed = 100

    moves = {}
    moves.NO_TURN = 0
    moves.LIGHT_TURN = (math.pi * 24)/180
    moves.MEDIUM_TURN = (math.pi * 45)/180
    moves.HARD_TURN = (math.pi * 90)/180
    moves.DOWN = (math.pi * 180)/180

end