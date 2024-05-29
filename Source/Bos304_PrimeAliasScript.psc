Scriptname Bos304_PrimeAliasScript extends ReferenceAlias Hidden
{Script on the Prime alias on BoS304.}

Quest Property DNPrime_BoS304 Auto Const
Int Property myStage Auto Const
Int Property myStageEnd Auto Const


;************************************

Event OnLoad()
    RegisterForAnimationEvent(self.getActorRef(), "On")
    RegisterForAnimationEvent(self.getActorRef(), "Off")
EndEvent

;************************************

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
  if (asEventName == "On")
  	;Prime starts his laser beam at CIT
  	DNPrime_BoS304.SetStage(myStage)
  endIf

 if (asEventName == "Off")
 	;Prime ends his laser beam at CIT
  	DNPrime_BoS304.SetStage(myStageEnd)
  endIf
endEvent

;************************************