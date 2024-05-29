Scriptname StingwingRaceFXScript extends ActiveMagicEffect
{Handles race fx for stingwing}

Actor selfRef
Weapon Property PUnarmedStingwingNoPoison Auto Const

Weapon Property PUnarmedStingwing Auto Const
ActorValue Property AvailableCondition1 Auto const

Event OnEffectStart(Actor akTarget, Actor akCaster)
    selfRef = akCaster
EndEvent

Event OnCripple(ActorValue akActorValue, bool abCrippled)
	Debug.Trace("OnCripple Received: " + akActorValue + ", " + abCrippled)

	if akActorValue == AvailableCondition1
		Debug.Trace("Yo foo you shot my tail off")
		;med glow
		selfRef.removeitem(PUnarmedStingwing)
		selfRef.equipitem(PUnarmedStingwingNoPoison)
	endIf
EndEvent