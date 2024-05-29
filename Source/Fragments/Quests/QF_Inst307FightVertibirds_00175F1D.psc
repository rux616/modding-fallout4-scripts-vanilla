;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst307FightVertibirds_00175F1D Extends Quest Hidden Const

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

;Play its scene, forcing it to wait for the player before taking off.
Inst307FightVertibirds_Vertibird01Scene.Start()
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

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Clean up all of the Phase 1 Vertibirds
SetStage(29)
SetStage(39)
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

;Run its scene, causing it to land and drop off its passengers.
Inst307FightVertibirds_Vertibird03Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
;Move the two Knights on board the Vertibird into position.
ObjectReference Vertibird = Alias_Vertibird03.GetReference()
Actor Knight1 = Alias_Vertibird03Knight1.GetActorRef()
Actor Knight2 = Alias_Vertibird03Knight2.GetActorRef()
;Knight1.Disable()
Knight1.MoveTo(Vertibird)
Knight1.Enable()

;Knight2.Disable()
Knight2.MoveTo(Vertibird)
Knight2.Enable()

;Debug.Trace("Stage 61 Actors Enabled")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;Dropship Vertibird has landed and dropped of its passengers. Begin assault on the Gantry.
Alias_Vertibird03.TryToEvaluatePackage()
Alias_Vertibird03Pilot.TryToEvaluatePackage()
Alias_Vertibird03Gunner.TryToEvaluatePackage()
Alias_Vertibird03Knight1.TryToEvaluatePackage()
Alias_Vertibird03Knight2.TryToEvaluatePackage()
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
;Store local refs.
Actor Vertibird = Alias_Vertibird04.GetActorRef()
Actor Pilot = Alias_Vertibird04Pilot.GetActorRef()

;Enable Maxson's Vertibird
Vertibird.Enable()
Pilot.Enable()

;Ghost Maxson's Vertibird
Vertibird.SetGhost(True)
Pilot.SetGhost(True)

;Play its scene, holding it on the Prydwen until we're ready for it (Stage 71)
Inst307FightVertibirds_Vertibird04Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0071_Item_00
Function Fragment_Stage_0071_Item_00()
;BEGIN CODE
;Store local refs.
Actor Vertibird = Alias_Vertibird04.GetActorRef()
Actor Pilot = Alias_Vertibird04Pilot.GetActorRef()
Actor Knight1 = Alias_Vertibird04Knight1.GetActorRef()

;Move Maxson on board the Vertibird and into position.
;Knight1.Disable()
Knight1.MoveTo(Vertibird)
Knight1.Enable()

;Debug.Trace("Stage 71 Actors Enabled")

;Un-ghost Maxson's Vertibird
Vertibird.SetGhost(False)
Pilot.SetGhost(False)

;Run its scene, causing it to land and drop off its passengers.
Inst307FightVertibirds_Vertibird04Scene.Start()
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

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Clean up all Vertibirds. All of these stages should have been set by now, but make sure.
SetStage(29)
SetStage(39)
SetStage(69)
SetStage(79)

;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Inst307FightQuestScript Property Inst307Fight Auto Const

ReferenceAlias Property Alias_VertibirdScout Auto Const
ReferenceAlias Property Alias_VertibirdScoutPilot Auto Const

ReferenceAlias Property Alias_Vertibird01 Auto Const
ReferenceAlias Property Alias_Vertibird01Pilot Auto Const
ReferenceAlias Property Alias_Vertibird01Gunner Auto Const

ReferenceAlias Property Alias_Vertibird03 Auto Const
ReferenceAlias Property Alias_Vertibird03Pilot Auto Const
ReferenceAlias Property Alias_Vertibird03Gunner Auto Const
ReferenceAlias Property Alias_Vertibird03Knight1 Auto Const
ReferenceAlias Property Alias_Vertibird03Knight2 Auto Const

ReferenceAlias Property Alias_Vertibird04 Auto Const
ReferenceAlias Property Alias_Vertibird04Pilot Auto Const
ReferenceAlias Property Alias_Vertibird04Knight1 Auto Const

Scene Property Inst307FightVertibirds_Vertibird01Scene Auto Const
Scene Property Inst307FightVertibirds_Vertibird03Scene Auto Const
Scene Property Inst307FightVertibirds_Vertibird04Scene Auto Const

ObjectReference Property Inst307Vertibirds_Vertibird03_DisembarkMarker Auto Const
ObjectReference Property Inst307Vertibirds_Vertibird04_DisembarkMarker Auto Const
