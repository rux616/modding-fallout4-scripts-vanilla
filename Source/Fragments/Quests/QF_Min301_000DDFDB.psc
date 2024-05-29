;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Min301_000DDFDB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Min03.SetStage(0)
Min03.setStage(150)
Min03.setStage(550) ; allowed to build artillery
Min03.setStage(560) ; smoke grenades
; TEMP - test if Min03 not finished
;Min03.setStage(950) ; add Ronnie to workshop
;Min03.setStage(1000) ; completed
MQ206.SetStage(0)
MQ206.SetStage(100)
MQ206.SetStage(200)
MQ206Min.SetStage(1000)
MQ206Min.SetStage(1450)
MQ206.Stop()
MQ206Min.Stop()
MQ207.SetStage(180) ; kicked out
MQ207.SetStage(200) ; complete quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
setStage(0)
WorkshopParent.MinutemenOwnedSettlements.SetValueInt(MinutemenCentralQuest.MinRecruitment03)
MQ207.SetStage(200) ; player has exited Institute
Min207.SetStage(200) ; 
MinutemenCentralQuest.CheckForMQAdvance()
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

;BEGIN FRAGMENT Fragment_Stage_0015_Item_01
Function Fragment_Stage_0015_Item_01()
;BEGIN CODE
RRAct3Lost.SetStage(300)
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

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
; if player has holotape, set stage 100
if Game.GetPlayer().GetItemCount(MQ206Holotape) > 0
	Min207.SetStage(100)
else
; otherwise, objective to get holotape
	Min207.SetStage(20)
endif
; make it active
Min207.SetActive(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)

; advance MinDefendCastle
MinDefendCastle.SetStage(50)

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Min03Script Property Min03 Auto Const

MQ206Script Property MQ206 Auto Const

Quest Property MQ206Min Auto Const

Quest Property MQ207 Auto Const

MQ00Script Property MQ00 Auto Const

workshopparentscript Property WorkshopParent Auto Const

MinutemenCentralScript Property MinutemenCentralQuest Auto Const

Quest Property MQ301 Auto Const

ReferenceAlias Property Alias_PrestonGarvey Auto Const

GlobalVariable Property XPFactionFinal Auto Const

Quest Property MinDefendCastle Auto Const

Quest Property Min207 Auto Const

Quest Property RRAct3Lost Auto Const

Holotape Property MQ206Holotape Auto Const Mandatory
