;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS00Fight_0100700E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Move the player to the fight.
Game.GetPlayer().MoveTo(BoS00FightStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;FOR AL: Set this stage to safely bypass BoS00Fight (in console, Stage 0s for other BoS quests, etc.)


;Setting this stage starts the quest, automatically setting Stage 10.

;Store off refs.
Actor Danse = Alias_Danse.GetActorRef()
Actor Haylen = Alias_Haylen.GetActorRef()
Actor Rhys = Alias_Rhys.GetActorRef()
Actor Ghoul01 = Alias_Ghoul01.GetActorRef()
Actor Ghoul02 = Alias_Ghoul02.GetActorRef()
Actor Ghoul03 = Alias_Ghoul03.GetActorRef()
Actor Ghoul04 = Alias_Ghoul04.GetActorRef()

;Kill and disable all Ghouls.
SetStage(90) ;Stop respawning.
Ghoul01.Kill()
Ghoul02.Kill()
Ghoul03.Kill()
Ghoul04.Kill()
Ghoul01.Disable()
Ghoul02.Disable()
Ghoul03.Disable()
Ghoul04.Disable()

;Move Danse, Haylen, and Rhys back to their starting positions. Enable Haylen & Rhys.
Danse.MoveTo(BoS00DanseSceneStartMarker)
Haylen.MoveTo(BoS00HaylenSceneStartMarker)
Rhys.MoveTo(BoS00RhysSceneStartMarker)
Haylen.Enable()
Rhys.Enable()

;Stop the quest.
;The shutdown stage takes care of removing the Ghoul Invulnerability Perk from Danse.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Start off the fight. Initially, Danse is invulnerable and the Ghouls are endless, preventing either
;side from winning until the player gets close enough to see what's going on.

;Store off refs.
Actor Danse = Alias_Danse.GetActorRef()
Actor Haylen = Alias_Haylen.GetActorRef()
Actor Rhys = Alias_Rhys.GetActorRef()

;Move Danse into position.
Danse.MoveTo(BoS00Fight_DanseStartMarker)

;Make Danse invulnerable to the Ghouls (for now).
Danse.AddPerk(BoS00Fight_DanseInvulnerabilityPerk)

;Disable Rhys & Halen.
Rhys.Disable()
Haylen.Disable()

;Start Ghoul Assault - Automatic
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;At this stage, the player is potentially within viewing distance of the fight (~6000u).

;FOR AL: Maybe a one-line scene with Danse yelling something at the Ghouls? ("Die, you bastards!")
;At this range, it'd need an extended falloff radius.

;Ghoul respawns should no longer be infinite. Start tracking them.
((Self as Quest) as BoS100FightMonitor).StartFightMonitor()

;Danse should no longer be invulnerable to the Ghouls.
Alias_Danse.GetActorRef().RemovePerk(BoS00Fight_DanseInvulnerabilityPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;At this stage, the player within a reasonable distance of Danse (~3000u), usually in the parking lot.

;FOR AL: Maybe a one-line scene with Danse yelling for the player to help him?
;Maybe incorporate a Line of Sight check into the scene?
;Maybe pop an objective to help Danse?
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set by the quest script, <8> deaths after Stage 20 is set.

;FOR AL: Maybe a quick scene with Rhys and Haylen coming to Danse's aid?
;Maybe incorporate a Line of Sight and/or distance check?

;Store off refs.
Actor Danse = Alias_Danse.GetActorRef()
Actor Haylen = Alias_Haylen.GetActorRef()
Actor Rhys = Alias_Rhys.GetActorRef()

;Start Halen
Haylen.MoveTo(BoS00Fight_HaylenStartMarker)
Haylen.Enable()
Haylen.EvaluatePackage()

;Start Rhys
Rhys.MoveTo(BoS00Fight_RhysStartMarker)
Rhys.Enable()
Rhys.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Set by the quest script, <4> deaths after Stage 50 is set.
;To win the fight from here, you need only finish off the surviving Ghouls.

;FOR AL: Maybe a scene responding to the Ghouls' dwindling numbers ("We're almost there!", etc.).
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
;Set if the player shoots at least one Ghoul during the fight.
;Has no effect on BoS00Fight, but I assume it might affect the BoS00 Intro if
;the player just stood back and watched.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set when the fight is over and the Recon Team (Danse/Rhys/Halen) have all dropped out of combat.
;(so the player's not fighting them, they're not fighting ambient enemies, etc., etc.).
;It should be safe to move on to the BoS00 Intro Scene at this point.

;FOR AL: Handoff to the BoS00 Intro Scene.

;Stop this quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Make absolutely sure the Ghoul Invulnerability perk gets removed from Danse.
Alias_Danse.GetActorRef().RemovePerk(BoS00Fight_DanseInvulnerabilityPerk)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BoS00Fight_DanseStartMarker Auto Const

ObjectReference Property BoS00Fight_RhysStartMarker Auto Const

ObjectReference Property BoS00Fight_HaylenStartMarker Auto Const

ReferenceAlias Property Alias_Danse Auto Const

ReferenceAlias Property Alias_Haylen Auto Const

ReferenceAlias Property Alias_Rhys Auto Const

Perk Property BoS00Fight_DanseInvulnerabilityPerk Auto Const

ObjectReference Property BoS00FightInRangeTrigger Auto Const

ObjectReference Property BoS00RhysSceneStartMarker Auto Const

ObjectReference Property BoS00HaylenSceneStartMarker Auto Const

ObjectReference Property BoS00DanseSceneStartMarker Auto Const

ReferenceAlias Property Alias_Ghoul01 Auto Const

ReferenceAlias Property Alias_Ghoul02 Auto Const

ReferenceAlias Property Alias_Ghoul03 Auto Const

ReferenceAlias Property Alias_Ghoul04 Auto Const

ObjectReference Property BoS00FightStart Auto Const
