;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS07bPostQuest_0005F816 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Turn on scene trigger (unless MQ201 is running)
If MQ201.IsRunning() == False
  Alias_SceneTrigger.GetRef().Enable()
else
  setstage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Don't play final scene if player could be turning in MS07a
;debug.messagebox("Eval MS07b post scene")

NickEllieScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MS07bEllieKnowsMartysDead.SetValue(1)
self.setstage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property NickEllieScene Auto Const

GlobalVariable Property MS07bEllieKnowsMartysDead Auto Const

Quest Property MS07a Auto Const

ReferenceAlias Property Alias_Nick Auto Const

Location Property DiamondCityValentines Auto Const

ReferenceAlias Property Alias_SceneTrigger Auto Const Mandatory

Quest Property MQ201 Auto Const Mandatory
