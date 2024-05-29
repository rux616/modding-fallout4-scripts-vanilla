;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_V118_MiscObjectives_01036761 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
if isObjectiveDisplayed(10) && !isObjectiveCompleted(10)
	SetObjectiveDisplayed(10, false)
endif
if isObjectiveDisplayed(15) && !isObjectiveCompleted(15)
	SetObjectiveDisplayed(15, false)
endif
if isObjectiveDisplayed(20) && !isObjectiveCompleted(20)
	SetObjectiveDisplayed(20, false)
endif
if isObjectiveDisplayed(30) && !isObjectiveCompleted(30)
	SetObjectiveDisplayed(30, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
if DLC03_V118_PearlAvery.IsRunning()
	DLC03_V118_PearlAvery.stop()
endif
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

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
if isObjectiveDisplayed(10)
	SetObjectiveCompleted(10)
endif

SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if isObjectiveDisplayed(10)
	SetObjectiveCompleted(10)
endif


SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
if isObjectiveDisplayed(10)
	SetObjectiveCompleted(10)
endif
if isObjectiveDisplayed(15)
	SetObjectiveCompleted(15)
endif
if isObjectiveDisplayed(20)
	SetObjectiveCompleted(20)
endif

SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
if isObjectiveDisplayed(10)
	SetObjectiveCompleted(10)
endif
if isObjectiveDisplayed(15)
	SetObjectiveCompleted(15)
endif
if isObjectiveDisplayed(20)
	SetObjectiveCompleted(20)
endif
if isObjectiveDisplayed(30)
	SetObjectiveCompleted(30)
endif

if isObjectiveDisplayed(100)
	SetObjectiveCompleted(100)
endif

if isObjectiveDisplayed(110)
	SetObjectiveCompleted(110)
endif

SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
if isObjectiveDisplayed(10)
	SetObjectiveCompleted(10)
endif
if isObjectiveDisplayed(15)
	SetObjectiveCompleted(15)
endif
if isObjectiveDisplayed(20)
	SetObjectiveCompleted(20)
endif
if isObjectiveDisplayed(30)
	SetObjectiveCompleted(30)
endif

If isObjectiveDisplayed(40)
	SetObjectiveCompleted(40)
endif

if IsObjectiveDisplayed(100)
	SetObjectiveCompleted(100)
endif

if IsObjectiveDisplayed(110)
	SetObjectiveCompleted(110)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if !IsObjectiveDisplayed(100) && !DLC03_V118_Intro.GetStageDone(100)
	SetObjectiveDisplayed(100)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(100) && !DLC03_V118_Intro.GetStageDone(100)
	SetObjectiveCompleted(100)
	SetObjectiveDisplayed(110)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03_V118_PearlAvery Auto Const Mandatory

Quest Property DLC03_V118_Intro Auto Const Mandatory
