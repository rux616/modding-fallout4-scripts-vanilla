;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN130_RR302_0002F461 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;TRASH THIS
Alias_TinkerTom.GetActorRef().FollowerFollow()
Alias_Glory.GetActorRef().FollowerFollow()
int i = 0
While (i < Alias_Agents.GetCount())
     (Alias_Agents.GetAt(i) as Actor).FollowerFollow()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;When the player enters the station, bring the other Railroad Agents inside
;/Actor a
a = Alias_Glory.GetActorRef()
if (!a.IsDead())
     a.Disable()
     a.MoveTo(DN130_GloryWarpMarker)
     a.EnableNoWait(True)
     a.EvaluatePackage()
EndIf
a = Alias_TinkerTom.GetActorRef()
if (!a.IsDead())
     a.Disable()
     a.MoveTo(DN130_TinkerTomWarpMarker)
     a.EnableNoWait(True)
     a.EvaluatePackage()
EndIf
a = Alias_Agent001.GetActorRef()
if (!a.IsDead())
     a.Disable()
     a.MoveTo(DN130_Agent001WarpMarker)
     a.EnableNoWait(True)
     a.EvaluatePackage()
EndIf
a = Alias_Agent002.GetActorRef()
if (!a.IsDead())
     a.Disable()
     a.MoveTo(DN130_Agent002WarpMarker)
     a.EnableNoWait(True)
     a.EvaluatePackage()
EndIf
a = Alias_Agent003.GetActorRef()
if (!a.IsDead())
     a.Disable()
     a.MoveTo(DN130_Agent003WarpMarker)
     a.EnableNoWait(True)
     a.EvaluatePackage()
EndIf

;Kill the guards outside, and the patrol team if they were sent out.
int i = 0
int count = Alias_BoSGuards_Exterior_GuardTeam.GetCount()
Debug.Trace("Mark: " + i + ", " + count)
While (i < count)
     Debug.Trace("In Loop: " + i + ": " + Alias_BoSGuards_Exterior_GuardTeam.GetAt(i))
     (Alias_BoSGuards_Exterior_GuardTeam.GetAt(i) as Actor).Kill()
     i = i + 1
EndWhile
if (GetStageDone(22))
     i = 0
     count = Alias_BoSGuards_Interior_PatrolTeam.GetCount()
     While (i < count)
          Debug.Trace("In Loop: " + i + ": " + Alias_BoSGuards_Interior_PatrolTeam.GetAt(i))
          (Alias_BoSGuards_Interior_PatrolTeam.GetAt(i) as Actor).Kill()
          i = i + 1
     EndWhile
EndIf
/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;This quest is used by RR302 to manage events specific to that quest.

;Set up the Police Station for RR302.
DN130.SetStage(80)

;Move the Station Leader (usually Haylen) into position.
;Actor BoSStationLeader = (Alias_BoSStationLeader.GetActorRef())
;BoSStationLeader.MoveTo(RR302StationLeaderStartMarker)
;BoSStationLeader.GetActorBase().SetProtected(False)
;BoSStationLeader.Enable()

;If Clarke is in the Cambridge PD Jail, set him up to be released.
if (pBoSM02Postquest.GetStageDone(20))
     pBoSM02Postquest.SetStage(40)
EndIf

