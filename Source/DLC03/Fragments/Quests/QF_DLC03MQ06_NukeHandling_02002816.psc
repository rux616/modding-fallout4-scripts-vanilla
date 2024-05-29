;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ06_NukeHandling_02002816 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;TEMP - To be replaced with actual door opening

SecretRoomEnableMarker.Enable()

;Update stage in DLC03MQ06 if quest is running
if DLC03MQ06.IsRunning() 
  DLC03MQ06.SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property SecretRoomEnableMarker Auto Const Mandatory

Quest Property DLC03MQ06 Auto Const Mandatory
