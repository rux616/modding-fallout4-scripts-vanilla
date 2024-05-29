Scriptname Patch_1_3Script extends Quest

; 86683: to fix companions whose workshop command state is messed up, restore "saved" values to original values
	; holds data for each companion's original workshop command flags
	struct companionWorkshopCommandFlags
		ReferenceAlias companionAlias
		bool bCommandable = true
		bool bAllowCaravan = true
		bool bAllowMove = true
	endStruct

	companionWorkshopCommandFlags[] property companionWorkshopData const auto
	{ array of all companions' original workshop command flags }

	; for Preston special case
	MinutemenCentralScript property MinutemenCentralQuest auto const mandatory
	int PrestonGarveyIndex = 9
; 86683 END

; 91166
REScript[] property MinDefendQuests auto const mandatory
; etc.

Event OnQuestInit()
	; 86683:
	int i = 0
	while i < companionWorkshopData.Length
		; for each companion, restore original flags
		companionWorkshopCommandFlags workshopFlags = companionWorkshopData[i]
		WorkshopNPCScript companion = workshopFlags.companionAlias.GetActorRef() as WorkshopNPCScript
		if companion 
			; this is OK even if they aren't currently in workshop mode, because these functions save out the new state for when they return to workshop mode
			companion.SetAllowMove(workshopFlags.bAllowMove)
			companion.SetCommandable(workshopFlags.bCommandable)
			companion.SetAllowCaravan(workshopFlags.bAllowCaravan)
		endif
		i += 1
	endWhile
	; special case: Preston becomes commandable after Minutemen advance to stage 1
	if MinutemenCentralQuest.MinutemenProgress >= 1
		; get Preston
		companionWorkshopCommandFlags workshopFlags = companionWorkshopData[PrestonGarveyIndex]
		WorkshopNPCScript companion = workshopFlags.companionAlias.GetActorRef() as WorkshopNPCScript
		if companion
			; Preston is moveable and commandable at this point in Minutemen questline 
			companion.SetAllowMove(true)
			companion.SetCommandable(true)
		endif
	endif
	; 86683 END

	; 91166:
	Fix_91166()
endEvent

function Fix_91166()
	; 91166
	; fix fail stage data on Min defend quests
	int i = 0
	while i < MinDefendQuests.Length
		REScript theQuest = MinDefendQuests[i]
		REScript:DeadCount deadCountItem = theQuest.DeadCountGroups[1]
		if deadCountItem
			deadCountItem.stageToSet = 290
		endif

		i += 1
	endWhile
endFunction