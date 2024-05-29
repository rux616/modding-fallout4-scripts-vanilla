;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03Acadia_BoSVertibird_01053D16 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; tell vertibird to stay at base
Alias_Vertibird.TryToSetValue(REVertibirdLandAirport, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE DLC03:DLC03Acadia_BoSVertibirdScript
Quest __temp = self as Quest
DLC03:DLC03Acadia_BoSVertibirdScript kmyQuest = __temp as DLC03:DLC03Acadia_BoSVertibirdScript
;END AUTOCAST
;BEGIN CODE
; start failsafe timer
;kmyQuest.StartBoardingFailsafeTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; snap everybody into place if they're not riding yet
actor powerarmor1 = alias_powerarmorpassenger1.GetActorRef()
actor powerarmor2 = alias_powerarmorpassenger2.GetActorRef()
actor gunner = alias_gunner.GetActorRef()
actor copilot = alias_copilot.GetActorRef()

actor vertibird = alias_Vertibird.GetActorRef()
;/
if powerarmor1.IsOnMount() == false
	powerarmor1.SnapIntoInteraction(vertibird)
endif
if powerarmor2.IsOnMount() == false
	powerarmor2.SnapIntoInteraction(vertibird)
endif
if gunner.IsOnMount() == false
	gunner.SnapIntoInteraction(vertibird)
endif
if copilot.IsOnMount() == false
	copilot.SnapIntoInteraction(vertibird)
endif
/;

; tell vertibird to orbit
Alias_Vertibird.TryToSetValue(REVertibirdLandAirport, 0)
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
; now can shut down when everything unloads
kmyQuest.StopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; tell vertibird to return to airport
setStage(500)
; failsafe
setstage(100)
; set stage in DLC03AcadiaBoS for actors to update packages
DLC03Acadia_BoS.SetStage(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; tell vertibird to return to airport
Alias_Vertibird.TryToSetValue(REVertibirdLandAirport, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
debug.trace(self + " STOPPING")
setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Pilot Auto Const

ReferenceAlias Property Alias_Gunner Auto Const

ReferenceAlias Property Alias_PowerArmorPassenger1 Auto Const

ReferenceAlias Property Alias_PowerArmorPassenger2 Auto Const

ActorValue Property REVertibirdLandAirport Auto Const

ReferenceAlias Property Alias_Vertibird Auto Const

ReferenceAlias Property Alias_Copilot Auto Const Mandatory

Quest Property DLC03Acadia_BoS Auto Const Mandatory
