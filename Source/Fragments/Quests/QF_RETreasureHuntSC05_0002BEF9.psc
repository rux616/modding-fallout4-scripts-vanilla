;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETreasureHuntSC05_0002BEF9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;This is one of the Treasure Hunt RE Subquests.
;All of the _Treasure quests are started indirectly by a single master quest,
;RESceneTreasureHuntMaster, which limits their frequency, handles the actual trigger
;loading/unloading, and otherwise serves as the 'real' RE quest here.

;debug.trace(self + " STARTING")

;Notify the master quest that this is the active subquest.
RESceneTreasureHuntMaster.TreasureHuntSubquest = (Self as Quest)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;This stage is set by the master quest when its trigger unloads.
;Did the player find the note? If not, shut down. If so, we might still want to clean up.
if (GetStage() < 30)
     ;Player didn't find the note, so shut down.
     Stop()
Else
     ;Optionally, do any additional cleanup here.
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Player takes the note.
;- Begin preserving instance data.
;- Add the reward to its container.
RETreasureHuntSC05_Reward.Start()
;- Add the reward to the boss, if any.
Actor Boss = Alias_DungeonBoss.GetActorRef()
if (Boss != None)
     Boss.AddItem(Alias_Weapon.GetReference())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Player reads the note. Display the objective.
SetObjectiveDisplayed(40)

;Add the dungeon to the map.
Alias_DungeonMapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Player finds the reward item. Complete objective and shut down.
if (GetStageDone(50) && GetStageDone(51))
     SetObjectiveCompleted(40)
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
;Player finds the reward item. Complete objective and shut down.
RETreasureHuntSC05_Reward.Stop()
Actor Boss =  Alias_DungeonBoss.GetActorRef()
if (GetStageDone(50) || (Boss == None) || (Boss.IsDisabled()))
     SetObjectiveCompleted(40)
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Stop the quest.
;debug.trace(self + " STOPPING")
RETreasureHuntSC05_Reward.Stop()
if (!GetStageDone(50))
     Alias_TempNoteContainer.GetReference().RemoveItem(Alias_Weapon.GetReference())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

RESceneTreasureHuntMasterScript Property RESceneTreasureHuntMaster Auto Const

ReferenceAlias Property Alias_TempNoteContainer Auto Const

ReferenceAlias Property Alias_NoteHolder Auto Const

ReferenceAlias Property Alias_Note Auto Const

ReferenceAlias Property Alias_RewardContainer Auto Const

Form Property RewardItems Auto Const

ReferenceAlias Property Alias_DungeonBoss Auto Const

ReferenceAlias Property Alias_Weapon Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

Quest Property RETreasureHuntSC05_Reward Auto Const Mandatory
