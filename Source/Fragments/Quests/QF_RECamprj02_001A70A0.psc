;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECamprj02_001A70A0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Uncomment these as desired.
Alias_Container.GetReference().Enable()
Alias_ClutterMarker.GetReference().Enable()
Alias_BedObject1.GetReference().Enable()
;Alias_BedObject2.GetReference().Enable()
;Alias_BedObject3.GetReference().Enable()

Alias_container.GetReference().SetFactionOwner(RECampRJ02Faction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if alias_Clint.GetRef().Is3DLoaded()
	RECamprj02Scene01.Start()
endif
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

ReferenceAlias Property Alias_Clint Auto Const

Scene Property RECamprj02Scene01 Auto Const

Faction Property RECampRJ02Faction Auto Const
