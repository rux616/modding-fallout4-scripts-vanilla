;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN031_000E75B7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
MS09.triggerIntro = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DN031Script
Quest __temp = self as Quest
DN031Script kmyQuest = __temp as DN031Script
;END AUTOCAST
;BEGIN CODE
; kill captain
Alias_ParsonsGuardCaptain.GetActorRef().GetActorBase().SetEssential(false)
Alias_ParsonsGuardCaptain.TryToKill()
; kill exterior guards
Alias_ExteriorGuards.KillAll()

MS09DeadGuardsEnableMarker.Enable()

kmyQuest.UnregisterForRemoteEvent(kmyQuest.ParsonsLocation.GetLocation(), "OnLocationLoaded")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MS09Script Property MS09 Auto Const

ObjectReference Property ParsonsMainDoorExterior Auto Const

RefCollectionAlias Property Alias_ExteriorGuards Auto Const

ReferenceAlias Property Alias_ParsonsGuardCaptain Auto Const

ObjectReference Property MS09DeadGuardsEnableMarker Auto Const
