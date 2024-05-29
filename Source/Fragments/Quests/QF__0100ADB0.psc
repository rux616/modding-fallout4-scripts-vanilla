;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__0100ADB0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyquest.Startup()
((self as Quest) as REAssaultQuestScript).InitAssault()

if (Game.GetPlayer().GetLevel() >= 15)
     Alias_SupermutantBoss01.TryToEnable()
     Alias_Supermutant02.TryToEnable()
     Alias_Supermutant03.TryToEnable()
     if (!Alias_TRIGGER.GetReference().HasKeyword(RETriggerProhibitAnimals))
          Alias_FEVHound04.TryToEnable()
          Alias_FEVHound05.TryToEnable()
          ((Self as Quest) as REScript).SetDeadCounts(1, 5)
     EndIf
EndIf
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

ReferenceAlias Property Alias_SupermutantBoss01 Auto Const

ReferenceAlias Property Alias_Supermutant02 Auto Const

ReferenceAlias Property Alias_Supermutant03 Auto Const

ReferenceAlias Property Alias_FeralGhoul04 Auto Const

ReferenceAlias Property Alias_FeralGhoul03 Auto Const

ReferenceAlias Property Alias_FeralGhoul02 Auto Const

ReferenceAlias Property Alias_FeralGhoulBoss01 Auto Const

ReferenceAlias Property Alias_FEVHound05 Auto Const

ReferenceAlias Property Alias_FEVHound04 Auto Const

Keyword Property RETriggerProhibitAnimals Auto Const
