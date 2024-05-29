;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ06a_HCSynthQuest_01038A72 Extends Quest Hidden Const

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

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;If the player's destroyed hasn't destroyed the Wind Farm, start the High Confessor's scene
if DLC03MQ06_WindFarmDestroyed.GetValue() == 0
  DLC03MQ06a_HCSynthQuest_SermonScene.Start()
else
  SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
DLC03_CustomItemQuest.SetStage(260)
SetObjectiveCompleted(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
SetStage(100)
SetObjectiveDisplayed(10, false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property HCSynthMarker Auto Const Mandatory

ReferenceAlias Property Alias_HCSynth Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleusSermon Auto Const Mandatory

Scene Property DLC03MQ06a_HCSynthQuest_SermonScene Auto Const Mandatory

GlobalVariable Property DLC03MQ06_WindFarmDestroyed Auto Const Mandatory

Quest Property DLC03_CustomItemQuest Auto Const Mandatory
