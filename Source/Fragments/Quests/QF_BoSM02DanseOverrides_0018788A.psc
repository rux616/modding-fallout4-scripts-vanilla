;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM02DanseOverrides_0018788A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor Danse = Alias_BoSPaladinDanse.GetActorRef()
Danse.SetPlayerTeammate(False, False, False)
Danse.FollowerWait()
Danse.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Actor Danse = Alias_BoSPaladinDanse.GetActorRef()
Danse.SetPlayerTeammate(True, True, True)
Danse.FollowerFollow()
Danse.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoSPaladinDanse Auto Const Mandatory
