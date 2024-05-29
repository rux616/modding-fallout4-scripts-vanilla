Scriptname BoS202VBirdScript extends ReferenceAlias Conditional

Action Property ActionPropellersOn Auto Const
Action Property ActionPropellersOff Auto Const
int PropsDone


Event OnLoad()

if PropsDone == 0
	Debug.Trace("PropsOff")
	Self.GetActorRef().PlayIdleAction(ActionPropellersOff)
	PropsDone = 1
endif

endEvent