Scriptname DLC04:DLC04MQ04TutorialQuest extends Quest

Message Property DLC04TutorialRaiderMap01 Auto Const Mandatory
{First message describing the Raider map}

Message Property DLC04TutorialRaiderMap02 Auto Const Mandatory
{Second message describing the Raider map}

Message Property DLC04TutorialClearRaiderOutpost01 Auto Const Mandatory
{Message describing consequences of clearing a Raider outpost - part 1 of 2}

Message Property DLC04TutorialClearRaiderOutpost02 Auto Const Mandatory
{Message describing consequences of clearing a Raider outpost - part 2 of 2}

Message Property DLC04TutorialOutpostsShare01 Auto Const Mandatory
{Message describing outposts automatically sharing}

Message Property DLC04TutorialActiveQuests01 Auto Const Mandatory
{Message describing active quest listing in Shank's menu}

Message Property DLC04TutorialWorkshopsPage01 Auto Const Mandatory
{Message informing player to visit workshops page menu}

Message Property DLC04TutorialLoseOwnership01 Auto Const Mandatory
{Message informing player they'll have to reclaim any settlements they target}

Message Property DLC04TutorialZKeyThrow01 Auto Const Mandatory
{Message informing player how to throw stuff}

Worldspace Property Commonwealth Auto Const Mandatory
{Commonwealth worldspace (used to make sure the "Show Raider Map tutorial" only fires while the player's in the Commonwealth)}

ReferenceAlias Property TutorialInitialRaiderSettlement Auto Const Mandatory
{Reference alias for the player's initial raider settlement}

ReferenceAlias Property MQ04InitialRaiderSettlement Auto Const Mandatory
{Reference alias on MQ04 containing the player's first radier settlement}

;Local vars
bool bRaiderMapTutOnce = false
bool bClearRaiderOutpost = false
bool bOutpostsShareTutOnce = false
bool bActiveQuestTutOnce = false
bool bWorkshopPageTutOnce = false
bool bReclaimSettlementsTutOnce = false
bool bZKeyThrowingTutOnce = false

Function RegisterForMapTutorialEvent()
	RegisterForTutorialEvent("OnEnterPipBoyMapPage")
EndFunction

Function ShowTutorialRaiderMap()
	if !bRaiderMapTutOnce
		bRaiderMapTutOnce = true

		DLC04TutorialRaiderMap01.ShowAsHelpMessage("DLC04RaiderMap01", 14, 0, 1, "PipboyMenu", 76)
		DLC04TutorialRaiderMap02.ShowAsHelpMessage("DLC04RaiderMap02", 12, 0, 1, "PipboyMenu", 76)
	endif
EndFunction

Function ShowTutorialClearRaiderSettlement()
	if !bClearRaiderOutpost
		bClearRaiderOutpost = true

		DLC04TutorialClearRaiderOutpost01.ShowAsHelpMessage("DLC04ClearOutpost01", 11, 0, 1, "NoMenu", 75)
		DLC04TutorialClearRaiderOutpost02.ShowAsHelpMessage("DLC04ClearOutpost02", 14, 0, 1, "NoMenu", 75)
	endif
EndFunction

Event OnTutorialEvent(String asEventName, Message aMessage)
	;If the player's in the Commonwealth, throw the map tutorial when they open the map page
	if asEventName == "OnEnterPipBoyMapPage"
		if Game.GetPlayer().GetWorldSpace() == Commonwealth
			ShowTutorialRaiderMap()
		else
			RegisterForMapTutorialEvent()
		endif
	endif
EndEvent

Function RegisterForWorkshopMenuEvent()
	;Get the reference to the player's first raider settlement and add it to the appropriate alias on this quest
	TutorialInitialRaiderSettlement.ForceRefTo(MQ04InitialRaiderSettlement.GetRef())

	;Then register that thang for a workshop mode event
	ObjectReference SettlementRef = TutorialInitialRaiderSettlement.GetRef()
	if SettlementRef != none
		RegisterforRemoteEvent(SettlementRef, "OnWorkshopMode")
	endif
EndFunction

Event ObjectReference.OnWorkshopMode(ObjectReference akSender, bool aStart)
	ObjectReference SettlementRef = TutorialInitialRaiderSettlement.GetRef()
	if akSender == SettlementRef
		UnregisterForRemoteEvent(SettlementRef, "OnWorkshopMode")
		ShowTutorialOutpostsShare()
	endif
EndEvent

Function ShowTutorialOutpostsShare()
	if !bOutpostsShareTutOnce
		bOutpostsShareTutOnce = true

		DLC04TutorialOutpostsShare01.ShowAsHelpMessage("DLC04OutpostsShare", 15, 0, 1, "NoMenu")
	endif
EndFunction

Function ShowTutorialActiveQuests()
	if !bActiveQuestTutOnce
		bActiveQuestTutOnce = true

		DLC04TutorialActiveQuests01.ShowAsHelpMessage("DLC04ActiveQuest", 11, 0, 1, "")
	endif
EndFunction

Function ShowTutorialVisitWorkshopsPage()
	if !bWorkshopPageTutOnce
		bWorkshopPageTutOnce = true

		DLC04TutorialWorkshopsPage01.ShowAsHelpMessage("DLC04WorkshopPage", 8, 0, 1, "NoMenu")
	endif
EndFunction

Function ShowTutorialReclaimSettlements()
	if !bReclaimSettlementsTutOnce
		bReclaimSettlementsTutOnce = true

		DLC04TutorialLoseOwnership01.ShowAsHelpMessage("DLC04LoseOwnership", 12, 0, 1, "NoMenu")
	endif
EndFunction

Function ShowTutorialZKeyThrowing()
	if !bZKeyThrowingTutOnce
		bZKeyThrowingTutOnce = true

		DLC04TutorialZKeyThrow01.ShowAsHelpMessage("DLC04ZKeyThrow", 14, 0, 1, "NoMenu")
	endif
EndFunction