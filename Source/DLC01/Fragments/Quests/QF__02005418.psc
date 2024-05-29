;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF__02005418 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

ObjectReference current
int i = 0
While (i < 7)
	current = ObjectMarkers[Utility.RandomInt(0, ObjectMarkers.Length - 1)].GetReference().PlaceAtMe(DebrisPiles[Utility.RandomInt(0, DebrisPiles.Length - 1)])
	current.SetScale(Utility.RandomFloat(0.8, 1.25))
	current.SetAngle(0, 0, Utility.RandomFloat(0, 360))
	i = i + 1
EndWhile

current = Alias_AmbushFurniture01.GetReference()
current.SetAngle(0, 0, Utility.RandomFloat(0, 360))

current = Alias_AmbushFurniture02.GetReference()
current.SetAngle(0, 0, Utility.RandomFloat(0, 360))

current = Alias_AmbushFurniture03.GetReference()
current.SetAngle(0, 0, Utility.RandomFloat(0, 360))

Alias_Assaultron01.TryToEnableNoWait()
Alias_Assaultron02.TryToEnableNoWait()

if (Game.GetPlayer().GetLevel() > 35)
     Alias_Assaultron03.TryToEnableNoWait()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
ObjectReference akActivator = Alias_Assaultron01.GetActorRef()
Alias_Assaultron01.GetActorRef().Activate(akActivator)
Utility.Wait(Utility.RandomFloat(0.0, 0.8))
Alias_Assaultron03.GetActorRef().Activate(akActivator)
Utility.Wait(Utility.RandomFloat(0.0, 0.8))
Alias_Assaultron02.GetActorRef().Activate(akActivator)
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
; DO NOT REARM TRIGGER - we don't reuse Object encounter locations
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Assaultron01 Auto Const Mandatory

ReferenceAlias Property Alias_Assaultron02 Auto Const Mandatory

ReferenceAlias Property Alias_Assaultron03 Auto Const Mandatory

ReferenceAlias Property Alias_AmbushFurniture01 Auto Const Mandatory

ReferenceAlias Property Alias_AmbushFurniture02 Auto Const Mandatory

ReferenceAlias Property Alias_AmbushFurniture03 Auto Const Mandatory

ReferenceAlias[] Property ObjectMarkers Auto Const

STATIC[] Property DebrisPiles Auto Const
