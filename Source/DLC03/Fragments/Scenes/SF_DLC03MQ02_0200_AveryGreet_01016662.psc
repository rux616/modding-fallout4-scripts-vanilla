;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03MQ02_0200_AveryGreet_01016662 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
Actor player = Game.GetPlayer()
Actor m = Alias_Mariner.GetActorRef()
if (!player.HasDetectionLoS(m) && !player.HasDetectionLoS(M01MarinerPreRunMarker))
     m.MoveTo(M01MarinerPreRunMarker)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_Begin
Function Fragment_Phase_08_Begin()
;BEGIN CODE
Game.StopDialogueCamera()

; Play the Alarm Sound
int nSoundID = pDLC03AMBAlarmFarHarbor.play(Game.GetPlayer())
Sound.SetInstanceVolume(nSoundID, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property pDLC03AMBAlarmFarHarbor Auto Const Mandatory

ObjectReference Property M01MarinerPreRunMarker Auto Const Mandatory

ReferenceAlias Property Alias_Mariner Auto Const
