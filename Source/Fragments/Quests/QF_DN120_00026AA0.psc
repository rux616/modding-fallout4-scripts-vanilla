;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN120_00026AA0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Set the synths to be unaggressive for initial scene
Alias_SynthBoss01.GetActorReference().SetValue(Aggression, 0)
Alias_SynthRefColl.SetValue(Aggression, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Check if DN120Misc is running. If so, set stage 100 to credit step to get key
If DN120Misc.IsRunning() == 1
    DN120Misc.SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Give the player the key and remove it from the robot's inventory
Alias_FrontDeskGreeter.GetActorRef().RemoveItem(DN120_ResidentKey)
Game.GetPlayer().AddItem(DN120_ResidentKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
; Enable the synths and scene triggers
Alias_SynthEnableMarker.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
; Start the Synth Greet scene
DN120_GreetSynthsScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
; Set the synths back to aggressive
Alias_SynthBoss01.GetActorRef().SetValue(Aggression, 2)
Alias_SynthRefColl.SetValue(Aggression, 2)

Alias_SynthBoss01.GetActorRef().EvaluatePackage()
Alias_SynthRefColl.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_FrontDeskGreeter Auto Const

Key Property DN120_ResidentKey Auto Const

ReferenceAlias Property Alias_SynthBoss01 Auto Const

RefCollectionAlias Property Alias_SynthRefColl Auto Const

ActorValue Property Aggression Auto Const

ReferenceAlias Property Alias_SynthEnableMarker Auto Const

Scene Property DN120_GreetSynthsScene Auto Const

Quest Property DN120Misc Auto Const
