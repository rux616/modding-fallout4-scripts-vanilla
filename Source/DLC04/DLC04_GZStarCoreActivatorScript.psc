Scriptname DLC04:DLC04_GZStarCoreActivatorScript Extends ObjectReference
{Script for the Star Core loose activator. Activating it 'picks it up', disabling the activator and adding a Star Core misc item to the player's inventory.}
;
;I'm doing this instead of placing loose misc items in the world because the Activator won't havok (so nothing can be lost)
;and it simplifies the management of the misc items, so I don't have to find them and pull them together into a collection, etc..

DLC04:DLC04GZTrackingQuestScript property DLC04GZTrackingQuest Auto Const Mandatory
{Galactic Zone Tracking Quest}

DLC04:DLC04GZMainQuestScript property DLC04GZMainQuest Auto Const Mandatory

DLC04:DLC04GZTrackingQuestStarCoreCollection property GalacticZoneOutsideCores Auto Const Mandatory

DLC04:DLC04GZTrackingQuestStarCoreCollection myCollection 	;RefCollectionAlias on DLC04GZMainQuest, if any.

;Register this Star Core's colleciton when DLC04GZMainQuest starts up.
Function RegisterCollection(DLC04:DLC04GZTrackingQuestStarCoreCollection c)
	myCollection = c
EndFunction

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		if (akActionRef == Game.GetPlayer())
			GoToState("Done")
			Self.DisableNoWait()
			DLC04GZTrackingQuest.AddCoreToPlayer()
			;Update the tracking quest.
			if (myCollection != None)
				myCollection.StarCoreTaken(Self)
			Else
				GalacticZoneOutsideCores.StarCoreTaken(Self)
			EndIf
		EndIf		    
	EndEvent
EndState

State Done
	;Do nothing.
EndState