;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstM03Starter_000A0577 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Startup stage - runs when the quest is started from the completion stage of quest Inst302

;Shut down the Higgs/Courser & Loken/Ayo ambient scene quests
DialogueInstituteHiggsCourser1.Stop()
;DialogueInstituteLokenAyo1.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set by the script on the player alias when the player changes loc to a new loc that is not Institute loc or child of it
InstM03.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueInstituteHiggsCourser1 Auto Const

Quest Property InstM03 Auto Const Mandatory
