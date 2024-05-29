;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ00TransitCenter_01046A18 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Restore power to the Monorail.
DLC04MQ00.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Play a Power On sound.
QSTArcJetLightsOnA.Play(Game.GetPlayer())

;Swap the lighting state.
DLC04TransitCenterAuxPowerEnableMarker.EnableNoWait()
DLC04TransitCenterAuxPowerDisableMarker.DisableNoWait()

;If Gage isn't speaking, turn on Transit Center announcements.
If DLC04MQ00_800_Gage.IsPlaying() == False
   DLC04TransitCenterAnnouncements.SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04TransitCenterAuxPowerEnableMarker Auto Const Mandatory

ObjectReference Property DLC04TransitCenterAuxPowerDisableMarker Auto Const Mandatory

Quest Property DLC04MQ00 Auto Const Mandatory

Quest Property DLC04TransitCenterAnnouncements Auto Const Mandatory

Scene Property DLC04MQ00_800_Gage Auto Const Mandatory

Sound Property OBJLightsPowerOn2D Auto Const Mandatory

Sound Property QSTArcJetLightsOnA Auto Const Mandatory
