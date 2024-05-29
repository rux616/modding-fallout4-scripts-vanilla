;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN092_BossTauntScene_0001F68D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
actor player = game.getPlayer() as actor

Alias_WaveRaider01.getactorReference().startcombat(player)
Alias_WaveRaider02.getactorReference().startcombat(player)
Alias_WaveRaider03.getactorReference().startcombat(player)
Alias_WaveRaiderRoofLookout.getactorReference().startcombat(player)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_WaveRaider01 Auto Const
ReferenceAlias Property Alias_WaveRaider02 Auto Const
ReferenceAlias Property Alias_WaveRaider03 Auto Const


ReferenceAlias Property Alias_WaveRaiderRoofLookout Auto Const
