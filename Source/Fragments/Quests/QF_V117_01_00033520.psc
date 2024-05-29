;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_V117_01_00033520 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_Ashes.GetActorRef().EvaluatePackage()

;Add a perk to the player so they can interact with Ashes.
Game.GetPlayer().AddPerk(V81_01Ashes)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Sets Ashes so he's interctable again. 
;Stage 50 is set on script V81AshesChangeLocation that's attached to his alias on this quest.

Alias_Ashes.GetRef().BlockActivation(False,False)

debug.trace(self + "Ashes interactable")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
V81_01Guard.Start()
Alias_Ashes.GetRef().BlockActivation(True,True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetStage(1)
SetStage(2)
SetStage(3)
SetObjectiveCompleted(10, true)
SetObjectiveDisplayed(100, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100, true)
SetObjectiveDisplayed(200, true)

V81_01PlayerFoundAshes.Start()
Alias_Ashes.GetActorRef().EvaluatePackage()

;Remove perk from player since it's served its purpose.
Game.GetPlayer().RemovePerk(V81_01Ashes)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200, true)

if V81_01.GetStageDone(21) == true
    game.GetPlayer().AddItem(TeddyBear, 1)
elseif V81_01.GetStageDone(22) == true 
    game.GetPlayer().AddItem(RollerSkate, 1)
elseif V81_01.GetStageDone(23) == true
    game.GetPlayer().AddItem(SilverLocket, 1)
elseif V81_01.GetStageDone(25) == false
    game.GetPlayer().AddItem(AmmoFusionCore, 1)
EndIf

Alias_Ashes.GetActorRef().GetActorBase().SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Remove perk from player since it's no longer necessary.
Game.GetPlayer().RemovePerk(V81_01Ashes)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Remove perk from player since it's no longer necessary.
Game.GetPlayer().RemovePerk(V81_01Ashes)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property V81_01 Auto Const

MiscObject Property TeddyBear Auto Const

MiscObject Property RollerSkate Auto Const

MiscObject Property SilverLocket Auto Const

Ammo Property AmmoFusionCore Auto Const

GlobalVariable Property XPMiscQuestFinal Auto Const

Scene Property V81_01Guard Auto Const

ReferenceAlias Property Alias_Ashes Auto Const

Scene Property V81_01PlayerFoundAshes Auto Const

Perk Property V81_01Ashes Auto Const
