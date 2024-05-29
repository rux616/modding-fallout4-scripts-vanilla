;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS07c_012_NickGraveScene_0014BF2E Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE MS07cScript
MS07cScript kmyQuest = GetOwningQuest() as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Is Nick going to trigger his affinity scene
if (Alias_NickValentine.GetActorReference() as CompanionActorScript).TestEventForAffinityBump(CA_CustomEvent_ValentineCompletesQuest, T1_Infatuation)
  kmyquest.bNickEntersInfat = 1
else
  kmyquest.bNickEntersInfat = 0
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE MS07cScript
MS07cScript kmyQuest = GetOwningQuest() as MS07cScript
;END AUTOCAST
;BEGIN CODE
;Is Nick going to trigger his affinity scene
if (Alias_NickValentine.GetActorReference() as CompanionActorScript).TestEventForAffinityBump(CA_CustomEvent_ValentineCompletesQuest, T1_Infatuation)
  kmyquest.bNickEntersInfat = 1
else
  kmyquest.bNickEntersInfat = 0
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NickValentine Auto Const

Keyword Property CA_CustomEvent_ValentineCompletesQuest Auto Const

GlobalVariable Property T1_Infatuation Auto Const
