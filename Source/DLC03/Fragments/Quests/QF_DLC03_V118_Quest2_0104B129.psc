;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_V118_Quest2_0104B129 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
DLC03DialogueV118.SetStage(1300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(10) && !IsObjectiveCompleted(10)
	SetObjectiveCompleted(10)
Endif

if !IsObjectiveDisplayed(30)
	SetObjectiveDisplayed(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
If !GetStageDone(100)
	SetObjectiveDisplayed(30)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(10) && !IsObjectiveCompleted(10)
	SetObjectiveCompleted(10)
Endif

If IsObjectiveDisplayed(20) && !IsObjectiveCompleted(20)
	SetObjectiveCompleted(20)
Endif

SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(10) && !IsObjectiveCompleted(10)
	SetObjectiveCompleted(10)
Endif

If IsObjectiveDisplayed(20) && !IsObjectiveCompleted(20)
	SetObjectiveCompleted(20)
Endif

if IsObjectiveDisplayed(30)
	SetObjectiveDisplayed(30, false)
endif

SetObjectiveDisplayed(35)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(10) && !IsObjectiveCompleted(10)
	SetObjectiveCompleted(10)
Endif

If IsObjectiveDisplayed(20) && !IsObjectiveCompleted(20)
	SetObjectiveCompleted(20)
Endif

SetObjectiveDisplayed(35)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(35, false)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)


SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(30)
	SetObjectiveCompleted(30)
EndIf
If IsObjectiveDisplayed(55)
	SetObjectiveCompleted(55)
Endif
SetObjectiveDisplayed(56)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(30)
	SetObjectiveCompleted(30)
EndIf
if IsObjectiveDisplayed(55)
	SetObjectiveCompleted(55)
endif
SetObjectiveCompleted(56)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03DialogueV118 Auto Const Mandatory
