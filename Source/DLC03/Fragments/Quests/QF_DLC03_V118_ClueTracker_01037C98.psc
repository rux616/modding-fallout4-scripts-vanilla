;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_V118_ClueTracker_01037C98 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_RedPaintCan.GetReference().SetDestroyed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
DLC03_CustomItemQuest.SetStage(70)
utility.wait(1.0)
Alias_BaseballBat.GetReference().SetNoFavorAllowed()
Alias_RedPaintCan.GetReference().SetNoFavorAllowed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
Alias_Clues.EnableAll()
DLC03_V118_SantiagoPaintClueRef.Disable()

;Set all the Case Files to use the blank text till they are displayed
;This is necessary because text replacement won't show up if the text icons preceeding it are not already filled.
;	EG: TextReplacement1	TextReplacement2    <- 2 will not show up if you replace it unless 1 has already been replaced as well



;/
kMyQuest.AddClue(Alias_CF_V118, "V118Clue1", DLC03_V118_CaseFile_Blank, true)
kMyQuest.AddClue(Alias_CF_V118, "V118Clue2", DLC03_V118_CaseFile_Blank, true)
kMyQuest.AddClue(Alias_CF_V118, "V118Clue3", DLC03_V118_CaseFile_Blank, true)
kMyQuest.AddClue(Alias_CF_V118, "V118Clue4", DLC03_V118_CaseFile_Blank, true)
kMyQuest.AddClue(Alias_CF_V118, "V118Clue5", DLC03_V118_CaseFile_Blank, true)
kMyQuest.AddClue(Alias_CF_V118, "V118Clue6", DLC03_V118_CaseFile_Blank, true)
kMyQuest.AddClue(Alias_CF_V118, "V118Clue7", DLC03_V118_CaseFile_Blank, true)
kMyQuest.AddClue(Alias_CF_V118, "V118Clue8", DLC03_V118_CaseFile_Blank, true)
kMyQuest.AddClue(Alias_CF_V118, "V118Clue9", DLC03_V118_CaseFile_Blank, true)
/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
Alias_BloodClues.DisableAll()

;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(10)

;If you haven't found out it's paint
if !GetStageDone(40)
	;kMyQuest.AddClue(Alias_CF_CSEzra, "CSEzraClue2", DLC03_V118_CaseFile_CSEzra_Clue2)
else
	;kMyQuest.AddClue(Alias_CF_CSEzra, "CSEzraClue2", DLC03_V118_CaseFile_CSEzra_Clue2a)
Endif

;If you have found all clues at Ezra's crime scene, set the stage on that quest to nudge the player onward
If GetStageDone(10) && GetStageDone(30) && GetStageDone(72)
	DLC03_V118_Quest.SetStage(380)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Increase the amount of blood/paint the player has found
kMyQuest.IncreaseBloodFound()

Alias_BloodClues.DisableAll()

;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(12)

;if you haven't already found the end of the trail & the other blood trail stages have not been done
if !GetStageDone(20) && !GetStageDone(11) && !GetStageDone(13)
	;If you haven't found out it's paint
	if !GetStageDone(40)
		;kMyQuest.AddClue(Alias_CF_CSEzra, "CSEzraClue2", DLC03_V118_CaseFile_CSEzra_Clue3)
	else
		;kMyQuest.AddClue(Alias_CF_CSEzra, "CSEzraClue2", DLC03_V118_CaseFile_CSEzra_Clue3a)
	Endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(30)

;kMyQuest.AddClue(Alias_CF_CSEzra, "CSEzraClue1", DLC03_V118_CaseFile_CSEzra_Clue1)

;If you have found all clues at Ezra's crime scene, set the stage on that quest to nudge the player onward
If GetStageDone(10) && GetStageDone(30) && GetStageDone(72)
	DLC03_V118_Quest.SetStage(380)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(40)
Alias_RedPaintCan.GetReference().SetDestroyed(false)

Alias_BloodClues.EnableAll()

If GetStageDone(20)
	;kMyQuest.AddClue(Alias_CF_CSEzra, "CSEzraClue3", DLC03_V118_CaseFile_CSEzra_Clue3c)
	;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue3_2", DLC03_V118_CaseFile_Keith_Clue3_2a)
	;kMyQuest.AddClue(Alias_CF_Gilda, "GildaClue3_2", DLC03_V118_CaseFile_Gilda_Clue3_2a)
Endif

