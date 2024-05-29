;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RESceneKMK08_001942D7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Move actor here
Alias_dogVendor.TryToEnable()
Alias_DogVendor.TryToMoveTo(Alias_CenterMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
setStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
REDogVendorLikesPlayer.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(game.GetCaps(), REDogVendorPrice.GetValueInt(), false, Alias_DogVendor.GetRef())
REDogVendorBuyCount.SetValue(REDogVendorBuyCount.GetValue() + 1)
; put dog in go home alias so it can persist until it arrives
GenericGoHome.GoHomeActors.AddRef(Alias_Dog.GetRef())
Alias_Dog.GetActorRef().AllowPCDialogue(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
; if player didn't buy dog, make temp so it will get cleaned up
if GetStageDone(100) == false
	alias_Dog.GetRef().Delete()
endif
; move vendor back to holding cell and disable
Alias_DogVendor.GetRef().MoveToMyEditorLocation()
Alias_dogVendor.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

Potion Property WaterPurified Auto Const

Potion Property WaterDirty Auto Const

ReferenceAlias Property Alias_DogVendor Auto Const

ReferenceAlias Property Alias_CenterMarker Auto Const

ReferenceAlias Property Alias_Dog Auto Const

GlobalVariable Property REDogVendorPrice Auto Const

GlobalVariable Property REDogVendorLikesPlayer Auto Const

GlobalVariable Property REDogVendorBuyCount Auto Const

GenericGoHomeScript Property GenericGoHome Auto Const
