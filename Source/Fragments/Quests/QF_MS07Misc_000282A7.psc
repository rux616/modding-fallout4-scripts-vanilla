;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS07Misc_000282A7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MQ105_001_NickEscortToDiamondCity.Stop()
Alias_Nick.GetActorRef().Moveto(NickOfficeMovetoMarker)

;Ellie is now happy
Actor EllieREF = Alias_Ellie.GetActorRef()
EllieREF.ChangeAnimArchetype(pAnimArchetypeFriendly)
EllieREF.ChangeAnimFaceArchetype(AnimFaceArchetypeFriendly)

;Enable the detective case files and block their activation
ObjectReference CaseFileA = Alias_CaseFileA.GetRef()
ObjectReference CaseFileB = Alias_CaseFileB.GetRef()

CaseFileA.Enable()
CaseFileB.Enable()

CaseFileA.BlockActivation(true, true)
CaseFileB.BlockActivation(true, true)

;run scene with her and Nick
pMS07MiscScene.Start()

;player can now take things in the office
Game.GetPlayer().AddToFaction(DmndValentinesOwnerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Ellie.GetActorRef().EvaluatePackage()

;update objectives
MQ105.SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

If (DialogueDiamondCity as DialogueDiamondCityScript).EllieSP_Var == 1
  PlayerREF.AddItem(Caps001, 125)
ElseIf (DialogueDiamondCity as DialogueDiamondCityScript).EllieSP_Var == 2
  PlayerREF.AddItem(Caps001, 150)
ElseIf (DialogueDiamondCity as DialogueDiamondCityScript).EllieSP_Var == 3
  PlayerREF.AddItem(Caps001, 200)
Else
  PlayerREF.AddItem(Caps001, 100)
EndIf

PlayerREF.addItem(ClothesValentineHat)
PlayerREF.AddItem(ClothesValentineCoat)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
MQ105.SetStage(30)

;shutdown the quest here. stage is 400 ahead of 350
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Prime MS07 and MS07c quests
MS07.SetStage(2)
MS07c.SetStage(2)
MS07cGreetingHandler.SetStage(2)

;Reenable the case files
Alias_CaseFileA.GetRef().BlockActivation(false)
Alias_CaseFileB.GetRef().BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Ellie Auto Const

Keyword Property pAnimArchetypeFriendly Auto Const

Scene Property pMS07MiscScene Auto Const

Scene Property pMS07MiscSceneAlt Auto Const

ReferenceAlias Property Alias_Nick Auto Const

ObjectReference Property pEllieStartMarker Auto Const

Keyword Property AnimFaceArchetypeFriendly Auto Const

Faction Property CurrentCompanionFaction Auto Const

Quest Property MQ105 Auto Const

Package Property MQ105NickFollowPlayerOnlyInDiamondCity Auto Const

Quest Property DialogueDiamondCity Auto Const

MiscObject Property Caps001 Auto Const

Quest Property MS07 Auto Const

Quest Property MS07c Auto Const

Quest Property MS07cGreetingHandler Auto Const

ObjectReference Property NickOfficeMovetoMarker Auto Const

Armor Property ClothesValentineHat Auto Const

Armor Property ClothesValentineCoat Auto Const

ReferenceAlias Property Alias_CaseFileA Auto Const

ReferenceAlias Property Alias_CaseFileB Auto Const

Scene Property MQ105_001_NickEscortToDiamondCity Auto Const

Faction Property DmndValentinesOwnerFaction Auto Const Mandatory
