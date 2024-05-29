;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFGoodneighbor08_0015DE65 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Sammy.getactorRef().Enable()

;disable the guards we're replacing for this scene
Alias_NormalGuard01.GetActorRef().Disable()
Alias_NormalGuard02.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
FFGoodneighbor08Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor08Script
Quest __temp = self as Quest
FFGoodneighbor08Script kmyQuest = __temp as FFGoodneighbor08Script
;END AUTOCAST
;BEGIN CODE
kmyquest.StartTimerGameTime(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;if player is already not in the worldspace, jump to shutdown
If Game.GetPlayer().GetWorldSpace() != Goodneighbor
  SetStage(300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_NewGuardGhoulOnly.GetActorRef().Delete()
Alias_NewGuardHumanOnly.GetActorRef().Delete()
Alias_Sammy.GetActorRef().Delete()

;re-enable the old guards
Alias_NormalGuard01.GetActorRef().Enable()
Alias_NormalGuard02.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Sammy Auto Const

ReferenceAlias Property Alias_GuardMarker01 Auto Const

ReferenceAlias Property Alias_NewGuardGhoulOnly Auto Const

ReferenceAlias Property Alias_NewGuardHumanOnly Auto Const

ReferenceAlias Property Alias_NormalGuard01 Auto Const

ReferenceAlias Property Alias_NormalGuard02 Auto Const

WorldSpace Property Goodneighbor Auto Const

Scene Property FFGoodneighbor08Scene Auto Const
