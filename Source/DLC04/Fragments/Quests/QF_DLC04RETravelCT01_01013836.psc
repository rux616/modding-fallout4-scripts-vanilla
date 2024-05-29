;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04RETravelCT01_01013836 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()

;Roll to spawn Raider gang.
Int Roll = Utility.RandomInt(0,2)
If (Roll == 0)
   SetStage(20)
   Alias_RaiderLeaderDisciple.GetActorRef().Enable()
   Alias_RaiderDisciple01.GetActorRef().Enable()
   Alias_RaiderDisciple02.GetActorRef().Enable()
ElseIf (Roll == 1)
   SetStage(30)
   Alias_RaiderLeaderOperator.GetActorRef().Enable()
   Alias_RaiderOperator01.GetActorRef().Enable()
   Alias_RaiderOperator02.GetActorRef().Enable()
ElseIf (Roll == 2)
   SetStage(40)
   Alias_RaiderLeaderPack.GetActorRef().Enable()
   Alias_RaiderPack01.GetActorRef().Enable()
   Alias_RaiderPack02.GetActorRef().Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
DLC04RETravelCT01_60_LeaderReact.Start()
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

ReferenceAlias Property Alias_RaiderLeaderDisciple Auto Const Mandatory

ReferenceAlias Property Alias_RaiderLeaderOperator Auto Const Mandatory

ReferenceAlias Property Alias_RaiderLeaderPack Auto Const Mandatory

ReferenceAlias Property Alias_RaiderDisciple01 Auto Const Mandatory

ReferenceAlias Property Alias_RaiderOperator01 Auto Const Mandatory

ReferenceAlias Property Alias_RaiderPack01 Auto Const Mandatory

ReferenceAlias Property Alias_RaiderDisciple02 Auto Const Mandatory

ReferenceAlias Property Alias_RaiderOperator02 Auto Const Mandatory

ReferenceAlias Property Alias_RaiderPack02 Auto Const Mandatory

Scene Property DLC04RETravelCT01_60_LeaderReact Auto Const Mandatory
