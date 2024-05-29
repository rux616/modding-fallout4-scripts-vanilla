;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MagnoliaGreetScene_00074D26 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN AUTOCAST TYPE DialogueGoodneighborScript
DialogueGoodneighborScript kmyQuest = GetOwningQuest() as DialogueGoodneighborScript
;END AUTOCAST
;BEGIN CODE
kmyquest.GetPlayerHighestSpecial()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
