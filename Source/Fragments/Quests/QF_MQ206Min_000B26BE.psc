;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ206Min_000B26BE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;MQ206 function handles all the objectives
pMQ206.WorkingWithFaction(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
(pMQ206 as MQ206Script).GiveSignalInterceptorPlans(Alias_Sturges.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
;MQ206 function handles all the objectives
pMQ206.BeginBuilding()
; give note
Game.GetPlayer().AddItem(MQ206ListReflectorPlatform)
; give platform build items
pMQ206.SetStage(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
;MQ206 function handles all the objectives
debug.trace(self + " stage 1200")
pMQ206.SetObjectiveCompleted(pMQ206.ObjectiveTalkToFactionScientist02)
pMQ206.UpdateBuildingStage()
; give note
Game.GetPlayer().AddItem(MQ206MinListCombined)
; add other building items to workshop (once only)
pMQ206.SetStage(350)
debug.trace(self + " stage 1200 done")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
pMQ206.FinishBuilding()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
pMQ206.SetStage(600)
; start Min207 side objective
Min207.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
pMQ206.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1450_Item_00
Function Fragment_Stage_1450_Item_00()
;BEGIN CODE
Min207.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1475_Item_00
Function Fragment_Stage_1475_Item_00()
;BEGIN CODE
pMQ206.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;make sure sturges always gives you the holotape
SetStage(1350)

;advance the main quest
pMQ206.SetStage(1000)

; Queue up the Railroad trying to convince you to win the game with them instead
pRRAct3Pickup.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MQ206Script Property pMQ206 Auto Const

Quest Property Min207 Auto Const

Book Property MQ206ListReflectorPlatform Auto Const

Book Property MQ206MinListCombined Auto Const

Quest Property pRRAct3Pickup Auto Const

ReferenceAlias Property Alias_Sturges Auto Const
