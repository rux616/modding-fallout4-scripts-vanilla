;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestRECheckpointQuest_000AC50A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
RECheckpointMQWonInst.SetValue(1)
MQWonInst.SetValue(1)
MQComplete.Setvalue(1)
RECheckpointParent.SetStage(10)
Game.GetPlayer().AddToFaction(InstituteFaction)
;BrotherhoodofSteelFaction.SetEnemy(PlayerFaction)
RailroadFaction.SetEnemy(PlayerFaction)
PlayerRailroad_KickedOut.SetValue(1)
TestRECheckpointDisableQuestGlobal.SetValue(1)

BoSKickOut.SetStage(20)
;Utility.Wait(3.0)
;RRKickOut.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
RECheckpointMQWonBoS.SetValue(1)
MQWonBoS.SetValue(1)
MQComplete.Setvalue(1)
RECheckpointParent.SetStage(10)
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
InstKickOut.SetStage(10)
PlayerInstitute_KickedOut.SetValue(1)
;RRKickOut.SetStage(100)
;InstituteFaction.SetEnemy(PlayerFaction)

RailroadFaction.SetEnemy(PlayerFaction)
PlayerRailroad_KickedOut.SetValue(1)

BoSJoined.SetValue(1)
TestRECheckpointDisableQuestGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
RECheckpointMQWonRR.SetValue(1)
MQWonRR.SetValue(1)
MQComplete.Setvalue(1)
RECheckpointParent.SetStage(10)
Game.GetPlayer().AddToFaction(RailroadFaction)
BoSKickOut.SetStage(20)
InstKickOut.SetStage(10)
PlayerInstitute_KickedOut.SetValue(1)
;BrotherhoodofSteelFaction.SetEnemy(PlayerFaction)
;InstituteFaction.SetEnemy(PlayerFaction)
TestRECheckpointDisableQuestGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
RECheckpointMQWonMin.SetValue(1)
MQWonMin.SetValue(1)
MQComplete.Setvalue(1)
RECheckpointParent.SetStage(10)
Game.GetPlayer().AddToFaction(MinutemanFaction)
BoSKickOut.SetStage(20)
InstKickOut.SetStage(10)
PlayerInstitute_KickedOut.SetValue(1)
;InstituteFaction.SetEnemy(PlayerFaction)
;BrotherhoodofSteelFaction.SetEnemy(PlayerFaction)
MinutemanFaction_PlayerJoined.SetValue(1)
TestRECheckpointDisableQuestGlobal.SetValue(1)
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

Quest Property RECheckpointParent Auto Const

GlobalVariable Property MQComplete Auto Const

Quest Property DN119Fight Auto Const

GlobalVariable Property TestRECheckpointDisableQuestGlobal Auto Const

GlobalVariable Property MinutemanFaction_PlayerJoined Auto Const

GlobalVariable Property RECheckpointMQWonRR Auto Const

GlobalVariable Property RECheckpointMQWonBoS Auto Const

GlobalVariable Property RECheckpointMQWonInst Auto Const

GlobalVariable Property RECheckpointMQWonMin Auto Const

Faction Property PlayerFaction Auto Const

Quest Property BoSKickOut Auto Const

Quest Property InstKickOut Auto Const

Quest Property RRKickOut Auto Const

GlobalVariable Property PlayerBoS_KickedOut Auto Const

GlobalVariable Property PlayerInstitute_KickedOut Auto Const

GlobalVariable Property PlayerRailroad_KickedOut Auto Const
