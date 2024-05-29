Scriptname MS01BulletScript extends ReferenceAlias

ObjectReference Property MattPeabodyRef Auto Const
ObjectReference Property CarolPeabodyRef Auto Const
ObjectReference Property BulletRef Auto Const
ObjectReference Property BillyRef Auto Const
Quest Property MS01 Auto Const

Event OnUnload()
	If MS01.GetStageDone(45) == true && GetActorRef().IsDead() == false
		MS01.SetObjectiveCompleted(45, true)
		BulletRef.Disable()
		MattPeabodyRef.Disable()
		CarolPeabodyRef.Disable()
		BillyRef.Disable()
		MS01.CompleteQuest()
		MS01.Stop()
	Endif
EndEvent

