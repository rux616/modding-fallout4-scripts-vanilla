;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN130_RR302_01001BB1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;This quest is started by RR302 to manage events specific to that quest.

;INITIAL SETUP:
; - Update the Police Station's state.
DN130.SetStage(60)

; - Move the Station Leader (usually Haylen) into position and enable.
Actor BoSStationLeader = (Alias_BoSStationLeader.GetActorRef())
BoSStationLeader.MoveTo(RR302StationLeaderStartMarker)
BoSStationLeader.Enable()

;- Move the Assault Leader (usually Rhys) into position and disable.
Actor BoSAssaultLeader = (Alias_BoSAssaultLeader.GetActorRef())
BoSAssaultLeader.MoveTo(RR302StationLeaderStartMarker)
BoSAssaultLeader.Disable()

;Enable the BoS Guards and Turrets for the fight.
int i = 0
int count = Alias_BoSGuards_Exterior_GuardTeam.GetCount()
While (i < count)
     Alias_BoSGuards_Exterior_GuardTeam.GetAt(i).Enable()
EndWhile
i = 0
count = Alias_BoSGuards_Interior_GuardTeam.GetCount()
While (i < count)
     Alias_BoSGuards_Interior_GuardTeam.GetAt(i).Enable()
EndWhile
i = 0
count = Alias_BoSGuards_Interior_PatrolTeam.GetCount()
While (i < count)
     Alias_BoSGuards_Interior_PatrolTeam.GetAt(i).Enable()
EndWhile
i = 0
count = Alias_Turrets.GetCount()
While (i < count)
     Alias_Turrets.GetAt(i).Enable()
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Player has weakened the Police Station's defenses, either by subverting the Turrets
;or luring away some soldiers on a patrol.

;Notify RR302 to update its objective.
RR302.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Flag stage set by DN130-RR302 quest script when turrets are disabled.

;Set Stage 20, since player has weakened the station's defenses.
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
;Flag stage set by DN130-RR302 quest script when turrets have been converted.

;Set Stage 20, since player has weakened the station's defenses.
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
;Stage set when the player convinces the Station Leader to order a patrol.

;Set Stage 20, since player has weakened the station's defenses.
SetStage(20)

;Start the patrol.
;Force patrollers into Aliases.
Alias_PatrolTeamAlias01.ForceRefTo(Alias_BoSGuards_Interior_PatrolTeam.GetAt(0))
Alias_PatrolTeamAlias02.ForceRefTo(Alias_BoSGuards_Interior_PatrolTeam.GetAt(1))
Alias_PatrolTeamAlias03.ForceRefTo(Alias_BoSGuards_Interior_PatrolTeam.GetAt(2))
Alias_PatrolTeamAlias04.ForceRefTo(Alias_BoSGuards_Interior_PatrolTeam.GetAt(3))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Start Reinforcements
;Alias_Rhys.GetActorRef().Enable()
;int count = Alias_BoSGuards_Exterior_AssaultTeam.GetCount()
;int i = 0
;While (i < count)
;     Alias_BoSGuards_Exterior_AssaultTeam.GetAt(i).Enable()
;EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN130_RR302_Start_Enable Auto Const

RefCollectionAlias Property Alias_BoSGuards_Interior_GuardTeam Auto Const

RefCollectionAlias Property Alias_BoSGuards_Interior_PatrolTeam Auto Const

RefCollectionAlias Property Alias_BoSGuards_Exterior_GuardTeam Auto Const

RefCollectionAlias Property Alias_BosGuards_Exterior_AssaultTeam Auto Const

Quest Property DN130 Auto Const

ObjectReference Property RR302StationLeaderStartMarker Auto Const

ReferenceAlias Property Alias_BoSAssaultLeader Auto Const

ReferenceAlias Property Alias_BoSStationLeader Auto Const

RefCollectionAlias Property Alias_Turrets Auto Const

Quest Property RR302 Auto Const

ReferenceAlias Property Alias_PatrolTeamAlias01 Auto Const

ReferenceAlias Property Alias_PatrolTeamAlias02 Auto Const

ReferenceAlias Property Alias_PatrolTeamAlias03 Auto Const

ReferenceAlias Property Alias_PatrolTeamAlias04 Auto Const
