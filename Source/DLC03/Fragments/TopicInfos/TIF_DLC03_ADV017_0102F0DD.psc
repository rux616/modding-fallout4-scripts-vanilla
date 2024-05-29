;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03_ADV017_0102F0DD Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if !DLC03EchoLakeLumberMapMarker.IsMapMarkerVisible()
	DLC03EchoLakeLumberMapMarker.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC03EchoLakeLumberMapMarker Auto Const Mandatory
