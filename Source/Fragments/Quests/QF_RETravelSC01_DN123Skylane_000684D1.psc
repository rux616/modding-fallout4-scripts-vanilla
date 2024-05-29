;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelSC01_DN123Skylane_000684D1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;debug.trace(self + " STARTING")
kmyQuest.Startup()

;Start DN123, if it isn't already running.
DN123.Start()

;Disable the REAssault trigger at Skylanes, on the off-chance it could load while this was running.
DN123_SkylanesRETrigger.DisableNoWait()

;Move Ness into position.
Actor Ness = Alias_Ness.GetActorRef()
Ness.MoveTo(Alias_TravelMarkerA1.GetReference())
Ness.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Re-enable the REAssault trigger at Skylanes.
DN123_SkylanesRETrigger.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;DN123 is managing the objectives for this quest.
;Display 'Meet Ness at the Crash Site'.
DN123.SetStage(30)

;DN123 re-enables the SkylanesRETrigger; no need to do it here.
;DN123_SkylanesRETrigger.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Re-enable the REAssault trigger at Skylanes.
DN123_SkylanesRETrigger.EnableNoWait()
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
;debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()

;Re-enable the REAssault trigger at Skylanes.
DN123_SkylanesRETrigger.EnableNoWait()

;Move Ness to the holding cell.
Actor Ness = Alias_Ness.GetActorRef()
if (!Ness.IsDead())
     Ness.MoveTo(REHoldingCellMarker)
     Ness.EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Ness Auto Const

ReferenceAlias Property Alias_TravelMarkerA1 Auto Const

ObjectReference Property REHoldingCellMarker Auto Const

Quest Property DN123 Auto Const

ObjectReference Property DN123_SkylanesRETrigger Auto Const Mandatory
