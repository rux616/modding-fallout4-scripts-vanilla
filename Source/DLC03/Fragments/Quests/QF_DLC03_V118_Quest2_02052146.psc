;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_V118_Quest2_02052146 Extends Quest Hidden Const

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

SetObjectiveDisplayed(20)
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

SetObjectiveDisplayed(35)
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

SetObjectiveDisplayed(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveFailed(40)
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03DialogueV118 Auto Const Mandatory
