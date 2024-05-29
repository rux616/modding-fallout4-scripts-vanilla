Scriptname DN144DeathclawHideTriggerScript extends ObjectReference Hidden

Bool Property bDeathclawShouldHide = TRUE const auto

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer() && (GetLinkedRef() as Actor).IsInCombaT()
    	(GetLinkedRef() as DN144LvlDeathclawScript).bShouldHide = bDeathclawShouldHide
    	(GetLinkedRef() as Actor).EvaluatePackage()
    endif
EndEvent	