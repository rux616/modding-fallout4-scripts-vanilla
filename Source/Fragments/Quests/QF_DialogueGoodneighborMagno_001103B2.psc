;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueGoodneighborMagno_001103B2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MagnoliaSongsScript
Quest __temp = self as Quest
MagnoliaSongsScript kmyQuest = __temp as MagnoliaSongsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PlaySong()

;make sure radio can play songs now too
RadioDCGoodneighborReady.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MagnoliaSongsScript
Quest __temp = self as Quest
MagnoliaSongsScript kmyQuest = __temp as MagnoliaSongsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StopAllSongs()
MagnoliaSong1.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE MagnoliaSongsScript
Quest __temp = self as Quest
MagnoliaSongsScript kmyQuest = __temp as MagnoliaSongsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StopAllSongs()
MagnoliaSong2.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE MagnoliaSongsScript
Quest __temp = self as Quest
MagnoliaSongsScript kmyQuest = __temp as MagnoliaSongsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StopAllSongs()
MagnoliaSong3.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE MagnoliaSongsScript
Quest __temp = self as Quest
MagnoliaSongsScript kmyQuest = __temp as MagnoliaSongsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StopAllSongs()
MagnoliaSong4.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE MagnoliaSongsScript
Quest __temp = self as Quest
MagnoliaSongsScript kmyQuest = __temp as MagnoliaSongsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StopAllSongs()
MagnoliaSong5.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MagnoliaSong1 Auto Const

Scene Property MagnoliaSong2 Auto Const

Scene Property MagnoliaSong3 Auto Const

Scene Property MagnoliaSong4 Auto Const

Scene Property MagnoliaSong5 Auto Const

GlobalVariable Property RadioDCGoodneighborReady Auto Const Mandatory
