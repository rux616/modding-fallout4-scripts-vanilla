;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN017_00080834 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set during BoS101, when Danse's escort to Arcjet begins.

;Reset the dungeon.
ArcjetSystemsExt.Reset()
ArcjetSystems01.Reset()
ArcjetSystems02.Reset()

;Swap from the prequest to the quest states.
DN017_Quest_Disable.Disable()
DN017_Quest_Enable.Enable()

;Update follower commentary markers to avoid conflicts with Danse's dialogue.
DN017_FollowerCommentaryBunker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Give the player the lab terminal password.
if (Alias_PrototypeLabPassword.GetReference() != None)
     Game.GetPlayer().AddItem(Alias_PrototypeLabPassword.GetReference())
Else
     Game.GetPlayer().AddItem(DN017_PrototypeLabPassword)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Player opens the door to the Prototype Lab, triggering Synth ambush.

;Enable test lab lighting.
DN017_TestLabLightingEnable.Enable()
DN017_TestLabLightingDisable.Disable()

;Enable the synth runners.
DN017_LabSynthRunners.Enable()

;Clear the quest item flag on the password.
Alias_PrototypeLabPassword.Clear()

;Notify BoS101 to have Danse catch up to the player if he's fallen behind.
BoS101.SetStage(135)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
;BoS101 - Trigger Danse's Synth Ambush scene.
BoS101.SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Turret Hall Sequence
;Player has entered the Turret Hall (set by BoS101)

;Danse begins his attack run. Move to position 1 to take out the first turret.
Alias_Danse.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
;Turret Hall Sequence
;First turret destroyed.

;Move to position 2 to take out the second turret.
Alias_Danse.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN CODE
;Turret Hall Sequence
;Second turret destroyed.

;Move to position 3 to take out the third turret.
Alias_Danse.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0063_Item_00
Function Fragment_Stage_0063_Item_00()
;BEGIN CODE
;Turret Hall Sequence
;Third turret destroyed.

;Move to position 4 to take out the fourth turret.
Alias_Danse.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0064_Item_00
Function Fragment_Stage_0064_Item_00()
;BEGIN CODE
;Turret Hall Sequence
;Fourth turret destroyed.

;Release Danse from the Turret Hall special packages.
;Set when all four turrets destroyed, or the player hits the bypass trigger.
Alias_Danse.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;Turret Hall Sequence
;Set when all of the Turrets and all of the Synths in the Turret Hall are dead.
BoS101.SetStage(190)
Alias_Danse.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE dn017questscript
Quest __temp = self as Quest
dn017questscript kmyQuest = __temp as dn017questscript
;END AUTOCAST
;BEGIN CODE
;Player restarts the Aux Generator in the Engine Core Facilities Room.
kmyQuest.RestartGenerator()

