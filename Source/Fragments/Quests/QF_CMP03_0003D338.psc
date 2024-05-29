;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CMP03_0003D338 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
COMMacCreadyStory.SetStage(2)
utility.wait(2)
COMMacCreadyStory.SetStage(35)
COMMacCreadyStory.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
COMMacCreadyStory.SetStage(2)
utility.wait(2)
COMMacCreadyStory.SetStage(55)
COMMacCreadyStory.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_CMP03Winlock.GetActorRef().MoveTo(CMP03WinlockMarker)
Alias_CMP03Winlock.GetActorRef().Enable()
Alias_CMP03Barnes.GetActorRef().MoveTo(CMP03BarnesMarker)
Alias_CMP03Barnes.GetActorRef().Enable()
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20, 1)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
CMP03KillCount.SetValue(CMP03KillCount.GetValue() + 1)
if CMP03KillCount.GetValue() >= 2
SetStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30, 1)
CMP03KillCount.SetValue(CMP03KillCount.GetValue() + 1)
if CMP03KillCount.GetValue() >= 2
SetStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60, 1)
Alias_CMP03Sinclair.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(70, 1)
Alias_CMP03Sinclair.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0078_Item_00
Function Fragment_Stage_0078_Item_00()
;BEGIN CODE
if CMP03Lockdown.GetValue() == 0
CMP03Act02Scene03a.Start()
elseif CMP03Lockdown.GetValue() == 1
CMP03Act02Scene03b.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(80,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80,1)
CMP03HSLDoorRef.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70,1)
SetObjectiveDisplayed(85, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
SetObjectiveCompleted(85,1)
SetObjectiveDisplayed(90, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90,1)
SetObjectiveDisplayed(95,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(95,1)
SetObjectiveDisplayed(100,1)
SetObjectiveDisplayed(110,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
setObjectiveCompleted(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
setObjectiveCompleted(110,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CMP03Winlock Auto Const

ReferenceAlias Property Alias_CMP03Barnes Auto Const

ObjectReference Property CMP03WinlockMarker Auto Const

ObjectReference Property CMP03BarnesMarker Auto Const

GlobalVariable Property CMP03KillCount Auto Const

ReferenceAlias Property Alias_CMP03Sinclair Auto Const

Quest Property COMMacCreadyStory Auto Const

GlobalVariable Property CMP03Lockdown Auto Const

Scene Property CMP03Act02Scene03a Auto Const

Scene Property CMP03Act02Scene03b Auto Const

ObjectReference Property CMP03HSLDoorRef Auto Const

ObjectReference Property CMP03ChemicalHoodRef Auto Const
