;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS07cTapes_0014A24C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Alias_BADTFLMapMarker.GetRef().AddToMap()
;Alias_MaldenMapMarker.GetRef().AddToMap()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Alias_FensMapMarker.GetRef().AddtoMap()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Alias_NahantMapMarker.GetRef().AddtoMap()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Alias_SouthBostonMapMarker.GetRef().AddtoMap()
;Alias_NatickMapMarker.GetRef().AddtoMap()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Alias_EastBostonMapMarker.GetRef().AddtoMap()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Alias_QuincyMapMarker.GetRef().AddtoMap()
;Alias_NahantMapMarker.GetRef().AddtoMap()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Alias_SouthBostonMapMarker.GetRef().AddtoMap()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Alias_CoastGuardMapMarker.GetRef().AddtoMap()
;Alias_SouthBostonMapMarker.GetRef().AddtoMap()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Alias_QuincyMapMarker.GetRef().AddtoMap()
;Alias_NatickMapMarker.GetRef().AddtoMap()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Alias_CoastGuardMapMarker.GetRef().AddtoMap()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Check the Natick and East Boston tapes. 
;If they haven't been picked up, shove them in aliases in MS07cPostQuestTapes

if !GetStageDone(85) && !MS07c.GetStageDone(85)
  if !MS07cPostQuestTapes.GetStageDone(10)
    MS07cPostQuestTapes.SetStage(10)
  endif

  PostQuest_Holotape06EastBoston.ForceRefTo(Alias_Holotape06EastBoston.GetRef())
endif

if !GetStageDone(115) && !MS07c.GetStageDone(115)
  if !MS07cPostQuestTapes.GetStageDone(10)
    MS07cPostQuestTapes.SetStage(10)
  endif

  PostQuest_Holotape04Natick.ForceRefTo(Alias_Holotape04Natick.GetRef())
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BADTFLMapMarker Auto Const

ReferenceAlias Property Alias_MaldenMapMarker Auto Const

ReferenceAlias Property Alias_QuincyMapMarker Auto Const

ReferenceAlias Property Alias_NatickMapMarker Auto Const

ReferenceAlias Property Alias_NahantMapMarker Auto Const

ReferenceAlias Property Alias_EastBostonMapMarker Auto Const

ReferenceAlias Property Alias_SouthBostonMapMarker Auto Const

ReferenceAlias Property Alias_FensMapMarker Auto Const

ReferenceAlias Property Alias_CoastGuardMapMarker Auto Const

Quest Property MS07c Auto Const

LocationAlias Property Alias_QuincyRuinsLocation Auto Const Mandatory

ReferenceAlias Property Alias_Holotape04Natick Auto Const Mandatory

ReferenceAlias Property PostQuest_Holotape04Natick Auto Const

ReferenceAlias Property Alias_Holotape06EastBoston Auto Const Mandatory

ReferenceAlias Property PostQuest_Holotape06EastBoston Auto Const

Quest Property MS07cPostQuestTapes Auto Const
