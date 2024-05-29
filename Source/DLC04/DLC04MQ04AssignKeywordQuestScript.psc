Scriptname DLC04:DLC04MQ04AssignKeywordQuestScript extends Quest

Keyword Property WorkshopType02IgnoreFirstBatch Auto Const Mandatory
{Keyword applied to all workshops that shouldn't be part of the "first batch" of targets}

Keyword Property WorkshopType02FirstBatch Auto Const Mandatory
{Keyword used to denote this should be a workshop used by }

WorkshopParentScript Property WorkshopParent Auto Const mandatory
{Workshop parent script (used to get all the workshops)}

Keyword Property DLC04RaidInitKeyword Auto Const Mandatory
{Init keyword for for raiding system}

Formlist Property DLC04RaidExcludedSettlementKeywords Auto Const Mandatory
{List of keyword types to exclude from list}

int Property iMinVassalsThreshold = 7 Auto Const
{The minimun number of vassals it's acceptable for the player to have available. Otherwise, just apply the keyword to all the workshops}

GlobalVariable Property DLC04MQ04KeywordInitComplete Auto Const Mandatory
{Global to let raid system know it's ok to start sending raids to initial targets}

;Struct of workshop information
Struct WorkshopData

	ReferenceAlias Workshop
	{Reference alias of the workshop we want to target}

	Quest ManagingQuest
	{Any quest managing its reservation}

	int iCompletionStage = -1
	{The completion stage of the managing quest}

	int iFailureStage = -1 
	{The failure stage of the managing quest}
EndStruct

WorkshopData[] Property TargetWorkshops Auto Const Mandatory
{Array of workshop information}

;Local vars
int iValidTargetCount = 0

Function StartUp()

	int i = 0
	int iCount = TargetWorkshops.Length

	;Roll through all the initial workshops targets and ensure they have valid vassals available
	while i < iCount
		ObjectReference myShop = TargetWorkshops[i].Workshop.GetRef()
		int iVassalTargets = 0

		;Check to see how many vassals this shop has available
		iVassalTargets = myShop.RaidTargetsAvailable(akActionKW = DLC04RaidInitKeyword, astrConfirm = none, aLocToHighlight = none, akIncludeKeywordList = none, akExcludeKeywordList = DLC04RaidExcludedSettlementKeywords, abExcludeZeroPopulation = true, abOnlyOwnedWorkshops = false, abTurnOffHeader = true, abOnlyPotentialVassalSettlements = true)
		debug.trace("DLC04 Keyword Init: Workshop: " + myshop + " has " + iVassalTargets + " potential vassals.")

		;Add the keyword if this location has available vassals and either has no completion or failure stage or one is completed
		if iVassalTargets > 0 && CheckWorkshopCompletionState(TargetWorkshops[i])
			myShop.AddKeyword(WorkshopType02FirstBatch)

			;Increase the count of valid targets by one
			iValidTargetCount += 1 

			debug.trace("DLC04 Keyword Init: Workshop:" + myShop + " valid. Adding keyword.")
		endif

		i += 1
	endwhile

	debug.trace("DLC04 Keyword Init: Total valid targets: " + iValidTargetCount)

	;If there aren't enough potential initial targets, loop through them all again add the keyword to them all
	if iValidTargetCount < iMinVassalsThreshold
		debug.trace("DLC04 Keyword Init: Insufficent workshop targets. Applying keyword to the whole lot of 'em.")

		i = 0

		while i < iCount
			WorkshopScript myShop = TargetWorkshops[i].Workshop.GetRef() as WorkshopScript

			if CheckWorkshopCompletionState(TargetWorkshops[i])

				myShop.AddKeyword(WorkshopType02FirstBatch)

				debug.trace("DLC04 Keyword Init: Failsafe - Adding keyword to: " + myShop)
			endif

			i += 1
		endwhile

	endif

	;Mark off the global to let the system know init is done
	DLC04MQ04KeywordInitComplete.Mod(1)

	;And shut this thang down
	debug.trace("DLC04 Keyword Init: All done. Shut it down.")
	Stop()
EndFunction

bool Function CheckWorkshopCompletionState(WorkshopData aiWorkshopData)
	bool bWorkshopComplete = false

	;Check to see if this workshop's has completion/failure stages, and if so, that one is done
	if aiWorkshopData.iCompletionStage == -1 && aiWorkshopData.iFailureStage == -1
		bWorkshopComplete = true
	elseif aiWorkshopData.iCompletionStage != -1 && aiWorkshopData.ManagingQuest.GetStageDone(aiWorkshopData.iCompletionStage) 
		bWorkshopComplete = true
	elseif aiWorkshopData.iFailureStage != -1 && aiWorkshopData.ManagingQuest.GetStageDone(aiWorkshopData.iFailureStage)
		bWorkshopComplete = true
	endif

	return bWorkshopComplete
EndFunction