;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestVertibirdKMK_001B01D0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; enable passengers
Alias_Pilot.TryToEnable()
Alias_Gunner.TryToEnable()
Alias_Attacker01.TryToEnable()
Alias_Attacker02.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Attacker01Links Auto Const
ReferenceAlias Property Alias_Attacker02Links Auto Const
ReferenceAlias Property Alias_Attacker03Links Auto Const
ReferenceAlias Property Alias_Attacker04Links Auto Const
ReferenceAlias Property Alias_Attacker05Links Auto Const
ReferenceAlias Property Alias_Defender01Links Auto Const
ReferenceAlias Property Alias_Defender02Links Auto Const
ReferenceAlias Property Alias_Defender03Links Auto Const
ReferenceAlias Property Alias_Defender04Links Auto Const
ReferenceAlias Property Alias_Defender05Links Auto Const

ReferenceAlias Property Alias_MapMarker Auto Const

ReferenceAlias Property Alias_Pilot Auto Const

ReferenceAlias Property Alias_Gunner Auto Const

ReferenceAlias Property Alias_Attacker01 Auto Const

ReferenceAlias Property Alias_Attacker02 Auto Const

ReferenceAlias Property Alias_Attacker03 Auto Const

ReferenceAlias Property Alias_Attacker04 Auto Const

ReferenceAlias Property Alias_Pilot02 Auto Const

ReferenceAlias Property Alias_Gunner02 Auto Const
