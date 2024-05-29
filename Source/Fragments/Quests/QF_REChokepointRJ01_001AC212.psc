;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REChokepointRJ01_001AC212 Extends Quest Hidden Const

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
;Set when the player enters the trigger volume, representing
;the guarded/checkpoint area.

;Set when the player enters the trigger volume, representing the guarded/checkpoint area.
if (!GetStageDone(30))
     SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
setstage(24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Player pays toll.
Actor Gunner01 = Alias_Gunner01.GetActorRef()

;Debug.Trace("A: " + Gunner01.GetItemCount(Caps001) + " for " + REChokepointRJ01Toll.GetValueInt())
int capsToMove = Game.GetPlayer().GetItemCount(Caps001)
int capsRequired = REChokepointRJ01Toll.GetValueInt()
if (capsToMove > capsRequired)
     capsToMove = capsRequired
EndIf
Game.GetPlayer().RemoveItem(Caps001, capsToMove)
Gunner01.AddItem(Caps001, capsToMove)
;Debug.Trace("B: " + Gunner01.GetItemCount(Caps001) + " for " + REChokepointRJ01Toll.GetValueInt())

Gunner01.EvaluatePackage()
Alias_Gunner02.TryToEvaluatePackage()
Alias_Gunner03.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Player angers/attacks guards.
Actor player = Game.GetPlayer()
Actor Gunner01 = Alias_Gunner01.GetActorRef()
Actor Gunner02 = Alias_Gunner02.GetActorRef()
Actor Gunner03 = Alias_Gunner03.GetActorRef()
Gunner01.StartCombat(player)
Gunner02.StartCombat(player)
Gunner03.StartCombat(player)
Gunner01.EvaluatePackage()
Gunner02.EvaluatePackage()
Gunner03.EvaluatePackage()
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

ReferenceAlias Property Alias_Gunner01 Auto Const

ReferenceAlias Property Alias_Gunner02 Auto Const

ReferenceAlias Property Alias_Gunner03 Auto Const

MiscObject Property Caps001 Auto Const

GlobalVariable Property ReChokepointRJ01Toll Auto Const
