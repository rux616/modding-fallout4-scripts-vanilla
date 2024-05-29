;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestPrestonLIP_000396DE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Play all scenes
pTestPrestonCurrentLIP.Stop()
pTestPrestonCutsceneLIP.Stop()
pTestPrestonHighVolumeLIP.Stop()
pTestPrestonPCapLIP.Stop()

pTestPrestonCurrentLIP.Start()
pTestPrestonCutsceneLIP.Start()
pTestPrestonHighVolumeLIP.Start()
pTestPrestonPCapLIP.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pTestPrestonCurrentLIP Auto Const

Scene Property pTestPrestonCutsceneLIP Auto Const

Scene Property pTestPrestonHighVolumeLIP Auto Const

Scene Property pTestPrestonPCapLIP Auto Const
