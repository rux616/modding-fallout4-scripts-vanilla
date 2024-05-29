;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01RECampSC01_0101097E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
Debug.trace(self + " STARTING")
kmyQuest.Startup()

;Uncomment these as desired.
Alias_Container.GetReference().Enable()
Alias_ClutterMarker.GetReference().Enable()
Alias_BedObject1.GetReference().Enable()
Alias_BedObject2.GetReference().Enable()
Alias_BedObject3.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Container Auto Const Mandatory

ReferenceAlias Property Alias_ClutterMarker Auto Const Mandatory

ReferenceAlias Property Alias_ObjectMarker1 Auto Const Mandatory

ReferenceAlias Property Alias_BedObject1 Auto Const Mandatory

ReferenceAlias Property Alias_ObjectMarker2 Auto Const Mandatory

ReferenceAlias Property Alias_BedObject2 Auto Const Mandatory

ReferenceAlias Property Alias_ObjectMarker3 Auto Const Mandatory

ReferenceAlias Property Alias_BedObject3 Auto Const Mandatory
