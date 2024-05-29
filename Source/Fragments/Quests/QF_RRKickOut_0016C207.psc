;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRKickOut_0016C207 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; Glory can be killed without consequence now
Alias_Glory.GetActorRef().RemoveFromAllFactions()
Alias_Glory.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Send out the Kickout Event for the Railroad (3)
(MQ00 as MQ00Script).MQFactionKickoutPlayer(3)

; Make the player hostile to the Railroad Faction
Game.GetPlayer().RemoveFromFaction(pRailroadFaction)
pRailroadFaction.SetPlayerEnemy()

; Tracking no longer in faction and kicked out 
pPlayerRailroad_IsInFaction.SetValue(0)
pPlayerRailroad_KickedOut.SetValue(1)

; Put up a message box
if ( GetStageDone(50) )             ; Did you ever join the Railroad?
  pRRKickoutMessage.Show()    ; If so, you get alerted you're out of the faction
endif

; If Curie's quest is running - boot Glory from it
if ( pCOMCurieQuest.IsRunning() )
  pCOMCurieQuest.SetStage(310)
endif

; For safety, enable everyone
Alias_Desdemona.GetActorRef().Enable()
Alias_Desdemona.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_TinkerTom.GetActorRef().Enable()
Alias_TinkerTom.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_Glory.GetActorRef().Enable()
Alias_Glory.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_DoctorCarrington.GetActorRef().Enable()
Alias_DoctorCarrington.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_PAM.GetActorRef().Enable()
Alias_PAM.GetActorRef().GetActorBase().SetEssential(FALSE)

; Make Deacon hate you
pCOMDeacon.SetStage(91)     ; Dismiss Deacon if he's with you
(Alias_Deacon.GetActorRef() as CompanionActorScript).SetAffinity(-5000)

; Now Deacon is not essential
Alias_Deacon.GetActorRef().Enable()
Alias_Deacon.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_Deacon.GetActorRef().GetActorBase().SetProtected(TRUE)

; Disable any ambient conversations in the Railroad
pRRDisableHQConversations.SetValue(1)    ; TRUE - no more conversations

; Disable Z1-14
Alias_Z114.GetActorRef().Disable()

; Is the secret door to the HQ open?
if pRRSecretDoorBrickNavcut02.IsEnabled()
  ; Open the secret door to the HQ
  pRRSecretDoorBrickRef02.SetOpen()
  pRRSecretDoorBrickNavcut02.Disable()     ; Kill the nav mesh cutter by the secret door  

  ; Teleport some Railroad generics to intercept the player
  Alias_Reinforcement01.GetActorRef().MoveTo(pRRKickOutReinforcementMarker01)
  Alias_Reinforcement02.GetActorRef().MoveTo(pRRKickOutReinforcementMarker02)
endif

; Close off "Nuclear Option for the Railroad"
if ( pMQ302RR.IsRunning() )
  pMQ302RR.SetStage(9000)
endif

;If player won the game with the Railroad, shut down checkpoint attackers
if RECheckpointMQWonRR.GetValue() == 1
  RECheckpointDisableAttackers.SetValue(1)

  ;If checkpoint quests are running, pull their objectives
    if RECheckpoint01_BoSAttackers.IsRunning()
      RECheckpoint01_BoSAttackers.SetStage(600)
    endif

    if RECheckpoint02_SynthAttackers.IsRunning()
      RECheckpoint02_SynthAttackers.SetStage(600)
    endif

    if RECheckpoint03_Gunners.IsRunning()
      RECheckpoint03_Gunners.SetStage(600)
    endif

    if RECheckpoint04_Deathclaws.IsRunning()
      RECheckpoint04_Deathclaws.SetStage(600)
    endif

    if RECheckpoint05_Vertibird.IsRunning()
      RECheckpoint05_Vertibird.SetStage(600)
    endif

    if RECheckpoint06_SuperMutants.IsRunning()
      RECheckpoint06_SuperMutants.SetStage(600)
    endif

    if RECheckpoint07_VertibirdBoS.IsRunning()
      RECheckpoint07_VertibirdBoS.SetStage(600)
    endif

    if RECheckpoint09_Raiders.IsRunning()
      RECheckpoint09_Raiders.SetStage(600)
    endif

    if RECheckpoint10_RaidersPowerArmor.IsRunning()
      RECheckpoint10_RaidersPowerArmor.SetStage(600)
    endif

    if RECheckpoint11_FeralGhouls.IsRunning()
      RECheckpoint11_FeralGhouls.SetStage(600)
    endif

    if RECheckpoint12_Deathclaw.IsRunning()
      RECheckpoint12_Deathclaw.SetStage(600)
    endif

    if RECheckpoint13_YaoGuai.IsRunning()
      RECheckpoint13_YaoGuai.SetStage(600)
    endif

    if RECheckpoint14_SynthAttackers.IsRunning()
      RECheckpoint14_SynthAttackers.SetStage(600)
    endif

    if RECheckpoint15_Gunners.IsRunning()
      RECheckpoint15_Gunners.SetStage(600)
    endif

    if RECheckpoint16_Radscorpions.IsRunning()
      RECheckpoint16_Radscorpions.SetStage(600)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Close all the quests
