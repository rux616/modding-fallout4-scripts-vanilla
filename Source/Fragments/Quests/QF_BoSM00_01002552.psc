;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM00_01002552 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;BoSM00 normally starts during BoS201, after Maxson's speech. Quickstart to the end of BoS201.
BoS201.SetStage(0)
BoS201.SetStage(255)

;Move the player and Danse to the bridge.
Alias_BoSPaladinDanse.TryToMoveTo(BoSMQuickstartMarker)
Game.GetPlayer().MoveTo(BoSMQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;When this starts up, queue up BoSM01 as the first available misc quest.

;If BoSM01 is still active, re-enable its dialogue. Kells now takes over as the questgiver.
if (BoSM01.IsRunning())
     BoSM01.EnableBoSM01Act2()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoS201 Auto Const

ReferenceAlias Property Alias_BoSCaptainKellsRef Auto Const

ReferenceAlias Property Alias_BoSPaladinDanse Auto Const

ObjectReference Property BoSMQuickstartMarker Auto Const

BoSM01QuestScript Property BoSM01 Auto Const
