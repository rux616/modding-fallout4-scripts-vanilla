;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03MQ02_0600_OldLongfel_010324EF Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_22_Begin
Function Fragment_Phase_22_Begin()
;BEGIN CODE
; Play the Fog Crawler scream
int nSoundID = pDLC03NPCFogCrawlerDistantScreamB.play(Game.GetPlayer())
Sound.SetInstanceVolume(nSoundID, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property pDLC03NPCFogCrawlerDistantScream Auto Const Mandatory

Sound Property pDLC03NPCFogCrawlerDistantScreamB Auto Const Mandatory
