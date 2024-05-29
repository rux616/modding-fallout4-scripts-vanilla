;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REObjectSC01_00023C29 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;debug.trace(self + " STARTING")
kmyQuest.Startup()

;Form an array of tires.
ObjectReference[] TirePiles = new ObjectReference[8]
TirePiles[0] = Alias_TirePileCenter1.GetReference()
TirePiles[1] = Alias_TirePileCenter2.GetReference()
TirePiles[2] = Alias_TirePileCenter3.GetReference()
TirePiles[3] = Alias_TirePileCenter4.GetReference()
TirePiles[4] = Alias_TirePileA1.GetReference()
TirePiles[5] = Alias_TirePileA2.GetReference()
TirePiles[6] = Alias_TirePileB1.GetReference()
TirePiles[7] = Alias_TirePileB2.GetReference()

;Form an array of fires.
ObjectReference[] Fires = new ObjectReference[8]
Fires[0] = Alias_TirePileFireCenter1.GetReference()
Fires[1] = Alias_TirePileFireCenter2.GetReference()
Fires[2] = Alias_TirePileFireCenter3.GetReference()
Fires[3] = Alias_TirePileFireCenter4.GetReference()
Fires[4] = Alias_TirePileFireA1.GetReference()
Fires[5] = Alias_TirePileFireA2.GetReference()
Fires[6] = Alias_TirePileFireB1.GetReference()
Fires[7] = Alias_TirePileFireB2.GetReference()

;Form an array of hazards.
ObjectReference[] FireHazard = new ObjectReference[8]
FireHazard[0] = Alias_TirePileFireHazardCenter1.GetReference()
FireHazard[1] = Alias_TirePileFireHazardCenter2.GetReference()
FireHazard[2] = Alias_TirePileFireHazardCenter3.GetReference()
FireHazard[3] = Alias_TirePileFireHazardCenter4.GetReference()
FireHazard[4] = Alias_TirePileFireHazardA1.GetReference()
FireHazard[5] = Alias_TirePileFireHazardA2.GetReference()
FireHazard[6] = Alias_TirePileFireHazardB1.GetReference()
FireHazard[7] = Alias_TirePileFireHazardB2.GetReference()

;Adjust the position of the tires and associated fires.
TirePiles[0].MoveTo(TirePiles[0], 0, 0, 32, True)
TirePiles[0].SetAngle(0, 0, 0)
TirePiles[0].SetScale(Utility.RandomFloat(0.9, 1.1))
Fires[0].MoveTo(Fires[0], 0, 0, 32, True)
Fires[0].SetScale(Utility.RandomFloat(0.9, 1.1))
FireHazard[0].MoveTo(Fires[0])

TirePiles[1].MoveTo(TirePiles[1], 96, 0, 32, True)
TirePiles[1].SetAngle(0, 0, 180)
TirePiles[1].SetScale(Utility.RandomFloat(0.9, 1.1))
Fires[1].MoveTo(Fires[1], 96, 0, 32, True)
Fires[1].SetScale(Utility.RandomFloat(0.9, 1.1))
FireHazard[1].MoveTo(Fires[1])

TirePiles[2].MoveTo(TirePiles[2], -96, 0, 32, True)
TirePiles[2].SetAngle(0, 0, 180)
TirePiles[2].SetScale(Utility.RandomFloat(0.9, 1.1))
Fires[2].MoveTo(Fires[2], -96, 0, 32, True)
Fires[2].SetScale(Utility.RandomFloat(0.9, 1.1))
FireHazard[2].MoveTo(Fires[2])

TirePiles[3].MoveTo(TirePiles[3], 0, 128, 32, True)
TirePiles[3].SetAngle(0, 0, 90)
TirePiles[3].SetScale(Utility.RandomFloat(0.9, 1.1))
Fires[3].MoveTo(Fires[3], 0, 128, 32, True)
Fires[3].SetScale(Utility.RandomFloat(0.9, 1.1))
FireHazard[3].MoveTo(Fires[3])

TirePiles[4].MoveTo(TirePiles[4], 0, 0, 32, True)
TirePiles[4].SetScale(Utility.RandomFloat(0.9, 1.1))
Fires[4].MoveTo(Fires[4], 0, 0, 32, True)
Fires[4].SetScale(Utility.RandomFloat(0.9, 1.1))
FireHazard[4].MoveTo(Fires[4])

