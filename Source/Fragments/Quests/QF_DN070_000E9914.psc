;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN070_000E9914 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(DN070_TreasuresEntry)
SetStage(20)
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;When the boss is killed, change the Map Marker Heading Ref to a marker closer to the workshop.
JamaicaPlainMapMarkerRef.SetLinkedRef(JamaicaPlainMapMarkerHeadingRefAlt)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Player reads a flyer in the Commonwealth, listens to Hadrian's Holotape, etc.
;Display 'Find the Treasures of Jamaica Plain', pointing to Carl.
JamaicaPlainMapMarkerRef.AddToMap()
if (!GetStageDone(100))
     SetObjectiveDisplayed(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Update 'Find the Treasures of Jamaica Plain' to point to the Treasure Door Button,
;re-displaying it if the player already had the objective.
if (!GetStageDone(100))
     SetObjectiveDisplayed(20, True, True)
EndIf

;If Stage 20 hasn't been set already, set it to make sure anything with Stage 20
;as a prerequisite will work.
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;The player clearly also knows about the basement...
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Play the Turret Hall Intro Scene
DN070_TurretHallIntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;If the player tries to hack into the Access Door Terminal, quest DN070_HackComputer
;sets this stage (regardless of success) to trigger the Protectron fight.

;Delay a bit. This takes advantage of time being paused in terminal mode
;to make sure the scene only triggers after the player exits the terminal.
Utility.Wait(0.5)

;Play the stinger music.
DN070_SecurityMusicStinger.Activate(DN070_SecurityMusicStinger)

;Play the 'Hacking Detected' scene.
DN070_HackingDetectedScene.Start()

;Set the two Protectrons conscious, activating their Klaxons.
int i = 0
Actor a
While (i < Alias_DN070_TreasureHallProtectrons.GetCount())
     a = Alias_DN070_TreasureHallProtectrons.GetAt(i) as Actor
     a.SetValue(ProtectronPodStatus, 1)
     (a.GetLinkedRef(LinkCustom01) as GlowingKlaxonLightScript).PlayLights()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN CODE
;The 'Hacking Detected' scene will set this stage to trigger the Protectron fight.
int i = 0
Actor a
While (i < Alias_DN070_TreasureHallProtectrons.GetCount())
     a = Alias_DN070_TreasureHallProtectrons.GetAt(i) as Actor
     if (a.GetValue(ProtectronPodStatus) > 0)
          ;a.SetValue(ProtectronPodStatus, 1)
          a.SetValue(Aggression, 2)
          a.SetUnconscious(False)
          a.EvaluatePackage()
     EndIf
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;The player has used the Treasures security terminal to open the Treasures Hall door.
;When the door finishes opening, it sets this stage to enable the lights.

;Disable the music trigger in the turret hall if the player hasn't hit it yet.
DN070_TurretHallMusicTrigger.DisableNoWait()

;Play the reveal music if the player hasn't tripped the security system.
if (!GetStageDone(90))
     DN070_SecurityMusicReveal.Activate(DN070_SecurityMusicReveal)
EndIf

;Delay a bit.
Utility.Wait(2)

;Play the power on sfx.
QSTArcJetLightsOnA.Play(DN070_TreasuresHall_Lights1)

;Enable the lights.
DN070_TreasuresHall_Enable.Enable()
DN070_TreasuresHall_Disable.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Complete 'Find the Treasures of Jamaica Plain' when the player presses the Treasures button.
SetObjectiveCompleted(20)
CompleteQuest()

;Shut off the Turret Hall Follower Comment, since the player has seen the treasure.
AO_Comment_Unique_JamaicaPlainLaserHall.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
;The player has pressed the button to open the Treasures door.
;When the door finishes opening, it sets this stage to enable the lights.

;Delay a bit.
Utility.Wait(0.5)

;Enable the first set of lights.
QSTArcJetLightsOnA.Play(DN070_Treasures_Lights1)
DN070_Treasures_Enable1.Enable(False)
Utility.Wait(0.5)
DN070_Treasures_Disable1.DisableNoWait(False)

;Delay a bit.
Utility.Wait(0.5)

;Enable the second set of lights.
QSTArcJetLightsOnA.Play(DN070_Treasures_Lights2)
DN070_Treasures_Enable2.Enable(False)
Utility.Wait(0.5)
DN070_Treasures_Disable2.DisableNoWait(False)

;Delay a bit.
Utility.Wait(0.5)

;Play some music.
DN070_BattleHymnMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Stop the music. Stopping the scene doesn't work, so disable the transmitter instead.
DN070_BattleHymnMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property QSTArcJetLightsOnA Auto Const

ObjectReference Property DN070_TreasuresHall_Lights1 Auto Const

ObjectReference Property DN070_TreasuresHall_Enable Auto Const

ObjectReference Property DN070_TreasuresHall_Disable Auto Const

ObjectReference Property DN070_Treasures_Lights2 Auto Const

ObjectReference Property DN070_Treasures_Enable1 Auto Const

ObjectReference Property DN070_Treasures_Enable2 Auto Const

ObjectReference Property DN070_Treasures_Disable1 Auto Const

ObjectReference Property DN070_Treasures_Disable2 Auto Const

ObjectReference Property DN070_Treasures_Lights1 Auto Const

ActorValue Property ProtectronPodStatus Auto Const

ActorValue Property Aggression Auto Const

Scene Property DN070_HackingDetectedScene Auto Const

RefCollectionAlias Property Alias_DN070_TreasureHallProtectrons Auto Const

ObjectReference Property AO_Comment_Unique_JamaicaPlainLaserHall Auto Const


Scene Property DN070_TreasuresScene Auto Const

Scene Property DN070_SecurityScene Auto Const

Scene Property DN070_TurretHallIntroScene Auto Const

ObjectReference Property DN070_JamaicaPlainTreasuresRadioRef Auto Const

ObjectReference Property DN070_BattleHymnMarker Auto Const

ObjectReference Property DN070_TreasuresEntry Auto Const

Keyword Property LinkCustom01 Auto Const

ObjectReference Property JamaicaPlainMapMarkerRef Auto Const

ObjectReference Property DN070_TurretHallMusicTrigger Auto Const

ObjectReference Property DN070_SecurityMusicStinger Auto Const

ObjectReference Property DN070_SecurityMusicReveal Auto Const

MusicType Property MUSRewardShort Auto Const

ObjectReference Property JamaicaPlainMapMarkerHeadingRefAlt Auto Const Mandatory
