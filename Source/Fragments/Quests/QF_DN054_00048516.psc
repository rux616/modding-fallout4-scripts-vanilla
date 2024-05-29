;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN054_00048516 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Alias_RowdyContainer.getRef().AddItem(Alias_RowdysGun.getRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Stop DN054 Random encounter if running
if pREObjectJSDN054.isrunning() == true
   pREObjectJSDN054.stop()
endif

;start Atom Cats radio quest, toggle global to enable songs for DC Radio
pDN054Radio.start()
pRadioDCTrackReady.setValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Alias_Zeke.getActorReference().EvaluatePackage()
Alias_DragRaceCat.getActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;pDN054WaitForPlayerScene.start()
pDN054CatsGatherPostRaceScene.start()
if  Alias_Zeke.getActorReference().isinCombat() == false
    Alias_Zeke.getActorReference().SwitchtoPowerArmor(none)
endif
Alias_Zeke.getActorReference().EvaluatePackage()


;Disable Compaion Commentary on the drag race
CompanionCommentMarkerDisabler.disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Zeke.getActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_Zeke.getActorReference().EvaluatePackage()
Alias_DN054Rowdy.getActorReference().EvaluatePackage()

if (pDN054.hasObjective(5)) == true && (pDN054.isObjectiveCompleted(5)) ==false
    setObjectiveCompleted(5)
endif

setObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
setObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_PumpWidget.getRef().enable()
game.getPlayer().AddItem(Alias_PumpWidget.getRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
setObjectiveDisplayed(20)
pDN054PumpTrigger.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
game.getPlayer().RemoveItem(Alias_PumpWidget.getRef())
pDn054WarwickPumpPart.Enable()

setObjectiveCompleted(20)
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
game.getplayer().additem(pMirelurkCake, 5)

Alias_Zeke.getActorReference().switchtoPowerArmor(zekePostRepairPowerArmor)
Alias_Zeke.getActorReference().EvaluatePackage()

Alias_JuneWarwick.getActorReference().setEssential(false)
Alias_JuneWarwick.Clear()
Alias_JuneWarwick.RemoveFromRef(Alias_JuneWarwick.getActorReference())

setObjectiveCompleted(30)
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
setObjectiveCompleted(40)
pDN054GunnersWarnScene.start()
Alias_Dn054GunnersEnabler.getReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
setObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
setObjectiveCompleted(50)
setObjectiveDisplayed(60)

Alias_Zeke.getActorReference().EvaluatePackage()
Alias_DN054Rowdy.getActorReference().EvaluatePackage()
Alias_DN054Roxy.getActorReference().EvaluatePackage()
Alias_DN054Bluejay.getActorReference().EvaluatePackage()
Alias_DN054JohnnyD.getActorReference().EvaluatePackage()
Alias_DN054Duke.getActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
setObjectiveCompleted(60)


;Game.RewardPlayerXP(pXPMiscQuestSmall.GetValue() as int)
game.getPlayer().AddItem(pClothesGreaserJacketAtomCats, 1, false)
Game.getplayer().addperk(pDN054AtomCatsPerk)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Zeke Auto Const

ReferenceAlias Property Alias_RaceTrigger Auto Const

ReferenceAlias Property Alias_BasicGun Auto Const

ReferenceAlias Property Alias_RowdysGun Auto Const

ReferenceAlias Property Alias_RowdyContainer Auto Const

ReferenceAlias Property Alias_WaldenDropbox Auto Const

ReferenceAlias Property Alias_Gunner01 Auto Const

ReferenceAlias Property Alias_Gunner02 Auto Const

ReferenceAlias Property Alias_Gunner03 Auto Const

Scene Property pDN054WaitForPlayerScene Auto Const

ReferenceAlias Property Alias_DragRaceCat Auto Const

ReferenceAlias Property Alias_DN054GunnersEnabler Auto Const

ObjectReference Property CompanionCommentMarkerDisabler Auto Const

Quest Property pDN054 Auto Const

Scene Property pDN054CatsGatherPostRaceScene Auto Const

ReferenceAlias Property Alias_DN054Rowdy Auto Const

ReferenceAlias Property Alias_PumpWidget Auto Const

ObjectReference Property pDN054WarwickPumpPart Auto Const

ObjectReference Property pDN054PumpTrigger Auto Const

Potion Property pMirelurkCake Auto Const

Scene Property pDN054GunnersWarnScene Auto Const

ReferenceAlias Property Alias_DN054Roxy Auto Const

ReferenceAlias Property Alias_Dn054Bluejay Auto Const

ReferenceAlias Property Alias_DN054Duke Auto Const

Alias Property DN054JohnnyD Auto Const

ReferenceAlias Property Alias_DN054JohnnyD Auto Const

Armor Property pClothesGreaserJacketAtomCats Auto Const

GlobalVariable Property pXPRadiant Auto Const

Quest Property pREObjectJSDN054 Auto Const

Perk Property pDN054AtomCatsPerk Auto Const

Quest Property pDN054Radio Auto Const

GlobalVariable Property pRadioDCTrackReady Auto Const

ObjectReference Property zekePostRepairPowerArmor Auto Const

ReferenceAlias Property Alias_JuneWarwick Auto Const Mandatory
