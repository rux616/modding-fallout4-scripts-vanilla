Scriptname CreationClub:VRWorkshops:VRWorkshopSummonVRSettlersScript extends Quest
{A variation of the base game SummonedByAlarm script.}

RefCollectionAlias Property Alias_WorkshopNPCs Auto Const Mandatory
ReferenceAlias Property Alias_Workshop Auto Const Mandatory
workshopparentscript Property WorkshopParent Auto Const Mandatory
ActorValue Property WorkshopBellDistance Auto Const Mandatory
ReferenceAlias Property Alias_SummonMarker Auto Const Mandatory
Bool Property IsAlarm = False Auto Const
{Re-usable code for alarm versus regular bell.}
Int Property StartupStage = 0 Auto Const

Event OnStageSet(int auiStageID, int auiItemID)
	If(auiStageID == StartupStage)
		StartUp()
	EndIf
EndEvent

Function StartUp()

	;Add all workshop NPCs to the collection
	ObjectReference[] workshopNPCs = WorkshopParent.GetWorkshopActors(Alias_Workshop.GetRef() as WorkshopScript)
	
	debug.trace("VR WORKSHOPS: Found " + workshopNPCs.length + " settlers.")

	int i = 0

	While(i < workshopNPCs.Length)

		debug.trace("VR WORKSHOPS: Adding settler " + workshopNPCs[i] + " to ref collection.")

		ObjectReference theNPC = workshopNPCs[i]
		; what distance to travel (to randomize a bit)
		int dieRoll = Utility.RandomInt(0, 2)
		theNPC.SetValue(WorkshopBellDistance, dieRoll)
		Alias_WorkshopNPCs.AddRef(theNPC)
		i += 1
	EndWhile

	;start timer
	StartTimerGameTime(0.5)
EndFunction

Event OnTimerGameTime(int aiTimerID)
	;stops the quest and releases settlers from their idle-around-the-summon-marker package
	debug.trace("VR WORKSHOPS: Summon timer ended, stopping quest.")
	Stop()
EndEvent