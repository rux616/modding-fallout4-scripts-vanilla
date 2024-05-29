;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN050_00045770 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
pDN050ProctorScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
alias_DN050TestDoor01.getReference().SetOpen()
alias_enablemarkerTest01.getReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
pDN050ProctorTestScene01.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Game.RewardPlayerXP(pXPRadiant.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
alias_DN050TestDoor02.getReference().setOpen()
alias_enablemarkerTest01.getReference().disable()
alias_enablemarkerTest02.getReference().enable()
pDN050ProctorTestScene02.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Game.RewardPlayerXP(pXPRadiant.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
alias_DN050TestDoor03.getReference().setOpen()
alias_enablemarkerTest02.getReference().disable()
alias_enablemarkerTest03.getReference().enable()
pDN050ProctorTestScene03.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Game.RewardPlayerXP(pXPRadiant.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DN050Safe.unlock()
pMUSRewardShort.Add()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pDN050ProctorScene Auto Const

ReferenceAlias Property Alias_DN050TestDoor01 Auto Const

ReferenceAlias Property Alias_DN050TestDoor02 Auto Const

ReferenceAlias Property Alias_DN050TestDoor03 Auto Const

Scene Property pDN050ProctorTestScene01 Auto Const

Scene Property pDN050ProctorTestScene02 Auto Const

Scene Property pDN050ProctorTestScene03 Auto Const

ReferenceAlias Property Alias_EnableMarkerTest01 Auto Const

ReferenceAlias Property Alias_EnableMarkerTest02 Auto Const

ReferenceAlias Property Alias_EnableMarkerTest03 Auto Const

GlobalVariable Property pXPRadiant Auto Const

ObjectReference Property DN050Safe Auto Const

MusicType Property pMUSRewardShort Auto Const Mandatory
