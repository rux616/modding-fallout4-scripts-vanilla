;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DialogueNucleusArchemist__01006C83 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE GenericDoctorsScript
GenericDoctorsScript kmyQuest = GetOwningQuest() as GenericDoctorsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ClearDialogueConditions()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
