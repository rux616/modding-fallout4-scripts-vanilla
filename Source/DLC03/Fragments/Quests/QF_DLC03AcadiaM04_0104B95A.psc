;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03AcadiaM04_0104B95A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Cog.GetActorReference().EvaluatePackage()
DLC03AcadiaM04CogJuleStage50Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
DLC03AcadiaM04Stage100JuleScene.Start()
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(200)
Game.GetPlayer().AddItem(DLC03Acadia_M04Key,1)

;set stage for blocking Jule's initial scene in AcadiaDialogue since it won't make sense past here
DLC03AcadiaDialogue.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
SetObjectiveDisplayed(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(M04Note.GetReference(), 1)
SetObjectiveCompleted(400)
If IsObjectiveDisplayed(410)
SetObjectivedisplayed(410, 0)
endif
DLC03_CustomItemQuest.SetSTage(250)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(M04Note.GetReference(), 1)
Game.GetPlayer().AddItem(DLC03M04JuleKey,1)
SetObjectiveCompleted(410)
If IsObjectiveDisplayed(400)
SetObjectivedisplayed(400, 0)
endif
DLC03_CustomItemQuest.SetStage(240)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Cog Auto Const

ReferenceAlias Property Jule Auto Const

Scene Property DLC03AcadiaM04CogJuleStage50Scene Auto Const Mandatory

Scene Property DLC03AcadiaM04Stage100JuleScene Auto Const Mandatory

ReferenceAlias Property M04Note Auto Const

Key Property DLC03Acadia_M04Key Auto Const Mandatory

Key Property DLC03M04JuleKey Auto Const Mandatory

Quest Property DLC03_CustomItemQuest Auto Const Mandatory

Quest Property DLC03AcadiaDialogue Auto Const Mandatory
