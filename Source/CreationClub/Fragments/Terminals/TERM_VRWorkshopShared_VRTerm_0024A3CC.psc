;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CreationClub:Fragments:Terminals:TERM_VRWorkshopShared_VRTerm_0024A3CC Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Release music to worldspace defaults
VRParentQuest.ClearMusic()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;commonwealth
VRParentQuest.OverrideMusic(VRWorkshopShared_MUSzExplore)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
;dungeon
VRParentQuest.OverrideMusic(VRWorkshopShared_MUSDungeonA)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
;coast
VRParentQuest.OverrideMusic(VRWorkshopShared_MUSzExploreCoast)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
;FO3 capital wasteland
VRParentQuest.OverrideMusic(VRWorkshopShared_MUSExploreCapitalWasteland)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
;sanctuary
VRParentQuest.OverrideMusic(VRWorkshopShared_MUSzExploreFoothillsSanctuary)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
;urban
VRParentQuest.OverrideMusic(VRWorkshopShared_MUSzExploreUrban)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
;FO3 Tranquility Lane
VRParentQuest.OverrideMusic(VRWorkshopShared_MUSTraquilityLaneType)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CreationClub:VRWorkshops:VRWorkshopParentScript Property VRParentQuest Auto Const Mandatory
MusicType Property VRWorkshopShared_MUSzExplore Auto Const Mandatory
MusicType Property VRWorkshopShared_MUSDungeonA Auto Const Mandatory
MusicType Property VRWorkshopShared_MUSExploreCapitalWasteland Auto Const Mandatory
MusicType Property VRWorkshopShared_MUSzExploreUrban Auto Const Mandatory
MusicType Property VRWorkshopShared_MUSzExploreGlowingSea Auto Const Mandatory
MusicType Property VRWorkshopShared_MUSzExploreCoast Auto Const Mandatory
MusicType Property VRWorkshopShared_MUSzExploreFoothillsSanctuary Auto Const Mandatory
MusicType Property VRWorkshopShared_MUSTraquilityLaneType Auto Const Mandatory
