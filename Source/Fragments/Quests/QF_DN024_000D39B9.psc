;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN024_000D39B9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
DN024_RaiderSittingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
Alias_RaiderTalkToSit.getACtorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
if(GetStageDone(205) == 0)
    SetStage(205)
    DN024_StairwellScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Alias_RaiderStairwell01.getActorRef().EvaluatePackage()
Alias_RaiderStairwell02.getActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DN024_RaiderSittingScene Auto Const

ReferenceAlias Property Alias_RaiderTalkToSit Auto Const

Scene Property DN024_StairwellScene Auto Const

ReferenceAlias Property Alias_RaiderStairwell01 Auto Const

ReferenceAlias Property Alias_RaiderStairwell02 Auto Const
