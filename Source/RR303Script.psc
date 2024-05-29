Scriptname RR303Script extends Quest Conditional

; location properties
Location Property pOldNorthChurchLocation Auto Const
Location Property RR303VertibirdLocation Auto Const

InputEnableLayer Property EnableLayer Auto

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	; watch for player to change location
	if akSender == Game.GetPlayer()

		; Checking to see if the player has chosen to go into the catacombs and help Glory
		if ( GetStageDone(210) && !GetStageDone(220) && Game.GetPlayer().IsInLocation(pOldNorthChurchLocation) )
			setStage(230)	; Flag you're helping Glory
		endif

	endif
EndEvent

Event Actor.OnItemEquipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
	if ( akSender == Game.GetPlayer() && !GetStageDone(1000) )		; Is the player equipping something?
		Debug.Trace(akSender + ", " + akBaseObject + ", " + akReference)

		; Is the equipped object a disguise? AND Has the alarm not gone off
		if ( akBaseObject.HasKeyword(pRR302BoSDisguise) && !GetStageDone(1000) )	
			Debug.Trace("The player is disguised")

			; Make the player friends with the BoS
			pBrotherhoodOfSteelFaction.SetPlayerEnemy(FALSE)
			Game.GetPlayer().AddToFaction(pRR302TempBoSFriends)
			;pBrotherhoodOfSteelFaction.SetEnemy(pPlayerFaction, FALSE)
		endif
	endIf
EndEvent

Event Actor.OnItemUnequipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
	if ( akSender == Game.GetPlayer() && !GetStageDone(1000) )		; Is the player unequipping something?
		Debug.Trace(akSender + ", " + akBaseObject + ", " + akReference)

		if ( akBaseObject.HasKeyword(pRR302BoSDisguise) )	; Is the unequipped object a disguise?
			Debug.Trace("The player is NOT disguised")

			; Make the player enemies with the BoS
			pBrotherhoodOfSteelFaction.SetPlayerEnemy()
			Game.GetPlayer().RemoveFromFaction(pRR302TempBoSFriends)
			;pBrotherhoodOfSteelFaction.SetEnemy(pPlayerFaction, TRUE)
		endif
	endIf
EndEvent

function RegisterVertibirdAnim()
	; Register for the "Spinning, Spinning line"
	RegisterForAnimationEvent(pRR302HijackVertibirdREF, "VertibirdDialogueStart") 
endFunction

function InitializeQuest()
	if initialized
		return
	endif

	RegisterForCustomEvent(MQ00, "MQFactionKickOut")

	Debug.Trace("RR303Script Intialized")

	initialized = true
endFunction

; Handle the vertibird spinning event
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	Debug.Trace(akSource + ", " + asEventName)
	if (asEventName == "VertibirdDialogueStart")
		SetStage(807)   ; Let the scene know that we're spinning
	endif
EndEvent

; handle faction kickout event
Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
	;store off which faction we just got kicked out of
	int kickoutFactionNumber = (akArgs[0] as int)

	Debug.Trace("Received kickout event: " + kickoutFactionNumber)

	if ( kickoutFactionNumber == 3 )     ; 3 is the Railroad
		SetStage(20000)                  ; Fail the quest
	endif

	if ( kickoutFactionNumber == 4 )     ; 4 is the Institute
		SetStage(20000)                  ; Fail the quest
	endif

EndEvent


Int Property bDeaconPostChurchTalk Auto Conditional
Keyword Property pRR302BoSDisguise Auto Conditional
Faction Property pBrotherhoodOfSteelFaction Auto Conditional
Faction Property pRR302TempBoSFriends Auto Conditional
Faction Property pPlayerFaction Auto Conditional
MQ00Script property MQ00 auto const
bool initialized = false


Int Property bDrummerGaveReport Auto Conditional

Int Property bDeaconIsActiveCompanion Auto Conditional

ObjectReference Property pRR302HijackVertibirdREF Auto Const
