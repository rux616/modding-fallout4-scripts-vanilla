;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__0100B9D8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Move the furniture markers into the correct alignment.
ObjectReference feedMarker01 = Alias_BloodbugFeedMarker01.GetReference()
ObjectReference feedMarker02 = Alias_BloodbugFeedMarker02.GetReference()
ObjectReference feedMarker03 = Alias_BloodbugFeedMarker03.GetReference()
feedMarker01.MoveTo(feedMarker01, 0, -44, 0)
feedMarker02.SetAngle(0, 0, -90)
feedMarker03.SetAngle(0, 0, -180)

;Spawn creatures. (50% Bloodbug, 25% Bloatfly, 25% Vulture)
Alias_Creature01.ForceRefTo(((Self as Quest) as REObjectSC03Script).SpawnCreature(0))
Alias_Creature01.TryToEvaluatePackage()
Alias_Creature02.ForceRefTo(((Self as Quest) as REObjectSC03Script).SpawnCreature(1))
Alias_Creature02.TryToEvaluatePackage()
if (Utility.RandomInt(0, 1) == 0)
     Alias_Creature03.ForceRefTo(((Self as Quest) as REObjectSC03Script).SpawnCreature(2))
     Alias_Creature03.TryToEvaluatePackage()
EndIf
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
; DO NOT REARM TRIGGER - we don't reuse Object encounter locations
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_BloodbugFeedMarker01 Auto Const

ReferenceAlias Property Alias_BloodbugFeedMarker02 Auto Const

ReferenceAlias Property Alias_BloodbugFeedMarker03 Auto Const

ReferenceAlias Property Alias_Creature01 Auto Const

ReferenceAlias Property Alias_Creature02 Auto Const

ReferenceAlias Property Alias_Creature03 Auto Const
