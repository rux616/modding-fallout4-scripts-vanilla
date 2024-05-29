;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REAssaultTEMPLATE_00030FB0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
((self as Quest) as REAssaultQuestScript).InitAssault()
kmyquest.Startup()
actor friend = Alias_PrestonFriend.GetActorRef()
friend.moveTo(Alias_Defender03Marker.GetRef())
friend.enable()
; wound 2 raiders to give a better chance to defender
float damageHealth = Alias_Raider01.GetActorRef().GetValue(Game.GetHealthAV()) * 0.80
Alias_Raider01.GetActorRef().DamageValue(Game.GetHealthAV(), damageHealth)
Alias_Raider02.GetActorRef().DamageValue(Game.GetHealthAV(), damageHealth)
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

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
actor friend = Alias_PrestonFriend.GetActorRef()
friend.AddToFaction(MinutemenFaction)
WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(friend)
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

actor friend = Alias_PrestonFriend.GetActorRef()
if friend.IsInFaction(WorkshopNPCFaction) == false
	friend.Disable()
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

ReferenceAlias Property Alias_Raider01 Auto Const

ReferenceAlias Property Alias_Raider02 Auto Const

ReferenceAlias Property Alias_PrestonFriend Auto Const

ReferenceAlias Property Alias_Defender03Marker Auto Const

Faction Property MinutemenFaction Auto Const

workshopparentscript Property WorkshopParent Auto Const

Faction Property WorkshopNPCFaction Auto Const
