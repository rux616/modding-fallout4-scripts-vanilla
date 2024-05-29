;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03CoA_DialogueNucleus__01018067 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_DialogueNucleusScript
DLC03:DLC03CoA_DialogueNucleusScript kmyQuest = GetOwningQuest() as DLC03:DLC03CoA_DialogueNucleusScript
;END AUTOCAST
;BEGIN CODE
;If player hasn't already convinced High Confessor to Divide
;or hasn't failed the "I'm Atom's chosen" option
;Store off the player's trust level 
;(used to determine difficulty of one of the speech challenges

if !DLC03CoA_DialogueNucleus.GetStageDone(93) && !DLC03CoA_DialogueNucleus.GetStageDone(95)
  kmyquest.StorePlayerTrustLevel()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory
