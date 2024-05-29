;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelKMK_BoSM02_0014DC84 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
actor clarke = Alias_Clarke.GetActorRef()
clarke.moveTo(Alias_TravelMarkerB1.GetRef())
clarke.GetActorBase().SetProtected(False)
clarke.SetOutfit(BoSM02_InitiateClarkeREOutfit)
clarke.enable()
; make cowardly
clarke.SetValue(Game.GetConfidenceAV(), 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_FeralGhouls.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
actor clarke = Alias_Clarke.GetActorRef()
; make brave
clarke.SetValue(Game.GetConfidenceAV(), 3)
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
; disable clarke
actor clarke = Alias_Clarke.GetActorRef()
if !clarke.IsDead()
  clarke.disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Clarke Auto Const

ReferenceAlias Property Alias_TravelMarkerB1 Auto Const

RefCollectionAlias Property Alias_FeralGhouls Auto Const

Armor Property Armor_Rustic_Underarmor Auto Const

Armor Property Armor_BoS_Knight_Underarmor Auto Const

Outfit Property BoSM02_InitiateClarkeREOutfit Auto Const
