;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_ADV017_0102C687 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_StartingWolf.GetActorRef().AllowPCDialogue(true)
Alias_StartingFEVHound.GetActorRef().AllowPCDialogue(true)
Alias_StartingDog.GetActorRef().AllowPCDialogue(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
if Alias_StartingWolf.GetActorRef().GetKiller() == game.GetPlayer()
SetStage(10)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
if Alias_StartingFEVHound.GetActorRef().GetKiller() == game.GetPlayer()
SetStage(10)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
if Alias_StartingDog.GetActorRef().GetKiller() == game.GetPlayer()
SetStage(10)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(0)
SetObjectiveCompleted(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
DLC03_ADV017PathToCamp.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Alias_Erikson.GetActorREf().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_StartingWolf.GetActorRef().StopCombat()
Alias_StartingFEVHound.GetActorRef().StopCombat()
Alias_StartingDog.GetActorRef().StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC03_ADV017_LItem_Dogmeat)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC03_ADV017_LItem_Strong)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Get rid of the pre Erikson companion comment marker, replacing it with the post reveal version
DLC03_ADV017_AOCommentDogsPost.MoveTo(DLC03_ADV017_AOCommentDogsPre)

DLC03_ADV017_AOCommentDogsPre.Delete()

DLC03_ADV017_EriksonFaction.SetAlly(PlayerFaction, True, true)
DLC03_ADV017_EriksonDogFaction.SetAlly(PlayerFaction, True, true)
ADV017PlayerBedRef.SetActorOwner(none)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_StartingWolf Auto Const Mandatory

ReferenceAlias Property Alias_StartingFEVHound Auto Const Mandatory

ReferenceAlias Property Alias_StartingDog Auto Const Mandatory

LeveledItem Property DLC03_ADV017_LItem_Strong Auto Const Mandatory

LeveledItem Property DLC03_ADV017_LItem_Dogmeat Auto Const Mandatory

Scene Property DLC03_ADV017PathToCamp Auto Const Mandatory

ReferenceAlias Property Alias_Erikson Auto Const Mandatory

ObjectReference Property DLC03_ADV017_AOCommentDogsPost Auto Const Mandatory

ObjectReference Property DLC03_ADV017_AOCommentDogsPre Auto Const Mandatory

ObjectReference Property ADV017PlayerBedRef Auto Const Mandatory

Faction Property DLC03_ADV017_EriksonFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property DLC03_ADV017_EriksonDogFaction Auto Const Mandatory
