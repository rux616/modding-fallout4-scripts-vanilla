Scriptname VFTQuestScript extends Quest

int WaitForPlayerToBoardTimerID = 1
int endSceneStage = 100
float gameTimeToWaitForPlayer = 1.0 ; game hours

function StartWaitTimer()
	StartTimerGameTime(gameTimeToWaitForPlayer, WaitForPlayerToBoardTimerID)
endFunction

Event OnTimerGameTime(int aiTimerID)
    ; if player isn't on board, end scene
    actor player = Game.GetPlayer()
    if player.IsOnMount()
    	; run timer again
    	StartWaitTimer()
    else
    	; end scene
    	SetStage(endSceneStage)
    endif
EndEvent