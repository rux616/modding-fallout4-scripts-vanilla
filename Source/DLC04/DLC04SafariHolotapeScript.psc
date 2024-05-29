Scriptname DLC04:DLC04SafariHolotapeScript extends ObjectReference

quest property DLC04SafariAdventureQuest auto 
int property onListenStage auto
int property onPickupStage auto
int property shutdownstage auto
int property prereqstage auto
bool property onlypickup auto


auto state WaitForPickup
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if (DLC04SafariAdventureQuest.isstagedone(shutdownstage) == false)
			if onPickupStage != 0 
				if (DLC04SafariAdventureQuest.isstagedone(onPickupstage) == false)
					if DLC04SafariAdventureQuest.isstagedone(prereqstage) == true
						DLC04SafariAdventureQuest.setstage(onPickupstage)
					endif
				endif
			endif
			if onlypickup == false
				gotostate("WaitForListen")
			else
				gotostate("done")
			endif
		endif
	EndEvent
endState

State WaitForListen
	Event onHolotapePlay(ObjectReference akTerminalRef)
		if (DLC04SafariAdventureQuest.isstagedone(shutdownstage) == false) && (DLC04SafariAdventureQuest.isstagedone(onListenstage) == false)
			DLC04SafariAdventureQuest.setstage(onListenstage)
			gotostate("Done")
		endif
	endEvent
endState

State Done
	;Do nothing
endState