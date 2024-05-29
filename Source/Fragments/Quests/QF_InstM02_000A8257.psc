;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstM02_000A8257 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set stage 1000 in Inst 302
Inst302.SetStage(1000)

;Add the player to the Institute Faction, which is necessary for some faction interactions
Game.GetPlayer().AddToFaction(InstituteFaction)

;Add the Institute map marker
InstituteMapMarker.AddToMap(True)

;Move the player
Game.GetPlayer().MoveTo(InstM04Playtest1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set if the player passes the speech challenge to get a reward from Liam
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set in Phase 6 of InstM02SceneEvenConfront if the player passes the speech challenge
;In the speech challenge, the player says he will keep Eve's secret

;Add Eve to the Institute faction
Alias_Eve.GetActorRef().AddToFaction(InstituteFaction)

SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set at the end of the scene LiamInvestigation
;Used as a condition to prevent the scene from running again
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
;Set if the player passes the hard speech challenge to get Liam to fess up
;Used as a condition to prevent Liam's initial greeting from playing again
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set at the end of Justin Ayo's initial quest dialogue scene
;Used as a condition on Alan Binet's greeting
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Set at the end of the player's first conversation with Alan Binet
SetObjectiveDisplayed(20)

;Set the stage that marks Justin's intro scene as being complete
;This is checked as a condnition on Alan Binet's investigate scene
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;Set if the player access a terminal in Robotics while Alan Binet is there
;Changes Alan's greeting to teh player at this point
;Gates Alan's idles as he comments on what the player is doing

;Set in Phase 2 of scene "InstM02AlanInvestigate"
;Also set the first time the player uses one of the Robotics terminals
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Set when the player activates terminal 3 in Dr. Binet's lab
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
;Set after the player has investigated the terminal in the Binet quarters
SetObjectiveCompleted(30)
SetObjectiveDisplayed(33)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;Set when the player has investigated the SRB temrinal
SetObjectiveCompleted(33)
SetObjectiveDisplayed(36)

;Move EVE to the maintenance terminal, remove her from the Institute faction, give her a gun
Alias_Eve.GetActorRef().MoveTo(InstM02EveStage700Marker)
Alias_Eve.GetActorRef().RemoveFromFaction(InstituteFaction)
Alias_Eve.GetActorRef().AddItem(LL_InstituteLaserGun_SimplePistol)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;Set at the end of Even's confrontation scene at the maintenance temrinal

SetStage(800)

;Add Eve to the player enemy faction
Alias_Eve.GetActorReference().AddToFaction(PlayerEnemyFaction)
Alias_EveDialogueInstitute.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Set when the player sees the entry on the Binet quarters terminal that implicates Liam
SetObjectiveCompleted(36)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Set if the player decides to tell Justin Ayo that Liam is guilty
SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
;Set if the player agrees to help Liam Binet frame Justin Ayo
SetObjectiveCompleted(30)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
;Set when the player disables the security safeguards on Justin Ayo's private terminal
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
;Set after the player has reported Liam to Justin

;Give reward
Game.GetPlayer().AddItem(Caps001, 1000)

;Used to gate some post-quest dialogue
;Disable Liam once the player has changed location twice away from the Institute
SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_00
Function Fragment_Stage_1700_Item_00()
;BEGIN CODE
;Set at the end of the quest if the player sides with Liam and got Liam to agree to give his spare glasses

;Give reward
Game.GetPlayer().AddItem(InstM02LiamsGlasses, 1)

SetStage(1800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN CODE
;Set after the player has framed Justin
;Used to condition some post-quest dialogue

;Disable Justin once the player has changed location twice away from the Institute
;Code

SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;Grant XP reward
;Game.RewardPlayerXP(XPMiscQuestFinal.GetValue() as int)

;Completion stage
CompleteAllObjectives()
InstM02Post.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_01
Function Fragment_Stage_2000_Item_01()
;BEGIN CODE
;Fail InstR05 (because Justin Ayo will be exiled, which will make InstR05 impossible to complete)
InstR05.SetStage(1500)

;Completion stage
CompleteAllObjectives()
InstM02Post.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2500_Item_00
Function Fragment_Stage_2500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Caps001 Auto Const

;ObjectReference Property InstM02Playtest1 Auto Const

Quest Property Inst302 Auto Const

Faction Property InstituteFaction Auto Const

ObjectReference Property InstM02EveStage700Marker Auto Const

ReferenceAlias Property Alias_Eve Auto Const

Faction Property PlayerEnemyFaction Auto Const

ObjectReference Property InstituteMapMarker Auto Const

ObjectReference Property InstM04Playtest1 Auto Const

Quest Property InstM02Post Auto Const

GlobalVariable Property XPMiscQuestFinal Auto Const

Quest Property pRR102 Auto Const

LeveledItem Property LL_InstituteLaserGun_SimplePistol Auto Const

Armor Property InstM02LiamsGlasses Auto Const

ReferenceAlias Property Alias_EveDialogueInstitute Auto Const

Quest Property InstR05 Auto Const Mandatory
