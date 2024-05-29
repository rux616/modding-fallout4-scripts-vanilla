Scriptname VaultDoorConsoleScript extends ObjectReference

Keyword Property LinkVaultDoorConsoleFurniture Auto Hidden

Quest Property MyQuest Auto
Int Property StageToSet Auto

InputEnableLayer Property VaultDoorConsoleLayer Auto Hidden

Event OnActivate(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()
	ObjectReference PlayerFurnitureREF = Self.GetLinkedRef(LinkVaultDoorConsoleFurniture)

	If akActionRef == PlayerREF

		if PlayerREF.IsInCombat()
			; skip the animation and go directly to opening everything
			Self.BlockActivation(True, True)
			Self.PlayAnimation("Stage2")
			Utility.Wait(2.0)
			Self.PlayAnimation("Stage3")
			MyQuest.SetStage(StageToSet)
		ElseIf PlayerREF.IsInPowerArmor()
			; skip the animation and go directly to opening everything
			Self.BlockActivation(True, True)
			Self.PlayAnimation("Stage2")
			Utility.Wait(2.0)
			Self.PlayAnimation("Stage3")
			MyQuest.SetStage(StageToSet)
		ElseIf PlayerREF.GetSitState() != 0
			; Don't do a thing
		else
			;disable VATS controls 
			VaultDoorConsoleLayer = InputEnableLayer.Create()
			VaultDoorConsoleLayer.EnableVATS(False)
			Self.BlockActivation(True, True)
			;put player in the furniture 
			PlayerFurnitureREF.Activate(PlayerREF)

			;wait for the pipboy animation to finish
			RegisterForAnimationEvent(PlayerREF, "On")
			;wait for the player button press anim
			RegisterForAnimationEvent(PlayerREF, "Play01")
			;wait for the button press to finish
			RegisterForAnimationEvent(Self, "stage4")

			;patch 1.3 - 89054 - if the player ever gets up from the furniture (such as being hit) we need to know
			RegisterForRemoteEvent(PlayerREF, "OnGetUp")
		EndIf
	EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	Actor PlayerREF = Game.GetPlayer()

	;player plugs in the pipboy
	If (akSource == PlayerREF) && (asEventNAme == "On")
		UnregisterForAnimationEvent(PlayerREF, "On")
		;flip open the glass
		Self.PlayAnimation("Stage2")
		;play the SWF files on the pipboy
		Game.ShowPipboyPlugin()
	EndIf

	;player presses the button
	If (akSource == PlayerREF) && (asEventName == "Play01")
		UnRegisterForAnimationEvent(PlayerREF, "Play01")
		;depress button animation
		Self.PlayAnimation("Stage3")
	EndIf

	;if the vault control panel sequence is complete, set stage in quest
	If (akSource == Self) && (asEventName == "stage4")
		UnRegisterForAnimationEvent(Self, "stage4")
		;allow VATS again and delete layer
		VaultDoorConsoleLayer.EnableVATS(True)
		VaultDoorConsoleLayer = None
		MyQuest.SetStage(StageToSet)

		;patch 1.3 - 89054 - no need to catch the getup event anymore
		UnRegisterForRemoteEvent(PlayerREF, "OnGetUp")
	EndIf
EndEvent

;patch 1.3 - 89054 - if the player ever leaves the linked furniture, we need to clear the control lock and re-enable the console

;need to create a function so I can call this remotely to fix savegames already in this state
Function ResetVaultConsole()
	Actor PlayerREF = Game.GetPlayer()
	VaultDoorConsoleLayer.EnableVATS()
	VaultDoorConsoleLayer = None
	Self.BlockActivation(False, False)

	;unregister for previously registered events
	UnregisterForAllEvents()
EndFunction

Event Actor.OnGetUp(Actor akSender, ObjectReference akFurniture)
	Actor PlayerREF = Game.GetPlayer()
	If (akSender == PlayerREF) && (akFurniture == Self.GetLinkedRef(LinkVaultDoorConsoleFurniture))
		ResetVaultConsole()
	EndIf
EndEvent

;Event OnReset()
;	Self.PlayAnimation("reset")
;	Self.BlockActivation(False, False)
;EndEvent