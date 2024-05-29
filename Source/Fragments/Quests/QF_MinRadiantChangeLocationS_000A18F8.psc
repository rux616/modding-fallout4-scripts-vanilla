;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinRadiantChangeLocationS_000A18F8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; script event to fire up recruitment quest at this location
debug.trace(self + " Starting")
MinRadiantStart.SendStoryEvent(akLoc = Alias_SettlementLocation.GetLocation(), akRef1 = Alias_SettlementWorkshop.GetRef())
debug.trace(self + " Location=" + Alias_SettlementLocation.GetLocation())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property MinRecruitmentStart Auto Const

LocationAlias Property Alias_SettlementLocation Auto Const

Keyword Property MinRadiantStart Auto Const

ReferenceAlias Property Alias_SettlementWorkshop Auto Const
