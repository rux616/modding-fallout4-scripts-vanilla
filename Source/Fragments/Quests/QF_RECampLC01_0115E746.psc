;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECampLC01_0115E746 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Jules.GetRef().Enable()
Alias_Jules.GetActorRef().SetRestrained(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
RECampLC01TriggerOnce.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
RECampLC01_CaptorFaction.SetPlayerEnemy()
Alias_Fred.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Angie.GetActorRef().StartCombat(Game.GetPlayer())

;Trigger Jules' combat scene
self.SetStage(625)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
RECampLC01_FredExecutesJules.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Alias_Jules.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
Alias_Jules.GetActorRef().SetRestrained(false)
Alias_Jules.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
Alias_Jules.GetActorRef().EvaluatePackage()
Alias_Fred.GetActorRef().EvaluatePackage()
Alias_Angie.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
RECampLC01_CaptiveFaction.SetPlayerEnemy()
Alias_Jules.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
RECampLC01_CaptorFaction.SetPlayerEnemy()
Alias_Fred.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Angie.GetActorRef().StartCombat(Game.GetPlayer())

;Trigger Jules' combat scene
self.SetStage(625)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
if !self.GetStageDone(400)
  RECampLC01_JulesDuringCombat.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
self.SetStage(405)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Jules Auto Const

ReferenceAlias Property Alias_Angie Auto Const

ReferenceAlias Property Alias_Fred Auto Const

Scene Property RECampLC01_FredExecutesJules Auto Const

GlobalVariable Property RECampLC01TriggerOnce Auto Const

Faction Property RECampLC01_CaptorFaction Auto Const

Faction Property RECampLC01_CaptiveFaction Auto Const

Scene Property RECampLC01_JulesDuringCombat Auto Const
