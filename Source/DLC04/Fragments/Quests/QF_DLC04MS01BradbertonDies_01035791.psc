;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MS01BradbertonDies_01035791 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; Set in the end data of the scene in this quest

; Block activation on Bradberton
DLC04MS01BradbertonTalkingActivatorRef.BlockActivation(True,True)

; If DLC04MS01 is still running and the player agreed to let Bradberton live, this is a betrayal of Sierra
; in this case DLC04MS01 fails and Sierra attacks the player
; Otherwise, check if the player has cut the power in the post quest after agreeing to Sierra's offer
; If so, start her attack scene and make her hostile as per above

If DLC04MS01.IsRunning() && DLC04MS01.GetStageDone(620)
   DLC04MS01.SetStage(755)
elseif DLC04MS01.IsRunning() == False && DLC04MS01.GetStageDone(800)
   DLC04MS01SierraAttacks.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Sierra Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Confidence Auto Const Mandatory

Scene Property DLC04MS01Post_SierraAttackPlayer Auto Const Mandatory

Quest Property DLC04MS01 Auto Const Mandatory

Quest Property DLC04MS01SierraAttacks Auto Const Mandatory

ObjectReference Property DLC04MS01BradbertonTalkingActivatorRef Auto Const Mandatory
