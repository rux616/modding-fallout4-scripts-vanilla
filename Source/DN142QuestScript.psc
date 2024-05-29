Scriptname DN142QuestScript extends Quest


ReferenceAlias Property ControlPanel Auto
ReferenceAlias Property GearDoor Auto
RefCollectionAlias Property	GearKlaxonLights Auto
ReferenceAlias Property	GearStrobeLight Auto
ReferenceAlias Property KlaxonSoundMarker Auto
Sound Property OBJKlaxon2DLP Auto
ObjectReference Property VDoorCollision Auto
Int KlaxonSoundID


Bool Property ControlPanelDONE = False Auto hidden
Bool Property GearDoorDONE = False Auto hidden

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;wait for the gear door to finish animating, then stop Klaxon
	If (akSource == GearDoor.GetRef()) && (asEventName == "KlaxonStop") && (GearDoorDONE == False)
		StopKlaxonSound()
		UnregisterForAnimationEvent(GearDoor.GetRef(), "KlaxonStop")
		;never run this again
		GearDoorDONE = True
	EndIf
EndEvent

Function StartKlaxonSound()
	KlaxonSoundID = OBJKlaxon2DLP.Play(KlaxonSoundMarker.GetRef())
EndFunction

Function StopKlaxonSound()
	Sound.StopInstance(KlaxonSoundID)
EndFunction

Function OpenGearDoor()
	GearDoor.GetRef().PlayAnimation("Stage2")
	VDoorCollision.Disable()
	;enable the Klaxon lights. Animations play in the RefAlias scripts for each KlaxonLight
	LocalEnableAll(GearKlaxonLights)
	;LocalActivate(GearKlaxonLights)
	;UnregisterForAnimationEvent(ControlPanel.GetRef(), "Stage4")
	;wait for the gear door to finish animating, then stop Klaxon
	RegisterForAnimationEvent(GearDoor.GetRef(), "KlaxonStop")
	;never run this again
	;ControlPanelDONE = True
	;SetStage(8)
EndFunction

; Enable everyone in the collection
function LocalEnableAll(refCollectionAlias myCollectionAlias, bool bEnabled = true)
	int index = 0
	ObjectReference currentRef
	int count = myCollectionAlias.GetCount()
	while index < count
		currentRef = myCollectionAlias.GetAt(index)
		if currentRef
			currentRef.Enable(bEnabled)
			currentRef.Activate(currentRef)
		endif
		index += 1		
	endWhile
endFunction
;/
function LocalActivate(refCollectionAlias myCollectionAlias)
	int index = 0
	ObjectReference currentRef
	int count = myCollectionAlias.GetCount()
	while index < count
		currentRef = myCollectionAlias.GetAt(index)
		if currentRef
			currentRef.Activate(currentRef)
		endif
		index += 1		
	endWhile
endFunction
/;