;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04RaidSubdue_000_Shank_01016E69 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;If quest has started successfully,
; throw objective to other bosses
Quest myQuest = GetOwningQuest()

if DLC04RaidAttackQuestTalkToBossesIntroDone.GetValue() <= 0
  if myQuest.GetStageDone(19) || myQuest.GetStageDone(20)
    myQuest.SetStage(15)
  endif
endif

;Throw stage to inform player location can't be fast traveled to
if myQuest.GetStageDone(19)
  myQuest.SetStage(21)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
;Pull Shank's anim flavor
Shank.GetActorRef().ChangeAnimFlavor()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC04RaidAttackQuestTalkToBossesIntroDone Auto Const Mandatory

ReferenceAlias Property Shank Auto Const Mandatory
