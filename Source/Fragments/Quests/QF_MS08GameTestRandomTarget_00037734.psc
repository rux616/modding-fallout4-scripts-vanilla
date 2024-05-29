;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS08GameTestRandomTarget_00037734 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
debug.trace("MS08GameTestRandomTarget stage 1")
MS08GameTarget.ForceRefTo(Alias_Target.GetReference())
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Target const auto
ReferenceAlias Property MS08GameTarget const auto