DLC03_V118_SantiagoPaintClueRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
;kMyQuest.SetClueFoundAndStartScene(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
utility.wait(1.0)

;Tell the quest to queue the clue scene with this clue
If Alias_OverseersDoor.GetReference().IsLocked()
	kMyQuest.SetClueFoundAndStartScene(55)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue4", DLC03_V118_CaseFile_Keith_Clue4)

;If you have NOT found the bat
if !GetStageDone(72)
	kMyQuest.SetClueFoundAndStartScene(70)
else
	kMyQuest.SetClueFoundAndStartScene(71)
	;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue5", DLC03_V118_CaseFile_Keith_Clue5)
endif

;kMyQuest.AddClue(Alias_CF_CSEzra, "CSEzraClue4", DLC03_V118_CaseFile_CSEzra_Clue4)

if GetStageDone(12)
	SetStage(74)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0072_Item_00
Function Fragment_Stage_0072_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue

utility.wait(1.0)

If GetStageDone(10) && GetStageDone(30) && GetStageDone(72)
	DLC03_V118_Quest.SetStage(380)
Endif

if GetStageDone(70)
SetStage(74)
Endif

;If you have NOT found the case
if !GetStageDone(70)
	kMyQuest.SetClueFoundAndStartScene(72)
	;kMyQuest.AddClue(Alias_CF_Bert, "BertClue7", DLC03_V118_CaseFile_Bert_Clue7)
else
	kMyQuest.SetClueFoundAndStartScene(72)
	;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue5", DLC03_V118_CaseFile_Keith_Clue5)
	;kMyQuest.AddClue(Alias_CF_Bert, "BertClue7", DLC03_V118_CaseFile_Bert_Clue7a)
endif

;kMyQuest.AddClue(Alias_CF_CSEzra, "CSEzraClue5", DLC03_V118_CaseFile_CSEzra_Clue5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0074_Item_00
Function Fragment_Stage_0074_Item_00()
;BEGIN CODE
DLC03_V118_Quest.SetStage(391)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Ezra, "EzraClue4", DLC03_V118_CaseFile_Ezra_Clue4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Ezra was embezzling
kMyQuest.SetClueFoundAndStartScene(80)
;kMyQuest.AddClue(Alias_CF_Ezra, "EzraClue6", DLC03_V118_CaseFile_Ezra_Clue6)

DLC03_V118_Quest.SetStage(394)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(90)
;kMyQuest.AddClue(Alias_CF_Ezra, "EzraClue7", DLC03_V118_CaseFile_Ezra_Clue7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(91)
;kMyQuest.AddClue(Alias_CF_Ezra, "EzraClue7", DLC03_V118_CaseFile_Ezra_Clue7a)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0092_Item_00
Function Fragment_Stage_0092_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(92)
;kMyQuest.AddClue(Alias_CF_Ezra, "EzraClue8", DLC03_V118_CaseFile_Ezra_Clue8)
;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue6", DLC03_V118_CaseFile_CSSpencer_Clue6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0093_Item_00
Function Fragment_Stage_0093_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue8", DLC03_V118_CaseFile_CSSpencer_Clue8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
; Info about who is in what suite

;kMyQuest.AddClue(Alias_CF_Julianna, "SuiteNum", DLC03_V118_CaseFile_Julianna_ClueSuiteNum, true)
;kMyQuest.AddClue(Alias_CF_Keith, "SuiteNum", DLC03_V118_CaseFile_Keith_ClueSuiteNum, true)
;kMyQuest.AddClue(Alias_CF_Gilda, "SuiteNum", DLC03_V118_CaseFile_Gilda_ClueSuiteNum, true)
;kMyQuest.AddClue(Alias_CF_Bert, "SuiteNum", DLC03_V118_CaseFile_Bert_ClueSuiteNum, true)
;kMyQuest.AddClue(Alias_CF_Spencer, "SuiteNum", DLC03_V118_CaseFile_Spencer_ClueSuiteNum, true)
;kMyQuest.AddClue(Alias_CF_Ezra, "SuiteNum", DLC03_V118_CaseFile_Ezra_ClueSuiteNum, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;general info about bert and julianna
;kMyQuest.AddClue(Alias_CF_Julianna, "JuliannaClue1", DLC03_V118_CaseFile_Julianna_Clue1)
;kMyQuest.AddClue(Alias_CF_Julianna, "JuliannaClue2", DLC03_V118_CaseFile_Julianna_Clue2)
;kMyQuest.AddClue(Alias_CF_Julianna, "JuliannaClue3", DLC03_V118_CaseFile_Julianna_Clue3)

;kMyQuest.AddClue(Alias_CF_Bert, "BertClue1", DLC03_V118_CaseFile_Bert_Clue1)
;kMyQuest.AddClue(Alias_CF_Bert, "BertClue2", DLC03_V118_CaseFile_Bert_Clue2)
;kMyQuest.AddClue(Alias_CF_Bert, "BertClue3", DLC03_V118_CaseFile_Bert_Clue3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;General info about gilda and keith
;kMyQuest.AddClue(Alias_CF_Gilda, "GildaClue1", DLC03_V118_CaseFile_Gilda_Clue1)
;kMyQuest.AddClue(Alias_CF_Gilda, "GildaClue2", DLC03_V118_CaseFile_Gilda_Clue2)
;kMyQuest.AddClue(Alias_CF_Gilda, "GildaClue3", DLC03_V118_CaseFile_Gilda_Clue3)

;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue1", DLC03_V118_CaseFile_Keith_Clue1)
;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue2", DLC03_V118_CaseFile_Keith_Clue2)
;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue3", DLC03_V118_CaseFile_Keith_Clue3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0103_Item_00
Function Fragment_Stage_0103_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;general info about Santiago
;kMyQuest.AddClue(Alias_CF_Santiago, "SantiagoClue1", DLC03_V118_CaseFile_Santiago_Clue1)
;kMyQuest.AddClue(Alias_CF_Santiago, "SantiagoClue2", DLC03_V118_CaseFile_Santiago_Clue2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0104_Item_00
Function Fragment_Stage_0104_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
; general info about spencer lords
;kMyQuest.AddClue(Alias_CF_Spencer, "SpencerClue1", DLC03_V118_CaseFile_Spencer_Clue1)
;kMyQuest.AddClue(Alias_CF_Spencer, "SpencerClue2", DLC03_V118_CaseFile_Spencer_Clue2)
;kMyQuest.AddClue(Alias_CF_Spencer, "SpencerClue3", DLC03_V118_CaseFile_Spencer_Clue3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;General Info about Ezra

;kMyQuest.AddClue(Alias_CF_Ezra, "EzraClue1", DLC03_V118_CaseFile_Ezra_Clue1)
;kMyQuest.AddClue(Alias_CF_Ezra, "EzraClue2", DLC03_V118_CaseFile_Ezra_Clue2)
;kMyQuest.AddClue(Alias_CF_Ezra, "EzraClue3", DLC03_V118_CaseFile_Ezra_Clue3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0106_Item_00
Function Fragment_Stage_0106_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
; Spencer was killed several weeks before Ezra
;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue1", DLC03_V118_CaseFile_CSSpencer_Clue1)
;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue2", DLC03_V118_CaseFile_CSSpencer_Clue2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0107_Item_00
Function Fragment_Stage_0107_Item_00()
;BEGIN CODE
; Ezra didn't look into Spencers death
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0108_Item_00
Function Fragment_Stage_0108_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
; Julianna found the body
;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue3", DLC03_V118_CaseFile_CSSpencer_Clue3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
if !GetStageDone(250)
	;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue5", DLC03_V118_CaseFile_CSSpencer_Clue5)
	kMyQuest.SetClueFoundAndStartScene(210)
else
	;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue5", DLC03_V118_CaseFile_CSSpencer_Clue5a)
	;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue7", DLC03_V118_CaseFile_CSSpencer_Clue7a)
	kMyQuest.SetClueFoundAndStartScene(215)
endif

if GetStageDone(220) && GetStageDone(230) && GetStageDone(240)
	DLC03_V118_Quest.SetStage(360)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
if GetStageDone(210) && GetStageDone(230) && GetStageDone(240)
	DLC03_V118_Quest.SetStage(360)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
if GetStageDone(220) && GetStageDone(210) && GetStageDone(240)
	DLC03_V118_Quest.SetStage(360)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue4", DLC03_V118_CaseFile_CSSpencer_Clue4)
if GetStageDone(220) && GetStageDone(230) && GetStageDone(210)
	DLC03_V118_Quest.SetStage(360)
endif

kMyQuest.SetClueFoundAndStartScene(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
if GetStageDone(210)
	;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue7", DLC03_V118_CaseFile_CSSpencer_Clue7a)
	;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue5", DLC03_V118_CaseFile_CSSpencer_Clue5a)
	kMyQuest.SetClueFoundAndStartScene(255)
else
	;kMyQuest.AddClue(Alias_CF_CSSpencer, "CSSpencerClue7", DLC03_V118_CaseFile_CSSpencer_Clue7)
	kMyQuest.SetClueFoundAndStartScene(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(401)
;kMyQuest.AddClue(Alias_CF_Santiago, "SantiagoClue5", DLC03_V118_CaseFile_Santiago_Clue5)

;kMyQuest.AddClue(Alias_CF_CSEzra, "CSEzraClue6", DLC03_V118_CaseFile_CSEzra_Clue6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0402_Item_00
Function Fragment_Stage_0402_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Santiago, "SantiagoClue5", DLC03_V118_CaseFile_Santiago_Clue5a)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0403_Item_00
Function Fragment_Stage_0403_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
if !GetStageDone(602)
;kMyQuest.AddClue(Alias_CF_Santiago, "SantiagoClue3", DLC03_V118_CaseFile_Santiago_Clue3)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0404_Item_00
Function Fragment_Stage_0404_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Santiago, "SantiagoClue4", DLC03_V118_CaseFile_Santiago_Clue4)
kMyQuest.SetClueFoundAndStartScene(404)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Santiago, "SantiagoClue4", DLC03_V118_CaseFile_Santiago_Clue4a)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0501_Item_00
Function Fragment_Stage_0501_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
if !GetStageDone(601)
;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue6", DLC03_V118_CaseFile_Keith_Clue6)
endif

DLC03_V118_Quest.SetStage(627)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0502_Item_00
Function Fragment_Stage_0502_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
if !GetStageDone(702)
;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue8", DLC03_V118_CaseFile_Keith_Clue8)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0503_Item_00
Function Fragment_Stage_0503_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue5", DLC03_V118_CaseFile_Keith_Clue5a)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0601_Item_00
Function Fragment_Stage_0601_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue6", DLC03_V118_CaseFile_Keith_Clue6a)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0602_Item_00
Function Fragment_Stage_0602_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Santiago, "SantiagoClue3", DLC03_V118_CaseFile_Santiago_Clue3a)



SetStage(604)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0603_Item_00
Function Fragment_Stage_0603_Item_00()
;BEGIN CODE
SetStage(604)
SetStage(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0702_Item_00
Function Fragment_Stage_0702_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
if GetStageDone(502)
;kMyQuest.AddClue(Alias_CF_Keith, "KeithClue8", DLC03_V118_CaseFile_Keith_Clue8a)
endif

;Keith claims they are friends
if !GetStageDone(502)
;kMyQuest.AddClue(Alias_CF_Bert, "BertClue5", DLC03_V118_CaseFile_Bert_Clue5)
else
;kMyQuest.AddClue(Alias_CF_Bert, "BertClue5", DLC03_V118_CaseFile_Bert_Clue5a)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0703_Item_00
Function Fragment_Stage_0703_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Bert, "BertClue4", DLC03_V118_CaseFile_Bert_Clue4)
SetStage(701)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0704_Item_00
Function Fragment_Stage_0704_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Bert, "BertClue6", DLC03_V118_CaseFile_Bert_Clue6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0705_Item_00
Function Fragment_Stage_0705_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Bert, "BertClue8", DLC03_V118_CaseFile_Bert_Clue8)
SetStage(502)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0801_Item_00
Function Fragment_Stage_0801_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Ezra, "EzraClue6", DLC03_V118_CaseFile_Ezra_Clue6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0802_Item_00
Function Fragment_Stage_0802_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;kMyQuest.AddClue(Alias_CF_Ezra, "EzraClue6", DLC03_V118_CaseFile_Ezra_Clue6a)

;If you have heard Julianna and anyone elses version of the arguement
; you know she is acting strangely
if GetStageDone(802) && GetStageDone(803)
	SetStage(804)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0803_Item_00
Function Fragment_Stage_0803_Item_00()
;BEGIN CODE
;If you have heard Julianna and anyone elses version of the arguement
; you know she is acting strangely
if GetStageDone(802) && GetStageDone(803)
	SetStage(804)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



RefCollectionAlias Property Alias_Clues Auto Const Mandatory



ReferenceAlias Property Alias_RedPaintCan Auto Const Mandatory

Quest Property DLC03_V118_Quest Auto Const Mandatory




ReferenceAlias Property Alias_CF_V118 Auto Const Mandatory

Quest Property DLC03_CustomItemQuest Auto Const Mandatory




ObjectReference Property DLC03_V118_SantiagoPaintClueRef Auto Const Mandatory

RefCollectionAlias Property Alias_BloodClues Auto Const Mandatory

ReferenceAlias Property Alias_OverseersDoor Auto Const Mandatory

ReferenceAlias Property Alias_BaseballBat Auto Const Mandatory
