Scriptname FFDiamondCity04Script extends Quest Conditional


;track speech challenge rewards
;0 = 50, 1 = 75, 2 = 100, 3 = 200
Int Property var_Speech Auto Conditional

;item counters
GlobalVariable Property FFDiamondCity04Count Auto
GlobalVariable Property FFDiamondCity04Total Auto


Function ItemCollected()
	debug.trace(self + " junk item collected")
	;Count items, advance quest once all are dead
	If GetStageDone(10) == 1
		if ModObjectiveGlobal(1, FFDiamondCity04Count, 10, FFDiamondCity04Total.value)
			debug.trace(self + " item collected, objective displayed, updating counts")
  			SetStage(20)
		EndIF
	Else
		;don't display objective unless stage has been set
		if ModObjectiveGlobal(1, FFDiamondCity04Count, -1, FFDiamondCity04Total.value)
			debug.trace(self + " item collected, objective NOT displayed, updating counts")
  			SetStage(20)
		endif
	EndIf 
EndFunction