;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN130_0006F08A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Set when the player is kicked out of the Brotherhood (at any point).

;Clear ownership on the Police Station so taking things is no longer theft.
CambridgePD01.SetFactionOwner(None)

;Call OnUnload on DN130_LoadUnloadMarker to see if now is a safe time to update
;the state of the Police Station. We don't want to do it if the player is there.
DN130_LoadUnloadMarker.OnUnload()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
;Set when the player is kicked out of the Brotherhood and the Police Station is not loaded.
;Update the state of the Police Station for Act II or III, as appropriate.

if (MQ206.GetStageDone(1200))
     ;Act III
     SetStage(60)
ElseIf (BoS201.GetStageDone(5))
     ;Act II
     SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
;Set if the player completes MQ302-MIN without first completing BoS100, then heads
;over to Cambridge PD and completes BoS100.
;
;This stage is referenced by DN130_CambridgePDUnloadCheck; it causes the Police Station to switch
;to its Act III state the next time the area unloads.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set after the initial BoS100 dialogue with Danse outside the police station. Just unlock the doors.
CambridgePDFrontDoor.Unlock()
CambridgePDRoofDoor.Unlock()

;Alternately, if the player kills Danse, BoS100Fight adds a key to his corpse, allowing
;the player to get in at this stage.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set during BoS101, when the player picks up the Deep Range Transmitter in Arcjet Systems.

;Set all prior stages to make this quickstart-safe.
SetStage(20)

;Open the garage door.
DN130_PDGarageDoor.SetOpenNoWait(True)

;Enable the Deep Range Transmitter on the roof.
BoS101DeepRangeTransmitterStaticRef.EnableNoWait()

;Update enable states.
DN130_30_ArcjetPostquestDisableMarker.DisableNoWait()
DN130_30_ArcjetPostquestEnableMarker.EnableNoWait()
DN130_30_ArcjetPostquestEnableTempMarker.Enable()

;Update follower commentary markers.
DN130_FortifiedCommentMarker.Enable()

;Stop BoS100Fight, which cleans up the ghouls.
BoS100Fight.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set midway through Act I, after the player completes a Radiant quest.

;Set all prior stages to make this quickstart-safe.
SetStage(30)

;Update enable states.
DN130_30_ArcjetPostquestEnableTempMarker.Disable()
DN130_40_ActIMidDisableMarker.DisableNoWait()
DN130_40_ActIMidEnableMarker.EnableNoWait()
DN130_40_ActIMidEnableTempMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set at the start of Act II, immediately after the Prydwen arrives.

;Set all prior stages to make this quickstart-safe.
SetStage(40)

;Update enable states.
DN130_40_ActIMidEnableTempMarker.Disable()
DN130_50_ActIIDisableMarker.DisableNoWait()
DN130_50_ActIIEnableMarker.EnableNoWait()
DN130_50_ActIIEnableTempMarker.Enable()

;Update commentary markers.
DN130_FortifiedCommentMarker.Disable()
DN130_CambridgePDUniqueCommentMarker.EnableNoWait()
DN130_FollowerCommentMessyMarker.DisableNoWait()
DN130_FollowerCommentCleanMarker.EnableNoWait()

;Update Lockup Terminal.
DN130_LockupTerminalRef_Normal.EnableNoWait()

;Move Haylen's holotape, since the table it was on just disabled.
if (!GetStageDone(16))
     Alias_BoSHolotapeHaylen.TryToDisable()
     Alias_BoSHolotapeHaylenAlt.TryToEnable()
EndIf

;Enable BoS Soldiers.
DN130_50_BoSSoliderEnableTempMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Set at the start of Act III, when the player teleports into the Institute.

;Set all prior stages to make this quickstart-safe.
SetStage(50)

;Update enable states.
DN130_50_ActIIEnableTempMarker.Disable()
DN130_60_ActIIIDisableMarker.DisableNoWait()
DN130_60_ActIIIEnableMarker.EnableNoWait()
DN130_60_ActIIIEnableTempMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Set when RR302 begins. Sets up the police station for the RR302 attack.

;Set prior stages to make this quickstart-safe.
SetStage(60)

;Update enable states.
DN130_60_ActIIIEnableTempMarker.Disable()
DN130_80_RR302DisableMarker.DisableNoWait()
DN130_80_RR302EnableMarker.EnableNoWait()
DN130_80_RR302EnableTempMarker.Enable()
RR302_GhoulDisableTempMarker.Disable()
RR302_GhoulEnableTempMarker.Enable()

