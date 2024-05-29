;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01RETravelSC03_0101097D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;debug.trace(self + " STARTING")
kmyQuest.Startup()
ObjectReference temp

;This encounter is 2 Eyebots and 4-5 Handys.
;2 Eyebots and 3 Handys start enabled. Roll for 4 & 5.
if (Utility.RandomInt(0, 1) == 0)
     Alias_Handy04.TryToEnable()
     if (Utility.RandomInt(0, 1) == 0)
          Alias_Handy05.TryToEnable()
     EndIf
EndIf

;Snap all of the Handys to the navmesh and Re-EVP
Alias_Handy01.GetActorRef().MoveToNearestNavmeshLocation()
Alias_Handy01.GetActorRef().EvaluatePackage()
Alias_Handy02.GetActorRef().MoveToNearestNavmeshLocation()
Alias_Handy02.GetActorRef().EvaluatePackage()
Alias_Handy03.GetActorRef().MoveToNearestNavmeshLocation()
Alias_Handy03.GetActorRef().EvaluatePackage()
Alias_Handy04.GetActorRef().MoveToNearestNavmeshLocation()
Alias_Handy04.GetActorRef().EvaluatePackage()
Alias_Handy05.GetActorRef().MoveToNearestNavmeshLocation()
Alias_Handy05.GetActorRef().EvaluatePackage()
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

RefCollectionAlias Property Alias_RadStags Auto Const

ReferenceAlias Property Alias_RoboRaider01 Auto Const Mandatory

ReferenceAlias Property Alias_RoboRaider02 Auto Const Mandatory

ReferenceAlias Property Alias_RoboRaider04 Auto Const Mandatory

ReferenceAlias Property Alias_RoboRaider03 Auto Const Mandatory

ReferenceAlias Property Alias_MechBot01 Auto Const Mandatory

ReferenceAlias Property Alias_MechBot02 Auto Const Mandatory

ReferenceAlias Property Alias_MechBot03 Auto Const Mandatory

ReferenceAlias Property Alias_MechBot04 Auto Const Mandatory

ReferenceAlias Property Alias_EyeBot03 Auto Const Mandatory

ReferenceAlias Property Alias_EyeBot04 Auto Const Mandatory

ReferenceAlias Property Alias_Handy04 Auto Const Mandatory

ReferenceAlias Property Alias_Handy05 Auto Const Mandatory

ReferenceAlias Property Alias_Handy01 Auto Const Mandatory

ReferenceAlias Property Alias_Handy02 Auto Const Mandatory

ReferenceAlias Property Alias_Handy03 Auto Const Mandatory
