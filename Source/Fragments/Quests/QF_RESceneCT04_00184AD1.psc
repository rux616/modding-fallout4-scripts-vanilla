;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RESceneCT04_00184AD1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Spawn corpse. 33% Brahmin, 33% Radstag, 34% YaoGuai.
Alias_Corpse01.ForceRefTo(((Self as Quest) as RESceneCT04SpawnsScript).SpawnCorpse())

;Spawn creatures. 33% Bloatfly, 33% Bloodbug, 34% Radroach.
Alias_Pest01.ForceRefTo(((Self as Quest) as RESceneCT04SpawnsScript).SpawnCreature())
Alias_Pest01.TryToEvaluatePackage()
Alias_Pest02.ForceRefTo(((Self as Quest) as RESceneCT04SpawnsScript).SpawnCreature())
Alias_Pest02.TryToEvaluatePackage()
if (Utility.RandomInt(0, 1) == 0)
     Alias_Pest03.ForceRefTo(((Self as Quest) as RESceneCT04SpawnsScript).SpawnCreature())
     Alias_Pest03.TryToEvaluatePackage()
EndIf
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

ReferenceAlias Property Alias_Corpse01 Auto Const

ReferenceAlias Property Alias_Pest01 Auto Const

ReferenceAlias Property Alias_Pest02 Auto Const

ReferenceAlias Property Alias_Pest03 Auto Const
