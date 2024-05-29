Scriptname CreationClub:VRWorkshops:VRWorkshopAttacksQuestScript extends Quest
{Handles staging enemy attacks in VR Workshops.}

Group RefAliasCollections
	RefCollectionAlias Property AttackSpawnPointsRefCol Auto Const Mandatory
	{Fills with spawn points on quest start which player has placed around VR settlement. RefAlias data in the editor controls initial max fill amount.}
	RefCollectionAlias Property AttackEnemiesRefCol Auto Const Mandatory
	{Track the enemies themselves that are spawned at the markers.}
EndGroup

Group TeleportEffects
	EffectShader Property TeleportInFXS Auto Const Mandatory
	EffectShader Property TeleportOutFXS Auto Const Mandatory
	Sound Property TeleportSound Auto Const Mandatory
EndGroup

Group ActorValues
	ActorValue Property LeftAttackCondition Auto Const Mandatory
	ActorValue Property LeftMobilityCondition Auto Const Mandatory
	ActorValue Property PerceptionCondition Auto Const Mandatory
	ActorValue Property RightAttackCondition Auto Const Mandatory
	ActorValue Property RightMobilityCondition Auto Const Mandatory
	ActorValue Property EnduranceCondition Auto Const Mandatory
	ActorValue Property Rads Auto Const Mandatory
	ActorValue Property Health Auto Const Mandatory
EndGroup

Group Messages
	Message Property VRWorkshop_Message_AttackStart Auto Const Mandatory
	Message Property VRWorkshop_Message_AttackStop Auto Const Mandatory
	Message Property VRWorkshop_Message_NoEnemySpawners Auto Const Mandatory
	Message Property VRWorkshopShared_MessageBox_AttackModeBleedout Auto Const Mandatory
EndGroup

Group StageNumbers
	Int Property StageReady = 10 Auto Const
	{Stage to set when all the enemies have been spawned. Completion stage is }
	Int Property StageCompleted = 1000 Auto Const
	{Stage to set to clean up and reset quest}
EndGroup

Float AnimationDuration = 1.2 Const

;===========
;States
;===========

;Empty State

Function StartVRAttack()
EndFunction

Function StopVRAttack()
EndFunction

Function FailVRAttack()
EndFunction

Auto STATE Waiting

	Function StartVRAttack()
		debug.trace("VR WORKSHOP: " + self + " - StartVRAttack() called, starting quest to load RefCollections.")
		GoToState("Busy")
		Start()
		GoToState("Waiting")
	EndFunction

	Function StopVRAttack()
	{Called by script fragments on terminal, or when leaving VR}
		GoToState("Busy")
		debug.trace("VR WORKSHOP: " + self + " StopVRAttack() stopping")
		VRWorkshop_Message_AttackStop.Show()
		TeleportSound.Play(Game.GetPlayer())
		DisableAllEnemies()
		SetStage(StageCompleted)
		GoToState("Waiting")

	EndFunction

	Function FailVRAttack()
	{Called by player RefAlias when "killed" (bleedout) to fail the quest and avoid stun lock}
		GoToState("Busy")
		debug.trace("VR WORKSHOP: " + self + " StopVRAttack() stopping due to player bleedout")
		TeleportSound.Play(Game.GetPlayer())
		VRWorkshopShared_MessageBox_AttackModeBleedout.Show() ;tell player they failed to survive attack mode
		DisableAllEnemies()
		SetStage(StageCompleted) ;Note that this stage stops the quest
		GoToState("Waiting")		
	EndFunction

ENDSTATE

STATE Busy
	Function StartVRAttack()
	EndFunction

	Function StopVRAttack()
	EndFunction

	Function FailVRAttack()
	EndFunction
ENDSTATE

;=====================
;Functions (Stateless)
;=====================

Function SpawnEnemiesAtMarkers()

	int iCount = AttackSpawnPointsRefCol.GetCount() ;the total count

	If(iCount)
		;Loop over spawn points and place enemies

		int iIndex = 0 ;current index of the loop

		While (iIndex < iCount)

			;Grab the instance of the attack marker
			CreationClub:VRWorkshops:VRWorkshopAttackMarkerScript attackMarker = AttackSpawnPointsRefCol.GetAt(iIndex) as CreationClub:VRWorkshops:VRWorkshopAttackMarkerScript

			If(attackMarker)
				debug.trace("VR WORKSHOP: " + self + " Spawning enemy at ref: " + attackMarker)
				ObjectReference enemyToSpawn = attackMarker.SpawnEnemyAtMarker() ;what type of enemy spawns is defined at the activator/script level
				AttackEnemiesRefCol.AddRef(enemyToSpawn) ;add spawned actor to the RefCollectionAlias for control and cleanup
			EndIf
			iIndex += 1
		EndWhile

		debug.trace("VR WORKSHOP: " + self + " Total enemies spawned " + AttackEnemiesRefCol.GetCount())

		VRWorkshop_Message_AttackStart.Show()

		;Go to the next stage, which is the 'ready' stage with a quest marker
		SetStage(StageReady)
	Else
		debug.trace("VR WORKSHOP: " + self + " - No spawn markers found, aborting")
		VRWorkshop_Message_NoEnemySpawners.Show() ;TODO this should also show in the terminal
		Stop()
	EndIf		

EndFunction


Function DisableAllEnemies()
	int iCount = AttackEnemiesRefCol.GetCount()
	int iIndex = 0

	;Disable enemies. Done in two passes so the Utilty.Wait to play VFX doesn't delay disabling them all.

	;VFX PASS
	While (iIndex < iCount)
		If(AttackEnemiesRefCol.GetAt(iIndex)) ;avoid log spam
			(AttackEnemiesRefCol.GetAt(iIndex) as Actor).StopCombat()
			PlayTeleportOutEffect(AttackEnemiesRefCol.GetAt(iIndex))
		EndIf
		iIndex += 1
	EndWhile

	Utility.Wait(AnimationDuration)
	iIndex = 0

	;DISABLE PASS
	While (iIndex < iCount)
		If(AttackEnemiesRefCol.GetAt(iIndex)) ;avoid log spam
			AttackEnemiesRefCol.GetAt(iIndex).DisableNoWait()
		EndIf
		iIndex += 1
	EndWhile
EndFunction

Function PlayTeleportOutEffect(ObjectReference enemyToDisable)
	TeleportOutFXS.play(enemyToDisable, AnimationDuration)
	TeleportSound.Play(enemyToDisable)
EndFunction
