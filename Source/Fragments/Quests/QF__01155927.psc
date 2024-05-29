;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01155927 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
RESceneLC01TriggerOnce.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Start execution
RESceneLC01_ShootAccused.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
Alias_Accused.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Actor AccusedREF = Alias_Accused.GetActorRef()

RESceneLC01_AccusedFaction.SetPlayerEnemy()
RESceneLC01_AccusedFaction.SetEnemy(RESceneLC01_AccusorFaction)
AccusedREF.StartCombat(Game.GetPlayer())
Alias_Accusor.GetActorRef().StartCombat(AccusedREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
RESceneLC01_AccusorFaction.SetPlayerEnemy()
Alias_Accusor.GetActorRef().StartCombat(Game.GetPlayer())
RESceneLC01_AccusedFaction.SetEnemy(RESceneLC01_AccusorFaction)
Alias_Accused.GetActorRef().StartCombat(Alias_Accusor.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
RESceneLC01_AccusedFaction.SetPlayerEnemy()
RESceneLC01_AccusedFaction.SetEnemy(RESceneLC01_AccusorFaction)
Alias_Accused.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN CODE
RESceneLC01_AccusedFaction.SetEnemy(RESceneLC01_AccusorFaction)
Alias_Accused.GetActorRef().StartCombat(Alias_Accusor.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Accusor.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Alias_Accused.GetActorRef().EvaluatePackage()
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
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

Scene Property RESceneLC01_ShootAccused Auto Const

ReferenceAlias Property Alias_Accusor Auto Const

ReferenceAlias Property Alias_Accused Auto Const

Faction Property RESceneLC01_AccusedFaction Auto Const

Faction Property RESceneLC01_AccusorFaction Auto Const

GlobalVariable Property RESceneLC01TriggerOnce Auto Const
