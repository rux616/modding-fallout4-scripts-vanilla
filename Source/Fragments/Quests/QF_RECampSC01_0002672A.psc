;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECampSC01_0002672A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Roll to determine how many Raiders were formerly at this camp.
int numRaiders = Utility.RandomInt(1, 3)

;Set stages to store off this data for later use. A bit easier than creating a non-const script
;just to hold this data.
if (numRaiders >= 2)
     SetStage(12)
EndIf
if (numRaiders == 3)
     SetStage(13)
EndIf

;Trace this for use while debugging.
Debug.Trace("RECampSC01 has started. There should be " + numRaiders + " beds.")

;Enable camp clutter.
Alias_Container.GetReference().Enable()
Alias_ClutterMarker.GetReference().Enable()
Alias_BedObject1.GetReference().Enable()
if (numRaiders > 1)
     Alias_BedObject2.GetReference().Enable()
EndIf
if (numRaiders > 2)
     Alias_BedObject3.GetReference().Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;The first time the camp's container is opened, roll to see if the Raiders return to ambush the player.
;Currently, there's a 50% chance of this happening.

if (Utility.RandomInt(1, 2) == 1)
     Debug.Trace("Raider ambush!")
     Alias_Raider01.TryToEnable()
     Alias_Raider01.TryToEvaluatePackage()
     if (GetStageDone(12))
          Alias_Raider02.TryToEnable()
          Alias_Raider02.TryToEvaluatePackage()
     EndIf
     if (GetStageDone(13))
          Alias_Raider03.TryToEnable()
          Alias_Raider03.TryToEvaluatePackage()
     EndIf
Else
     Debug.Trace("Camp was deserted.")
EndIf

;Start the return dialogue scene.
RECampSC01_RaiderReturnScene.Start()
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


;Disable everything.
Alias_Container.GetReference().Disable()
Alias_ClutterMarker.GetReference().Disable()
Alias_BedObject1.GetReference().Disable()
Alias_BedObject2.GetReference().Disable()
Alias_BedObject3.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Container Auto Const

ReferenceAlias Property Alias_ClutterMarker Auto Const

ReferenceAlias Property Alias_BedObject1 Auto Const

ReferenceAlias Property Alias_BedObject2 Auto Const

ReferenceAlias Property Alias_BedObject3 Auto Const
ReferenceAlias Property Alias_Raider01 Auto Const

ReferenceAlias Property Alias_Raider02 Auto Const

ReferenceAlias Property Alias_Raider03 Auto Const

Scene Property RECampSC01_RaiderReturnScene Auto Const
