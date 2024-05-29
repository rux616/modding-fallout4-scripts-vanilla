Scriptname Default1StateActivator extends ObjectReference Default Const
{For any activator that you want to play a single animation each time it's activated.}

Group Required_Properties

	string property Anim = "open" auto const
	{Anim to play when this is activated.}

EndGroup


Event OnActivate(ObjectReference akActionRef)
    playAnimation(Anim)
EndEvent