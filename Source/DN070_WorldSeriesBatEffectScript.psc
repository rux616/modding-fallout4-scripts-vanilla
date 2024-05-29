Scriptname DN070_WorldSeriesBatEffectScript extends ActiveMagicEffect  

ObjectReference property DN070_WorldSeriesBatEffectMarker Auto Const
Keyword property DN070_WorldSeriesBatKnockdownEffect_ExclusionKeyword Auto Const
Sound property UIPerkGrandSlamHit Auto Const
ActorValue property Luck Auto Const
int property minPushForce = 10 Auto Const
int property maxPushForce = 15 Auto Const

Event OnEffectStart(actor Target, actor Caster)
	Actor player = Game.GetPlayer()
	DN070_WorldSeriesBatEffectMarker.MoveTo(player)
	DN070_WorldSeriesBatEffectMarker.SetPosition(DN070_WorldSeriesBatEffectMarker.GetPositionX(), DN070_WorldSeriesBatEffectMarker.GetPositionY(), DN070_WorldSeriesBatEffectMarker.GetPositionZ() + 96)
	player.PushActorAway(Target, Utility.RandomInt(minPushForce, (maxPushForce + (player.GetValue(Luck) * 2)) as int))
	UIPerkGrandSlamHit.Play(player)
	Target.AddKeyword(DN070_WorldSeriesBatKnockdownEffect_ExclusionKeyword)
EndEvent
