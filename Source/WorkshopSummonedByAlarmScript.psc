Scriptname WorkshopSummonedByAlarmScript extends Quest

RefCollectionAlias Property Alias_WorkshopNPCs Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

workshopparentscript Property WorkshopParent Auto Const

ActorValue Property WorkshopBellDistance Auto Const

ReferenceAlias Property Alias_Bell Auto Const

function Startup()
	; report startup to siren
	WorkshopSirenScript siren = Alias_Bell.GetRef() as WorkshopSirenScript
	if siren
		siren.SetAlarmQuest(self)
	endif

	ObjectReference[] workshopNPCs = WorkshopParent.GetWorkshopActors(Alias_Workshop.GetRef() as WorkshopScript)
	; add them all to the collection
	int i = 0
	while i < workshopNPCs.Length
		ObjectReference theNPC = workshopNPCs[i]
		; what distance to travel (to randomize a bit)
		int dieRoll = Utility.RandomInt(0, 2)
		theNPC.SetValue(WorkshopBellDistance, dieRoll)
		Alias_WorkshopNPCs.AddRef(theNPC)
		i += 1
	endWhile
	; start timer
	StartTimerGameTime(0.5)
endFunction

; timer shuts down quest
Event OnTimerGameTime(int aiTimerID)
	Stop()
EndEvent
