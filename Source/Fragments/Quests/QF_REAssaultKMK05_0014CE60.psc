;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REAssaultKMK05_0014CE60 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
((self as Quest) as REAssaultQuestScript).InitAssault()
actor sniper = Alias_Sniper.GetActorRef()
sniper.MoveTo(Alias_Defender02Marker.GetRef())
sniper.Enable()
kmyquest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;When the player moves in range, begin the assault.
((self as Quest) as REAssaultQuestScript).StartAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Debug.Trace("Defending faction won!")
((self as Quest) as REAssaultQuestScript).CompleteAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
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
actor sniper = Alias_Sniper.GetActorRef()
if sniper.IsDead() == false
	sniper.Disable()
endif
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

ReferenceAlias Property Alias_Sniper Auto Const

ReferenceAlias Property Alias_Defender02Marker Auto Const
