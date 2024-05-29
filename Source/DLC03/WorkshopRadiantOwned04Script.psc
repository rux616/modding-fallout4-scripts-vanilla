Scriptname DLC03:WorkshopRadiantOwned04Script extends DLC03:WorkshopRadiantOwnedScript conditional

int property iCrabAttackerCount auto conditional
{ set to number of attackers when stage 100 is set }

ReferenceAlias property SettlementSpokesman auto const mandatory
{ spokesman }

RefCollectionAlias property CrabAttackers auto const mandatory
{ put NPCs who are going to attack the crab in here }

RefCollectionAlias property HermitCrabs auto const mandatory
{ all crabs }

ReferenceAlias property HermitCrab auto const mandatory
{ pick the closest crab }

GenericGoHomeScript Property GenericGoHome Auto Const
{ quest that makes sure actors get home }

function DailyUpdateCustom()
	debug.trace(self + " DailyUpdateCustom - TODO")
endFunction

function SetCrabAttackers()
	ObjectReference spokesman = SettlementSpokesman.GetRef()
	; pick a crab if we don't have one
	if HermitCrab.GetRef() == NONE 
		int i = 0
		while i < HermitCrabs.GetCount()
			ObjectReference newCrab = HermitCrabs.GetAt(i)
			if HermitCrab.GetRef() == NONE
				HermitCrab.ForceRefTo(newCrab)
			else 
				; compare distance - we want closest
				ObjectReference currentCrab = HermitCrab.GetRef()
				if spokesman.GetDistance(newCrab) < spokesman.GetDistance(currentCrab)
					HermitCrab.ForceRefTo(newCrab)
				endif
			endif
			i += 1
		endWhile
	endif
	; always put spokesman in first
	CrabAttackers.AddRef(spokesman)
	
	; put up to 4 additional NPCs into the collection
	int i = 0
	while i < WorkshopNPCs.GetCount() && CrabAttackers.GetCount() <= 5
		Actor theNPC = WorkshopNPCs.GetAt(i) as Actor
		if theNPC && CrabAttackers.Find(theNPC) == -1
			CrabAttackers.AddRef(theNPC)
			; put in "go home" alias to make sure doesn't get stuck in kidnap location after quest shuts down
			GenericGoHome.AddRef(theNPC)
		endif
		i += 1
	endWhile
	iCrabAttackerCount = CrabAttackers.GetCount()
endFunction