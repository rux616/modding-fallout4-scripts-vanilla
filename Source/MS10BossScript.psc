Scriptname MS10BossScript extends ReferenceAlias

ObjectReference Property MS10RexGreet Auto Const

Event OnDeath(actor akKiller)
	MS10RexGreet.enable()
EndEvent