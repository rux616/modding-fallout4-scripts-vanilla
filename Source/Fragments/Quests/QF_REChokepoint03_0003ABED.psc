;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REChokepoint03_0003ABED Extends Quest Hidden Const

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
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
;Raiders attack farmers.
Alias_Raider01.GetActorRef().SetValue(Game.GetAggressionAV(), 2)
Alias_Raider02.GetActorRef().SetValue(Game.GetAggressionAV(), 2)
Alias_Raider03.GetActorRef().SetValue(Game.GetAggressionAV(), 2)
Alias_Raider01.GetActorRef().StartCombat(Alias_Farmer01.GetActorRef())
Alias_Raider02.GetActorRef().StartCombat(Alias_Farmer02.GetActorRef())
Alias_Raider03.GetActorRef().StartCombat(Alias_Farmer02.GetActorRef())
Alias_Raider01.GetActorRef().EvaluatePackage()
Alias_Raider02.GetActorRef().EvaluatePackage()
Alias_Raider03.GetActorRef().EvaluatePackage()

;Farmers flee.
REChokepoint03_FarmerRunForIt.Start()
Alias_Farmer01.GetActorRef().EvaluatePackage()
Alias_Farmer02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Player disrupts initial scene; attacks anyone.

;Adjust scenes.
REChokepoint03_FarmerConfrontation.Stop()
REChokepoint03_RaiderResponse.Stop()

;Stage 19 starts the combat.
SetStage(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Player disrupts initial scene; attacks farmers. Used as a dialogue flag.
;Stage 20 handles the real work.
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Flag, set when raiders are dead.
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

ReferenceAlias Property Alias_Farmer01 Auto Const

ReferenceAlias Property Alias_Farmer02 Auto Const

Scene Property REChokepoint03_FarmerConfrontation Auto Const

Scene Property REChokepoint03_FarmerRunForIt Auto Const

Scene Property REChokepoint03_RaiderResponse Auto Const
