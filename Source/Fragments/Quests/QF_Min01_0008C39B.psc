;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Min01_0008C39B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
MQ102.SetStage(150)
MQ102.SetStage(200)

Alias_Preston.GetRef().MoveTo(PrestonStartPoint)
Alias_Sturges.GetRef().MoveTo(SturgesStartPoint)

Game.GetPlayer().MoveTo(PlayerStartPoint)

Alias_StockpileBoss.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Adrienne.GetRef().MoveTo(AdrienneStartPoint)
Alias_Adrienne.GetRef().Enable()

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

Followers.FollowerFollow(Alias_Adrienne.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Adrienne Auto Const

ObjectReference Property AdrienneStartPoint Auto Const

ReferenceAlias Property Alias_Preston Auto Const

ReferenceAlias Property Alias_Sturges Auto Const

ObjectReference Property PrestonStartPoint Auto Const

ObjectReference Property SturgesStartPoint Auto Const

ObjectReference Property PlayerStartPoint Auto Const

ReferenceAlias Property Alias_StockpileBoss Auto Const

Quest Property MQ102 Auto Const

FollowersScript Property Followers Auto Const
