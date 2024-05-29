;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ06a_HCSynthQuest_02032F41 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Move Synth confessor to sermon location
Alias_HCSynth.GetRef().Moveto(HCSynthMarker)

;Get him in the right package
Alias_HCSynth.GetActorRef().EvaluatePackage()

;Bypass sermon speech if you haven't already
if !DLC03CoA_DialogueNucleusSermon.GetStageDone(100)
  !DLC03CoA_DialogueNucleusSermon.SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property HCSynthMarker Auto Const Mandatory

ReferenceAlias Property Alias_HCSynth Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleusSermon Auto Const Mandatory
