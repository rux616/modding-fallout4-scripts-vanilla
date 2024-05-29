;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04_RQ_SendAlarmIfDetec_0105388F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
DLC04:DLC04_RQ_ManagerScript.GetScript().trace(self, "Start up stage 0")

Alias_victim.GetActorReference().SendAssaultAlarm()

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_victim Auto Const Mandatory
