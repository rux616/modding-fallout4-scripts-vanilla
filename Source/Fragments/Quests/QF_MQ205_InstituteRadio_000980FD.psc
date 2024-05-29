;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ205_InstituteRadio_000980FD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
(DNMasterQuest as RadioFailsafeScript).AddScene(MQ205_InstituteRadioStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
MQ205.setStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
(DNMasterQuest as RadioFailsafeScript).RemoveScene(MQ205_InstituteRadioStart)
MQ205_InstituteRadioStart.stop()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ205_InstituteRadioStart Auto Const

Quest Property MQ205 Auto Const

Quest Property DNMasterQuest Auto Const Mandatory
