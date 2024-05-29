Scriptname CreationClub:VRWorkshops:VRWorkshopAttackEnemyRefScript extends RefCollectionAlias
{Handles events and visual effects for VR Workshop enemy attacks}

Group EffectShaders
	EffectShader Property TeleportInFXS Auto Const Mandatory
	EffectShader Property TeleportOutFXS Auto Const Mandatory
	EffectShader Property HologramShaunFXS Auto Const Mandatory
EndGroup

Group SoundEffects
	Sound Property TeleportSound Auto Const Mandatory
EndGroup

Group QuestData
	Quest Property VRAttackQuest Auto Const Mandatory
	{The VR Attack quest so we can stop it when all hostiles are cleared}
	RefCollectionAlias Property AttackEnemiesRefCol Auto Const Mandatory
	{Collection of enemies spawned during staged VR Attack}
	Int Property StageHostilesCleared = 50 Auto Const
	{Stage to set when player/settlers kill all of the spawned enemies, to finish objective}	
EndGroup

Float AnimationDuration = 2.0 Const

Event OnLoad(ObjectReference akSender)
	debug.trace("VR WORKSHOPS: VR enemy loaded")

	;Teleport in effects
	TeleportInFXS.play(akSender, AnimationDuration)
	TeleportSound.Play(akSender)

	;Hologram effects
	HologramShaunFXS.Play(akSender)
	(akSender as Actor).SetAlpha(0.50)	

	BlockActivation(True,True) ;prevent pickpocket or looting after dead
EndEvent

Event OnDeath(ObjectReference akSender, Actor akKiller)
	debug.trace("VR WORKSHOPS: VR enemy killed")
	;Teleport out
	TeleportOutFXS.play(akSender, AnimationDuration)
	TeleportSound.Play(akSender)
	Utility.Wait(AnimationDuration) ;wait for effect to finish
	akSender.Disable() ;make the body disappear
	RemoveEnemyFromRefCollection(akSender) ;"Call home" to remove self from ref collection, do this last to block cannibal perk
EndEvent

Function RemoveEnemyFromRefCollection(ObjectReference enemyToRemove)
	debug.trace("VR WORKSHOP: Removing " + enemyToRemove + "from RefCollection.")

	AttackEnemiesRefCol.RemoveRef(enemyToRemove)

	;This is the last enemy in the collection, finish the quest
	If(!AttackEnemiesRefCol.GetCount())
		debug.trace("There are no more enemies in the ref collection, finish the quest.")
		VRAttackQuest.SetStage(StageHostilesCleared)
	EndIf

EndFunction