;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04PackFights_010525A5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Add player factions

DLC04PackFightsAttackerFaction.SetAlly(PlayerFaction)
DLC04PackFightsDefenderFaction.SetAlly(PlayerFaction)
PlayerFaction.SetAlly(DLC04PackFightsAttackerFaction)
PlayerFaction.SetAlly(DLC04PackFightsDefenderFaction)

; Move the Pack audience members into their furniture.
Alias_Spectator01.GetActorRef().SnapIntoInteraction(DLC04PackFightsChairF04Ref)
Alias_Spectator02.GetActorRef().SnapIntoInteraction(DLC04PackFightsChairM06Ref)
Alias_Spectator03.GetActorRef().SnapIntoInteraction(DLC04PackFightsChairF03Ref)
Alias_Spectator04.GetActorRef().SnapIntoInteraction(DLC04PackFightsChairM05Ref)

; Then set stage to 10 to spawn the attacker and defender.

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Spawn the attacker and defender at the appropriate marks.
; Global checks if this is the first time the quest has run or not.

If DLC04PackFightsRanOnce.GetValue() == 0
     Alias_AttackerAnimal01.TryToEnable()
     Alias_DefenderAnimal01.TryToEnable()
EndIf

If DLC04PackFightsRanOnce.GetValue() == 1
     Alias_AttackerAnimal01.TryToEnable()
     ; Roll to spawn Defender
     Int Roll = Utility.RandomInt(0,1)
     If (Roll == 0)
          Alias_DefenderAnimal01.TryToEnable()
     ElseIf (Roll == 1)
          Alias_DefenderSlave01.TryToEnable()
     EndIf
EndIf

; Track if the quest has been run before. We want to make sure the first fight the player
; see is always animal vs animal for now.

If DLC04PackFightsRanOnce.GetValue() == 0
     DLC04PackFightsRanOnce.SetValue(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; Stage set by DLC04RaiderKickout Stage 20.
Alias_AttackerAnimal01.GetActorRef().AddToFaction(DLC04GangPackFaction)
Alias_DefenderAnimal01.GetActorRef().AddToFaction(DLC04GangPackFaction)
Alias_DefenderSlave01.GetActorRef().AddToFaction(DLC04GangPackFaction)

Alias_AttackerAnimal01.GetActorRef().RemoveFromFaction(DLC04PackFightsAttackerFaction)
Alias_DefenderAnimal01.GetActorRef().RemoveFromFaction(DLC04PackFightsDefenderFaction)
Alias_DefenderSlave01.GetActorRef().RemoveFromFaction(DLC04PackFightsDefenderFaction)

Alias_AttackerAnimal01.GetActorRef().RemovePerk(DLC04PackFightsReduceDamage)
Alias_DefenderAnimal01.GetActorRef().RemovePerk(DLC04PackFightsReduceDamage)
Alias_DefenderSlave01.GetActorRef().RemovePerk(DLC04PackFightsReduceDamage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC04PackFightsRanOnce Auto Const Mandatory

ReferenceAlias Property Alias_AttackerAnimal01 Auto Const Mandatory

ReferenceAlias Property Alias_DefenderAnimal01 Auto Const Mandatory

ReferenceAlias Property Alias_DefenderSlave01 Auto Const Mandatory

Faction Property DLC04PackFightsAttackerFaction Auto Const Mandatory

Faction Property DLC04PackFightsDefenderFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_Spectator01 Auto Const Mandatory

ReferenceAlias Property Alias_Spectator03 Auto Const Mandatory

ReferenceAlias Property Alias_Spectator02 Auto Const Mandatory

ReferenceAlias Property Alias_Spectator04 Auto Const Mandatory

ObjectReference Property DLC04PackFightsChairF04Ref Auto Const Mandatory

ObjectReference Property DLC04PackFightsChairM06Ref Auto Const Mandatory

ObjectReference Property DLC04PackFightsChairF03Ref Auto Const Mandatory

ObjectReference Property DLC04PackFightsChairM05Ref Auto Const Mandatory

Perk Property DLC04PackFightsReduceDamage Auto Const Mandatory

Faction Property DLC04GangPackFaction Auto Const Mandatory
