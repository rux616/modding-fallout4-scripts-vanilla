;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REChokepoint01_0003A528 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Set when the player enters the trigger volume, representing the guarded/checkpoint area.
if (!GetStageDone(30))
     SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Player pays toll.
Actor Raider1 = Alias_Raider01.GetActorRef()

;Debug.Trace("A: " + Raider1.GetItemCount(Caps001) + " for " + REChokepoint01Toll.GetValueInt())
int capsToMove = Game.GetPlayer().GetItemCount(Caps001)
int capsRequired = REChokepoint01Toll.GetValueInt()
if (capsToMove > capsRequired)
     capsToMove = capsRequired
EndIf
Game.GetPlayer().RemoveItem(Caps001, capsToMove, False, Raider1)
;Debug.Trace("B: " + Raider1.GetItemCount(Caps001) + " for " + REChokepoint01Toll.GetValueInt())

Raider1.EvaluatePackage()
Alias_Raider02.TryToEvaluatePackage()
Alias_Raider03.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Player angers/attacks guards.
Actor player = Game.GetPlayer()
Actor Raider1 = Alias_Raider01.GetActorRef()
Actor Raider2 = Alias_Raider02.GetActorRef()
Actor Raider3 = Alias_Raider03.GetActorRef()
Raider1.StartCombat(player)
Raider2.StartCombat(player)
Raider3.StartCombat(player)
Raider1.EvaluatePackage()
Raider2.EvaluatePackage()
Raider3.EvaluatePackage()
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

ReferenceAlias Property Alias_Raider01 Auto Const

ReferenceAlias Property Alias_Raider02 Auto Const

ReferenceAlias Property Alias_Raider03 Auto Const

MiscObject Property Caps001 Auto Const

GlobalVariable Property REChokepoint01Toll Auto Const
