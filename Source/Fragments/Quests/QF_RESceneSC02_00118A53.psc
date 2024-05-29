;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RESceneSC02_00118A53 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyquest.Startup()
; randomly enable some of the super mutants
float time = GameHour.GetValue()
int enableChance = 50
; enable more at night
if time > 20 || time < 6
	enableChance = 75
endif
Alias_SuperMutants.AddRef(Alias_Supermutant01.GetRef())
Alias_SuperMutants.AddRef(Alias_Supermutant02.GetRef())
Alias_SuperMutants.AddRef(Alias_Supermutant03.GetRef())
Alias_SuperMutants.AddRef(Alias_Supermutant04.GetRef())
kmyquest.REParent.RandomlyEnableOrKillCollection(Alias_SuperMutants, enableChance, 0, 1)

;Check to see if this dungeon has a specific raid note we should be using.
Book myNote
int index = RESupermutantRaidSourceList.Find(Alias_Dungeon.GetLocation())
if (index >= 0)
     myNote = RESupermutantRaidNoteList.GetAt(index) as Book
EndIf
if (myNote != None)
     Actor leader = Alias_Supermutant01.GetActorRef()
     leader.RemoveItem(Alias_SupermutantRaiderNote.GetReference())
     leader.AddItem(myNote, 1)
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

FormList Property RESupermutantRaidSourceList Auto Const

FormList Property RESupermutantRaidNoteList Auto Const

ReferenceAlias Property Alias_SupermutantRaiderNote Auto Const

LocationAlias Property Alias_Dungeon Auto Const

ReferenceAlias Property Alias_Supermutant01 Auto Const

ReferenceAlias Property Alias_Supermutant03 Auto Const

ReferenceAlias Property Alias_Supermutant04 Auto Const

RefCollectionAlias Property Alias_SuperMutants Auto Const

GlobalVariable Property GameHour Auto Const

ReferenceAlias Property Alias_Supermutant02 Auto Const Mandatory
