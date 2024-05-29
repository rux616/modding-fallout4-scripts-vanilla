;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRKickOut_0117ACD1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Send out the Kickout Event for the Railroad (3)
(MQ00 as MQ00Script).MQFactionKickoutPlayer(3)

; Make the player hostile to the Railroad Faction
Game.GetPlayer().RemoveFromFaction(pRailroadFaction)
pRailroadFaction.SetEnemy(pPlayerFaction)

; Put up a message box
if ( GetStageDone(50) )             ; Did you ever join the Railroad?
  pRRKickoutMessage.Show()    ; If so, you get alerted you're out of the faction
endif

; For safety, enable everyone
Alias_Desdemona.GetActorRef().Enable()
Alias_Desdemona.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_Deacon.GetActorRef().Enable()
Alias_Deacon.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_TinkerTom.GetActorRef().Enable()
Alias_TinkerTom.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_Glory.GetActorRef().Enable()
Alias_Glory.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_DoctorCarrington.GetActorRef().Enable()
Alias_DoctorCarrington.GetActorRef().GetActorBase().SetEssential(FALSE)
Alias_PAM.GetActorRef().Enable()
Alias_PAM.GetActorRef().GetActorBase().SetEssential(FALSE)

; Make Deacon hate you
pCOMDeacon.SetStage(90)     ; Dismiss Deacon if he's with you
(Alias_Deacon.GetActorRef() as CompanionActorScript).SetAffinity(-5000)

; Disable any ambient conversations in the Railroad
pRRDisableHQConversations.SetValue(1)    ; TRUE - no more conversations
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
