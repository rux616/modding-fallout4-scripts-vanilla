;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01003501 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
if (!BoSM01.IsRunning() || !BoSM01DistressSignals.IsRunning())
     BoSM01.Start()
     BoSM01DistressSignals.Start()
EndIf
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoSM01 Auto Const

Quest Property BoSM01DistressSignals Auto Const
