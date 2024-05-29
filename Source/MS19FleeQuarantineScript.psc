Scriptname MS19FleeQuarantineScript extends ObjectReference Const

Faction Property MS19Fugitive Auto Const

Quest Property MS19 Auto Const

;Event OnActivate(ObjectReference akActorRef)
;	if MS19.GetStage() >= 400 && MS19.GetStage() < 1000
;		if akActorRef == game.getplayer()
;			game.getplayer().AddToFaction(MS19Fugitive)
;		endif
;	endif
;EndEvent