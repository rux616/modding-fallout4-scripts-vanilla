;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RR304_00142FD3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RR304Script
Quest __temp = self as Quest
RR304Script kmyQuest = __temp as RR304Script
;END AUTOCAST
;BEGIN CODE
; If this becomes a quest - "Nowhere to Hide"

; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
RR303.SetStage(1)
SetStage(100)
pRailroadFaction.SetAlly(pPlayerFaction)

; Make the Prydwen et al appear
pBoSEnable.SetStage(10)
pBoSEnable.SetStage(15)
pBoSPrydwen.Enable()

; Kick the player out of the Brotherhood
pBoSKickOut.SetStage(20)

; Deacon won't give his intro spiel all the time
pCOMDeacon.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
; Get the vertibird doing it's thing
Alias_Vertibird.GetActorRef().PlayIdle(pVertibirdUntrainedFlightIdleStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetStage(1)
SetStage(100)
SetStage(200)
SetStage(300)
SetStage(400)
SetStage(500)
SetStage(600)
SetStage(700)
SetStage(800)

Game.GetPlayer().MoveTo(Alias_TinkerTom.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetStage(1)
SetStage(100)
SetStage(200)
SetStage(300)
SetStage(400)
RR303.SetStage(400)
SetStage(500)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(900)
Game.GetPlayer().MoveTo(pBoS201DanseRoofMarker)
Utility.Wait(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0026_Item_00
Function Fragment_Stage_0026_Item_00()
;BEGIN CODE
Alias_TinkerTom.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Deacon.GetActorRef().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
SetStage(26)

RR302.SetStage(10800)
RR303.SetStage(11100)
RR302.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetStage(1)
SetStage(800)
RR303.SetStage(800)
SetStage(1200)
RR302.Stop()

; Teleport player to the Prydwen
Game.GetPlayer().MoveTo(pRR303PrydwenMarker)

; Teleport the Claymore
actor aTarg = Alias_Vertibird.GetActorRef()
aTarg.Enable()
aTarg.MoveTo(pRR303ClaymoreTeleportMarker)

; Bring in Deacon
Utility.Wait(0.5)
aTarg = Alias_TinkerTom.GetActorRef()
aTarg.EvaluatePackage()
aTarg.Disable()
aTarg.Enable()
aTarg.MoveTo(pRR303PrydwenMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(10100)
RR303.SetStage(10100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(10200)
RR303.SetStage(10200)

; Finish "Underground Undercover"
RR201.SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Called from RR303 - 200
; * That's fired when the BoS attacking the interior HQ are killed.

; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(10300)
RR303.SetStage(10300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Called from RR303 - 300
; * Fired when BoS killed in Catacombs

; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(10400)
RR303.SetStage(10400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Called from RR303 - 400
; * Fired when BoS killed in Church

; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(10500)
RR303.SetStage(10500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(10600)
RR303.SetStage(10600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(10700)
RR303.SetStage(10700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(10800)
RR303.SetStage(10800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(10900)
RR303.SetStage(10900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(10950)
RR303.SetStage(10950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(11000)
RR303.SetStage(11000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(11100)
RR303.SetStage(11100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(11200)
RR303.SetStage(11200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(11300)
RR303.SetStage(11300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(11400)
RR303.SetStage(11400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(11500)
RR303.SetStage(11500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
; Sync with "Precipice of War" and "Rockets' Red Glare"
RR302.SetStage(11600)
RR303.SetStage(11600)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; No need to "Fail Quest" since there are no objectives for this
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RR302 Auto Const

Quest Property RR303 Auto Const

Faction Property pRailroadFaction Auto Const

Faction Property pPlayerFaction Auto Const

Quest Property RR201 Auto Const

ReferenceAlias Property Alias_TinkerTom Auto Const

ObjectReference Property pRR302TinkerToRoofMarker Auto Const

ReferenceAlias Property Alias_Deacon Auto Const

ObjectReference Property pBoS201DanseRoofMarker Auto Const

ObjectReference Property pRR303PrydwenMarker Auto Const

ReferenceAlias Property Alias_Vertibird Auto Const

ObjectReference Property pRR303ClaymoreTeleportMarker Auto Const

Quest Property pBoSEnable Auto Const

ObjectReference Property pBoSPrydwen Auto Const

Quest Property pBoSKickOut Auto Const

Quest Property pFollowers Auto Const

Idle Property pVertibirdUntrainedFlightIdleStart Auto Const

Quest Property pCOMDeacon Auto Const
