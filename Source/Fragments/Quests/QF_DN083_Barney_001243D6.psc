;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN083_Barney_001243D6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
dn083_BarneyStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
actor Barney = Alias_Barney.getReference() as Actor
actor Mirelurk01 = Alias_StartMirelurk01.getReference() as Actor
actor Mirelurk02 = Alias_StartMirelurk02.getReference() as Actor
actor Mirelurk03 = Alias_StartMirelurk03.getReference() as Actor

DN083_BarneyCrabsAttack.start()
DN083_Barney.SetObjectiveDisplayed(5)

Barney.EvaluatePackage()

Mirelurk01.EvaluatePackage()
Mirelurk01.RemovefromFaction(DN083_IntroMirelurkFaction)
Mirelurk02.EvaluatePackage()
Mirelurk02.RemovefromFaction(DN083_IntroMirelurkFaction)
Mirelurk03.EvaluatePackage()
Mirelurk03.RemovefromFaction(DN083_IntroMirelurkFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
actor Barney = Alias_Barney.getReference() as Actor

Barney.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
actor Barney = Alias_Barney.getReference() as Actor

Barney.evaluatePackage()

Alias_StartBarneyGreetSceneTrigger.getReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
DN083_BarneyRunsToBunker.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
actor Barney = Alias_Barney.getReference() as Actor

DN083_Barney.setObjectiveCompleted(6)
DN083_Barney.setObjectiveDisplayed(15)


DN083_BarneyRunsToBunker.start()
Barney.evaluatePackage()

alias_GateDoor.getReference().SetOpen()
alias_BunkerDoor.getReference().unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
Alias_Barney.GetReference().MoveTo(Alias_BarneysBunkWaitForPlayer.getreference())

setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
actor Barney = Alias_Barney.getReference() as Actor

Barney.EvaluatePackage()
dn083_Barney.SetObjectiveCompleted(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
DN083_OnQuest.SetValue(1)

SetObjectiveDisplayed(30)

MirelurkEnabler.Enable()

Game.GetPlayer().AddItem(DN083_Password)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
actor Barney = Alias_Barney.getReference() as Actor

Barney.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
actor Barney = Alias_Barney.getReference() as Actor
Barney.evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0071_Item_00
Function Fragment_Stage_0071_Item_00()
;BEGIN CODE
Alias_BarneysKey.GetReference().Disable()

Game.GetPlayer().AddItem(DN083_BarneysKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
CompleteAllObjectives()
CompleteQuest()
 
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;FailAllObjectives()
;FailQuest()
setObjectiveDisplayed(5, False)
setObjectiveDisplayed(6, False)
setObjectiveDisplayed(15, False)
setObjectiveDisplayed(30, False)
setObjectiveDisplayed(40, False)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property Alias_BarneysBunkerLocation Auto Const

ReferenceAlias Property Alias_BarneySniperPosition Auto Const

ReferenceAlias Property Alias_BarneySniperMissTarget Auto Const

ReferenceAlias Property Alias_Barney Auto Const

ReferenceAlias Property Alias_MirelurkPatrolStart01 Auto Const

ReferenceAlias Property Alias_StartMirelurk01 Auto Const

Faction Property DN083_IntroMirelurkFaction Auto Const

Faction Property DN083_IntroBarneyFaction Auto Const

Scene Property DN083_BarneyCrabsAttack Auto Const

Quest Property DN083_Barney Auto Const

ReferenceAlias Property Alias_BarneysBunkWaitForPlayer Auto Const

ReferenceAlias Property Alias_GateDoor Auto Const

GlobalVariable Property DN083_OnQuest Auto Const

ReferenceAlias Property Alias_BarneysKey Auto Const

ReferenceAlias Property Alias_Terminal01 Auto Const

ReferenceAlias Property Alias_Terminal02 Auto Const

ReferenceAlias Property Alias_Terminal03 Auto Const

ReferenceAlias Property Alias_MirelurkQueenSpawn Auto Const

ReferenceAlias Property Alias_MirelurkQueen Auto Const

Key Property DN083_BarneysKey Auto Const

ReferenceAlias Property Alias_MirelurkPatrolStart02 Auto Const

ReferenceAlias Property Alias_MirelurkPatrolStart03 Auto Const

ReferenceAlias Property Alias_StartMirelurk02 Auto Const

ReferenceAlias Property Alias_StartMirelurk03 Auto Const

Scene Property DN083_BarneyRunsToBunker Auto Const

ReferenceAlias Property Alias_StartBarneyGreetSceneTrigger Auto Const

Scene Property DN083_BarneyStart Auto Const

ReferenceAlias Property Alias_BunkerDoor Auto Const

ObjectReference Property MirelurkEnabler Auto Const

Book Property DN083_Password Auto Const