pRR102.SetStage(1100)
pRR201.SetStage(9000)
pRR301.SetStage(9000)
pRR302.SetStage(20000)
pRR303.SetStage(20000)
pRRM01.SetStage(9000)
pRRM02.SetStage(9000)
pRRR05.SetStage(9000)
pRRAct3Pickup.SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ00 Auto Const

Faction Property pRailroadFaction Auto Const
Faction Property pPlayerFaction Auto Const

Message Property pRRKickoutMessage Auto Const

ReferenceAlias Property Alias_Desdemona Auto Const

ReferenceAlias Property Alias_Deacon Auto Const

ReferenceAlias Property Alias_TinkerTom Auto Const

ReferenceAlias Property Alias_Glory Auto Const

ReferenceAlias Property Alias_DoctorCarrington Auto Const

ReferenceAlias Property Alias_PAM Auto Const

Quest Property pCOMDeacon Auto Const

GlobalVariable Property pRRDisableHQConversations Auto Const

Quest Property pRR102 Auto Const

Quest Property pRR201 Auto Const

Quest Property pRR301 Auto Const

Quest Property pRR302 Auto Const

Quest Property pRR303 Auto Const

Quest Property pRRM01 Auto Const

Quest Property pRRM02 Auto Const

Quest Property pRRR05 Auto Const

Location Property pRailroadHQLocation Auto Const

ObjectReference Property pRRSecretDoorBrickRef02 Auto Const

ObjectReference Property pRRSecretDoorBrickNavcut02 Auto Const

ReferenceAlias Property Alias_Reinforcement01 Auto Const

ReferenceAlias Property Alias_Reinforcement02 Auto Const

ObjectReference Property pRRKickOutReinforcementMarker01 Auto Const

ObjectReference Property pRRKickOutReinforcementMarker02 Auto Const

GlobalVariable Property pPlayerRailroad_IsInFaction Auto Const

GlobalVariable Property pPlayerRailroad_KickedOut Auto Const

Quest Property pRRAct3Pickup Auto Const

Quest Property pMQ302RR Auto Const Mandatory

GlobalVariable Property RECheckpointMQWonRR Auto Const

GlobalVariable Property RECheckpointDisableAttackers Auto Const

Quest Property RECheckpoint01_BoSAttackers Auto Const

Quest Property RECheckpoint02_SynthAttackers Auto Const

Quest Property RECheckpoint03_Gunners Auto Const

Quest Property RECheckpoint04_Deathclaws Auto Const

Quest Property RECheckpoint05_Vertibird Auto Const

Quest Property RECheckpoint06_SuperMutants Auto Const

Quest Property RECheckpoint07_VertibirdBoS Auto Const

Quest Property RECheckpoint09_Raiders Auto Const

Quest Property RECheckpoint10_RaidersPowerArmor Auto Const

Quest Property RECheckpoint11_FeralGhouls Auto Const

Quest Property RECheckpoint12_Deathclaw Auto Const

Quest Property RECheckpoint13_YaoGuai Auto Const

Quest Property RECheckpoint14_SynthAttackers Auto Const

Quest Property RECheckpoint15_Gunners Auto Const

Quest Property RECheckpoint16_Radscorpions Auto Const

Quest Property pCOMCurieQuest Auto Const Mandatory

ReferenceAlias Property Alias_Z114 Auto Const Mandatory
