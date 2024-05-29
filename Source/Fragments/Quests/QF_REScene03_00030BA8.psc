;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REScene03_00030BA8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
actor dog = Alias_Dog.GetActorRef()
dog.MoveTo(Alias_CenterMarker.GetRef())
dog.AllowPCDialogue(true)
; make him "wounded"
float currentHealth = dog.GetValue(Game.GetHealthAV())
dog.DamageValue(Game.GetHealthAV(), currentHealth/2)
dog.DamageValue(RightMobilityCondition, 100)
dog.AddSpell(RESceneKMK03Disease)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
; set variable so "dog help" quest can run
kmyQuest.REParent.bREScene03Triggered = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
actor dog = Alias_Dog.GetActorRef()
dog.RemoveSpell(RESceneKMK03Disease)
dog.AddToFaction(REPlayerAlly)
dog.RestoreValue(RightMobilityCondition, 100)
; set variable so "dog help" quest can run
kmyQuest.REParent.bREScene03DogHelped = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_DogNameNeutral.ForceRefTo(Alias_Dog.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_DogNamePositive.ForceRefTo(Alias_Dog.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Alias_DogNameNegative.ForceRefTo(Alias_Dog.GetRef())
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

; put dog back in holding cell
Alias_Dog.GetRef().MoveToMyEditorLocation()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Dog Auto Const

ReferenceAlias Property Alias_CenterMarker Auto Const

ReferenceAlias Property Alias_DogNameNegative Auto Const

ReferenceAlias Property Alias_DogNamePositive Auto Const

ReferenceAlias Property Alias_DogNameNeutral Auto Const

Faction Property REPlayerAlly Auto Const

ActorValue Property RightMobilityCondition Auto Const

SPELL Property RESceneKMK03Disease Auto Const Mandatory
