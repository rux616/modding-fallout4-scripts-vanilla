;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC02WorkshopResourceTarg_0100248E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; eyebot starts traveling
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
ObjectReference mapMarker = Alias_MapMarker.GetRef()
if mapMarker
  mapMarker.AddToMap()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
; destroy scanner
Alias_workshopObject.GetRef().SetDestroyed(true)

; kill quest if prior to locating resource
; OR if quest completed
; OR if active scan stopped
if GetStageDone(20) == false || GetStageDone(100) == true || GetStageDone(50) == true
  Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; if eyebot is dead or returned, stop quest immediately
if GetStageDone(30) || GetStageDone(70)
 	Stop()
else
	; wait for eyebot to return
	SetObjectiveDisplayed(5, false)
	SetObjectiveDisplayed(10, false)
	ScanScene.Stop()
	ReturnScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE DLC01:ResourceTargetQuestScript
Quest __temp = self as Quest
DLC01:ResourceTargetQuestScript kmyQuest = __temp as DLC01:ResourceTargetQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.EyebotReturns()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveCompleted(10)
; if eyebot has returned or is dead, done
if GetStageDone(30) || GetStageDone(70)
	Stop()
else
	; otherwise wait for it to return
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(5, false)
SetObjectiveDisplayed(10, false)
DLC01:WorkshopResourceScannerScript scannerRef = Alias_WorkshopObject.GetRef() as DLC01:WorkshopResourceScannerScript
if scannerRef
	scannerRef.ReadyToScan()
else
	debug.trace(self + " stop stage - scanner alias empty!!!!")
endif
; disable eyebot if in pod
if GetStageDone(70)
	; disable eyebot if in pod
if GetStageDone(70)
	Alias_Eyebot.TryToDisable()
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC01:WorkshopResourceTargetParentScript Property DLC01WorkshopResourceTargetParent Auto Const Mandatory

ReferenceAlias Property Alias_Container Auto Const Mandatory

ReferenceAlias Property Alias_ResourceMarker Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

ReferenceAlias Property Alias_workshopObject Auto Const Mandatory

ReferenceAlias Property Alias_EyeBot Auto Const Mandatory

Scene Property ReturnScene Auto Const

Scene Property ScanScene Auto Const
