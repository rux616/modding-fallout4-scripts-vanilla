;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_MS02RideIsSpinning_01033659 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
;Failed to load code for fragment Fragment_Phase_01_Begin
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04MS02Script
DLC04:DLC04MS02Script kmyQuest = GetOwningQuest() as DLC04:DLC04MS02Script
;END AUTOCAST
;BEGIN CODE
if kmyquest.GetStageDone(99) == true
    kmyquest.SetStage(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04UFOConsoleRef Auto Const Mandatory

Quest Property DLC04MS02 Auto Const Mandatory
