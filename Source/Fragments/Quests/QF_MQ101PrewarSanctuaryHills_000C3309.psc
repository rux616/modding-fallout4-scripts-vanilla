;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ101PrewarSanctuaryHills_000C3309 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
pMQ101_Sanctuary_CitizensRun.Start()

;make sure the vault gate fence cannot be activated
Alias_VaultGateFence.GetRef().BlockActivation(True, True)

Alias_VertibirdD.GetActorRef().BlockActivation(True, True)
;Alias_VertibirdD.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
pMQ101_Sanctuary_NeighborScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
pMQ101_Sanctuary_NeighborScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
pMQ101_Sanctuary04_NeighborScene03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
pMQ101_Sanctuary06_LineScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
pMQ101_Sanctuary05_NeighborScene05.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
pMQ101_Sanctuary07_ElevatorScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;close fence gate
;don't close gate
;Alias_VaultGateFence.GetRef().SetOpen(False)

;move spouse if needed
Actor SpouseREF = Alias_ActiveSpouse.GetActorRef()
If GetStageDone(72) == 0
  SpouseREF.moveto(MQ101SpouseGateFailsafeMarker)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
MQ101_Sanctuary07_ElevatorScene01.Stop()
MQ101_Sanctuary08_UniformShouts.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN CODE
;MQ101_Sanctuary08_EveryoneInPosition.Start()
MQ101.setStage(490)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
MQ101_Sanctuary08_EveryoneInPosition.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_VertibirdA_Soldier01.GetActorRef().EvaluatePackage()
Alias_VertibirdA_Soldier02.GetActorRef().EvaluatePackage()
;Alias_VertibirdA.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
MQ101_Sanctuary04_SoldierDirection01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
MQ101_Sanctuary04_SoldierDirection02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
MQ101_Sanctuary05_SoldierShouts02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
MQ101_Sanctuary04_SpouseShouts.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Alias_VertibirdC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
MQ101_Sanctuary04_SpouseShouts.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE MQ101SanctuaryHillScript
Quest __temp = self as Quest
MQ101SanctuaryHillScript kmyQuest = __temp as MQ101SanctuaryHillScript
;END AUTOCAST
;BEGIN CODE
MQ101.SetStage(435)

kmyQuest.PlayerCrossesBridge()

Alias_VertibirdC.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
;spouse shouts
MQ101_Sanctuary04_SpouseShouts.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
Alias_SoldierVaultOperator.GetActorRef().EvaluatePackage()
Alias_UniformSoldier03.GetActorRef().EvaluatePackage()
Alias_ElevatorVaultTec01.GetActorRef().EvaluatePackage()
Alias_ElevatorVaultTec02.GetActorRef().EvaluatePackage()
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

Scene Property pMQ101_Sanctuary_CitizensRun Auto Const

Scene Property pMQ101_Sanctuary_NeighborScene01 Auto Const

Scene Property pMQ101_Sanctuary_NeighborScene02 Auto Const

Scene Property pMQ101_Sanctuary06_LineScene01 Auto Const

Scene Property pMQ101_Sanctuary04_NeighborScene03 Auto Const

Scene Property pMQ101_Sanctuary05_NeighborScene05 Auto Const

Scene Property pMQ101_Sanctuary07_ElevatorScene01 Auto Const

ReferenceAlias Property Alias_VertibirdA_Soldier01 Auto Const

ReferenceAlias Property Alias_VertibirdA_Soldier02 Auto Const

Quest Property MQ101 Auto Const

ReferenceAlias Property Alias_MrSumner Auto Const

Scene Property MQ101_Sanctuary04_SpouseShouts Auto Const

ReferenceAlias Property Alias_MrsParker Auto Const

Scene Property MQ101_Sanctuary04_SoldierDirection02 Auto Const

Scene Property MQ101_Sanctuary04_SoldierDirection01 Auto Const

ReferenceAlias Property Alias_VertibirdC Auto Const

ReferenceAlias Property Alias_VaultGateFence Auto Const

Scene Property MQ101_Sanctuary05_SoldierShouts02 Auto Const

ReferenceAlias Property Alias_VertibirdD Auto Const

Scene Property MQ101_Sanctuary07_ElevatorScene01 Auto Const

Scene Property MQ101_Sanctuary08_EveryoneInPosition Auto Const

ReferenceAlias Property Alias_MrDonoghue Auto Const

Scene Property MQ101_Sanctuary08_UniformShouts Auto Const

ReferenceAlias Property Alias_SoldierVaultOperator Auto Const

ReferenceAlias Property Alias_UniformSoldier03 Auto Const

ReferenceAlias Property Alias_ElevatorVaultTec01 Auto Const

ReferenceAlias Property Alias_ElevatorVaultTec02 Auto Const

ReferenceAlias Property Alias_ActiveSpouse Auto Const

ObjectReference Property MQ101SpouseGateFailsafeMarker Auto Const

ReferenceAlias Property Alias_MrAble Auto Const

ReferenceAlias Property Alias_MrsAble Auto Const

ReferenceAlias Property Alias_MrWhitfield Auto Const

ReferenceAlias Property Alias_MrsWhitfield Auto Const

ReferenceAlias Property Alias_MrRussell Auto Const
