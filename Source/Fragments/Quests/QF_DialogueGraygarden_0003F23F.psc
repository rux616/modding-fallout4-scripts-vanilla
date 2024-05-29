;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueGraygarden_0003F23F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Set when Supervisor Browne has explained the farm activity
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Set when the player has refused to help Supervisor Browne with the farm activity
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN AUTOCAST TYPE DialogueGraygardenScript01
Quest __temp = self as Quest
DialogueGraygardenScript01 kmyQuest = __temp as DialogueGraygardenScript01
;END AUTOCAST
;BEGIN CODE
DialogueGraygardenGreeneTravelToCar.Start()
kmyquest.GreeneCar=1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN AUTOCAST TYPE DialogueGraygardenScript01
Quest __temp = self as Quest
DialogueGraygardenScript01 kmyQuest = __temp as DialogueGraygardenScript01
;END AUTOCAST
;BEGIN CODE
kmyquest.GreeneCar=0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE DialogueGraygardenScript01
Quest __temp = self as Quest
DialogueGraygardenScript01 kmyQuest = __temp as DialogueGraygardenScript01
;END AUTOCAST
;BEGIN CODE
kmyquest.GreeneCar=2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DialogueGraygardenScript01
Quest __temp = self as Quest
DialogueGraygardenScript01 kmyQuest = __temp as DialogueGraygardenScript01
;END AUTOCAST
;BEGIN CODE
;Give the player caps based on the quest variable "GreezePrize"
;This variable is set in Phase 2 of the scene "DialogueGraygardenBranchGreenePrize"

;Give 100 caps if the variable is 0
if kmyquest.GreenePrize == 0
     Game.GetPlayer().AddItem(Caps001, 100)
endif

;Give 150 caps if the variable is 1
if kmyquest.GreenePrize == 1
     Game.GetPlayer().AddItem(Caps001, 150)
endif

;Give 200 caps if the variable is 2
if kmyquest.GreenePrize == 2
     Game.GetPlayer().AddItem(Caps001, 200)
endif

;Give 300 caps if the variable is 3
if kmyquest.GreenePrize == 3
     Game.GetPlayer().AddItem(Caps001, 300)
endif

;Set the GreeneCar variable back to 0, which will return SupervisorGreene to normal wrkshop packages and dialogue
kmyquest.GreeneCar=0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Set in Supervisor Brown's say once hello where he mentions the farm activity
;Used as a condition in dialogue so he uses the repeating reminder hello instead of the one that introduces the subject
;This hello will no longer play when the player owns the farm
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Set in Greene's initial hello
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Caps001 Auto Const

Scene Property DialogueGraygardenGreeneTravelToCar Auto Const
