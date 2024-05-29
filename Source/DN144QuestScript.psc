Scriptname DN144QuestScript extends Quest


ReferenceAlias Property ControlPanel Auto
ReferenceAlias Property GearDoor Auto
RefCollectionAlias Property	GearKlaxonLights Auto
ReferenceAlias Property	GearStrobeLight Auto
ReferenceAlias Property KlaxonSoundMarker Auto
Sound Property OBJKlaxon2DLP Auto
Int KlaxonSoundID

Bool Property ControlPanelDONE = False Auto hidden
Bool Property GearDoorDONE = False Auto hidden

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;when the player cryopod animation finishes, enable activation
;/
	If (akSource == Game.GetPlayer()) && (asEventName == "CameraOverrideStop") && (CryopodDONE == False)
		;TEMP - Show SPECIAL MENU
		Game.ShowSPECIALMenu()
		;make sure the player can activate the spouse body
		MQSpouseMale.GetActorRef().SetDestroyed(False)
		MQSpouseFemale.GetActorRef().SetDestroyed(False)
		;place the coughing/shiver upper animations on player. We turn these animations off in DialogueVault111		
		;Game.GetPlayer().AddKeyword(AnimCoughing)
		;Game.GetPlayer().AttemptAnimationSetSwitch()
		;remove the FX armor
		Game.GetPlayer().UnequipItem(fx1stpersongroggywakearmor, abSilent=True)
		Game.GetPlayer().RemoveItem(fx1stpersongroggywakearmor, abSilent=True)
		;Player can use controls again
		VSEnableLayer.EnablePlayerControls(abmenu=false, abVATS=false)
		UnregisterForAnimationEvent(Game.GetPlayer(), "CameraOverrideStop")

		;wait until we leave menu mode
		While Utility.IsInMenuMode()
			Utility.Wait(0.1)
		EndWhile

		;pop the objective
		SetObjectiveDisplayed(1)
		;never run this again
		CryopodDONE = True
	EndIf
/;
;/
	;if the pipboy boot sequence is complete, enable player controls
	If (akSource == Game.GetPlayer()) && (asEventName == "pipboyIdleRoot") && (PipboyDONE == False)
		SetStage(6)
		UnregisterForAnimationEvent(Game.GetPlayer(), "pipboyIdleRoot`")
		;never run this again
		PipboyDONE = True
	EndIf
/;
;/
	If (akSource == Game.GetPlayer()) && (asEventNAme == "On")
		;flip open the glass
		ControlPanel.GetRef().PlayAnimation("Stage2")
		;start Klaxon
		;StartKlaxonSound()
		;wait for pipboy to jack out
		;RegisterForAnimationEvent(Game.GetPlayer(), "Off")
		UnregisterForAnimationEvent(Game.GetPlayer(), "On")
		;play the SWF files on the pipboy
		Game.ShowPipboyPlugin()
	EndIf
/;
	;If (akSource == Game.GetPlayer()) && (asEventNAme == "Off")
		;depress the button
		;ControlPanel.GetRef().PlayAnimation("Stage3")
		;button to finish depressing
		;RegisterForAnimationEvent(ControlPanel.GetRef(), "stage4")
		;UnregisterForAnimationEvent(Game.GetPlayer(), "Off")
	;EndIf	

;/
	;if the vault control panel sequence is complete, open the vault gear door
	If (akSource == ControlPanel.GetRef()) && (asEventName == "Stage4") && (ControlPanelDONE == False)
		GearDoor.GetRef().PlayAnimation("Stage2")
		;enable the Klaxon lights. Animations play in the RefAlias scripts for each KlaxonLight
		GearKlaxonLights.EnableAll()

		UnregisterForAnimationEvent(ControlPanel.GetRef(), "Stage4")
		;wait for the gear door to finish animating, then stop Klaxon
		RegisterForAnimationEvent(GearDoor.GetRef(), "KlaxonStop")
		;never run this again
		ControlPanelDONE = True
		SetStage(8)
	EndIf
/;

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