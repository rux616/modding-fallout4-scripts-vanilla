;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MS01Post_0103578F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Set if the player shuts off the power after agreeing to Sierra's offer
; This represents the player betraying Sierra

; CT - Adding open door
DLC04MS01RewardDoor.SetLockLevel(0)
DLC04MS01RewardDoor.SetOpen()

; Start Bradberton's death scene
DLC04MS01BradbertonDies.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Sierra Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Confidence Auto Const Mandatory

Scene Property DLC04MS01Post_SierraAttackPlayer Auto Const Mandatory

Quest Property DLC04MS01SierraAttacks Auto Const Mandatory

Quest Property DLC04MS01BradbertonDies Auto Const Mandatory

Quest Property DLC04MS01 Auto Const Mandatory

ObjectReference Property DLC04MS01RewardDoor Auto Const Mandatory
