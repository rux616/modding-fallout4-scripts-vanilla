;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN060_00182605 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_RobotMiddle.GetActorRef().SetUnconscious(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_RobotMower.GetActorRef().SetUnconscious(False)
Alias_RobotBaby.GetActorRef().SetUnconscious(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_RobotLaundry.GetActorRef().SetUnconscious(False)
Alias_RobotKitchen.GetActorRef().SetUnconscious(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_RobotGarage01.GetActorRef().SetUnconscious(False)
Alias_RobotGarage02.GetActorRef().SetUnconscious(False)
Alias_RobotGarage03.GetActorRef().SetUnconscious(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_SentryBot01.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN060_RobotGarage01 Auto Const

ReferenceAlias Property Alias_RobotGarage01 Auto Const

ReferenceAlias Property Alias_RobotGarage02 Auto Const

ReferenceAlias Property Alias_RobotGarage03 Auto Const

ReferenceAlias Property Alias_RobotLaundry Auto Const

ReferenceAlias Property Alias_RobotKitchen Auto Const

ReferenceAlias Property Alias_RobotMower Auto Const

ReferenceAlias Property Alias_RobotBaby Auto Const

ReferenceAlias Property Alias_RobotMiddle Auto Const

ReferenceAlias Property Alias_SentryBot01 Auto Const
