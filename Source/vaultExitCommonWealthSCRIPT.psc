Scriptname vaultExitCommonWealthSCRIPT extends ObjectReference
{Player the one shot animation and elevator in the Vault111Ext}

IMAGESPACEMODIFIER PROPERTY transitionISFX AUTO Const
IMAGESPACEMODIFIER PROPERTY blindISFX AUTO Const
ARMOR PROPERTY FXVault111ExitIdleLookUpInElevatorArmor AUTO Const
MUSICTYPE PROPERTY visionSwell AUTO Const
IDLE PROPERTY eyeShield AUTO Const
IDLE PROPERTY resetIdle AUTO Const
GLOBALVARIABLE PROPERTY gameHour AUTO Const
GlobalVariable Property TimeScale Auto Const
ObjectReference Property V111ElevatorCollisionPlatformEnableMarker Auto const

;elevator
OBJECTREFERENCE PROPERTY gearElevator AUTO Const

Weather Property CommonwealthClear Auto Const

Quest Property MQ102 Auto Const

Auto State WaitingForTrigger
	EVENT ONTRIGGERENTER(ObjectReference akActionRef)
		Actor PlayerREF = Game.GetPlayer()
		if akActionRef == PlayerREF
			gotoState("HasBeenTriggered")

			;force first person
			game.ForceFirstPerson()

			;disable controls
			InputEnableLayer myLayer = InputEnableLayer.Create()
			myLayer.DisablePlayerControls(true, true, true, true, true, true, true)

			;set time
			;wjs - we now do this in MQ102 stage 0
			;GameHour.SetValueInt(9)

			;time can advance again
			TimeScale.SetValueInt(20)
			
			;set weather, but don't override all weather because we want weather to transition back to the normal stack
			CommonwealthClear.ForceActive(abOverride=False)

			;Fade game in
			Game.FadeOutGame(false, true, 2, 0.5)
			;apply the FX
			transitionISFX.apply(1)

			;only do once
			self.disable()
			
			;apply the FX
			blindISFX.apply(1)

			;play Hatch Opening
			gearElevator.PlayAnimation("stage4")
			;debug.trace("called stage 4")
			;play eyeshield
			PlayerREF.playIdle(eyeShield)
			;play "God Rays" fade out
				; equip and animate "God Rays"
			PlayerREF.AddItem(FXVault111ExitIdleLookUpInElevatorArmor, abSilent=True)
			PlayerREF.EquipItem(FXVault111ExitIdleLookUpInElevatorArmor, true, true)
			;game.getPlayer().PlaySubGraphAnimation("Stage2")

			utility.wait(8)

			;play the music track
			visionSwell.Add()

			utility.wait(4)

			;reset idle
			PlayerREF.playIdle(resetIdle)
			PlayerREF.UnequipItem(FXVault111ExitIdleLookUpInElevatorArmor, true, true)
			PlayerREF.RemoveItem(FXVault111ExitIdleLookUpInElevatorArmor, abSilent=True)

			;disable the collision we use to keep the player from falling
			Debug.trace("Elevator Script (Exterior) - Disabling collision platform.")
			V111ElevatorCollisionPlatformEnableMarker.disable()
			;delete input layer
			myLayer = none

			MQ102.SetStage(10)
		ENDIF
	ENDEVENT
EndState

State HasBeenTriggered
	EVENT ONTRIGGERENTER(OBJECTREFERENCE obj)
		;empty state
	EndEvent
EndState
