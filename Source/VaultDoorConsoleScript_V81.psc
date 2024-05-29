Scriptname VaultDoorConsoleScript_V81 extends ObjectReference
{Needed to do special case scripting for V81}

Keyword Property LinkVaultDoorConsoleFurniture Auto Hidden

Quest Property MyQuest Auto
Int Property StageToSet Auto

Message Property CombatNoActivate Auto Hidden

InputEnableLayer Property VaultDoorConsoleLayer Auto Hidden

Auto State waitingForPlayer

	;unlock the other vault doors, this one is a talkingActivator, so block activation so everything appears normal at first
	Event OnInit()
		Self.BlockActivation()
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		Actor PlayerREF = Game.GetPlayer()
		ObjectReference PlayerFurnitureREF = Self.GetLinkedRef(LinkVaultDoorConsoleFurniture)

		If akActionRef == PlayerREF

			if PlayerREF.IsInCombat()
				; Don't do a thing
				CombatNoActivate.Show()
			ElseIf PlayerREF.IsInPowerArmor()
				gotoState("hasBeenTriggered")
				; skip the animation and go directly to opening everything
				debug.trace(self + " Blocking Activation on V81 Console while in Power Armor.")
				Self.BlockActivation(True, True)
				Self.PlayAnimation("Stage2")
				Utility.Wait(2.0)
				Self.PlayAnimation("Stage3")
				MyQuest.SetStage(StageToSet)
			ElseIF PlayerREF.GetSitState() != 0
				; Don't do a thing
			else
				gotoState("AnimationEventState")
				;disable VATS controls 
				VaultDoorConsoleLayer = InputEnableLayer.Create()
				VaultDoorConsoleLayer.EnableVATS(False)
				;block activation for now, enable it in the V81_00_Intro quest
				debug.trace(self + " Blocking Activation on V81 Console while NOT in Power Armor. Playing animation")
				Self.BlockActivation(True, True)
				;put player in the furniture 
				PlayerFurnitureREF.Activate(PlayerREF)

				;wait for the pipboy animation to finish
				RegisterForAnimationEvent(PlayerREF, "On")
				;wait for the player button press anim
				RegisterForAnimationEvent(PlayerREF, "Play01")
				;wait for the button press to finish
				RegisterForAnimationEvent(Self, "stage4")
			EndIf
		EndIf
	EndEvent
EndState

State AnimationEventState
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
			gotoState("hasBeenTriggered")
			UnRegisterForAnimationEvent(Self, "stage4")
			;allow VATS again and delete layer
			VaultDoorConsoleLayer.EnableVATS(True)
			VaultDoorConsoleLayer = None
			MyQuest.SetStage(StageToSet)
		EndIf
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		;do nothing
	EndEvent
EndState

State hasBeenTriggered
	;empty state
EndState