;Update Lockup Terminal. (Handled on BoSM02Postquest)

;Swap the BoS soldiers.
DN130_50_BoSSoldiersEnableTempMarker.Disable()
DN130_80_RR302BoSSoldiersEnableTempMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Set when the player turns in RR302. Reoccupies the police station for the BoS.

;Set all prior stages to make this quickstart-safe.
SetStage(80)

;Update enable states.
DN130_80_RR302EnableTempMarker.Disable()
DN130_90_PostRR302DisableMarker.DisableNoWait()
DN130_90_PostRR302EnableMarker.EnableNoWait()
DN130_90_PostRR302EnableTempMarker.Enable()
RR302_GhoulEnableTempMarker.Disable()
RR302_GhoulDisableTempMarker.Enable()

;Swap the BoS soldiers.
DN130_50_BoSSoldiersEnableTempMarker.Enable()
DN130_80_RR302BoSSoldiersEnableTempMarker.Disable()

;Reset the Police Station encounter zone, to make sure the soldiers respawn.
CambridgePDZone.Reset()

;This is the final state, so we can shut down now.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RR302 Auto Const

ObjectReference property CambridgePDFrontDoor Auto Const
ObjectReference property CambridgePDRoofDoor Auto Const

ObjectReference property DN130_30_ArcjetPostquestDisableMarker Auto Const
ObjectReference property DN130_30_ArcjetPostquestEnableMarker Auto Const
ObjectReference property DN130_30_ArcjetPostquestEnableTempMarker Auto Const

ObjectReference property DN130_40_ActIMidDisableMarker Auto Const
ObjectReference property DN130_40_ActIMidEnableMarker Auto Const
ObjectReference property DN130_40_ActIMidEnableTempMarker Auto Const

ObjectReference property DN130_50_ActIIDisableMarker Auto Const
ObjectReference property DN130_50_ActIIEnableMarker Auto Const
ObjectReference property DN130_50_ActIIEnableTempMarker Auto Const

ObjectReference property DN130_50_BoSSoliderEnableTempMarker Auto Const

ObjectReference property DN130_60_ActIIIDisableMarker Auto Const
ObjectReference property DN130_60_ActIIIEnableMarker Auto Const
ObjectReference property DN130_60_ActIIIEnableTempMarker Auto Const

ObjectReference property DN130_80_RR302DisableMarker Auto Const
ObjectReference property DN130_80_RR302EnableMarker Auto Const
ObjectReference property DN130_80_RR302EnableTempMarker Auto Const
ObjectReference property DN130_80_RR302BoSSoldiersEnableTempMarker Auto Const

ObjectReference property DN130_90_PostRR302DisableMarker Auto Const
ObjectReference property DN130_90_PostRR302EnableMarker Auto Const
ObjectReference property DN130_90_PostRR302EnableTempMarker Auto Const

GlobalVariable Property PlayerBoS_KickedOut Auto Const

EncounterZone Property CambridgePDZone Auto Const

Quest Property BoS100Fight Auto Const

Default2StateActivator Property DN130_PDGarageDoor Auto Const

ObjectReference Property RR302_GhoulDisableTempMarker Auto Const

ObjectReference Property RR302_GhoulEnableTempMarker Auto Const

ObjectReference Property DN130_FortifiedCommentMarker Auto Const

ObjectReference Property DN130_FollowerCommentMessyMarker Auto Const

ObjectReference Property DN130_FollowerCommentCleanMarker Auto Const

ObjectReference Property DN130_CambridgePDUniqueCommentMarker Auto Const

ObjectReference Property BoS101DeepRangeTransmitterStaticRef Auto Const

Cell Property CambridgePD01 Auto Const

ObjectReference Property DN130_LoadUnloadMarker Auto Const

Quest Property BoS201 Auto Const

Quest Property MQ206 Auto Const

ObjectReference Property DN130_50_BoSSoldiersEnableTempMarker Auto Const

ObjectReference Property DN130_LockupTerminalRef_Normal Auto Const

ObjectReference Property DN130_LockupTerminalRef_RR302Clarke Auto Const

Quest Property BoSM02Postquest Auto Const

ObjectReference Property DN130_HaylenHolotapeMovedMarker Auto Const Mandatory

ReferenceAlias Property Alias_BoSHolotapeHaylen Auto Const Mandatory

ReferenceAlias Property Alias_BoSHolotapeHaylenAlt Auto Const Mandatory
