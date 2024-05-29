;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN029SecondWaveA_000ADCA6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE DN029SecondWaveAScript
Quest __temp = self as Quest
DN029SecondWaveAScript kmyQuest = __temp as DN029SecondWaveAScript
;END AUTOCAST
;BEGIN CODE
debug.Trace(self + "Stage 0 Set")
Alias_ScavengerAttacker01.GetActorReference().Enable()
Alias_ScavengerAttacker02.GetActorReference().Enable()
Alias_ScavengerAttacker03.GetActorReference().Enable()
Alias_ScavengerAttacker04.GetActorReference().Enable()
Alias_ScavengerAttacker05.GetActorReference().Enable()
Alias_ScavengerAttacker06.GetActorReference().Enable()
Alias_ScavengerAttacker01.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_ScavengerAttacker02.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_ScavengerAttacker03.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_ScavengerAttacker04.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_ScavengerAttacker05.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_ScavengerAttacker06.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_MissleLauncherRaider.GetReference().EnablenoWait()
;utility.Wait(1)
kmyQuest.StartAttackTimer()
kmyQuest.MissileLauncher.Fire(Alias_MissileMarker01.GetReference(), kmyQuest.AmmoMissile)
utility.Wait(2)
kmyQuest.MissileLauncher.Fire(Alias_MissileMarker02.GetReference(), kmyQuest.AmmoMissile)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
debug.Trace(self + "Stage 100 Set")
if MS11.GetStageDone(1275) == FALSE
	Game.GetPlayer().AddToFaction(DN029ScavengerAttackFaction)
endif
Alias_ScavengerAttacker01.GetActorReference().Enable()
Alias_ScavengerAttacker02.GetActorReference().Enable()
Alias_ScavengerAttacker03.GetActorReference().Enable()
Alias_ScavengerAttacker04.GetActorReference().Enable()
Alias_ScavengerAttacker05.GetActorReference().Enable()
Alias_ScavengerAttacker06.GetActorReference().Enable()
Alias_ScavengerAttacker01.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_ScavengerAttacker02.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_ScavengerAttacker03.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_ScavengerAttacker04.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_ScavengerAttacker05.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_ScavengerAttacker06.GetActorReference().MoveTo(Alias_SpawnMarkerOverride.GetReference())
Alias_ScavengerAttacker01.GetActorReference().RemoveFromFaction(RaiderFaction)
Alias_ScavengerAttacker02.GetActorReference().RemoveFromFaction(RaiderFaction)
Alias_ScavengerAttacker03.GetActorReference().RemoveFromFaction(RaiderFaction)
Alias_ScavengerAttacker04.GetActorReference().RemoveFromFaction(RaiderFaction)
Alias_ScavengerAttacker05.GetActorReference().RemoveFromFaction(RaiderFaction)
Alias_ScavengerAttacker06.GetActorReference().RemoveFromFaction(RaiderFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
debug.Trace(self + "Stage 400 Set")
;debug.Notification("Scavenger made it to ship.  Starting Interior Attack.")
SetStage(500) ;Stop Spawning
DN029SecondWaveB.SetStage(0) ;Start Interior Attack

; Warn player that scavengers have entered the ship.
if !GetStageDone(100)
    MS11.SetStage(820)
endif

(Alias_ScavengerAttacker01 as DN029SecondWaveAAttakerScript).TryToEnterShip = TRUE
(Alias_ScavengerAttacker02 as DN029SecondWaveAAttakerScript).TryToEnterShip = TRUE
(Alias_ScavengerAttacker03 as DN029SecondWaveAAttakerScript).TryToEnterShip = TRUE
(Alias_ScavengerAttacker04 as DN029SecondWaveAAttakerScript).TryToEnterShip = TRUE
(Alias_ScavengerAttacker05 as DN029SecondWaveAAttakerScript).TryToEnterShip = TRUE
(Alias_ScavengerAttacker06 as DN029SecondWaveAAttakerScript).TryToEnterShip = TRUE
Alias_ScavengerAttacker01.GetActorReference().StopCombat()
Alias_ScavengerAttacker02.GetActorReference().StopCombat()
Alias_ScavengerAttacker03.GetActorReference().StopCombat()
Alias_ScavengerAttacker04.GetActorReference().StopCombat()
Alias_ScavengerAttacker05.GetActorReference().StopCombat()
Alias_ScavengerAttacker06.GetActorReference().StopCombat()
Alias_ScavengerAttacker01.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker02.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker03.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker04.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker05.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker06.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
debug.Trace(self + "Stage 450 Set")
;debug.Notification("Scavengers killed before reaching.  They are retreating!")
SetStage(500) ;Stop Spawning
Alias_ScavengerAttacker01.GetActorReference().StopCombat()
Alias_ScavengerAttacker02.GetActorReference().StopCombat()
Alias_ScavengerAttacker03.GetActorReference().StopCombat()
Alias_ScavengerAttacker04.GetActorReference().StopCombat()
Alias_ScavengerAttacker05.GetActorReference().StopCombat()
Alias_ScavengerAttacker06.GetActorReference().StopCombat()
Alias_ScavengerAttacker01.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker02.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker03.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker04.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker05.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker06.GetActorReference().EvaluatePackage()
if !GetStageDone(400)
    MS11.SetStage(840)
endif
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

ReferenceAlias Property Alias_ScavengerAttacker05 Auto Const

ReferenceAlias Property Alias_ScavengerAttacker06 Auto Const

Quest Property DN029FirstWave Auto Const

ReferenceAlias Property Alias_SpawnMarkerOverride Auto Const

Quest Property DN029SecondWaveB Auto Const

Faction Property DN029ScavengerAttackFaction Auto Const

Faction Property RaiderFaction Auto Const

ReferenceAlias Property Alias_MissileMarker01 Auto Const

ReferenceAlias Property Alias_MissileMarker02 Auto Const

ReferenceAlias Property Alias_MissleLauncherRaider Auto Const
