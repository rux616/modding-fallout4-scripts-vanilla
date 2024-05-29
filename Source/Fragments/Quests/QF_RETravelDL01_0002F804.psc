;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelDL01_0002F804 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

; enable some of the ghouls
kmyQuest.REParent.RandomlyEnableOrKillCollection(Alias_Ghouls, 50, 0, 1)

; if night, maybe enable glowing one
float time = GameHour.GetValue()
if (time > 20 || time < 6) && Utility.RandomInt(1, 100) < 50
	Alias_GlowingOne.TryToEnable()
else
	Alias_GlowingOne.TryToKill()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

RefCollectionAlias Property Alias_Ghouls Auto Const

ReferenceAlias Property Alias_GlowingOne Auto Const

GlobalVariable Property GameHour Auto Const
