;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_PatchQuest_1_2_00249E2D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;89087 - if the player has already killed the Deathclaw and all the Raiders in MQ102 and the quest didn't advance, advance it now
If MQ102.IsRunning()
  If MQ102Deathclaw.GetActorRef().IsDead() && MQ102RaiderBoss.GetActorRef().IsDead() && MQ102RaiderLookout.GetActorRef().IsDead() && MQ102WaveRaider01.GetActorRef().IsDead() && MQ102WaveRaider02.GetActorRef().IsDead() && MQ102WaveRaider03.GetActorRef().IsDead()   
    MQ102.SetStage(122)
  EndIf
EndIf

;89088 - if the control layer in MQ201 is still around after MQ201 has advanced past needing it, delete it
If MQ201.GetStageDone(150) && (MQ201 as MQ201QuestScript).MQ201PlayerEnableLayer != None
  (MQ201 as MQ201QuestScript).MQ201PlayerEnableLayer = None
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MQ102RaiderBoss Auto Const

ReferenceAlias Property MQ102RaiderLookout Auto Const

ReferenceAlias Property MQ102WaveRaider01 Auto Const

ReferenceAlias Property MQ102WaveRaider02 Auto Const

ReferenceAlias Property MQ102WaveRaider03 Auto Const

Quest Property MQ102 Auto Const Mandatory

ReferenceAlias Property MQ102Deathclaw Auto Const

Quest Property MQ201 Auto Const Mandatory