;Use BoSMarshal Quest to bring named BoS guys into the fray
pBoSMarshal.setstage(30)
Alias_BoSStationTeam.AddRef(Alias_ScribeHaylen.getReference())
Alias_ScribeHaylen.getReference().moveto(pRR302HaylenMarker)
Alias_BoSStationLeader.ForceRefTo(Alias_ScribeHaylen.GetReference())
Alias_BoSStationTeam.AddRef(Alias_KnightRhys.getReference())
Alias_KnightRhys.getReference().moveto(pRR302RhysMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Option A:
;The player convinces the Station Leader to order a fake patrol.

;Marshal the Patrol Team
SetStage(25)

;Start the patrol scene.
DN130RR302_DecoyPatrolScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Force Patrol NPCs into Aliases, clear Hold Positions, and remove them from the list of station guards.
;You no longer need to kill them in order to clear the station.
Actor a
int i = 0
While (i < Alias_BoSStationPatrolGroup.GetCount())
     a = Alias_BoSStationPatrolGroup.GetAt(i) as Actor
     a.SetLinkedRef(None, DMP_Combat_HoldPosition_256)
     (Alias_BoSStationTeam as DefaultCounterAliasColIncOnDeathA).Increment(a)
     i = i + 1
EndWhile
Alias_BoSStationPatrolMember01.ForceRefTo(Alias_BoSStationPatrolGroup.GetAt(0))
Alias_BoSStationPatrolMember02.ForceRefTo(Alias_BoSStationPatrolGroup.GetAt(1))
Alias_BoSStationPatrolMember03.ForceRefTo(Alias_BoSStationPatrolGroup.GetAt(2))
Alias_BoSStationPatrolMember04.ForceRefTo(Alias_BoSStationPatrolGroup.GetAt(3))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Option B:
;Player has chosen to double-cross the Railroad. The Patrol team heads out to kill them.

;Marshal the Patrol Team
SetStage(25)

;Start the patrol scene.
DN130RR302_KillerPatrolScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;Option C:
;Player disables or converts the turrets. Remove them from the RefCollection and increment.
int i = 0
Actor a
While (i < Alias_BoSStationTeam.GetCount())
     a = Alias_BoSStationTeam.GetAt(i) as Actor
     if (a.IsUnconscious() || !a.IsInFaction(BrotherhoodOfSteelFaction))
          (Alias_BoSStationTeam as DefaultCounterAliasColIncOnDeathA).Increment(a)
     Else
          i = i + 1
     EndIf
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Player shoots any BoS soldier or turret.

;Railroad team should move in if they haven't already.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
;Player has killed all but (3) BoS Soldiers or hostile turrets.
;Notify RR302 to display objective markers to the remaining enemies.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
;Player has killed all BoS Soldiers and hostile turrets.
;Notify RR302 that the initial combat has ended.
RR302.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Start Vertibird Assault
Alias_BoSVertibirdAssault_Vertibird.getReference().enable()
Alias_BoSVertibirdAssault_Pilot.getReference().enable()
Alias_BoSVertibirdAssault_Gunner.getReference().enable()
;Alias_BoSVertibirdAssault_Pilot.getReference().moveto(Alias_BoSVertibirdAssault_Vertibird.getReference())
;Alias_BoSVertibirdAssault_Gunner.getReference().moveto(Alias_BoSVertibirdAssault_Vertibird.getReference())
Alias_BoSVertibirdAssault_Soldier01.getReference().enable()
Alias_BoSVertibirdAssault_Soldier02.getReference().enable()
pDN130_RR302_VertibirdDropoff.start()
;pDN130_RR302VertibirdToPoliceStation.start()

; Get all the bad guys into a Reference Alias for RR302 (objective targets)
pVertibirdReinforcements.AddRef(Alias_BoSVertibirdAssault_Vertibird.getReference())
pVertibirdReinforcements.AddRef(Alias_BoSVertibirdAssault_Pilot.getReference())
pVertibirdReinforcements.AddRef(Alias_BoSVertibirdAssault_Gunner.getReference())
pVertibirdReinforcements.AddRef(Alias_BoSVertibirdAssault_Soldier01.getReference())
pVertibirdReinforcements.AddRef(Alias_BoSVertibirdAssault_Soldier02.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
;Player has killed all but (3) BoS Assault Team soldiers.
;Notify RR302 to display objective markers to the remaining soldiers.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
;Flag the location as cleared.
Alias_CambridgePDLocation.GetLocation().SetCleared()

;Player has killed all BoS Assault Team soldiers.
;Notify RR302 that the assault combat has ended.
RR302.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Set the Police Station to its post-RR302 state.
DN130.SetStage(90)

;If Clarke was still in the Cambridge PD Jail, disable him.
if (pBoSM02Postquest.GetStageDone(40))
     pBoSM02Postquest.SetStage(50)
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN130_RR302_Start_Enable Auto Const

Quest Property DN130 Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS100Fight Auto Const

ObjectReference Property RR302StationLeaderStartMarker Auto Const

ReferenceAlias Property Alias_BoSAssaultLeader Auto Const

ReferenceAlias Property Alias_BoSStationLeader Auto Const

RefCollectionAlias Property Alias_Turrets Auto Const

Quest Property RR302 Auto Const

ObjectReference Property RR302AssaultLeaderStartMarker Auto Const

ReferenceAlias Property Alias_Rhys Auto Const

ReferenceAlias Property Alias_Haylen Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

ObjectReference Property DN130_Agent001WarpMarker Auto Const

ObjectReference Property DN130_Agent002WarpMarker Auto Const

ObjectReference Property DN130_Agent003WarpMarker Auto Const

ObjectReference Property DN130_TinkerTomWarpMarker Auto Const

ObjectReference Property DN130_GloryWarpMarker Auto Const

ReferenceAlias Property Alias_Glory Auto Const

ReferenceAlias Property Alias_TinkerTom Auto Const

ReferenceAlias Property Alias_Agent001 Auto Const

ReferenceAlias Property Alias_Agent002 Auto Const

ReferenceAlias Property Alias_Agent003 Auto Const

Quest Property BoS101 Auto Const

ReferenceAlias Property Alias_BoSPaladinDanse Auto Const

RefCollectionAlias Property Alias_Agents Auto Const

RefCollectionAlias Property Alias_BoSStationTeam Auto Const

RefCollectionAlias Property Alias_BoSStationPatrolGroup Auto Const

Keyword Property DMP_Combat_HoldPosition_256 Auto Const

ReferenceAlias Property Alias_BoSStationPatrolMember01 Auto Const

ReferenceAlias Property Alias_BoSStationPatrolMember02 Auto Const

ReferenceAlias Property Alias_BoSStationPatrolMember04 Auto Const

ReferenceAlias Property Alias_BoSStationPatrolMember03 Auto Const

Scene Property DN130RR302_DecoyPatrolScene Auto Const

Scene Property DN130RR302_KillerPatrolScene Auto Const

RefCollectionAlias Property Alias_BoSAssaultTeam Auto Const

ReferenceAlias Property Alias_BoSVertibirdAssault_Vertibird Auto Const

ReferenceAlias Property Alias_BoSVertibirdAssault_Pilot Auto Const

ReferenceAlias Property Alias_BoSVertibirdAssault_Gunner Auto Const

Scene Property pDN130_RR302_VertibirdDropoff Auto Const

ReferenceAlias Property Alias_BoSVertibirdAssault_Soldier01 Auto Const

ReferenceAlias Property Alias_BoSVertibirdAssault_Soldier02 Auto Const

Quest Property pBoSM02Postquest Auto Const

RefCollectionAlias Property pVertibirdReinforcements Auto Const

Scene Property pDN130_RR302VertibirdToPoliceStation Auto Const

LocationAlias Property Alias_CambridgePDLocation Auto Const

Quest Property pBoSMarshal Auto Const

ObjectReference Property pRR302HaylenMarker Auto Const

ObjectReference Property pRR302RhysMarker Auto Const

ReferenceAlias Property Alias_ScribeHaylen Auto Const

ReferenceAlias Property Alias_KnightRhys Auto Const
