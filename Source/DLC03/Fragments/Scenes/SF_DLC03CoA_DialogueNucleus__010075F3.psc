;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03CoA_DialogueNucleus__010075F3 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_DialogueNucleusScript
DLC03:DLC03CoA_DialogueNucleusScript kmyQuest = GetOwningQuest() as DLC03:DLC03CoA_DialogueNucleusScript
;END AUTOCAST
;BEGIN CODE
;Check to see if Ware's got root
kmyquest.CalcWareRoot()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
