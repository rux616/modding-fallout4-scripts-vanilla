;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RRM01_00112ED5 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Wait a second and light the lantern
pRRM01SignalLanternREF.PlayAnimation("Stage2")

;Utility.Wait(0.8)
;pRRM01LanternLight.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pRRM01LanternLight Auto Const

ObjectReference Property pRRM01SignalLanternREF Auto Const
