;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueGoodneighbor_00033582 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
VaultTecGhoulWalkHallwayScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
Alias_VaultTecGhoul.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_VaultTecGhoul.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;also set that we've talked to him
SetStage(20)

;he is now friendly
actor vaultTecGhoul = Alias_VaultTecGhoul.GetActorRef()

vaultTecGhoul.ChangeAnimArchetype(AnimArchetypeFriendly)
vaultTecGhoul.ChangeAnimFaceArchetype(AnimFaceArchetypeFriendly)
(vaultTecGhoul as WorkshopNPCScript).SetWorkshopStatus(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
pMQ104.SetStage(185)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
pMQ104.SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_Magnolia.GetActorRef().MoveTo(GoodneighborMagnoliaSingMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMQ104 Auto Const

ReferenceAlias Property Alias_VaultTecGhoul Auto Const

Keyword Property AnimArchetypeFriendly Auto Const

Keyword Property AnimFaceArchetypeFriendly Auto Const

Scene Property VaultTecGhoulWalkHallwayScene Auto Const

ObjectReference Property GoodneighborMagnoliaSingMarker Auto Const

ReferenceAlias Property Alias_Magnolia Auto Const
