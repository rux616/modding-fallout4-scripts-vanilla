;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_Kickout_0202EFA1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;This is triggered from several spots:
;1. Killing any name CoA NPC (other than High Confessor, who is essential until you're allowed to kill him)
;2. Stage 150 - CoA entrance scene
;3. Stage 700 - AtomM01
;4. Stage 100 - MQ06 NukeHandling

Actor PlayerActor = Game.GetPlayer()

PlayerActor.RemoveFromFaction(DLC03ChildrenofAtomFaction)
DLC03ChildrenofAtomFaction.SetEnemy(PlayerFaction)
DLC03ChildrenofAtomFaction.SetPlayerEnemy()

;Set "Kick Out" var
DLC03CoA_PlayerKickedOutofCoA.SetValue(1)

;Show message
DLC03CoA_KickOutMessage.Show()

;Shut down "Speak to High Confessor" objective if active
DLC03CoA_DialogueNucleus.SetStage(55)

;Shutdown AtomM02
DLC03AtomM02.SetStage(800)

;Clear the Mother icon from her QI alias
MotherQIAlias.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DLC03ChildrenofAtomFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

GlobalVariable Property DLC03CoA_PlayerKickedOutofCoA Auto Const Mandatory

Message Property DLC03CoA_KickOutMessage Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

Quest Property DLC03AtomM02 Auto Const Mandatory

ReferenceAlias Property MotherQIAlias Auto Const Mandatory
