;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueInstituteEmergenc_0016D065 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_08_End
Function Fragment_Phase_08_End()
;BEGIN CODE
InstKickOutShaunScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN CODE
InstKickOutShaunDeadScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_16_End
Function Fragment_Phase_16_End()
;BEGIN CODE
If InstKickout.IsRunning()==False
if (EmergencyRelayTrigger as InstituteEmergencyRelayTriggerScript).PlayerinTrigger==0
(EmergencyRelayTrigger as InstituteEmergencyRelayTriggerScript).ReadyToGo=True
else
(EmergencyRelayTrigger as InstituteEmergencyRelayTriggerScript).RunTeleporter()
endif
else
InstKickOut.SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_17_End
Function Fragment_Phase_17_End()
;BEGIN AUTOCAST TYPE DialogueInstituteQuestScript
DialogueInstituteQuestScript kmyQuest = GetOwningQuest() as DialogueInstituteQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.EmergencyRelayActive=0
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property EmergencyRelayTrigger Auto Const

Quest Property InstKickOut Auto Const

Scene Property InstKickOutShaunScene Auto Const

Scene Property InstKickOutShaunDeadScene Auto Const
