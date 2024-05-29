;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueGoodneighborHanco_00111EC0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
If Alias_Daisy.GetActorRef().IsDead() == False
  Alias_Daisy.GetActorRef().MoveTo(HancockSpeechDaisyMoveToMarker)
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;quest has shutdown
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Daisy Auto Const

ObjectReference Property HancockSpeechDaisyMoveToMarker Auto Const
