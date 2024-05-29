;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REActorAttach02_000392F8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")

; if there are 2 corpses, chance of 2nd raider:
if Alias_corpse02.GetRef() && Utility.RandomInt() < 50
	Alias_Raider02.GetRef().Enable()
endif

; if there are 3 corpses, chance of 3rd raider:
if Alias_corpse03.GetRef() && Utility.RandomInt() < 50
	Alias_Raider03.GetRef().Enable()
endif

kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; scavenge patrol is done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property REVulturePreyKeyword Auto Const

ReferenceAlias Property Alias_Corpse01 Auto Const

ReferenceAlias Property Alias_Corpse03 Auto Const

ReferenceAlias Property Alias_Corpse02 Auto Const

ReferenceAlias Property Alias_Corpse04 Auto Const

ReferenceAlias Property Alias_Raider02 Auto Const

ReferenceAlias Property Alias_Raider03 Auto Const
