;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Min207_00136329 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; not a real quickstart for the main quest, but will get you started on this quest
MQ206.SetStage(1000)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
if Game.GetPlayer().GetItemCount(MQ206Holotape.GetRef()) > 0
	; if player has holotape, go right to stage 100
	SetStage(100)
else
	; otherwise, stage 20
	SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; set active
SetActive()
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
if Alias_Ingram.GetRef().GetItemCount(MQ206Holotape.GetRef()) > 0
	Game.GetPlayer().AddItem(MQ206Holotape.GetRef())
endif
SetObjectiveCompleted(20)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Sturges.GetRef().AddItem(MQ206Holotape.GetRef())
CompleteAllObjectives()
MinutemenCentralQuest.CheckForMQAdvance()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

minutemencentralscript Property MinutemenCentralQuest Auto Const

Quest Property MQ206 Auto Const

ReferenceAlias Property MQ206Holotape Auto Const

ReferenceAlias Property Alias_Sturges Auto Const

ReferenceAlias Property Alias_Ingram Auto Const