TirePiles[5].MoveTo(TirePiles[5], 0, 0, 32, True)
TirePiles[5].SetScale(Utility.RandomFloat(0.9, 1.1))
Fires[5].MoveTo(Fires[5], 0, 0, 32, True)
Fires[5].SetScale(Utility.RandomFloat(0.9, 1.1))
FireHazard[5].MoveTo(Fires[5])

TirePiles[6].MoveTo(TirePiles[6], 0, 0, 32, True)
TirePiles[6].SetScale(Utility.RandomFloat(0.9, 1.1))
Fires[6].MoveTo(Fires[6], 0, 0, 32, True)
Fires[6].SetScale(Utility.RandomFloat(0.9, 1.1))
FireHazard[6].MoveTo(Fires[6])

TirePiles[7].MoveTo(TirePiles[7], 0, 0, 32, True)
TirePiles[7].SetScale(Utility.RandomFloat(0.9, 1.1))
Fires[7].MoveTo(Fires[7], 0, 0, 32, True)
Fires[7].SetScale(Utility.RandomFloat(0.9, 1.1))
FireHazard[7].MoveTo(Fires[7])
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
;debug.trace(self + " STOPPING")
; DO NOT REARM TRIGGER - we don't reuse Object encounter locations

;Disable the flames and the associated hazards. The tire pile persists.
;Could potentially omit this since these are created temp refs, but that wasn't working for me.
Alias_TirePileFireCenter1.TryToDisable()
Alias_TirePileFireCenter2.TryToDisable()
Alias_TirePileFireCenter3.TryToDisable()
Alias_TirePileFireCenter4.TryToDisable()
Alias_TirePileFireA1.TryToDisable()
Alias_TirePileFireA2.TryToDisable()
Alias_TirePileFireB1.TryToDisable()
Alias_TirePileFireB2.TryToDisable()
Alias_TirePileFireHazardCenter1.TryToDisable()
Alias_TirePileFireHazardCenter2.TryToDisable()
Alias_TirePileFireHazardCenter3.TryToDisable()
Alias_TirePileFireHazardCenter4.TryToDisable()
Alias_TirePileFireHazardA1.TryToDisable()
Alias_TirePileFireHazardA2.TryToDisable()
Alias_TirePileFireHazardB1.TryToDisable()
Alias_TirePileFireHazardB2.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_TirePileCenter1 Auto Const

ReferenceAlias Property Alias_TirePileCenter2 Auto Const

ReferenceAlias Property Alias_TirePileCenter3 Auto Const

ReferenceAlias Property Alias_TirePileCenter4 Auto Const

ReferenceAlias Property Alias_TirePileA1 Auto Const

ReferenceAlias Property Alias_TirePileA2 Auto Const

ReferenceAlias Property Alias_TirePileB1 Auto Const

ReferenceAlias Property Alias_TirePileB2 Auto Const

ReferenceAlias Property Alias_TirePileFireCenter1 Auto Const

ReferenceAlias Property Alias_TirePileFireCenter2 Auto Const

ReferenceAlias Property Alias_TirePileFireCenter3 Auto Const

ReferenceAlias Property Alias_TirePileFireCenter4 Auto Const

ReferenceAlias Property Alias_TirePileFireA1 Auto Const

ReferenceAlias Property Alias_TirePileFireA2 Auto Const

ReferenceAlias Property Alias_TirePileFireB1 Auto Const

ReferenceAlias Property Alias_TirePileFireB2 Auto Const

ReferenceAlias Property Alias_TirePileFireHazardCenter1 Auto Const

ReferenceAlias Property Alias_TirePileFireHazardCenter2 Auto Const

ReferenceAlias Property Alias_TirePileFireHazardCenter3 Auto Const

ReferenceAlias Property Alias_TirePileFireHazardCenter4 Auto Const

ReferenceAlias Property Alias_TirePileFireHazardA1 Auto Const

ReferenceAlias Property Alias_TirePileFireHazardA2 Auto Const

ReferenceAlias Property Alias_TirePileFireHazardB1 Auto Const

ReferenceAlias Property Alias_TirePileFireHazardB2 Auto Const
