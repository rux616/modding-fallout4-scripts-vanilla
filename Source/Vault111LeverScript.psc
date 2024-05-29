Scriptname Vault111LeverScript extends ObjectReference

Sound Property OBJSwitchGearDoorPanelFail Auto
Scene Property BrokenCryopodScene Auto
Int DoOnce = 0
bool bInitialized = false	; set to true when successfully initialized (e.g. ref is in alias)

Event OnInit()
	if bInitialized == false
		bInitialized = true
		Self.BlockActivation()
	EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		OBJSwitchGearDoorPanelFail.Play(self)
		If BrokenCryopodScene.IsPlaying() == False
			BrokenCryopodScene.Start()
		EndIf
	EndIf
EndEvent