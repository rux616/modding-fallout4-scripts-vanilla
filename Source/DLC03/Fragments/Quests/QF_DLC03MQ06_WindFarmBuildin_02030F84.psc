;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ06_WindFarmBuildin_02030F84 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;if MQ06 is running, update appropriate stage
if DLC03MQ06.IsRunning()
  DLC03MQ06.SetStage(480)
endif

;Clear fuses from quest item aliases
Alias_Fuse01.Clear()
Alias_Fuse02.Clear()
Alias_Fuse03.Clear()
Alias_Fuse04.Clear()
Alias_Fuse05.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ06 Auto Const Mandatory

ReferenceAlias Property Alias_Fuse01 Auto Const Mandatory

ReferenceAlias Property Alias_Fuse02 Auto Const Mandatory

ReferenceAlias Property Alias_Fuse03 Auto Const Mandatory

ReferenceAlias Property Alias_Fuse04 Auto Const Mandatory

ReferenceAlias Property Alias_Fuse05 Auto Const Mandatory
