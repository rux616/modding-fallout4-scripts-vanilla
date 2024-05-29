;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueGoodneighborEntra_00033583 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;If Nick's here, play additional scene, otherwise skip ahead
Actor NickREF = Alias_Nick.GetActorRef()

If NickREF.GetWorldSpace() == Goodneighbor
  pGoodneighborIntroNickScene01.Start()  
  SetStage(3)
Else
  SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
If GetStageDone(3) == 0
  GoodneighborIntroScene01B.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;advance the scene
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
GoodneighborIntroScene01A.Stop()
GoodneighborIntroScene01B.Stop()
GoodneighborIntroScene01C.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
pGoodneighborIntroScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
;if Finn isn't loaded for some reason, kill him
If Alias_Finn.getActorRef().Is3DLoaded() == False
  SetStage(24)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
GoodneighborIntroScene02B.Stop()
SetStage(50)
Alias_Finn.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Actor HancockREF = Alias_Hancock.GetActorRef()

HancockREF.SetGhost()
Alias_Finn.GetActorRef().SetGhost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_Hancock.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Hancock.GetActorRef().SetGhost(False)
Alias_Finn.GetActorRef().SetGhost(False)

SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_Hancock.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
GoodneighborIntroScene02B.Stop()
GoodneighborIntroScene04.Start()
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;we are considered to be done
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0097_Item_00
Function Fragment_Stage_0097_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0098_Item_00
Function Fragment_Stage_0098_Item_00()
;BEGIN CODE
SetStage(60)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Actor HancockREF = Alias_Hancock.GetActorRef()

;disable Finn
Alias_Finn.GetActorRef().Disable()

;Hancock can't remain ghosted
HancockREF.SetGhost(False)

;companions can now comment on goodneighbor
GoodneighborCompanionCommentEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Finn Auto Const

ReferenceAlias Property Alias_Hancock Auto Const

Scene Property pGoodneighborIntroScene02 Auto Const

Quest Property pMQ04 Auto Const

Scene Property pGoodneighborIntroNickScene01 Auto Const

ReferenceAlias Property Alias_Nick Auto Const

Location Property pGoodneighborLocation Auto Const

Idle Property PairedKillGoodNeighbor Auto Const

Scene Property GoodneighborIntroScene01B Auto Const

Scene Property GoodneighborIntroScene01A Auto Const

Scene Property GoodneighborIntroScene01C Auto Const

Quest Property MQ104 Auto Const

WorldSpace Property Goodneighbor Auto Const

ObjectReference Property NickValentineGoodneighborMoveMarker Auto Const

Scene Property GoodneighborIntroScene04 Auto Const

Scene Property GoodneighborIntroScene02B Auto Const

Faction Property CurrentCompanionFaction Auto Const

Weapon Property CompHancockKnife Auto Const

ObjectReference Property GoodneighborCompanionCommentEnableMarker Auto Const Mandatory
