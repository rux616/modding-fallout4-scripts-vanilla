;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01022219 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE RECorpseSwarmCreatorScript
Quest __temp = self as Quest
RECorpseSwarmCreatorScript kmyQuest = __temp as RECorpseSwarmCreatorScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
; initialize swarm, corpse pairs
kmyQuest.InitializeSwarm(Alias_Corpse01.GetActorRef(), Alias_Swarm01.GetRef() as BugSwarmFXScript)
kmyQuest.InitializeSwarm(Alias_Corpse02.GetActorRef(), Alias_Swarm02.GetRef() as BugSwarmFXScript, true)
kmyQuest.InitializeSwarm(Alias_Corpse03.GetActorRef(), Alias_Swarm03.GetRef() as BugSwarmFXScript, true)
kmyQuest.InitializeSwarm(Alias_Corpse04.GetActorRef(), Alias_Swarm04.GetRef() as BugSwarmFXScript, true)
kmyQuest.InitializeSwarm(Alias_Corpse05.GetActorRef(), Alias_Swarm05.GetRef() as BugSwarmFXScript, true)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Corpse01 Auto Const

ReferenceAlias Property Alias_Corpse02 Auto Const

ReferenceAlias Property Alias_Corpse03 Auto Const

ReferenceAlias Property Alias_Corpse04 Auto Const

ReferenceAlias Property Alias_Corpse05 Auto Const

ReferenceAlias Property Alias_Swarm01 Auto Const

ReferenceAlias Property Alias_Swarm02 Auto Const

ReferenceAlias Property Alias_Swarm03 Auto Const

ReferenceAlias Property Alias_Swarm04 Auto Const

ReferenceAlias Property Alias_Swarm05 Auto Const
