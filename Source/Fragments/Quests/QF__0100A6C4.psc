;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__0100A6C4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Determine how many Supermutants are involved.
if (Utility.RandomInt() < 50)
     Alias_Supermutant03.TryToEnable()
     if (Utility.RandomInt() < 50)
          Alias_Supermutant04.TryToEnable()    
     EndIf
EndIf

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
