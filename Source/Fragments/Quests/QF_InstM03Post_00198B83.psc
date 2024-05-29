;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstM03Post_00198B83 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set when the player changes location, and the old and new locations are not InstituteLocation.
;Used as a condition for the rancdom encounter "RECampKMK_InstM03"
;Note that this random encounter will move Higgs and Loken out of the Institute

;Disable Higgs and Loken if the player had them exiled or executed

if InstM03.GetStageDone(80) || InstM03.GetStageDone(82)
    InstituteHiggsLokenEnableRef.Disable()
endif

;Disable the four synth guards from InstM03
Alias_SynthGuardEnableParent.GetReference().disable()

;Move the generic BioScience scientists back to BioScience
Alias_GenericScientistMale.GetActorRef().MoveTo(InstituteBioSciReturn1)
Alias_GenericScientistFemale.GetActorRef().MoveTo(InstituteBioSciReturn2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Disable synth guard hallway 1 (set when this actor unloads)
Alias_SynthGuardHallway01.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Disable synth guard hallway 1 (set when this actor unloads)
Alias_SynthGuardHallway02.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
;Disable synth guard hallway 1 (set when this actor unloads)
Alias_SynthGuardBioScience01.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
;Disable synth guard hallway 1 (set when this actor unloads)
Alias_SynthGuardBioScience02.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property InstM03 Auto Const

ReferenceAlias Property Alias_Lawrence Auto Const

ReferenceAlias Property Alias_Max Auto Const

ObjectReference Property InstituteScientistMaleBioSciRef Auto Const

ObjectReference Property InstituteScientistFemaleBioSciRef Auto Const

ReferenceAlias Property Alias_SynthGuardEnableParent Auto Const

ReferenceAlias Property Alias_GenericScientistMale Auto Const

ReferenceAlias Property Alias_GenericScientistFemale Auto Const

ObjectReference Property InstituteBioSciReturn1 Auto Const

ObjectReference Property InstituteBioSciReturn2 Auto Const

ObjectReference Property InstituteHiggsLokenEnableRef Auto Const Mandatory

ReferenceAlias Property Alias_SynthGuardHallway01 Auto Const Mandatory

ReferenceAlias Property Alias_SynthGuardHallway02 Auto Const Mandatory

ReferenceAlias Property Alias_SynthGuardBioScience01 Auto Const Mandatory

ReferenceAlias Property Alias_SynthGuardBioScience02 Auto Const Mandatory
