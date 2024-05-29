Scriptname CreationClub:VRWorkshops:VRWorkshopSirenScript extends ObjectReference

Quest Property VRWorkshopShared_SummonedByAlarmQuest Auto Const Mandatory
{The quest to start/stop the alarm}
ReferenceAlias Property Alias_SirenREF Auto Const Mandatory
{The stored external reference of the alarm that was triggered}

; OPEN = OFF (losing power)
event onOpen(ObjectReference akActionRef)
	debug.trace("VR WORKSHOPS:" + self + " OnOpen by " + akActionRef)
	VRWorkshopShared_SummonedByAlarmQuest.Stop()
EndEvent

; CLOSED = ON
event onClose(ObjectReference akActionRef)
	debug.trace("VR WORKSHOPS:" + self + " onClose by " + akActionRef)
	;update external reference to this specific siren ref
	Alias_SirenREF.ForceRefTo(self)
	; wait a bit before starting the alarm quest
	StartTimer(3.0)
EndEvent

Event OnTimer(int aiTimerID)
	debug.trace("VR WORKSHOPS:" + self + " OnTimer " + aiTimerID)
	; if still powered on, send event
	If(IsPowered() && GetOpenState() == 3)
		debug.trace("VR WORKSHOPS:" + self + " OnTimer " + aiTimerID)
		VRWorkshopShared_SummonedByAlarmQuest.Start()
	EndIf
EndEvent