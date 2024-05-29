;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03AtomM01_EncounterHan_010247B3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03AtomM01EncounterQuestScript
Quest __temp = self as Quest
DLC03:DLC03AtomM01EncounterQuestScript kmyQuest = __temp as DLC03:DLC03AtomM01EncounterQuestScript
;END AUTOCAST
;BEGIN CODE
;Enable encounters and populate ref collection

ObjectReference Stag01 = Alias_Stag01.GetRef()
if SpringTrigger.bEffectActive
  debug.trace("Stag 01 enabled")
  Stag01.Enable()
endif
Alias_Encounters.AddRef(Stag01)

ObjectReference Stag02 = Alias_Stag02.GetRef()
if SpringTrigger.bEffectActive
  debug.trace("Stag 02 enabled")
  Stag02.Enable()
endif
Alias_Encounters.AddRef(Stag02)

ObjectReference Crawler01 = Alias_Crawler01.GetRef()
if SpringTrigger.bEffectActive
  debug.trace("Crawler 01 enabled")
  Crawler01.Enable()
endif
Alias_Encounters.AddRef(Crawler01)

ObjectReference Crawler02 = Alias_Crawler02.GetRef()
if SpringTrigger.bEffectActive
  debug.trace("Crawler 02 enabled")
  Crawler02.Enable()
endif
Alias_Encounters.AddRef(Crawler02)

ObjectReference Stag03 = Alias_Stag03.GetRef()
if SpringTrigger.bEffectActive
  Stag03.Enable()
endif
Alias_Encounters.AddRef(Stag03)

ObjectReference Stag04 = Alias_Stag04.GetRef()
if SpringTrigger.bEffectActive
  debug.trace("Stag 04 enabled")
  Stag04.Enable()
endif
Alias_Encounters.AddRef(Stag04)

ObjectReference Stag05 = Alias_Stag05.GetRef()
if SpringTrigger.bEffectActive
  debug.trace("Stag 05 enabled")
  Stag05.Enable()
endif
Alias_Encounters.AddRef(Stag05)

ObjectReference Crawler03 = Alias_Crawler03.GetRef()
if SpringTrigger.bEffectActive
  debug.trace("Stag 05 enabled")
  Crawler03.Enable()
endif
Alias_Encounters.AddRef(Crawler03)

;Start up shutdown timer
kmyquest.StartShutdownTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_Stag01.GetActorRef().EvaluatePackage()
Alias_Stag02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_Stag01.GetRef().Disable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
Alias_Stag02.GetRef().Disable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_Stag03.GetActorRef().EvaluatePackage()
Alias_Stag04.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Alias_Crawler01.GetActorRef().EvaluatePackage()
Utility.Wait(0.5)
Alias_Crawler02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Utility.Wait(0.5)

Alias_Crawler02.GetActorRef().PlayIdle(IdleTongueDetect)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Actor FC = Alias_Crawler03.GetActorRef()

;Play distant cry if effect is active and get him moving
if SpringTrigger.bEffectActive
  DLC03NPCFogCrawlerDistantScreamA.Play(Game.GetPlayer())
endif

FC.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
Alias_Stag05.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0081_Item_00
Function Fragment_Stage_0081_Item_00()
;BEGIN CODE
Alias_Stag05.GetRef().Disable(true)
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

ReferenceAlias Property Alias_Stag01 Auto Const Mandatory

ReferenceAlias Property Alias_Stag02 Auto Const Mandatory

ReferenceAlias Property Alias_Crawler01 Auto Const Mandatory

ReferenceAlias Property Alias_Crawler02 Auto Const Mandatory

ReferenceAlias Property Alias_Stag03 Auto Const Mandatory

ReferenceAlias Property Alias_Stag04 Auto Const Mandatory

ReferenceAlias Property Alias_Crawler03 Auto Const Mandatory

Scene Property DLC03AtomM01_EncounterHandler_MotherScene Auto Const Mandatory

ReferenceAlias Property Alias_Stag05 Auto Const Mandatory

Idle Property IdleTongueDetect Auto Const Mandatory

Scene Property DLC03AtomM01_EncounterHandler_MotherScene01 Auto Const Mandatory

RefCollectionAlias Property Alias_Encounters Auto Const Mandatory

ReferenceAlias Property Alias_SpringTrigger Auto Const Mandatory

DLC03:DLC03AtomSpringScript Property SpringTrigger Auto Const Mandatory

Sound Property DLC03NPCFogCrawlerDistantScreamA Auto Const Mandatory

ReferenceAlias Property Alias_Crawler03TravelMarker Auto Const Mandatory
