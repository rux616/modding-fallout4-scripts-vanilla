;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETreasureHuntSC01_0002BDE6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;This is one of the Treasure Hunt RE Subquests.
;All of the _Treasure quests are started indirectly by a single master quest, RESceneTreasureHuntMaster,
;which limits their frequency, handles the actual trigger loading/unloading, and otherwise
;serves as the 'real' RE quest here. The subquests don't even extend REScript.

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
RETreasureHuntSC01_Reward.Start()
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
SetObjectiveCompleted(40)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Stop the quest and its reward quest.
;debug.trace(self + " STOPPING")
RETreasureHuntSC01_Reward.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

RESceneTreasureHuntMasterScript Property RESceneTreasureHuntMaster Auto Const

ReferenceAlias Property Alias_Note Auto Const

ReferenceAlias Property Alias_NoteHolder Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const

Quest Property RETreasureHuntSC01_Reward Auto Const Mandatory
