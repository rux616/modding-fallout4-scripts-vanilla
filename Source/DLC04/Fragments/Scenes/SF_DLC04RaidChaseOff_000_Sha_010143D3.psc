;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04RaidChaseOff_000_Sha_010143D3 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Quest myQuest = GetOwningQuest()

if myQuest.GetStageDone(19) || myQuest.GetStageDone(20)
  myQuest.SetStage(21)
  myQuest.SetStage(22)
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

ReferenceAlias Property Shank Auto Const Mandatory

Keyword Property AnimFlavorReadingBook Auto Const Mandatory
