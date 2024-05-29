;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECampKMK02_001922F8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; move and enable trader
Alias_Trader.TryToMoveTo(Alias_SceneMarker1.GetRef())
Alias_Trader.TryToEnable()

;Uncomment these as desired.
Alias_Container.GetReference().Enable()
Alias_ClutterMarker.GetReference().Enable()
Alias_BedObject1.GetReference().Enable()

; always enable 1 friend
Alias_BedObject2.GetReference().Enable()
Alias_Friends.GetAt(0).Enable()

; enable more?
int i = 1
while i < Alias_Friends.GetCount()
	if utility.RandomInt() > 50
		Alias_Friends.GetAt(i).Enable()
		Alias_BedObject3.GetReference().Enable()
	endif
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; move and enable trader
Alias_Trader.TryToMoveTo(Alias_SceneMarker1.GetRef())
Alias_Trader.TryToEnable()

;Uncomment these as desired.
Alias_Container.GetReference().Enable()
Alias_ClutterMarker.GetReference().Enable()
Alias_BedObject1.GetReference().Enable()

; always enable 1 friend
Alias_BedObject2.GetReference().Enable()
Alias_Friends.GetAt(0).Enable()
Alias_Friend01.ForceRefTo(Alias_Friends.GetAt(0))

; enable more?
int i = 1
while i < Alias_Friends.GetCount()
	if utility.RandomInt() > 50
		Alias_Friends.GetAt(i).Enable()
		Alias_BedObject3.GetReference().Enable()
	endif
	i += 1
endWhile
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

; disable trader if not hired by player
actor trader = Alias_Trader.GetActorRef()
if trader.IsInFaction(WorkshopNPCFaction) == false
	trader.Disable()
endif

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

ReferenceAlias Property Alias_Trader Auto Const

ReferenceAlias Property Alias_SceneMarker1 Auto Const

ReferenceAlias Property Alias_Patient Auto Const

Scene Property RECampKMK01PatientScene Auto Const

RefCollectionAlias Property Alias_Friends Auto Const

ReferenceAlias Property Alias_Friend01 Auto Const

ReferenceAlias Property Alias_Friend02 Auto Const

ReferenceAlias Property Alias_Friend03 Auto Const

Faction Property WorkshopNPCFaction Auto Const Mandatory
