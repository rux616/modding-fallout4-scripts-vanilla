;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN001BADTFL_00043A4A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Raider01 Aggressive
Actor Raider01 = Alias_BADTFLRaider01.GetReference() as Actor
Raider01.SetValue(Aggression,2)
Raider01.RemoveFromFaction(DN001_TurretStartFaction)

;Raider02 Aggressive
Actor Raider02 = Alias_BADTFLRaider02.GetReference() as Actor
Raider02.SetValue(Aggression,2)
Raider02.RemoveFromFaction(DN001_TurretStartFaction)

;Turret Faction
Actor Turret = Alias_BADTFLTurret.GetReference() as Actor
;Turret.RemoveFromFaction(DN001_TurretStartFaction)

ObjectReference Target = alias_BADTFLTurretTarget.GetReference()
Target.disable()
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
ObjectReference TurretTrigger = Alias_BADTFLTurretTrigger.GetReference()

TurretTrigger.disable()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BADTFLRaider01 Auto Const

ReferenceAlias Property Alias_BADTFLRaider02 Auto Const

LocationAlias Property Alias_BADTFLLocation Auto Const

ReferenceAlias Property Alias_RaiderStartLocation01 Auto Const

ReferenceAlias Property Alias_RaiderStartLocation02 Auto Const

ActorValue Property Aggression Auto Const

Faction Property DN001_TurretStartFaction Auto Const

ReferenceAlias Property Alias_BADTFLTurret Auto Const

ReferenceAlias Property Alias_BADTFLTurretTarget Auto Const

ReferenceAlias Property Alias_BADTFLTurretTrigger Auto Const
