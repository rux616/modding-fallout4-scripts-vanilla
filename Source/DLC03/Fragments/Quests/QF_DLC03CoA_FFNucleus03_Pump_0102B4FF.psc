;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_FFNucleus03_Pump_0102B4FF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_RepairTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(DLC03_FFNucleus03_PumpRegulator, 10)
DLC03_FFNucleus03_PumpState.SetValue(1)
DLC03CoA_FFNucleus03_RepairDecom.Show()
Alias_RepairTrigger.GetRef().BlockActivation(true, true)
Alias_WaterSoundMarker.GetRef().Enable()
DLC03QSTNucleusGeneratorWaterActivate.Play(PumpStartupSoundMarker)

;if FFNucleus03 is still running, update appropriate stage
if DLC03CoA_FFNucleus03.IsRunning()
  DLC03CoA_FFNucleus03.SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(DLC03_FFNucleus03_PumpRegulator, 10)
DLC03_FFNucleus03_PumpState.SetValue(2)
DLC03CoA_FFNucleus03_InstallPump.Show()
Alias_RepairTrigger.GetRef().BlockActivation(true, true)
Alias_WaterSoundMarker.GetRef().Enable()
DLC03QSTNucleusGeneratorWaterActivate.Play(PumpStartupSoundMarker)

;if FFNucleus03 is still running, update appropriate stage
if DLC03CoA_FFNucleus03.IsRunning()
  DLC03CoA_FFNucleus03.SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DLC03_FFNucleus03_AllowArchConvos.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC03_FFNucleus03_PumpState Auto Const Mandatory

ReferenceAlias Property Alias_RepairTrigger Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus03 Auto Const Mandatory

Message Property DLC03CoA_FFNucleus03_RepairDecom Auto Const Mandatory

Message Property DLC03CoA_FFNucleus03_InstallPump Auto Const Mandatory

GlobalVariable Property DLC03_FFNucleus03_AllowArchConvos Auto Const Mandatory

ReferenceAlias Property Alias_WaterSoundMarker Auto Const Mandatory

ObjectReference Property PumpStartupSoundMarker Auto Const Mandatory

Sound Property DLC03QSTNucleusGeneratorWaterActivate Auto Const Mandatory

ReferenceAlias Property Alias_PumpRegulator Auto Const Mandatory

MiscObject Property DLC03_FFNucleus03_PumpRegulator Auto Const Mandatory
