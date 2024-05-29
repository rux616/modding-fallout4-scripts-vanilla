;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN143_000FCB15 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set from Set Stage Trigger
SetObjectiveDisplayed(100); Complete "Explore Vault 75"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set when first accessing either Lab Door without the key
SetObjectiveDisplayed(100, false); Remove "Explore Vault 75" Objective
SetObjectiveDisplayed(200); Display "Find Lab Access Password", point at actor holding key
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set when picking up Lab Access key
SetObjectiveDisplayed(100, false); Remove "Explore Vault 75" Objective
SetObjectiveCompleted(200); Complete "Find Lab Access Password"
SetObjectiveDisplayed(300); Display "Access Laboratory Area"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Set when unlocking either Lab Access Door
SetObjectiveCompleted(300); Complete "Access Laboratory Area"
SetObjectiveDisplayed(400); Display "Explore Laboratory"
Alias_LabCard01.Clear()
Alias_LabCard02.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set when first accessing either Admin Door without the key
SetObjectiveDisplayed(400, false); Remove "Explore Laboratory" Objective
SetObjectiveDisplayed(500); Display "Find Overseer Access Password", point at actor holding key
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Set when picking up Admin Access key
SetObjectiveDisplayed(400, false); Remove "Explore Laboratory" Objective
SetObjectiveCompleted(500); Complete "Find Overseer Access Password"
SetObjectiveDisplayed(600); Display "Access Overseer Area"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;Set when unlocking either Admin Access Door
SetObjectiveCompleted(600); Complete "Access Overseer Area"
SetObjectiveDisplayed(700); Display "Explore Overseer Area
Alias_AdminCard01.Clear()
Alias_AdminCard02.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Set after reading the Overseer's Terminal
SetObjectiveCompleted(700); Complete "Explore Overseer Area"
CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DN143StartCourse Auto Const

Scene Property DN143EndCourse Auto Const

ReferenceAlias Property Alias_LabCard01 Auto Const

ReferenceAlias Property Alias_LabCard02 Auto Const

ReferenceAlias Property Alias_AdminCard01 Auto Const

ReferenceAlias Property Alias_AdminCard02 Auto Const

ReferenceAlias Property Alias_AdminKeyHolder01 Auto Const

ReferenceAlias Property Alias_AdminKeyHolder02 Auto Const
