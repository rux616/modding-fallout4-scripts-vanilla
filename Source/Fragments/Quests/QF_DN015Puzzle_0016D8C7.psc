;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN015Puzzle_0016D8C7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE DN015PuzzleScript
Quest __temp = self as Quest
DN015PuzzleScript kmyQuest = __temp as DN015PuzzleScript
;END AUTOCAST
;BEGIN CODE
CustomItemQuest.SetStage(230)

DN015_PuzzleTerminalRef.AddTextReplacementData("DN015LeftCompound", Alias_NoneName.GetReference().GetBaseObject())
DN015_PuzzleTerminalRef.AddTextReplacementData("DN015RightCompound", Alias_NoneName.GetReference().GetBaseObject())
DN015_PuzzleTerminalRef.AddTextReplacementData("DN015IsotopeCurrent", Alias_NoneName.GetReference().GetBaseObject())
kmyQuest.Init()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN015_PuzzleTerminalRef Auto Const

ReferenceAlias Property Alias_NoneName Auto Const

Quest Property CustomItemQuest Auto Const Mandatory
