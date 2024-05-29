;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelCC01_0004763A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
;Let the farmer start running before releasing the hounds
Utility.Wait(6)
Alias_VicDog01.GetRef().Enable()
Alias_VicDog02.GetRef().Enable()
Alias_VicDog03.GetRef().Enable()
;Set the dogs on the farmer
Alias_VicDog01.GetActorRef().StartCombat(Alias_ScaredFarmer.GetActorRef())
Alias_VicDog02.GetActorRef().StartCombat(Alias_ScaredFarmer.GetActorRef())
Alias_VicDog03.GetActorRef().StartCombat(Alias_ScaredFarmer.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;Set Farmer to Flee, FIXME: this is fairly inconsistent behavior, set the Farmer to start at Cowardlly
;Alias_ScaredFarmer.GetActorRef().SetValue(Confidence, 4)
;Alias_ScaredFarmer.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;Farmer calms down because the dogs are dead
Alias_ScaredFarmer.GetActorRef().SetValue(Confidence, 1)
Alias_ScaredFarmer.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;Player reward for helping
Game.GetPlayer().AddItem(LL_Caps_Reward_Small)
;Check packages to head out
Alias_ScaredFarmer.GetActorRef().EvaluatePackage()
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

ReferenceAlias Property Alias_VicDog01 Auto Const

ReferenceAlias Property Alias_VicDog02 Auto Const

ReferenceAlias Property Alias_VicDog03 Auto Const

ReferenceAlias Property Alias_ScaredFarmer Auto Const

MiscObject Property Caps001 Auto Const

ActorValue Property Confidence Auto Const

LeveledItem Property LL_Caps_Reward_Small Auto Const Mandatory
