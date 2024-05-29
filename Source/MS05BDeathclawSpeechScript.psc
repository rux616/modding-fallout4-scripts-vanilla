Scriptname MS05BDeathclawSpeechScript extends ReferenceAlias

Scene Property pMS05BPlayerSpeaksScene Auto Const
Quest Property MS05B Auto Const

;If player activates the Deathclaw and isn't in combat and hasn't entered combat with him, start "Player Speaks" scene
Event OnActivate(ObjectReference akActionRef)

Actor PlayerRef = Game.GetPlayer()

    if akActionRef == PlayerRef && !self.GetActorRef().IsInCombat() && !PlayerRef.IsInCombat() && !MS05B.GetStageDone(280)
    	if !pMS05BPlayerSpeaksScene.IsPlaying()
    		pMS05BPlayerSpeaksScene.Start()
    	endif
    endif
EndEvent