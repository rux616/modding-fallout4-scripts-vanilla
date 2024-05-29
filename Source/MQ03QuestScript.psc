Scriptname MQ03QuestScript extends Quest  Conditional

Int Property RefusedPreston Auto Conditional
{variable to track if the player refuses to help Preston}

;variables for Raider death counts inside the Museum
GlobalVariable Property MQ03FirstRaiderCount Auto
GlobalVariable Property MQ03FirstRaiderTotal Auto

;variables for Raider death counts during Deathclaw fight
GlobalVariable Property MQ03DeathclawDeadCount Auto
GlobalVariable Property MQ03DeathclawDeadTotal Auto

; Stores the enable layer being used to disable player controls during the
; vertical slice intro. Created in MQ01 fragments and cleaned up in MQ03
; fragments
InputEnableLayer Property VSEnableLayer Auto Hidden

InputEnableLayer Property VaultDoorConsoleLayer Auto Hidden

ReferenceAlias Property ControlPanel Auto
ReferenceAlias Property VaultGearDoor Auto
ReferenceAlias Property	Vault111KlaxonLight01 Auto
ReferenceAlias Property	Vault111KlaxonLight02 Auto
ReferenceAlias Property	Vault111KlaxonLight03 Auto
ReferenceAlias Property	Vault111KlaxonLight04 Auto
ReferenceAlias Property	Vault111StrobeLight01 Auto
ReferenceAlias Property	MQSpouseMale Auto
ReferenceAlias Property	MQSpouseFemale Auto
ReferenceAlias Property KlaxonSoundMarker Auto
ReferenceAlias Property Player Auto
Sound Property OBJKlaxon2DLP Auto
Int KlaxonSoundID

Bool Property CryopodDONE = False Auto
Bool Property PipboyDONE = False Auto
Bool Property ControlPanelDONE = False Auto
Bool Property GearDoorDONE = False Auto

Keyword Property AnimCoughing Auto

Armor Property fx1stpersongroggywakearmor Auto

;variable to track player's progress in Vault111
Int Property V111QT = 0 Auto Conditional
Int Property ReSpecDone Auto Conditional

ReferenceAlias Property Alias_PrestonDoor Auto
ReferenceAlias Property Alias_PrestonExitDoor Auto

ReferenceAlias Property RaiderA1 Auto
ReferenceAlias Property RaiderA2 Auto

Quest Property MQ101 Auto
Quest Property Min00 Auto

MusicType Property MUSSpecialVault111DoorA Auto
MusicType Property MUSSpecialVault111DoorB Auto

ObjectReference Property V111ExitLightingEnableMarker Auto

Function PlayerWakesUp()
	(Player as MQ03PlayerScript).PlayerRegister()
EndFunction

;function call used to open Preston's door, but only when he is in position near the door, See DialogueConcordArea scenes
Function OpenPrestonDoor()
	Alias_PrestonDoor.GetRef().Unlock()
	Alias_PrestonDoor.GetRef().SetOpen()
EndFunction

Function FirstWaveRaiderDead()
	debug.trace(self + " Concord Museum Raider has died")
	;Count dead, advance quest once all are dead
	If GetStageDone(80) == 1
		if Min00.ModObjectiveGlobal(1, MQ03FirstRaiderCount, 85, MQ03FirstRaiderTotal.value)
			debug.trace(self + " Raider dead, objective displayed, updating counts")
  			SetStage(85)
		endif
	Else
		;don't display objective unless stage has been set
		if Min00.ModObjectiveGlobal(1, MQ03FirstRaiderCount, -1, MQ03FirstRaiderTotal.value)
			debug.trace(self + " Raider dead, objective NOT displayed, updating counts")
  			SetStage(85)
		endif
	EndIf

	;Failsafe
	If MQ03FirstRaiderCount.value >= MQ03FirstRaiderTotal.value
		SetStage(85)
	EndIf

EndFunction

Function DeathclawFightRaiderDead()
	debug.trace(self + " Deathclaw Fight: Concord Raider has died")
	;Count dead, advance quest once all are dead
	;We only want to start counting once the respawn script stops
	if Min00.ModObjectiveGlobal(1, MQ03DeathclawDeadCount, -1, MQ03DeathclawDeadTotal.value)
		debug.trace(self + " Raider dead, objective displayed, updating counts")
		SetStage(122)
	EndIf

	;Failsafe
	If MQ03DeathclawDeadCount.value >= MQ03DeathclawDeadTotal.value
		SetStage(122)
	EndIf

EndFunction

Event OnTimer(int aiTimerID)

	;Dogmeat Timer for the neighborhood
	If aiTimerID == 1
		SetStage(40)
	EndIf

	;Dogmeat Timer for escort
	If aiTimerID == 10
		SetStage(53)
	EndIf

