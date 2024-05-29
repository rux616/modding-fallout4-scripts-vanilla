;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstituteSS4_001C6407 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Runs when the quest starts

;Move Allie Filmore and scientist to scene markers
AllieFilmoreRef.MoveTo(InstituteSS4FilmoreStand)
InstituteScientistFemale02Ref.MoveTo(InstituteSS4ScientistMarker)
Alias_Synth.GetActorRef().MoveTo(InstituteSS4SynthStand)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Start the scene (set when the player enters InstituteSS4SetStageTrigger)
InstituteSS4Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property InstituteSS3Scene Auto Const

Scene Property InstituteSS4Scene Auto Const

ObjectReference Property InstituteSS4FilmoreStand Auto Const

ObjectReference Property AllieFilmoreRef Auto Const

ObjectReference Property InstituteScientistFemale02Ref Auto Const

ObjectReference Property InstituteSS4ScientistMarker Auto Const

ObjectReference Property InstituteSS4SynthStand Auto Const Mandatory

ReferenceAlias Property Alias_synth Auto Const Mandatory
