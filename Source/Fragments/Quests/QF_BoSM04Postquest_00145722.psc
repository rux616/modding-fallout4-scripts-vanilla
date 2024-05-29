;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM04Postquest_00145722 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Move Dr. Li and the player to the airport and set the appropriate stages.
SetStage(1)
DN053.SetStage(31)
DN053.SetStage(50)
DN053.SetStage(51)
DN053.SetStage(52)
DN053.SetStage(55)
DN053.SetStage(60)
DN053.SetStage(61)
DN053.SetStage(62)
DN053.SetStage(65)
DN053.SetStage(66)
Game.GetPlayer().MoveTo(BoS301IngramGantryMarker)

;Which version are we testing?
SetStage(16) ;CHANGE THIS AS NEEDED

if (GetStageDone(15))
     DN053.SetStage(63)
Else
     DN053.SetStage(64)
EndIf

;Just kill DialogueInstutute so we don't have to listen to Li's Institute dialogue.
DialogueInstitute.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Set all of the preliminary stages and move Dr. Li.
BoSLiLeftInstitute.SetValue(1)
BoS203.SetStage(255)
BoS301.SetStage(90)
BoS301.SetStage(255)
Alias_Li.TryToEnable()
Alias_Li.TryToMoveTo(BoS301LiGantryMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Warp to Dr. Li.
Game.GetPlayer().MoveTo(BoS301IngramGantryMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;If the player is kicked out of the Brotherhood, fail and shut down the postquest.
FailAllObjectives()
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Display 'Tell Dr. Li about Virgil'
SetObjectiveDisplayed(15)

;This stage is also set when the Postquest is running (Stage 16) and Virgil is killed.
;Check if he's dead. If so, hide the objective to give her the note, which is no longer relevant.
if (Alias_Virgil.GetActorRef().IsDead())
     SetObjectiveDisplayed(16, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
;Wait for the quest to finish initializing, or the letter won't transfer correctly.
SetStage(10)

;Give the player the letter.
Game.GetPlayer().AddItem(Alias_NoteVirgilCured.GetReference())

;Display 'Give Virgil's Letter to Dr. Li'
SetObjectiveDisplayed(16)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Give the letter to Dr. Li, if the player had it and was supposed to give it.
if (GetStageDone(16) && !GetStageDone(15))
     Alias_Li.GetActorRef().AddItem(Alias_NoteVirgilCured.GetReference())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Fail any open objectives and the quest as a whole.
FailAllObjectives()

;Stop the quest
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Shut down the postquest.
CompleteAllObjectives()
CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NoteVirgilCured Auto Const

GlobalVariable Property BoSLiDialogueSolution Auto Const

Quest Property BoS203 Auto Const

Quest Property DN053 Auto Const

ReferenceAlias Property Alias_Li Auto Const

ObjectReference Property BoS301IngramGantryMarker Auto Const

ObjectReference Property BoS301LiGantryMarker Auto Const

Quest Property BoS301 Auto Const

GlobalVariable Property BoSLiLeftInstitute Auto Const

ReferenceAlias Property Alias_Virgil Auto Const

Quest Property DialogueInstitute Auto Const
