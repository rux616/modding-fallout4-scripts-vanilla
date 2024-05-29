Scriptname Vault111BlockedDoorScript extends ReferenceAlias

Sound Property OBJSwitchGearDoorPanelFail Auto
Scene Property p008_EmergencyDoorScene Auto
Int DoOnce = 0
Scene Property p007_PlayerBrokenDoor Auto
bool bInitialized = false	; set to true when successfully initialized (e.g. ref is in alias)

Event OnAliasInit()
	if bInitialized == false
		bInitialized = true
		Self.GetRef().BlockActivation()
		debug.trace(self + " has been blocked")
	EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		If DoOnce == 0
			DoOnce = 1
			;p007_PlayerBrokenDoor.Start()
			p008_EmergencyDoorScene.Start()		
		Else
			;trigger fail sound
			OBJSwitchGearDoorPanelFail.Play(self.GetRef())
			If p007_PlayerBrokenDoor.IsPlaying() == False
				p007_PlayerBrokenDoor.Start()
			EndIf
		EndIf
	EndIf
EndEvent