EndEvent


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;when the player cryopod animation finishes, enable activation
	If (akSource == Game.GetPlayer()) && (asEventName == "CameraOverrideStop") && (CryopodDONE == False)
		;TEMP - Show SPECIAL MENU if we're not going through CharGen
		If MQ101.GetStageDone(900) == 0
			Game.ShowSPECIALMenu()
		EndIf
		;make sure the player can activate the spouse body
		MQSpouseMale.GetActorRef().BlockActivation(false, false)
		MQSpouseFemale.GetActorRef().BlockActivation(false, false)
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
		If MQ101.GetStageDone(900) == 1
			MQ101.SetStage(1000)
		EndIf

		;never run this again
		CryopodDONE = True

		;enable full compass
		Game.SetCharGenHUDMode(0)

		SetStage(1)

		;before we request autosave, wait a second for animation to clear
		;WJS - no longer need the wait
		;Utility.Wait(2.0)
		;autosave
		Game.RequestAutoSave()
	EndIf

	;if the pipboy boot sequence is complete, enable player controls
	If (akSource == Game.GetPlayer()) && (asEventName == "pipboyIdleRoot") && (PipboyDONE == False)
		UnregisterForAnimationEvent(Game.GetPlayer(), "pipboyIdleRoot`")

		;re-enable the HDR mask for the pipboy so the player can read the screen again
		Game.EnablePipboyHDRMask()

		SetStage(6)

		;never run this again
		PipboyDONE = True
	EndIf

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

	;wait for glass to flip
	If (akSource == ControlPanel.GetRef()) && (asEventName == "End")
		UnregisterForAnimationEvent(ControlPanel.GetRef(), "End")
	EndIf

	;If (akSource == Game.GetPlayer()) && (asEventNAme == "Off")
		;depress the button
		;ControlPanel.GetRef().PlayAnimation("Stage3")
		;button to finish depressing
		;RegisterForAnimationEvent(ControlPanel.GetRef(), "stage4")
		;UnregisterForAnimationEvent(Game.GetPlayer(), "Off")
	;EndIf	

	If (akSource == Game.GetPlayer()) && (asEventName == "Play01")
		(ControlPanel as MQ03ControlPanelScript).DepressButton()
	EndIf

	;if the vault control panel sequence is complete, open the vault gear door
	If (akSource == ControlPanel.GetRef()) && (ControlPanelDONE == False) && (asEventName == "Stage4")
		VaultGearDoor.GetRef().PlayAnimation("Stage2")
		;enable the Klaxon lights. Animations play in the RefAlias scripts for each KlaxonLight
		Vault111KlaxonLight01.GetRef().Enable()
		Vault111KlaxonLight02.GetRef().Enable()
		Vault111KlaxonLight03.GetRef().Enable()
		Vault111KlaxonLight04.GetRef().Enable()
		Vault111StrobeLight01.GetRef().Enable()

		;enable special exit lighting
		V111ExitLightingEnableMarker.Enable()

		;cue music
		MUSSpecialVault111DoorA.Add()

		UnregisterForAnimationEvent(ControlPanel.GetRef(), "Stage4")
		UnRegisterForAnimationEvent(Game.GetPlayer(), "Play01")
		;wait for the gear door to finish animating, then stop Klaxon
		RegisterForAnimationEvent(VaultGearDoor.GetRef(), "KlaxonStop")
		;wait for bridge to extend, then cue music
		RegisterForAnimationEvent(VaultGearDoor.GetRef(), "stage3")
		;never run this again
		ControlPanelDONE = True
		SetStage(8)
	EndIf
	;wait for the gear door to finish animating, then stop Klaxon
	If (akSource == VaultGearDoor.GetRef()) && (asEventName == "KlaxonStop") && (GearDoorDONE == False)
		StopKlaxonSound()
		;turn off strobe
		Vault111StrobeLight01.GetRef().Disable()
		UnregisterForAnimationEvent(VaultGearDoor.GetRef(), "KlaxonStop")
		;never run this again
		GearDoorDONE = True
	EndIf

	;wait for the bridge to fully extend, then cue music
	If (akSource == VaultGearDoor.GetRef()) && (asEventName == "stage3")
		UnregisterForAnimationEvent(VaultGearDoor.GetRef(), "stage3")
	EndIf

EndEvent

Function StartKlaxonSound()
	KlaxonSoundID = OBJKlaxon2DLP.Play(KlaxonSoundMarker.GetRef())
EndFunction

Function StopKlaxonSound()
	Sound.StopInstance(KlaxonSoundID)
EndFunction

Function MQ102EnableVats()
	VSEnableLayer.EnablePlayerControls(abmenu=false, abVATS=True)
EndFunction

Function DisablePipboy()
	VSEnableLayer = InputEnableLayer.Create()
	VSEnableLayer.DisablePlayerControls(abMovement=False)
EndFunction

Function ResetVaultLights()
	;once the player is leaving the vault, turn off the emergency lights
	Vault111KlaxonLight01.GetRef().GetLinkedRef().PlayAnimation("Reset")
	Vault111KlaxonLight02.GetRef().GetLinkedRef().PlayAnimation("Reset")
	Vault111KlaxonLight03.GetRef().GetLinkedRef().PlayAnimation("Reset")
	Vault111KlaxonLight04.GetRef().GetLinkedRef().PlayAnimation("Reset")
	Vault111KlaxonLight01.GetRef().Disable()
	Vault111KlaxonLight02.GetRef().Disable()
	Vault111KlaxonLight03.GetRef().Disable()
	Vault111KlaxonLight04.GetRef().Disable()
EndFunction