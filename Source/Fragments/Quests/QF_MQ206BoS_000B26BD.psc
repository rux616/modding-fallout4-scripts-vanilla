;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ206BoS_000B26BD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;MQ206 function handles all the objectives
MQ206.WorkingWithFaction(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
(MQ206 as MQ206Script).GiveSignalInterceptorPlans(Alias_ProctorIngram.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
;MQ206 function handles all the objectives
MQ206.BeginBuilding()
Game.GetPlayer().AddItem(MQ206ListReflectorPlatform)
; give platform build items
MQ206.SetStage(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
;MQ206 function handles all the objectives
MQ206.SetObjectiveCompleted(MQ206.ObjectiveTalkToFactionScientist02)
MQ206.UpdateBuildingStage()
; give note
Game.GetPlayer().AddItem(MQ206BoSListCombined)
; add other building items to workshop (once only)
MQ206.SetStage(350)
;Start BoS203 Silently
BoS203.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
MQ206.FinishBuilding()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1375_Item_00
Function Fragment_Stage_1375_Item_00()
;BEGIN CODE
MQ206.SetStage(600)
;Start external tracking for holotape quest
BoS204.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
MQ206.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;make sure Brotherhood always give Holotape if that somehow gets skipped
SetStage(1375)
BoS204.SetStage(10)

;trigger teleportation in main quest
MQ206.SetStage(1000)

; Queue up the Railroad trying to convince you to win the game with them instead
pRRAct3Pickup.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MQ206Script Property MQ206 Auto Const

Quest Property BoS203 Auto Const

Quest Property BoS204 Auto Const

Quest Property pRRAct3Pickup Auto Const

Book Property MQ206ListReflectorPlatform Auto Const

Book Property MQ206BoSListCombined Auto Const

ReferenceAlias Property Alias_ProctorIngram Auto Const
