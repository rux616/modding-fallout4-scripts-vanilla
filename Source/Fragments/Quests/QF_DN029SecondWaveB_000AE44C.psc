;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN029SecondWaveB_000AE44C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE DN029SecondWaveBScript
Quest __temp = self as Quest
DN029SecondWaveBScript kmyQuest = __temp as DN029SecondWaveBScript
;END AUTOCAST
;BEGIN CODE
debug.Trace(self + "Stage 0 Set")
;debug.Notification("Spawning Started")
kmyQuest.StartPhaseTimer()
if DN029SecondWaveA.GetStageDone(100)
    Alias_ScavengerAttacker01.GetActorReference().RemoveFromFaction(RaiderFaction)
    Alias_ScavengerAttacker02.GetActorReference().RemoveFromFaction(RaiderFaction)
    Alias_ScavengerAttacker03.GetActorReference().RemoveFromFaction(RaiderFaction)
    Alias_ScavengerAttacker04.GetActorReference().RemoveFromFaction(RaiderFaction)
endif
Alias_ScavengerAttacker01.GetActorReference().EnableNoWait()
Alias_ScavengerAttacker02.GetActorReference().EnableNoWait()
Alias_ScavengerAttacker03.GetActorReference().EnableNoWait()
Alias_ScavengerAttacker04.GetActorReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DN029SecondWaveBScript
Quest __temp = self as Quest
DN029SecondWaveBScript kmyQuest = __temp as DN029SecondWaveBScript
;END AUTOCAST
;BEGIN CODE
if DN029SecondWaveA.GetStageDone(100)
    kmyQuest.CurrentPhase = 2
    kmyQuest.PlayerUpdatePhase()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DN029SecondWaveBScript
Quest __temp = self as Quest
DN029SecondWaveBScript kmyQuest = __temp as DN029SecondWaveBScript
;END AUTOCAST
;BEGIN CODE
if DN029SecondWaveA.GetStageDone(100)
    kmyQuest.CurrentPhase = 4
    kmyQuest.PlayerUpdatePhase()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DN029SecondWaveBScript
Quest __temp = self as Quest
DN029SecondWaveBScript kmyQuest = __temp as DN029SecondWaveBScript
;END AUTOCAST
;BEGIN CODE
if DN029SecondWaveA.GetStageDone(100)
    kmyQuest.CurrentPhase = 5
    kmyQuest.PlayerUpdatePhase()
    utility.Wait(1)
    
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE defaultquestrespawnscript
Quest __temp = self as Quest
defaultquestrespawnscript kmyQuest = __temp as defaultquestrespawnscript
;END AUTOCAST
;BEGIN CODE
(DN029SecondWaveB as DN029SecondWaveBScript).CurrentPhase = 5

kmyQuest.RespawnMarkers[1].MoveTo(kmyQuest.RespawnMarkers[1].GetNthLinkedRef(3))
kmyQuest.RespawnMarkers[2].MoveTo(kmyQuest.RespawnMarkers[2].GetNthLinkedRef(3))
kmyQuest.RespawnMarkers[3].MoveTo(kmyQuest.RespawnMarkers[3].GetNthLinkedRef(3))
kmyQuest.RespawnMarkerFailsafe.MoveTo(kmyQuest.RespawnMarkerFailsafe.GetNthLinkedRef(1))

Alias_ScavengerAttacker01.GetActorReference().StopCombat()
Alias_ScavengerAttacker02.GetActorReference().StopCombat()
Alias_ScavengerAttacker03.GetActorReference().StopCombat()
Alias_ScavengerAttacker04.GetActorReference().StopCombat()
Alias_ScavengerAttacker01.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker02.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker03.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker04.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
debug.Trace(self + "Stage 500 Set")
;debug.Notification("Spawning Stopped")
DN029SecondWaveA.SetStage(450)
MS11.SetStage(850)
Alias_ScavengerAttacker01.GetActorReference().StopCombat()
Alias_ScavengerAttacker02.GetActorReference().StopCombat()
Alias_ScavengerAttacker03.GetActorReference().StopCombat()
Alias_ScavengerAttacker04.GetActorReference().StopCombat()
Alias_ScavengerAttacker01.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker02.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker03.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker04.GetActorReference().EvaluatePackage()
utility.Wait(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
debug.Trace(self + "Stage 1000 Set")
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_ScavengerAttacker01 Auto Const

ReferenceAlias Property Alias_ScavengerAttacker02 Auto Const

ReferenceAlias Property Alias_ScavengerAttacker03 Auto Const

ReferenceAlias Property Alias_ScavengerAttacker04 Auto Const

Quest Property MS11 Auto Const

Quest Property DN029SecondWaveB Auto Const

Quest Property DN029SecondWaveA Auto Const

Faction Property RaiderFaction Auto Const
