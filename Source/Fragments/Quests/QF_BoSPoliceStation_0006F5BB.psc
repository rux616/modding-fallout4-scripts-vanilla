;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSPoliceStation_0006F5BB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Dialogue is active at the Police Station for first time (end of BoS100)
BoSHRMedicalEscort.Start()
Alias_BoSPSRhys.GetActorRef().SetRestrained(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
BoSHRMedicalBanter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Kill Scenes if they are running - this is for backup in case they never shut down

if BoSHRMedicalEscort.IsPlaying() == 1
BoSHRMedicalEscort.Stop()
endif

if BoSHRMedicalBanter.IsPlaying() == 1
BoSHRMedicalBanter.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BoSHRMedicalEscort Auto Const

Scene Property BoSHRMedicalBanter Auto Const

ReferenceAlias Property Alias_BoSPSRhys Auto Const
