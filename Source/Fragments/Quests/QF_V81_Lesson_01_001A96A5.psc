;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_V81_Lesson_01_001A96A5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Play the lesson scene
Debug.Trace(Self + "Start lesson scene in quest")
V81_Lesson_01_Scene.Start()
Debug.Trace(Self + "Started")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Vault81ClassroomLightsEnable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Vault81ClassroomLightsEnable.Enable()
(ProjectorRef as ProjectorScript).ShutOff()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property V81_Lesson_01_Scene Auto Const

ObjectReference Property Vault81ClassroomLightsEnable Auto Const

ObjectReference Property ProjectorRef Auto Const
