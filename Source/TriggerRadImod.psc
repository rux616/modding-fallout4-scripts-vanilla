Scriptname TriggerRadImod extends ObjectReference
{Trigger radiation effect.}

ImageSpaceModifier property RadImod auto
ImageSpaceModifier property RadImodFadeIn auto
ImageSpaceModifier property RadImodFadeOut auto
Float Property fImodTime = 3.0 auto

Event OnTriggerEnter(ObjectReference akActionRef)
	
	if akActionRef == game.getPlayer()

		;debug.Trace("Imod start")
		RadImodFadeIn.applyCrossFade(2.0)
		RadImod.applyCrossFade(fImodTime)
		
	EndIf

EndEvent

EVENT onTriggerLeave(ObjectReference akActionRef)

		;debug.Trace("Imod fade")
		RadImod.popto(RadImodFadeOut)
	
endEVENT



