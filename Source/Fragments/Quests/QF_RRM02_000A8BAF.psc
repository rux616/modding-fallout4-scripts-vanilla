;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RRM02_000A8BAF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RRM02Script
Quest __temp = self as Quest
RRM02Script kmyQuest = __temp as RRM02Script
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; End the quests which could conflict with htis
pRR101.Stop()
pRR102.Stop()

Utility.Wait(1.0)

; Move people to their spots
Alias_Desdemona.GetActorRef().MoveToPackageLocation()
Alias_DoctorCarrington.GetActorRef().MoveToPackageLocation()

; Queue up the quest
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Port everyone to their spots
Alias_Desdemona.GetActorRef().MoveTo(pRRM02_DezMarker)
Alias_DoctorCarrington.GetActorRef().MoveTo(pRRM02_CarringtonMarker)
Alias_PAM.GetActorRef().MoveTo(pRRM02_PAMMarker)

; Let Drummer Boy know about the quest
pRRQuestsAvailable.Mod(1)
pRRQuestPAM.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; End the ambient conversation
pRRM02_Ambient_InitialTalk.Stop()

Utility.Wait(0.3)

; Start the intro conversation
pRRM02_0100_InitialConversation.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
; Drummer Boy no longer bothers PC
pRRQuestsAvailable.Mod(-1)
pRRQuestPAM.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(200)

;Clean up Drummer boy
SetStage(90)

; Flag Desdemona as unbusy - Flagged in RRR01b
pRRDesdemonaBusy.SetValue(0)

; Enable H2-22's goodbye holotape at the Memory Den
Alias_HolotapeH22Goodbye.GetReference().Enable()
Alias_HolotapeH22Goodbye.GetReference().SetActorOwner(NONE)
Alias_HolotapeH22Goodbye.GetReference().SetFactionOwner(NONE)

; Teleport H2-22 to the Memory Den
Alias_H222.GetActorRef().Enable()
Alias_H222.GetActorRef().MoveTo(pRRM02H222Marker)

Utility.Wait(0.8)

; Evaluate their new packages
Alias_Desdemona.GetActorRef().EvaluatePackage()
Alias_DoctorCarrington.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; Parting words
pRRM02_0300a_AmariaParting.Start()

; Re-enable all the Malden bad guys
int i = 0
while i < Alias_InstituteScavengers.GetCount()
  ObjectReference theRef = Alias_InstituteScavengers.GetAt(i)
  if theRef
    theRef.Reset()
  endif
  i += 1		
endWhile

; Move Glory to her spot
actor aGlory = Alias_Glory.GetActorRef()
aGlory.MoveTo(pRRM02GloryAtMaldenMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)

; Hide H2-22
Alias_H222.GetActorRef().Disable()

; Potentially block RR201 checking in conversation so you can turn it in
(pRR201 as RR201Script).bBlockRR201fromRRM02 = 1

; Wait a wee bit and update Glory's force greet package
Utility.Wait(4.0)
Alias_Glory.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(400)

; Give the player some caps
Game.GivePlayerCaps(200)
;Game.GetPlayer().AddPerk(pRRSecretAgentPerk, TRUE)
Game.GetPlayer().AddItem(pRRStealthBoy, 2)  ; Get a special Railroad stealth boy
pRRStealthBoyAvailable.SetValue(0)  ; Tom now sells them, this global is used for "Chance None"

; Unblock RR201's check in conversation
(pRR201 as RR201Script).bBlockRR201fromRRM02 = 0

; Give final XP
;Game.RewardPlayerXP(pXPFactionFinal.GetValue() as int)

; Handle a Railroad Quest being completed
pDialogueRailroad.RailroadMiscQuestCompleted()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8990_Item_00
Function Fragment_Stage_8990_Item_00()
;BEGIN CODE
;Clean up Drummer boy
if ( !GetStageDone(90) )
  pRRQuestsAvailable.Mod(-1)
  pRRQuestPAM.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
; Fail objectives and end quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Desdemona Auto Const

ReferenceAlias Property Alias_DoctorCarrington Auto Const

Scene Property pRRM02_0300a_AmariaParting Auto Const

Quest Property pRR101 Auto Const

Quest Property pRR102 Auto Const

ReferenceAlias Property Alias_PAM Auto Const

ReferenceAlias Property Alias_HolotapeH22Goodbye Auto Const

ObjectReference Property pRRM02H222Marker Auto Const

ReferenceAlias Property Alias_H222 Auto Const

GlobalVariable Property pXPFactionFinal Auto Const

GlobalVariable Property pRRQuestsAvailable Auto Const

GlobalVariable Property pRRQuestDesdemona Auto Const

GlobalVariable Property pRRQuestPAM Auto Const

Scene Property pRRM02_Ambient_InitialTalk Auto Const

Scene Property pRRM02_0100_InitialConversation Auto Const

RefCollectionAlias Property Alias_InstituteScavengers Auto Const

Perk Property pRRSecretAgentPerk Auto Const

DialogueRailroadScript Property pDialogueRailroad Auto Const

ReferenceAlias Property Alias_Glory Auto Const

ObjectReference Property pRRM02GloryAtMaldenMarker Auto Const

Potion Property pRRStealthBoy Auto Const

GlobalVariable Property pRRStealthBoyAvailable Auto Const

ObjectReference Property pRRM02_DezMarker Auto Const Mandatory

ObjectReference Property PRRM02_CarringtonMarker Auto Const Mandatory

ObjectReference Property pRRM02_PAMMarker Auto Const Mandatory

GlobalVariable Property pRRDesdemonaBusy Auto Const Mandatory

Quest Property pRR201 Auto Const Mandatory
