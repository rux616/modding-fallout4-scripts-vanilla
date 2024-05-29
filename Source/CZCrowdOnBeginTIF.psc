Scriptname CZCrowdOnBeginTIF extends TopicInfo

;This is not the best way to do this,
;but for rapid prototype and to prevent me from resetting all the properties on infos using iterations,
;this is what I'm doing for now

Group Autofill
Action Property ActionCustomCheering const auto
Action Property ActionCustomBooing const auto
Action Property ActionCustomLaughing const auto
EndGroup

Group WhichToPlay
bool Property cheer = true const auto
bool Property laugh = false const auto
EndGroup

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	debug.trace(self + "OnBegin() akSpeakerRef: " + akSpeakerRef)

	if cheer == true
		(akSpeakerRef as actor).PlayIdleAction(ActionCustomCheering)

		if ActionCustomCheering == None
			game.error(self + "ActionCustomCheering IS NOT SET!" )
		endif

	elseif laugh == false ;cheer == false
		(akSpeakerRef as actor).PlayIdleAction(ActionCustomBooing)

		if ActionCustomBooing == None
			game.error(self + "ActionCustomBooing IS NOT SET!" )
		endif

	elseif laugh == true;

		(akSpeakerRef as actor).PlayIdleAction(ActionCustomBooing)

		if ActionCustomBooing == None
			game.error(self + "ActionCustomBooing IS NOT SET!" )
		endif

	endif


    
EndEvent