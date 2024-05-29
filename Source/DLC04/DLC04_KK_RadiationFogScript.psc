ScriptName DLC04:DLC04_KK_RadiationFogScript Extends ObjectReference


VisualEffect Property DLC04CameraAttachFogRad Auto Const mandatory
GlobalVariable Property DLC04_KK_RadMistersAreOn Auto Const Mandatory
ObjectReference Property DLC04_KK_RadiationHazardsEnableParent Auto const mandatory

bool FogIsAttached
Event OnTriggerEnter(ObjectReference akTriggerRef)
	CheckFogAttach()
EndEvent


Event OnTriggerLeave(ObjectReference akTriggerRef)
	CheckFogAttach()
EndEvent

Function CheckFogAttach()
	If GetTriggerObjectCount() > 0
		if DLC04_KK_RadMistersAreOn.GetValue() == 1
			if  !FogIsAttached
				Debug.Trace(self + "::: Attaching Fog")
				DLC04CameraAttachFogRad.Play(game.GetPlayer(), afTime = -1.0)
				DLC04_KK_RadiationHazardsEnableParent.EnableNoWait()
				FogIsAttached = true
			Endif
		endif
	else
		if FogIsAttached
			DLC04CameraAttachFogRad.Stop(game.GetPlayer())
			DLC04_KK_RadiationHazardsEnableParent.DisableNoWait()
			FogIsAttached = false
		endif
	endif
EndFunction