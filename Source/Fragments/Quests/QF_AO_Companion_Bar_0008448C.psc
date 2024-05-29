;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_AO_Companion_Bar_0008448C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
debug.trace(self + "Stage 0: Start up - forcing the TravelSpot alias")
if Alias_CompanionStandHereMarker.GetReference()
	Alias_TravelSpot.ForceRefTo(Alias_CompanionStandHereMarker.GetReference())
else
	Alias_TravelSpot.ForceRefTo(Alias_BarTender.GetReference())
endif

;debug.messagebox("Scene begun")

;Start scene
;AO_Companion_Bar_Switchboard.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
debug.trace(self + "Stage 100: Unable to find valid scene. End quest.")

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
AttractionObjectScript AOS = Alias_myObject.GetReference() as AttractionObjectScript
if AOS
   AOS.DoMything()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_myObject Auto Const

ReferenceAlias Property Alias_CompanionStandHereMarker Auto Const

ReferenceAlias Property Alias_BarTender Auto Const

ReferenceAlias Property Alias_TravelSpot Auto Const

Scene Property AO_Companion_Bar_Switchboard Auto Const
