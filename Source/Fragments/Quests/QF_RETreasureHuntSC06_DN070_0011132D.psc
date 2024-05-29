;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETreasureHuntSC06_DN070_0011132D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;This is one of the Treasure Hunt RE Subquests.
;All of the _Treasure quests are started indirectly by a single master quest, RESceneSC01,
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
;Did the player interact with the encounter (attack the bugs or activate the body)?
;- If not, shut down.
;- If so, did they take the note or holotape?
;    - If so, shut down.
;    - If not, leave this running until they do, then handle the shutdown via stage 120.
if (!GetStageDone(30) || GetStageDone(40))
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;FLAG - Stage is set when the player attacks any of the Molerats
;or interacts with their corpses or Hadrian's body.
;
;Once set, we don't clean up the encounter until the player takes the note or holotape.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Set by the DefaultDummy created by this encounter when it unloads
;and Stage 40 has been set. It is now safe to clean up the encounter.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Stop the quest.
debug.trace(self + " STOPPING")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

RESceneTreasureHuntMasterScript Property RESceneTreasureHuntMaster Auto Const

ReferenceAlias Property Alias_Note Auto Const

ReferenceAlias Property Alias_RewardContainer Auto Const

Form Property RewardItems Auto Const

ReferenceAlias Property Alias_DungeonMapMarker Auto Const
