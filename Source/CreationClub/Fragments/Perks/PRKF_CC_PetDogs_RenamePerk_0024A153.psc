;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CreationClub:Fragments:Perks:PRKF_CC_PetDogs_RenamePerk_0024A153 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
;Re-roll a dog name 
debug.trace("CC: Perk calling dog rename function")
CC_PetDogQuest.NameDogWithConfirmation(akTargetRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CreationClub:CC_PetDogQuestScript Property CC_PetDogQuest Auto Const
