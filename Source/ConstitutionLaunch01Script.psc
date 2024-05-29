Scriptname ConstitutionLaunch01Script extends ObjectReference Hidden


;Event OnLoad()
;    RegisterForAnimationEvent(self, "impact")
;EndEvent
;
;
;Event OnAnimationEvent(ObjectReference akSource, string asEventName)
;	if (akSource == self) && (asEventName == "impact")
;    	if game.GetPlayer().GetDistance(GetLinkedRef()) < 1024
;    		game.ShakeCamera(game.GetPlayer(), 1, 4)
;			game.ShakeController(1, 1, 4)
;    	endIf
;    	utility.Wait(2)
;    	GetLinkedRef().GetLinkedRef().EnableNoWait()
;    	utility.Wait(1)
;    	self.DisableNoWait()
;	endIf
;EndEvent