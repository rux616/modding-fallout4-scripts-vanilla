Scriptname Inst303QuestScript extends Quest Conditional

Int Property PlayerInDirectorate Auto Conditional

Int Property PreMeetingLoop Auto Conditional

Bool Property Stage40AllieTravel Auto Conditional

Int Property PlayerBailed Auto Conditional

ReferenceAlias Property Shaun Auto Conditional

ObjectReference Property ShaunInteriorMarker Auto Conditional


;values:
; 1 - player left during opening scene
; 2 - player left during phase 3 scene
; 3 - player left during last scene


Function TeleportShaun()


;handle moving shaun back into the interior after initial scene
(Shaun.GetReference() as teleportactorscript).TeleportOut()
RegisterForCustomEvent((Shaun.GetReference() as teleportactorscript), "TeleportDone")
;Utility.Wait(1)
;Shaun.GetReference().Moveto(ShaunInteriorMarker)
;Shaun.GetReference().Enable()
;(Shaun as teleportreferencealias).TeleportIn()


EndFunction


Event TeleportActorScript.TeleportDone(TeleportActorScript akSender, Var[] akArgs)

if akSender==Shaun.GetReference()
Shaun.GetReference().Moveto(ShaunInteriorMarker)
Shaun.GetReference().Enable()
endif
EndEvent