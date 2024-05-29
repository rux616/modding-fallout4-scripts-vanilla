Scriptname DLC03:DLC03DialogueFarHarborScript extends Quest Conditional

Int nLeaveCounter
Int nHullCounter
Int Property SPEECHWright01 Auto Conditional
Int Property SPEECHWright02 Auto Conditional
Int Property bAllenCanTalkAboutChildren Auto Conditional
Perk Property pDLC03AllenMarkUpPerk Auto Const Mandatory
Location Property pDLC03FarHarborSettlementLocation Auto Const Mandatory

DCL03MQ00Script Property pDLC03MQ00 Auto Const Mandatory
;MQ00Script property MQ00 auto const
bool initialized = false

function InitializeQuest()
	if initialized
		return
	endif

	RegisterForCustomEvent(pDLC03MQ00, "DLC03FarHarborKickOut")
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")

	Debug.Trace("DLC03DialogueFarHarborScript Intialized")

	initialized = true
endFunction

function RegisterLocation()
	; Safety net - it's registed on init right now, too
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endFunction

function UnregisterLocation()
	UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endFunction

; handle faction kickout event
Event DLC03:DCL03MQ00Script.DLC03FarHarborKickOut(DCL03MQ00Script akSender, Var[] akArgs)
	Debug.Trace("Received kickout event for Far Harbor")

	SetStage(9000)                   ; Handle kickout

EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	
	Debug.Trace("Things change")

	; If you leave Far Harbor - then keep track of things
	if ( akOldLoc == pDLC03FarHarborSettlementLocation )
		nLeaveCounter += 1

		; If you leave Far Harbor 3 times, then Andre is either dead or recovered
		if ( nLeaveCounter >= 2 && GetStageDone(500) && !GetStageDone(150) && !GetStageDone(140) )
			if ( GetStageDone(110) )	; Has the player healed him?
				SetStage(150)		; Andre has recovered
			else
				SetStage(140)		; Kill Andre Michaud
			endif
			;UnRegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
		endif

		; Andre said he was going to leave Far Harbor, and he does (to presumably die someplace)
		if ( GetStageDone(160) && !GetStageDone(140) )
			SetStage(140)			; Kill Andre Michaud
			;UnRegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
		endif

		; Is the Mariner ready to talk about cancer?
		if ( GetStageDone(600) && !GetStageDone(625) )
			SetStage(625)   ; Then flag it
		endif

		; Has the Hull been constructed without the Power Tools?
		if ( GetStageDone(715) )
			nHullCounter += 1
			if ( nHullCounter == 3 )    ; On the 3rd visit, the Hull falls apart
				pLevel2PanelsIntact.Disable()
				pLevel2PanelsBroken.Enable()
				nHullCounter = 0
			else	; Otherwise, the Hull's in good shape
				pLevel2PanelsIntact.Enable()
				pLevel2PanelsBroken.Disable()
			endif
		endif

	endif

EndEvent

function RemoveAllenMarkUp()
	Utility.Wait(3.0)
	Game.GetPlayer().RemovePerk(pDLC03AllenMarkUpPerk)
endFunction


ObjectReference Property pLevel2PanelsIntact Auto Const Mandatory

ObjectReference Property pLevel2PanelsBroken Auto Const Mandatory
