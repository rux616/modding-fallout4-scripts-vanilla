;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueGoodneighborStanl_0017D18C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(20)
	SetObjectiveDisplayed(20, false)
endif
if IsObjectiveDisplayed(31)
	SetObjectiveCompleted(31)
endif
if IsObjectiveDisplayed(32)
	SetObjectiveCompleted(32)
endif
SetObjectiveDisplayed(33)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(33)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;event sent from DrinkingBuddyDialogue Quest
If IsObjectiveDisplayed(10)
	SetObjectiveCompleted(10)
Endif


SetObjectiveDisplayed(20)
SetObjectiveDisplayed(21)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(20)
	SetObjectiveCompleted(20)
	SetObjectiveDisplayed(30)
Endif

If IsObjectiveDisplayed(22)
	SetObjectiveDisplayed(22, false)
	SetObjectiveDisplayed(30)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0506_Item_00
Function Fragment_Stage_0506_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(31)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0507_Item_00
Function Fragment_Stage_0507_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(31)
	SetObjectiveCompleted(31)
	SetObjectiveDisplayed(32)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN CODE
DialogueGoodneighborRufusBuddyArrival.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
;Hide the other objectives
SetObjectiveCompleted(21) ;(Optional) Keep Drinkin' Buddy for yourself

if IsObjectiveDisplayed(20)
	SetObjectiveDisplayed(20, false) ;Send the Drinkin' Buddy to the Hotel Rexford
	SetObjectiveDisplayed(22) ;(Optional) Send the Drinkin' Buddy to the Hotel Rexford

Endif

;Set the Objective complete
If IsObjectiveDisplayed(30)
	SetObjectiveDisplayed(30, false) ;Follow Drinkin' Buddy to the Hotel Rexford
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
DialogueDrinkingBuddy.SetStage(100)
DialogueDrinkingBuddy.SetStage(120)

SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
int payout
if GetStageDone(23)
	payout = 400
elseif GetStageDone(22)
	payout = 300
elseif GetStageDone(21)
	payout = 200
else
	payout = 100
endif

if isObjectiveDisplayed(21)
SetObjectiveDisplayed(21, false)
endif

if isObjectiveDisplayed(50)
SetObjectiveCompleted(50, false)
endif

Game.GetPlayer().AddItem(Caps001, payout)
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Caps001 Auto Const

Scene Property DialogueGoodneighborRufusBuddyArrival Auto Const

Quest Property DialogueDrinkingBuddy Auto Const
