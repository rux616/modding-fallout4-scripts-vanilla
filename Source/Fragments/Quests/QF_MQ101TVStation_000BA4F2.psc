;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ101TVStation_000BA4F2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE MQ101TVStationScript
Quest __temp = self as Quest
MQ101TVStationScript kmyQuest = __temp as MQ101TVStationScript
;END AUTOCAST
;BEGIN CODE
;play commcercial at first, then transition to news
kmyquest.RegisterForAnimationEvent(Alias_PlayerTV.GetRef(), "comEnd")
Alias_PlayerTV.GetRef().playAnimation ("com")

;disable the radio transmitter
Alias_TVStation.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
MQ101TV_001_Weather.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_PlayerTV.GetRef().playAnimation("IndianHead")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_PlayerTV.GetRef().playAnimation("IndianHeadBeep")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
MQ101TV_001_Weather.Stop()
MQ101TV_001a_Rant1.Stop()
MQ101TV_002_Sports.Stop()
MQ101TV_002b_Economics.Stop()
MQ101TV_003_News.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_PlayerTV.GetRef().playAnimation("EndOfTheWorld")
MQ101TV_004_Interruption.Start()
MUSSpecialChargenTVAnnouncement.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
pMQ101.setStage(305)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_PlayerTV.GetRef().playAnimation("EndOfTheWorldEnd")
pMQ101.SetStage(310)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMQ101 Auto Const

Scene Property MQ101TV_001_Weather Auto Const

ReferenceAlias Property Alias_PlayerTV Auto Const

Scene Property MQ101TV_004_Interruption Auto Const


Scene Property MQ101TV_001a_Rant1 Auto Const

Scene Property MQ101TV_002_Sports Auto Const

Scene Property MQ101TV_003_News Auto Const

MusicType Property MUSSpecialChargenTVAnnouncement Auto Const

Scene Property MQ101TV_002b_Economics Auto Const

ReferenceAlias Property Alias_TVStation Auto Const
