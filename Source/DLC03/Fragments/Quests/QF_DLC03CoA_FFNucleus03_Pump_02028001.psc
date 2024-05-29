;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_FFNucleus03_Pump_02028001 Extends Quest Hidden Const

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
DLC03_FFNucleus03_PumpState.SetValue(1)
Alias_RepairTrigger.GetRef().Disable()
DLC03CoA_FFNucleus03_RepairDecom.Show()

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
DLC03_FFNucleus03_PumpState.SetValue(2)
Alias_RepairTrigger.GetRef().Disable()
DLC03CoA_FFNucleus03_InstallPump.Show()

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
