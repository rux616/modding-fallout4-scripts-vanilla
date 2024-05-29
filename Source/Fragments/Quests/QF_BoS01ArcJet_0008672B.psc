;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS01ArcJet_0008672B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if (BoS101.IsRunning() && DN017.assaultEncounterDoneBeforeRocket)
     BoS101SceneRocketFirePost.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BoS01ArcJetStage20 Auto Const

Scene Property BoS01ArcJetStage30 Auto Const

Scene Property BoS01ArcJetStage40 Auto Const

Scene Property BoS01ArcJetStage50 Auto Const

Scene Property BoS01ArcJetStage60 Auto Const

Scene Property BoS01ArcJetStage70 Auto Const

Quest Property BoS01 Auto Const

Scene Property BoS101ArcJetStage15 Auto Const

Scene Property BoS101ArcJetDansePuzzleScene01 Auto Const

Scene Property BoS101ArcJetDansePuzzleScene02 Auto Const

Scene Property BoS101ArcJetStage53 Auto Const

Scene Property BoS101Stage085 Auto Const

ReferenceAlias Property Alias_BoS101ArcJetDanse Auto Const

ObjectReference Property BoS101BunkerTeleportMarker Auto Const

Armor Property ArmorPoweredFrame Auto Const

ObjectMod Property PA_T60_Helmet Auto Const

Scene Property BoS101ArcJetAmbushRoomShout Auto Const

Scene Property BoS101ArcJetControlRoomShout Auto Const

GlobalVariable Property BoS101CellOverride Auto Const

Scene Property BoS101SceneAfterFight Auto Const

dn017questscript Property DN017 Auto Const

Quest Property BoS101 Auto Const

Scene Property BoS101SceneRocketFirePost Auto Const
