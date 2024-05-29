;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ202CompanionPostSurgery_000FAC86 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;(Followers as FollowersScript).SetCompanion(Alias_Nick.GetActorRef())
Alias_Nick.GetActorRef().AllowCompanion(True, True)

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10, abDisplayed=False)

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Nick is allowed to be a companion again
Alias_Nick.GetActorRef().AllowCompanion(False, False)

;Nick can now hate you
Valentine_MurderToggle.SetValueInt(1)
Valentine_AffinityCondition_HatredAllowed.SetValueInt(1)


;Check to see if player has already finished Nick's confidant scene to determine MS07c greeting
if !COMNick.GetStageDone(497)
  MS07cGreetingMQ202First.Setvalue(1)
endif

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Nick Auto Const

Quest Property Followers Auto Const

GlobalVariable Property MS07cGreetingMQ202First Auto Const

Quest Property MS07c Auto Const

Quest Property COMNick Auto Const

GlobalVariable Property Valentine_MurderToggle Auto Const Mandatory

GlobalVariable Property Valentine_AffinityCondition_HatredAllowed Auto Const Mandatory
