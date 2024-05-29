Scriptname V81_00_IntroScript extends Quest Conditional

;Item Counters for Fusion Cores
GlobalVariable Property V81_00_Intro_FusionCoreTotal Auto
GlobalVariable Property V81_00_Intro_FusionCoreFound Auto
Quest Property V81_00_Intro Auto
Ammo Property AmmoFusionCore Auto

Function ItemCollected()
	debug.trace(self + " Fusion Core Collected")
	;Count items, advance quest once three are collected
	If GetStageDone(100) == 1 && GetStageDone(400) == 0
		If (Game.GetPlayer().GetItemCount(AmmoFusionCore) == 1)
			debug.trace("Player has one fusion core")
			V81_00_Intro_FusionCoreFound.SetValueInt(1)
			debug.trace(self + " item collected, objective displayed, updating counts")
			UpdateCurrentInstanceGlobal(V81_00_Intro_FusionCoreFound)
			SetObjectiveDisplayed(10, true, true)
			debug.trace(self + " Counts updated to 1/3")
  		EndIf
 		If (Game.GetPlayer().GetItemCount(AmmoFusionCore) == 2)
			debug.trace("Player has two fusion cores")
			V81_00_Intro_FusionCoreFound.SetValueInt(2)
			debug.trace(self + " item collected, objective displayed, updating counts")
			UpdateCurrentInstanceGlobal(V81_00_Intro_FusionCoreFound)
			SetObjectiveDisplayed(10, true, true)
			debug.trace(self + " Counts updated to 2/3")
  		EndIf
 		If (Game.GetPlayer().GetItemCount(AmmoFusionCore) >= 3)
			debug.trace("Player has three or more fusion cores")
			V81_00_Intro_FusionCoreFound.SetValueInt(3)
			debug.trace(self + " item collected, objective displayed, updating counts")
			UpdateCurrentInstanceGlobal(V81_00_Intro_FusionCoreFound)
			SetObjectiveDisplayed(10, true, true)
			debug.trace(self + " Counts updated to 3/3")
			SetStage(200)
			If GetStageDone(200) == 0
				SetObjectiveDisplayed(20)
			EndIf
			If GetStageDone(200) == 1 && GetStageDone(300) == 0
				SetObjectiveDisplayed(20)
			EndIf
			If GetStageDone(300) == 1 && GetStageDone(400) == 0
				SetObjectiveDisplayed(30)
			EndIf
  		EndIf 		 		
	EndIf
EndFunction

Function ItemDropped()
	debug.trace(self + " Fusion Core Dropped or Lost")
	;Count items, subtract dropped or lost items
	If GetStageDone(100) == 1 && GetStageDone(400) == 0 && Game.GetPlayer().GetItemCount(AmmoFusionCore) <= 3
		If (Game.GetPlayer().GetItemCount(AmmoFusionCore) == 0)
			debug.trace("Player has no fusion cores")
			V81_00_Intro_FusionCoreFound.SetValueInt(0)
			debug.trace(self + " item collected, objective displayed, updating counts")
			UpdateCurrentInstanceGlobal(V81_00_Intro_FusionCoreFound)
			SetObjectiveDisplayed(10, true, true)
			SetObjectiveDisplayed(20, false, false)
			SetObjectiveDisplayed(30, false, false)
			SetObjectiveDisplayed(31, false, false)
			V81_00_Intro_Overseer_Intro.Stop()
  		EndIf
 		If (Game.GetPlayer().GetItemCount(AmmoFusionCore) == 1)
			debug.trace("Player has one fusion core")
			V81_00_Intro_FusionCoreFound.SetValueInt(1)
			debug.trace(self + " item collected, objective displayed, updating counts")
			UpdateCurrentInstanceGlobal(V81_00_Intro_FusionCoreFound)
			SetObjectiveDisplayed(10, true, true)
			SetObjectiveDisplayed(20, false, false)
			SetObjectiveDisplayed(30, false, false)
			SetObjectiveDisplayed(31, false, false)
			V81_00_Intro_Overseer_Intro.Stop()
  		EndIf
 		If (Game.GetPlayer().GetItemCount(AmmoFusionCore) == 2)
			debug.trace("Player has two fusion cores")
			V81_00_Intro_FusionCoreFound.SetValueInt(2)
			debug.trace(self + " item collected, objective displayed, updating counts")
			UpdateCurrentInstanceGlobal(V81_00_Intro_FusionCoreFound)
			SetObjectiveDisplayed(10, true, true)
			SetObjectiveDisplayed(20, false, false)
			SetObjectiveDisplayed(30, false, false)
			SetObjectiveDisplayed(31, false, false)
			V81_00_Intro_Overseer_Intro.Stop()
		EndIf
		SetObjectiveDisplayed(30, False)
	EndIf
EndFunction

;Script for opening the Vault door

ReferenceAlias Property VaultDoorControl Auto
ReferenceAlias Property VaultDoor Auto
RefCollectionAlias Property	VaultDoorKlaxonLights Auto
ReferenceAlias Property	GearStrobeLight Auto
ReferenceAlias Property KlaxonSoundMarker Auto
Sound Property OBJKlaxon2DLP Auto
Int KlaxonSoundID

Bool Property ControlPanelDONE = False Auto hidden
Bool Property GearDoorDONE = False Auto hidden


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;wait for the gear door to finish animating, then stop Klaxon
	If (akSource == VaultDoor.GetRef()) && (asEventName == "KlaxonStop") && (GearDoorDONE == False)
		StopKlaxonSound()
		UnregisterForAnimationEvent(VaultDoor.GetRef(), "KlaxonStop")
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
	VaultDoor.GetRef().PlayAnimation("Stage2")
	;enable the Klaxon lights. Animations play in the RefAlias scripts for each KlaxonLight
	LocalEnableAll(VaultDoorKlaxonLights)
	;LocalActivate(GearKlaxonLights)
	;UnregisterForAnimationEvent(ControlPanel.GetRef(), "Stage4")
	;wait for the gear door to finish animating, then stop Klaxon
	RegisterForAnimationEvent(VaultDoor.GetRef(), "KlaxonStop")
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
Scene Property V81_00_Intro_Overseer_Intro Auto Const
