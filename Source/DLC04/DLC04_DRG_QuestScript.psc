Scriptname DLC04:DLC04_DRG_QuestScript extends Quest

ReferenceAlias Property OneEyedIKe Auto Const Mandatory
GlobalVariable Property DLC04_DRG_ShootoutValid Auto Const Mandatory
GlobalVariable Property DLC04_DRG_ShootoutSuccess Auto Const Mandatory
GlobalVariable Property DLC04_DRG_ShootoutWeapon Auto Const Mandatory
Scene Property DLC04DryRockGulch_11_ShootOutSuccess Auto Const Mandatory
Scene Property DLC04DryRockGulch_12_ShootOutFailure Auto Const Mandatory
Scene Property DLC04DryRockGulch_10_ShootOutScene Auto Const Mandatory

Keyword Property WeaponTypeBallistic Auto Const Mandatory
Keyword Property WeaponTypeUnarmed Auto Const Mandatory
Keyword Property WeaponTypeMelee1H Auto Const Mandatory
Keyword Property WeaponTypeMelee2H Auto Const Mandatory
Keyword Property WeaponTypeExplosive Auto Const Mandatory
Keyword Property WeaponTypeLaser Auto Const Mandatory
Keyword Property WeaponTypePlasma Auto Const Mandatory

Int RobotDeathCount

Function CountDeadBots()
	RobotDeathCount+=1
	If RobotDeathCount >= 5
		SetStage(800)
	EndIf
EndFunction

Function StartShootOut()
	RegisterForHitEvent(OneEyedIke.GetActorRef())
	DLC04_DRG_ShootoutValid.SetValueInt(0)
EndFunction

Function StopShootOut()
	UnRegisterForHitEvent(OneEyedIke.GetActorRef())
	DLC04_DRG_ShootoutValid.SetValueInt(0)
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	Debug.Trace(akTarget + " was hit by " + akAggressor)

	;during the shootout, did the player hit Ike during the right timeframe?
	If akAggressor == Game.GetPlayer()
		If DLC04_DRG_ShootoutValid.GetValueInt() == 1
			DLC04_DRG_ShootoutSuccess.SetValueInt(1)
			DLC04DryRockGulch_10_ShootOutScene.Stop()
			DLC04DryRockGulch_11_ShootOutSuccess.Start()

			;check to see what kind of weapon hit him for dialogue conditions
			;0 = Ballistic, 1 = Unarmed, 2 = Any Melee, 3 = Explosive, 4 = Laser, 5 = Plasma			
			If akSource.HasKeyword(WeaponTypeBallistic)
				DLC04_DRG_ShootoutWeapon.SetValueInt(0)
			ElseIf akSource.HasKeyword(WeaponTypeUnarmed)
				DLC04_DRG_ShootoutWeapon.SetValueInt(1)
			ElseIf akSource.HasKeyword(WeaponTypeMelee1H)
				DLC04_DRG_ShootoutWeapon.SetValueInt(2)
			ElseIf akSource.HasKeyword(WeaponTypeMelee2H)
				DLC04_DRG_ShootoutWeapon.SetValueInt(2)
			ElseIf akSource.HasKeyword(WeaponTypeExplosive)
				DLC04_DRG_ShootoutWeapon.SetValueInt(3)
			ElseIf akSource.HasKeyword(WeaponTypeLaser)
				DLC04_DRG_ShootoutWeapon.SetValueInt(4)
			ElseIf akSource.HasKeyword(WeaponTypePlasma)
				DLC04_DRG_ShootoutWeapon.SetValueInt(5)
			EndIf			
		Else
			DLC04_DRG_ShootoutSuccess.SetValueInt(0)
			DLC04DryRockGulch_10_ShootOutScene.Stop()
			DLC04DryRockGulch_12_ShootOutFailure.Start()
		EndIf
	Else
		;aggressor wasn't the player, register for new hit
		RegisterForHitEvent(OneEyedIKe.GetActorRef())
	EndIf
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Remote listening for flag raise
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DLC04MQ03 Auto Const Mandatory
Function ListenForFlagRaise()
	RegisterForRemoteEvent(DLC04MQ03, "OnStageSet")

EndFunction

Group FlagRaiseProperties
	int Property ExternalFlagRaisedStage = 210 auto const
	int Property ExternalQuestKickoutStage = 1500 auto const

	int Property myFlagRaisedStage = 1500 auto const
	int Property myFlagFailedStage = 1600 auto const
EndGroup

Event Quest.OnStageSet(Quest sendingQuest, int auiStageID, int auiItemID)
	Debug.Trace(self + ": recieved OnStageSet from " + sendingQuest)
	Debug.Trace(self + "::: auiStageID = " + auiStageID)
	Debug.Trace(self + "::: auiItemID = " + auiItemID)
	;Flag Was raised!
	if auiStageID == ExternalFlagRaisedStage
		SetStage(myFlagRaisedStage)
		UnregisterForRemoteEvent(DLC04MQ03, "OnStageSet")
	;Flag raised fail due to raider kick out
	elseif auiStageID == ExternalQuestKickoutStage
		SetStage(myFlagFailedStage)
		UnregisterForRemoteEvent(DLC04MQ03, "OnStageSet")
	Endif
EndEvent