;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst307FightVertibirds_01009E05 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Enable the Vertibird Scout on startup.
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Enable the Vertibird Scout
Alias_VertibirdScout.TryToEnable()
Alias_VertibirdScoutPilot.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0029_Item_00
Function Fragment_Stage_0029_Item_00()
;BEGIN CODE
;Clean up the Vertibird Scout.
Actor vBird = Alias_VertibirdScout.GetReference() as Actor
vBird.EvaluatePackage()
Inst307Fight.RegisterForCleanup(vBird)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Enable the Helipad Vertibird
Alias_Vertibird01.TryToEnable()
Alias_Vertibird01Pilot.TryToEnable()
Alias_Vertibird01Gunner.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0039_Item_00
Function Fragment_Stage_0039_Item_00()
;BEGIN CODE
;Clean up the Helipad Vertibird
Actor vBird = Alias_Vertibird01.GetReference() as Actor
vBird.EvaluatePackage()
Inst307Fight.RegisterForCleanup(vBird)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Enable the Tower Vertibird
Alias_Vertibird02.TryToEnable()
Alias_Vertibird02Pilot.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
;If Vertibird01 is still active when Vertibird02 is triggered, reuse it.
;No need to do anything here; the packages take care of it.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0049_Item_00
Function Fragment_Stage_0049_Item_00()
;BEGIN CODE
;Clean up the Tower Vertibird
Actor vBird = Alias_Vertibird02.GetReference() as Actor
vBird.EvaluatePackage()
Inst307Fight.RegisterForCleanup(vBird)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Clean up all of the Phase 1 Vertibirds
SetStage(29)
SetStage(39)
SetStage(49)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Enable the Vertibird Dropship
Alias_Vertibird03.TryToEnable()
Alias_Vertibird03Pilot.TryToEnable()
Alias_Vertibird03Gunner.TryToEnable()
Alias_Vertibird03Knight1.TryToEnable()
Alias_Vertibird03Knight2.TryToEnable()

;Play its scene, causing it to land.
Inst307FightVertibirds_Vertibird03InitialScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
Alias_Vertibird03Knight1.TryToEvaluatePackage()
Alias_Vertibird03Knight2.TryToEvaluatePackage()
Alias_Vertibird03.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0069_Item_00
Function Fragment_Stage_0069_Item_00()
;BEGIN CODE
;Clean up the Dropship Vertibird
Actor vBird = Alias_Vertibird03.GetReference() as Actor
vBird.EvaluatePackage()
Inst307Fight.RegisterForCleanup(vBird)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Enable Maxson's Vertibird
;Alias_Vertibird04.TryToEnable()
;Alias_Vertibird04Pilot.TryToEnable()
;Alias_Vertibird04Knight1.TryToEnable()

;Play its scene, sending it to drop Maxson off.
Inst307FightVertibirds_Vertibird04InitialScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0079_Item_00
Function Fragment_Stage_0079_Item_00()
;BEGIN CODE
;Clean up Maxson's Vertibird
Actor vBird = Alias_Vertibird04.GetReference() as Actor
vBird.EvaluatePackage()
Inst307Fight.RegisterForCleanup(vBird)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_VertibirdScout Auto Const
ReferenceAlias Property Alias_VertibirdScoutPilot Auto Const

ReferenceAlias Property Alias_Vertibird01 Auto Const
ReferenceAlias Property Alias_Vertibird01Pilot Auto Const
ReferenceAlias Property Alias_Vertibird01Gunner Auto Const


Inst307FightQuestScript Property Inst307Fight Auto Const

ReferenceAlias Property Alias_Vertibird02 Auto Const

ReferenceAlias Property Alias_Vertibird02Pilot Auto Const

ReferenceAlias Property Alias_Vertibird03 Auto Const

ReferenceAlias Property Alias_Vertibird03Pilot Auto Const

ReferenceAlias Property Alias_Vertibird03Gunner Auto Const

ReferenceAlias Property Alias_Vertibird03Knight1 Auto Const

ReferenceAlias Property Alias_Vertibird03Knight2 Auto Const

ReferenceAlias Property Alias_Vertibird04 Auto Const

ReferenceAlias Property Alias_Vertibird04Pilot Auto Const

ReferenceAlias Property Alias_Vertibird04Knight1 Auto Const

Scene Property Inst307FightVertibirds_Vertibird03InitialScene Auto Const

Scene Property Inst307FightVertibirds_Vertibird04InitialScene Auto Const
