;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECampCT07a_0018EA00 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Move Stash from HoldingCell
Alias_DeadMerchant01.GetRef().MoveTo(Alias_ObjectMarker1.GetRef())
Alias_DeadMerchant01.GetActorRef().Kill()
Alias_DeadGuard02.GetRef().MoveTo(Alias_BedObject3.GetRef())
Alias_DeadGuard02.GetActorRef().Kill()

kmyQuest.REParent.bRECampCT07PCSawCamp = True



;Uncomment these as desired.
Alias_Container.GetReference().Enable()
Alias_ClutterMarker.GetReference().Enable()
Alias_BedObject1.GetReference().Enable()
Alias_BedObject2.GetReference().Enable()
Alias_BedObject3.GetReference().Enable()
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

ReferenceAlias Property Alias_DeadMerchant01 Auto Const

ReferenceAlias Property Alias_ObjectMarker1 Auto Const

ReferenceAlias Property Alias_DeadGuard02 Auto Const

ReferenceAlias Property Alias_ObjectMarker3 Auto Const
