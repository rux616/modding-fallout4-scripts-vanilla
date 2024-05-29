;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestRECheckpointQuest_0101F570 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
MQWonInst.Setvalue(1)
Game.GetPlayer().AddToFaction(InstituteFaction)
BrotherhoodofSteelFaction.SetPlayerEnemy()
RailroadFaction.SetPlayerEnemy()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
MQWonBos.Setvalue(1)
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
InstituteFaction.SetPlayerEnemy()
RailroadFaction.SetPlayerEnemy()
BoSJoined.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
MQWonRR.Setvalue(1)
Game.GetPlayer().AddToFaction(RailroadFaction)
BrotherhoodofSteelFaction.SetPlayerEnemy()
InstituteFaction.SetPlayerEnemy()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
MQWonMin.Setvalue(1)
Game.GetPlayer().AddToFaction(MinutemanFaction)
InstituteFaction.SetPlayerEnemy()
BrotherhoodofSteelFaction.SetPlayerEnemy()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MQWonInst Auto Const

GlobalVariable Property MQWonBoS Auto Const

GlobalVariable Property MQWonMin Auto Const

GlobalVariable Property MQWonRR Auto Const

Faction Property InstituteFaction Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

Faction Property MinutemanFaction Auto Const

Faction Property RailroadFaction Auto Const

Keyword Property RECheckpointKeyword Auto Const

GlobalVariable Property BoSJoined Auto Const
