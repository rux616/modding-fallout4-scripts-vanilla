;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueConcordArea_000179F3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
MQ102.SetStage(89)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;shut down the warning scene if it started
GrandmaMonkWarning.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
GrandmaMonkWarning.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
PlayerREF.AddItem(Game.GetCaps(), 100)
PlayerREF.AddItem(AmmoFusionCell, 50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Min01.SetStage(20)
; NOTE - Min01 needs to start here for packages, although it is actually setting stage 100 in Min00.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN CODE
; if MQ has already advanced past Diamond City, set stage 100 too
setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;shutdown MQ03
pMQ03.SetStage(200)

; get survivors moving to Sanctuary
debug.trace(self + "setting Min01 stage 50")
Min01.SetStage(50)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property GrandmaMonkWarning Auto Const

Quest Property pDialogueConcordSanctuarySurvivors Auto Const

ReferenceAlias Property Alias_GrandmaMonkAlias Auto Const

ReferenceAlias Property Alias_SturgesAlias Auto Const

ReferenceAlias Property Alias_PrestonGarveyAlias Auto Const

ReferenceAlias Property Alias_MarcyLongAlias Auto Const

ReferenceAlias Property Alias_JunLongAlias Auto Const

ReferenceAlias Property Alias_MuseumInsideEntranceMarker Auto Const

Quest Property pMQ03 Auto Const

Quest Property Min01 Auto Const

Quest Property MQ102 Auto Const

Scene Property PrestonStartScene Auto Const

Quest Property Min00 Auto Const

Ammo Property AmmoFusionCell Auto Const Mandatory