;BoS101 - Complete the objective to restart the generator.
BoS101.SetStage(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN AUTOCAST TYPE dn017questscript
Quest __temp = self as Quest
dn017questscript kmyQuest = __temp as dn017questscript
;END AUTOCAST
;BEGIN CODE
;Player exits the Generator Room. Finish restoring power to the Engine Core.
kmyquest.ExitGeneratorRoom()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0086_Item_00
Function Fragment_Stage_0086_Item_00()
;BEGIN AUTOCAST TYPE dn017questscript
Quest __temp = self as Quest
dn017questscript kmyQuest = __temp as dn017questscript
;END AUTOCAST
;BEGIN CODE
;Begin the synth assault when power is restored.
kmyQuest.StartAssaultEncounter()

;Enable the rocket helper collision to keep the jumping synths from getting stuck.
DN017_RocketHelperCollision.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0087_Item_00
Function Fragment_Stage_0087_Item_00()
;BEGIN AUTOCAST TYPE dn017questscript
Quest __temp = self as Quest
dn017questscript kmyQuest = __temp as dn017questscript
;END AUTOCAST
;BEGIN CODE
;When the player returns to the main chamber, if the assault is still running,
;make the respawns finite to allow the player to complete it.
kmyQuest.EngageAssaultEncounter()
BoS101CallForHelp.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0088_Item_00
Function Fragment_Stage_0088_Item_00()
;BEGIN AUTOCAST TYPE dn017questscript
Quest __temp = self as Quest
dn017questscript kmyQuest = __temp as dn017questscript
;END AUTOCAST
;BEGIN CODE
;Stop the assault encounter.
kmyQuest.StopAssaultEncounter()

;Disable the rocket helper collision.
DN017_RocketHelperCollision.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0089_Item_00
Function Fragment_Stage_0089_Item_00()
;BEGIN AUTOCAST TYPE dn017questscript
Quest __temp = self as Quest
dn017questscript kmyQuest = __temp as dn017questscript
;END AUTOCAST
;BEGIN CODE
;BoS101 - If the Synth assault is complete and the rocket is not currently firing, allow Danse
;to proceed.
if (kMyQuest.assaultEncounterDoneBeforeRocket)
     BoS101.SetStage(290)
     kMyQuest.UpdateElevatorLoadDoors(True)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN AUTOCAST TYPE dn017questscript
Quest __temp = self as Quest
dn017questscript kmyQuest = __temp as dn017questscript
;END AUTOCAST
;BEGIN CODE
;When the player enters the Control Room, if the synth assault is still
;ongoing (the player just ignored it), stop it as quickly as possible.
SetStage(88)
kmyQuest.ForcekillAssaultEncounter()

;Make absolutely sure Danse's invlunerability perk was removed.
Alias_Danse.GetActorRef().RemovePerk(DN017_DanseSynthInvulnerabilityPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
BoS101.SetStage(302)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Dungeon is now cleared.
Alias_ArcjetSystemsLocation.GetLocation().SetCleared()

;BoS101 - Danse directs the player to the boss' body for the transmitter.
BoS101.SetStage(305)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Unlock the door between ArcjetSystems01 & 02 when BoS101 is finished.
;(BoS101 locks it when power is restored to prevent a variety of issues with Danse's packages.)
BoS101LoadDoorRef.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property Alias_Danse Auto Const
ReferenceAlias Property Alias_AssaultSynth01 Auto Const
ReferenceAlias Property Alias_AssaultSynth02 Auto Const
ReferenceAlias Property Alias_AssaultSynth03 Auto Const
ReferenceAlias Property Alias_AssaultSynth04 Auto Const
ReferenceAlias Property Alias_AssaultSynth05 Auto Const
ReferenceAlias Property Alias_AssaultSynth06 Auto Const

LocationAlias Property Alias_ArcjetSystemsLocation Auto Const

ObjectReference Property DN017_TestLabLightingEnable Auto Const
ObjectReference Property DN017_TestLabLightingDisable Auto Const

ObjectReference Property DN017_Quest_Enable Auto Const
ObjectReference Property DN017_Quest_Disable Auto Const

Quest Property BoS101 Auto Const
Quest Property BoS101ArcJet Auto Const

Cell Property ArcjetSystemsExt Auto Const
Cell Property ArcjetSystems01 Auto Const
Cell Property ArcjetSystems02 Auto Const


ObjectReference Property DN017_LabSynthRunners Auto Const

Key Property DN017_PrototypeLabPassword Auto Const

ObjectReference Property DN017_FollowerCommentaryBunker Auto Const

Scene Property BoS101ArcJetComputerScene00 Auto Const
Scene Property BoS101ArcJetComputerScene01a Auto Const
Scene Property BoS101ArcJetComputerScene01b Auto Const
Scene Property BoS101ArcJetComputerScene02 Auto Const
Scene Property BoS101ArcJetComputerScene03 Auto Const
Scene Property BoS101ArcJetComputerScene04 Auto Const
Scene Property BoS101ArcJetComputerScene05 Auto Const

ObjectReference Property DN017_Char_EmbersOff Auto Const

ObjectReference Property DN017_Char_EmbersOn Auto Const

GlobalVariable Property BoS101CallForHelp Auto Const

ReferenceAlias Property Alias_PrototypeLabPassword Auto Const Mandatory

ObjectReference Property DN017_RocketHelperCollision Auto Const Mandatory

ObjectReference Property BoS101LoadDoorRef Auto Const Mandatory

Perk Property DN017_DanseSynthInvulnerabilityPerk Auto Const Mandatory
