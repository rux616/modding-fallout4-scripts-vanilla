;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS19_00022A0A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_Austin.GetActorRef().MoveTo(AustinForcegreetMarker)
Alias_AlexisCombes.GetActorRef().MoveTo(V81DepotRef)
Alias_HoltCombes.GetActorRef().MoveTo(V81DepotRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
MS19MiscSeeForsythe.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
MS19ForsytheSamples.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
MS19MiscSeeForsythe.SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
MUSReward.add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
if game.GetPlayer().GetItemCount(MS19Cure) == 0
    MS19GiveCureToForsythe.Stop()
    SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set the Global Value to 2 to track that the player let Austin die.
MS19PlayerChoice.SetValueInt(2)

;Enable Austin's memorial in the classroom.
V81AustinMemorial.Enable()

SetObjectiveFailed(800,true)
Setstage(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
MS19MiscSeeForsythe.SetStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
game.GetPlayer().AddItem(MS19Reward)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE ms19script
Quest __temp = self as Quest
ms19script kmyQuest = __temp as ms19script
;END AUTOCAST
;BEGIN CODE
kmyQuest.Freeze()
MS19MiscSeeForsythe.SetStage(13)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE ms19script
Quest __temp = self as Quest
ms19script kmyQuest = __temp as ms19script
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnFreeze()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MS19MiscSeeForsythe.SetStage(30)

If MS19.GetStageDone(15) == false
    If MS19.GetStageDone(13) == true
        game.GetPlayer().Additem(Caps001, 150)
    ElseIf MS19.GetStageDone(12) == true
        game.GetPlayer().Additem(Caps001, 100)
    ElseIf MS19.GetStageDone(11) == true
        game.GetPlayer().Additem(Caps001, 50)
    EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
alias_Austin.GetRef().MoveTo(V81FamilyMedicalRef)
alias_DrPenske.GetRef().MoveTo(V81FamilyMedicalRef)
alias_Austin.GetRef().BlockActivation(true, true)
alias_AlexisCombes.GetRef().MoveTo(V81DepotRef)
alias_HoltCombes.GetRef().MoveTo(V81DepotRef)
alias_ErinCombes.GetRef().MoveTo(V81DepotRef)
MS19DeadMoleratRef.enable()

DialogueVault81.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
MS19AustinInClinic.Start()
MS19MiscSeeForsythe.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE ms19script
Quest __temp = self as Quest
ms19script kmyQuest = __temp as ms19script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(700, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
SetStage(16)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
;MS19CurieInLab.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;MS19CurieDoor.SetOpen(true)
;utility.wait(1)
;MS19CurieDoor02.SetOpen(true)

MS19CurieDoor.Lock(False)
MS19CurieDoor.SetOpen(true)
Alias_Curie.GetActorRef().RemoveFromFaction(CaptiveFaction)
game.StopDialogueCamera()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700, true)
SetObjectiveDisplayed(800, true)

game.GetPlayer().AddItem(MS19Cure, 1)

MUSReward.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800, true)
SetObjectiveDisplayed(900, true)

alias_Overseer.GetRef().MoveTo(MS19OverseerGoToLab)
game.GetPlayer().RemoveItem(MS19Cure, 99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900, true)

MS19PlayerChoice.SetValueInt(1)
Game.GetPlayer().AddToFaction(SettlementVault81)

Alias_Overseer.GetActorRef().GetActorBase().SetEssential(false)
Alias_DrForsythe.GetActorRef().GetActorBase().SetEssential(false)
alias_Austin.GetRef().BlockActivation(false)

V81PCRoomMarker.enable()
;Vault81AtriumMapMarker.enable()
;Vault81AtriumMapMarker.AddToMap(true)

SetStage(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
MS19DeadMoleratRef.disable()

;Update Global for Radio News
RadioDCMS19Ready.SetValue((GameDaysPassed.GetValue() + 1))


stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DrForsythe Auto Const

ReferenceAlias Property Alias_Overseer Auto Const

ReferenceAlias Property Alias_Rachel Auto Const

ReferenceAlias Property Alias_Austin Auto Const

ObjectReference Property AustinForcegreetMarker Auto Const

ObjectReference Property MS19VaultDoorRef Auto Const

ObjectReference Property V81DepotRef Auto Const

ReferenceAlias Property Alias_AlexisCombes Auto Const

ReferenceAlias Property Alias_HoltCombes Auto Const

ObjectReference Property MS19ForsytheGoToLab Auto Const

ObjectReference Property MS19OverseerSickBedMarker Auto Const

ReferenceAlias Property Alias_BobbyDeLuca Auto Const

ObjectReference Property MS19QuarantineMarker Auto Const

ObjectReference Property V81FamilyMedicalRef Auto Const

ObjectReference Property MS19QuarantineDoorRef Auto Const

Potion Property MS19Cure Auto Const

Quest Property MS19 Auto Const

MiscObject Property Caps001 Auto Const

Quest Property V81_01 Auto Const

ObjectReference Property V81EnableCitizensMarker Auto Const

ObjectReference Property MS19CurieDoor Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMS19Ready Auto Const

ReferenceAlias Property Alias_Curie Auto Const

Faction Property CaptiveFaction Auto Const

Scene Property MS19CurieInLab Auto Const

ObjectReference Property MS19GuardWait Auto Const

Quest Property MS19MiscSeeForsythe Auto Const

SPELL Property MS19Disease Auto Const

ActorValue Property MS19Infected Auto Const

ReferenceAlias Property Alias_DrPenske Auto Const

ReferenceAlias Property Alias_Horatio Auto Const

ReferenceAlias Property Alias_KatyPinn Auto Const

Scene Property MS19ForsytheSamples Auto Const

Message Property MS19DiseaseMsg Auto Const

Quest Property MS19Fetch Auto Const

ObjectReference Property MS19SecretDoorEnabler Auto Const

Scene Property MS19AustinInClinic Auto Const

ObjectReference Property MS19DeadMoleratRef Auto Const

ObjectReference Property MS19SecretDoorRef Auto Const

ObjectReference Property MS19OverseerGoToLab Auto Const

LeveledItem Property MS19Reward Auto Const

ObjectReference Property V81PCRoomMarker Auto Const

GlobalVariable Property MS19PlayerChoice Auto Const

Idle Property IdleKickDoor Auto Const

Scene Property MS19BobbyRevealDoor Auto Const

MusicType Property MUSRewardShort Auto Const

MusicType Property MUSReward Auto Const

ObjectReference Property V81AustinMemorial Auto Const

ObjectReference Property Vault81AtriumMapMarker Auto Const Mandatory

Scene Property MS19GiveCureToForsythe Auto Const Mandatory

ReferenceAlias Property Alias_ErinCombes Auto Const Mandatory

Quest Property V81_04 Auto Const

Quest Property DialogueVault81 Auto Const

Faction Property SettlementVault81 Auto Const
