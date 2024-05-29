Scriptname DLC03:DLC03MQ05Script extends Quest Conditional

InputEnableLayer myLayer

Function BlockPlayerControls()
	myLayer = InputEnableLayer.Create()
	myLayer.DisablePlayerControls()
EndFunction

Function UnblockPlayerControls()
	myLayer.Delete()
EndFunction

function RegisterLocationChange()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endfunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)

	;Debug.Trace(akOldLoc + " going to " + akNewLoc)

	; Once you get to Acadia - signal you're there
	if akSender == Game.GetPlayer() && akNewLoc == pDLC03AcadiaLocation
		SetStage(810)    ; The stage that handles the arrival
		UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	endif

EndEvent

;disable player controls, play a receive item anim, fade out, fade up
Function ExamineSkull()
	InputEnableLayer myLayer2 = InputEnableLayer.Create()
	Actor myPlayer = Game.GetPlayer()

	myLayer2.DisablePlayerControls()
	; Might be nice to play a give item
	Utility.Wait(2.0)
	Game.FadeOutGame(True, True, 0.0, 3.0, True)
	Utility.Wait(4.0)
	Game.FadeOutGame(False, True, 0.0, 3.0)
	Utility.Wait(1.0)
	
	;InputEnableLayer clears when the function ends, but let's clear it just in case
	myLayer2=None
EndFunction

; Make everyone in the RefCollection angry and irritated
function MakeAngry(RefCollectionAlias pRefColl)
	int i = 0
	while i < pRefColl.GetCount()
		ObjectReference theRef = pRefColl.GetAt(i)
		if theRef
			theRef.AddKeyword(pAnimArchetypeIrritated)
			theRef.AddKeyword(pAnimFaceArchetypeAngry)
		endif
		i += 1		
	endWhile
endFunction

; Make everyone in the RefCollection no longer angry and irritated
function CalmAnger(RefCollectionAlias pRefColl)
	int i = 0
	while i < pRefColl.GetCount()
		ObjectReference theRef = pRefColl.GetAt(i)
		if theRef
			theRef.RemoveKeyword(pAnimArchetypeIrritated)
			theRef.RemoveKeyword(pAnimFaceArchetypeAngry)
		endif
		i += 1		
	endWhile
endFunction

Int Property nDiMAJusticeCounter Auto Conditional
Int Property bAveryShownHolotape Auto Conditional

Location Property pDLC03AcadiaLocation Auto Const Mandatory

Int Property bTriedToSpareAvery Auto Conditional

Keyword Property pAnimArchetypeIrritated Auto Const Mandatory
Keyword Property pAnimFaceArchetypeAngry Auto Const Mandatory

Int Property bAveryConvincedOnce Auto Conditional

Int Property bAcadiaShouldBurn Auto Conditional

Int Property nFightAllenCounter Auto Conditional
