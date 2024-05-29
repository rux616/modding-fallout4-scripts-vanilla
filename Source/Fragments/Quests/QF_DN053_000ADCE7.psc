;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN053_000ADCE7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set up Virgil
Actor Virgil = Alias_Virgil.GetActorRef()
Virgil.Enable()
Virgil.GetActorBase().SetEssential(False)
Virgil.MoveTo(MQ204VirgilInteriorMarkerRef)
Virgil.EvaluatePackage()

;Move the player to Virgil
Game.GetPlayer().MoveTo(Alias_Virgil.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;On startup, create Virgil's gun.
CustomItemQuest.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Enables Virgil's Post-Institute dialogue, which normally turns on at the beginning of
;Act III (MQ206 Stage 1200).
;
;BoSM04 sets this stage as a backup and expects this dialogue to run concurrently.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;EVP Virgil to end his forcegreet.
Alias_Virgil.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
if (!GetStageDone(32))
     ;Display 'Find Virgil's Serum'
     SetObjectiveDisplayed(31)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
if (!GetStageDone(90) && !GetStageDone(100))
     ;Complete 'Find Virgil's Serum'
     SetObjectiveCompleted(31)

     ;Display 'Return the Serum to Virgil'
     SetObjectiveDisplayed(32)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
;Complete 'Return the Serum to Virgil'
SetObjectiveCompleted(32)

;Remove the Serum from the player.
Game.GetPlayer().RemoveItem(Alias_VirgilsSerum.GetRef())

;Award the Radiant Quest XP for completing the quest.
Game.RewardPlayerXP(XPRadiant.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Fail the objectives to return the Serum.
SetObjectiveFailed(31)
SetObjectiveFailed(32)

;Remove Virgil from his faction so his Protectron and turrets won't attack the player when they kill him.
Alias_Virgil.GetActorRef().RemoveFromFaction(DN053_VirgilFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
;During the suicide scene, any hit kills Virgil.
Alias_Virgil.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0049_Item_00
Function Fragment_Stage_0049_Item_00()
;BEGIN CODE
;Restore Virgil to his faction so his defenses behave normally.
Alias_Virgil.GetActorRef().AddToFaction(DN053_VirgilFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN AUTOCAST TYPE DN053_QuestScript
Quest __temp = self as Quest
DN053_QuestScript kmyQuest = __temp as DN053_QuestScript
;END AUTOCAST
;BEGIN CODE
;Award Midquest XP for bringing the serum to Virgil.
Game.RewardPlayerXP(XPFactionSmall.GetValueInt())

;Start a timer, set for three days, after which Virgil will be cured.
kMyQuest.StartCureTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Switch Virgil to his human form.
Actor VirgilSM = Alias_Virgil_Supermutant.GetActorRef()
Actor VirgilH = Alias_Virgil_Human.GetActorRef()
ObjectReference VirgilG = Alias_VirgilsGun.GetReference()
if (!VirgilSM.IsDead())
     VirgilSM.Disable()
     VirgilH.Enable()
     Alias_Virgil.ForceRefTo(VirgilH)

    ;Swap Virgil's Super Mutant furniture for human stuff
    pDN053VirgilFurnitureSwapEnabler.Enable()

    ;Enable the music trigger when the player returns to the lab.
    DN053_PostCureMusicTrigger.Enable()

     if (VirgilSM.GetItemCount(VirgilG) > 0)
          VirgilSM.RemoveItem(VirgilG, 1, False, VirgilH)
     EndIf

     ;Give the player a misc objective to return.
     ;Display 'Return to Virgil'
     SetObjectiveDisplayed(60)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
;Complete 'Return to Virgil'
SetObjectiveCompleted(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0063_Item_00
Function Fragment_Stage_0063_Item_00()
;BEGIN CODE
;Enable the Postquest scenes with Dr. Li.
BoSM04Postquest.SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0064_Item_00
Function Fragment_Stage_0064_Item_00()
;BEGIN CODE
;Enable the postquest scenes with Dr. Li, and give the player Virgil's note.
BoSM04Postquest.SetStage(16)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
;Clear ownership on the lab, to allow the player to take things.
VirgilsLab01.SetActorOwner(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Allow the player to lie about killing Virgil.
BoSM04.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE DN053_QuestScript
Quest __temp = self as Quest
DN053_QuestScript kmyQuest = __temp as DN053_QuestScript
;END AUTOCAST
;BEGIN CODE
;Set when the player attacks or otherwise damages Virgil, or through dialogue.

;Fail the objectives to return the Serum.
SetObjectiveFailed(31)
SetObjectiveFailed(32)

;Clear the Serum alias; the player is now free to drop it.
Alias_VirgilsSerum.Clear()

;Force Virgil to become hostile.
Actor VirgilRef = Alias_Virgil.GetActorRef()
VirgilFaction.SetEnemy(PlayerFaction)
VirgilRef.GetCurrentScene().Stop()
VirgilRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN CODE
if (GetStageDone(40) && !GetStageDone(49))
     ;If Virgil is suicidal, auto-kill him.
     SetStage(45)
Else
     ;Otherwise, he becomes hostile.
     SetStage(90)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Clear ownership on the lab, to allow the player to take things.
VirgilsLab01.SetActorOwner(None)

;Clear the Serum alias; the player is now free to drop it.
Alias_VirgilsSerum.Clear()

;Set the lab location as cleared.
VirgilsLab.SetCleared(True)

;Fail the objectives to return the Serum.
SetObjectiveFailed(31)
SetObjectiveFailed(32)

;If the Postquest is running, and the player was to give Dr. Li the note, flip to just telling her.
if (GetStageDone(64))
     SetStage(63)
EndIf

;Shut down if BoSM04 has been completed.
if ((BoSM04.IsCompleted()) || (BoSPlayerRank.GetValue() == -1))
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Virgil Auto Const

Faction Property VirgilFaction Auto Const

Faction Property PlayerFaction Auto Const

RefCollectionAlias Property Alias_Turrets Auto Const

Faction Property DN053TurretFaction Auto Const

Scene Property DN053VirgilStage75_Scene_Suicidal Auto Const

Quest Property BoSM04 Auto Const

Quest Property BoSM04Postquest Auto Const

ReferenceAlias Property Alias_VirgilsSerum Auto Const

GlobalVariable Property XPFactionSmall Auto Const

ReferenceAlias Property Alias_Virgil_Supermutant Auto Const

ReferenceAlias Property Alias_Virgil_Human Auto Const

ReferenceAlias Property Alias_VirgilsGun Auto Const

Cell Property VirgilsLab01 Auto Const

ObjectReference Property DN053_VirgilsTrunk Auto Const

GlobalVariable Property BoSPlayerRank Auto Const

ObjectReference Property MQ204VirgilInteriorMarkerRef Auto Const

Location Property VirgilsLab Auto Const

GlobalVariable Property XPRadiant Auto Const

ObjectReference Property pDN053VirgilFurnitureSwapEnabler Auto Const

ObjectReference Property DN053_PostCureMusicTrigger Auto Const

Quest Property CustomItemQuest Auto Const

Faction Property DN053_VirgilFaction Auto Const Mandatory

Scene Property DN053_Virgil_Stage80_Attack Auto Const Mandatory
