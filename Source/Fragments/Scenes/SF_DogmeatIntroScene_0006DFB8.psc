;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DogmeatIntroScene_0006DFB8 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
debug.trace("Dogmeat Intro Scene Start start for real start")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
debug.trace("Dogmeat: Intro Scene Phase 1")
(dogmeatRefAlias.getActorRef() as DogmeatActorScript).makeDogmeatSniffy(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
debug.trace("Dogmeat Intro: Phase 1 done")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
getOwningQuest().SetObjectiveDisplayed(50, 1) ; remove for now per Todd suggestion.

; Trigger Playful Anim Archetype
DogmeatRefAlias.GetActorReference().SetDogAnimArchetypePlayful()

if dogmeatrefalias.getactorref().is3dloaded()
   dogmeatrefalias.getActorRef().setAnimationVariableInt("iMinTicksWalk",3)
   dogmeatrefalias.getActorRef().setAnimationVariableInt("iMaxTicksWalk",10)
   dogmeatrefalias.getActorRef().setAnimationVariableInt("iMinTicksWalkFlavor",1)
   dogmeatrefalias.getActorRef().setAnimationVariableInt("iMaxTicksWalkFlavor",5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
debug.trace("Dogmeat Intro: Phase 3 done")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
; Trigger Alert Anim Archetype
DogmeatRefAlias.GetActorReference().SetDogAnimArchetypeAlert()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
debug.trace("Dogmeat Intro: Phase 4 done")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property dogmeatRefAlias Auto Const

Keyword Property LinkCustom01 Auto Const

ObjectReference Property MoleratActivateMarker Auto Const

ReferenceAlias Property RRMolerat01 Auto Const

ActorValue Property Health Auto Const
