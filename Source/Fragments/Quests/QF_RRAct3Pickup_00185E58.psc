;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRAct3Pickup_00185E58 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRAct3PickupScript
Quest __temp = self as Quest
RRAct3PickupScript kmyQuest = __temp as RRAct3PickupScript
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Setting up necessary values to simulate getting to the Institute naturally
pPlayerBeenToInstitute.SetValueInt(1)
Game.GetPlayer().AddToFaction(pInstituteFaction)

pRR101.Stop()
pRR102.Stop()
pPlayerRailroad_IsInFaction.SetValue(1)
pMQ206Min.SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
; Setting up necessary values to simulate getting to the Institute naturally
pPlayerBeenToInstitute.SetValueInt(1)
Game.GetPlayer().AddToFaction(pInstituteFaction)

pRR101.Stop()
pRR102.Stop()
pPlayerRailroad_IsInFaction.SetValue(1)
pMQ206BoS.SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Gives an objective to talk to Tom
pRR201.SetStage(50)
; Kills the "Welcome Back From the Institute" conversation
pRR201.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Potentially give the player a new holotape
(pRR201 as RR201Script).MaybeGiveHolotape()

; See if the player still has the holotape
;if ( Game.GetPlayer().GetItemCount(pMQ206Holotape) == 0 )
;   Game.GetPlayer().AddItem(pMQ206HolotapeRR)
;endif

; The holotape is now ready to interface with the Institute
pRR201.SetStage(100)

; End the quest
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Fail objectives & end quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pRR201 Auto Const

Quest Property pMQ206Min Auto Const

Quest Property pRR101 Auto Const

Quest Property pRR102 Auto Const

GlobalVariable Property pPlayerRailroad_IsInFaction Auto Const

Quest Property pMQ206BoS Auto Const

GlobalVariable Property pPlayerBeenToInstitute Auto Const

Faction Property pInstituteFaction Auto Const

Holotape Property pMQ206Holotape Auto Const

Holotape Property pMQ206HolotapeRR Auto Const
