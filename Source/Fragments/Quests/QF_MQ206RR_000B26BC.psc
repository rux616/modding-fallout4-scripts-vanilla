;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ206RR_000B26BC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;MQ206 function handles all the objectives
pMQ206.WorkingWithFaction(3)

; If RR102 is still open, then replay the Intro scene
if ( pRR102.IsRunning() )
  pRR102_800b_Final_Intro.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
(pMQ206 as MQ206Script).GiveSignalInterceptorPlans(Alias_TinkerTom.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
;MQ206 function handles all the objectives
pMQ206.BeginBuilding()

; give note
Game.GetPlayer().AddItem(pMQ206RRListReflectorPlatform)

; give platform build items
pMQ206.SetStage(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
;MQ206 function handles all the objectives
pMQ206.SetObjectiveCompleted(pMQ206.ObjectiveTalkToFactionScientist02)
pMQ206.UpdateBuildingStage()

; give note
Game.GetPlayer().AddItem(pMQ206RRListCombined)

; add other building items to workshop (once only)
pMQ206.SetStage(350)
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

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
pMQ206.SetStage(500)
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
;make sure Railroad always gives you holotape
RR201.SetStage(100)

;advance the main quest
pMQ206.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MQ206Script Property pMQ206 Auto Const

ReferenceAlias Property Alias_TinkerTom Auto Const

Book Property pMQ206RRListReflectorPlatform Auto Const

Book Property pMQ206RRListCombined Auto Const

Quest Property pRR101 Auto Const

Scene Property pRR102_800b_Final_Intro Auto Const

Quest Property pRR102 Auto Const

Quest Property RR201 Auto Const Mandatory
