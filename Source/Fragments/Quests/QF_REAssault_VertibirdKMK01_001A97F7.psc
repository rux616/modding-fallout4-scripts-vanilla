;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REAssault_VertibirdKMK01_001A97F7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
; tell script about trigger since we're not starting from a story event
RETriggerScript myTrigger = Alias_Trigger.GetRef() as RETriggerScript
kmyQuest.SetTrigger(myTrigger)
; NOTE: this has to be called before Startup so myTrigger is set on REScript
kmyquest.Startup()
((self as Quest) as REAssaultQuestScript).InitAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; enable passengers
Alias_Pilot.TryToEnable()
Alias_Gunner.TryToEnable()
Alias_Attacker01.TryToEnable()
Alias_Attacker02.TryToEnable()

Alias_Pilot02.TryToEnable()
Alias_Gunner02.TryToEnable()
Alias_Attacker03.TryToEnable()
Alias_Attacker04.TryToEnable()

; start assault
setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;When the player moves in range, begin the assault.
((self as Quest) as REAssaultQuestScript).StartAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Debug.Trace("Defending faction won!")
((self as Quest) as REAssaultQuestScript).CompleteAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Debug.Trace("Attacking faction won!")
((self as Quest) as REAssaultQuestScript).CompleteAssault()
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
((Self as Quest) as REAssaultQuestScript).CleanupAssault()
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Attacker01Links Auto Const
ReferenceAlias Property Alias_Attacker02Links Auto Const
ReferenceAlias Property Alias_Attacker03Links Auto Const
ReferenceAlias Property Alias_Attacker04Links Auto Const
ReferenceAlias Property Alias_Attacker05Links Auto Const
ReferenceAlias Property Alias_Defender01Links Auto Const
ReferenceAlias Property Alias_Defender02Links Auto Const
ReferenceAlias Property Alias_Defender03Links Auto Const
ReferenceAlias Property Alias_Defender04Links Auto Const
ReferenceAlias Property Alias_Defender05Links Auto Const

ReferenceAlias Property Alias_MapMarker Auto Const

ReferenceAlias Property Alias_Pilot Auto Const

ReferenceAlias Property Alias_Gunner Auto Const

ReferenceAlias Property Alias_Attacker01 Auto Const

ReferenceAlias Property Alias_Attacker02 Auto Const

ReferenceAlias Property Alias_Attacker03 Auto Const

ReferenceAlias Property Alias_Attacker04 Auto Const

ReferenceAlias Property Alias_Pilot02 Auto Const

ReferenceAlias Property Alias_Gunner02 Auto Const
