Scriptname DLC02:DLC02WorkshopTameOffScript extends Quest Const

ReferenceAlias Property Alias_Workshop Auto Const mandatory

workshopparentscript Property WorkshopParent Auto Const mandatory

RefCollectionAlias Property Alias_WorkshopNPCs Auto Const mandatory

function Startup()
	debug.trace(self + " Startup")
	int i = 0
	while i < Alias_WorkshopNPCs.GetCount()
		ObjectReference theNPC = Alias_WorkshopNPCs.GetAt(i)
		DLC02TamedActorScript tamedActor = (theNPC as Actor) as DLC02TamedActorScript
		debug.trace(self + " i=" + i + ": theNPC=" + theNPC + ", tamedActor=" + tamedActor)
		if tamedActor
			; untame
			tamedActor.checkForTame()
		endif
		i += 1
	endWhile
	; start timer
	StartTimerGameTime(0.5)
endFunction

; timer shuts down quest
Event OnTimerGameTime(int aiTimerID)
	debug.trace(self + " Stopping")
	Stop()
EndEvent
