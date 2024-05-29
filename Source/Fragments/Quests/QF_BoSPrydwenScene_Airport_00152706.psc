;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSPrydwenScene_Airport_00152706 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;If BoSKick out hasn't run, start scene.
if !BoSKickOut.GetStageDone(20) && !BoSKickOut.GetStageDone(30) && !Alias_AirportSoldier01.GetActorRef().IsDead() && !Alias_AirportSoldier02.GetActorRef().IsDead()

else
  ;Otherwise, if characters are unloaded, disable them and shut down quest
  if !Alias_AirportSoldier01.GetRef().Is3DLoaded() && !Alias_AirportSoldier02.GetRef().Is3DLoaded()
    debug.trace(self + "Shutdown guards")
    SetStage(50)
  else
    ;Or, mark them up to be disabled on unload
    debug.trace(self + "Set guards to disappear on unload")
    SetStage(15)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
BoSPrydwenScene_Airport_001.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Alias_AirportSoldier01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Make sure stage 12 gets set so other guard can walk away
SetStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;If other soldier has unloaded, close down quest

if self.GetStageDone(30)
  self.setstage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;If other soldier has unloaded, close down quest

if self.GetStageDone(20)
  self.setstage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Disable enable marker for scene, then shut this thang down

if !Alias_SceneTrigger.GetRef().IsDisabled()
  Alias_SceneTrigger.GetRef().Disable()
endif 

BoSAirportScene.Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_AirportSoldier01 Auto Const

ReferenceAlias Property Alias_AirportSoldier02 Auto Const

Scene Property BoSPrydwenScene_Airport_001 Auto Const

Quest Property BoSKickOut Auto Const

ObjectReference Property BoSAirportScene Auto Const

ReferenceAlias Property Alias_SceneTrigger Auto Const Mandatory
