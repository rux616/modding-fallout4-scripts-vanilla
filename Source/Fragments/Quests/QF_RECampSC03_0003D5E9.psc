;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECampSC03_0003D5E9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Move Dreth in.
Alias_Dreth.GetRef().MoveTo(Alias_SceneMarker1.GetRef())

;Uncomment these as desired.
Debug.Trace("RECAMPSC03: " + Alias_Container.GetReference() + ", " + Alias_Container.GetReference().IsEnabled())
;Alias_Container.GetReference().Enable()
Debug.Trace("RECAMPSC03: " + Alias_Container.GetReference() + ", " + Alias_Container.GetReference().IsEnabled())
Alias_ClutterMarker.GetReference().Enable()
Alias_BedObject1.GetReference().Enable()
Alias_BedObject2.GetReference().Enable()
Alias_BedObject3.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_Dreth.GetActorRef().SetValue(RECamp02DrethState, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Debug.Trace("RECAMPSC03: " + Alias_Container.GetReference() + ", " + Alias_Container.GetReference().IsEnabled())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
Alias_Guard01.GetActorRef().EvaluatePackage()
Alias_Guard02.GetActorRef().EvaluatePackage()
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

;Move Dreth out.
Alias_Dreth.GetRef().MoveTo(REHoldingCellMarker)

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

ReferenceAlias Property Alias_Dreth Auto Const

ObjectReference Property REHoldingCellMarker Auto Const

ReferenceAlias Property Alias_Guard01 Auto Const

ReferenceAlias Property Alias_Guard02 Auto Const

ReferenceAlias Property Alias_SceneMarker1 Auto Const

ActorValue Property RECamp02DrethState Auto Const
