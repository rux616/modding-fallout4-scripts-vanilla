;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN036_New_0008FCED Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
DN036_StayOutOfMyStuffScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Alias_Phyllis.getActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
DN036_PhyllisBedRef.SetActorOwner(None)
Alias_Phyllis.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN AUTOCAST TYPE DN036QuestScript
Quest __temp = self as Quest
DN036QuestScript kmyQuest = __temp as DN036QuestScript
;END AUTOCAST
;BEGIN CODE
;kmyQuest.StartGetOutTimer()
 Alias_Phyllis.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_Phyllis.GetReference().MoveTo(DN036_TeleportMarkerRef)
DN036_ForceGreetAtTerminalScene.Start()
Alias_Phyllis.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
if isObjectiveDisplayed(10)
     SetObjectiveCompleted(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
alias_Phyllis.getActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN CODE
DN036_TimesUp.Start()
;Do a scene here later
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
alias_Phyllis.getActorRef().SetValue(Aggression, 2)
DN036PhyllisFaction.SetEnemy(PlayerFaction, 0)
alias_Phyllis.getActorRef().ChangeAnimArchetype(AnimArchetypeIrritated)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
Workshop.SetOwnedByPlayer(true)

DN036_WorkbenchFurniture.Disable()
alias_Phyllis.getActorRef().ChangeAnimArchetype()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetStage(800)
Workshop.SetOwnedByPlayer(true)

DN036_WorkbenchFurniture.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(10)
	SetObjectiveCompleted(10)
Endif

if !GetStageDone(2)
	SetStage(701)
elseif !GetStageDone(200)
	SetStage(702)
else
	SetStage(703)
endif
Workshop.SetOwnedByPlayer(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_Phyllis.GetReference().DeleteWhenAble()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Phyllis Auto Const

Keyword Property AnimArchetypeDepressed Auto Const

Faction Property PlayerFaction Auto Const

Faction Property DN036PhyllisFaction Auto Const

ActorValue Property Aggression Auto Const

Scene Property DN036_TimesUp Auto Const

ObjectReference Property DN036_TeleportMarkerRef Auto Const

ObjectReference Property DN036_PhyllisBedRef Auto Const

workshopscript Property Workshop Auto Const

Scene Property DN036_ForceGreetAtTerminalScene Auto Const

ObjectReference Property DN036_WorkbenchFurniture Auto Const

Scene Property DN036_StayOutOfMyStuffScene Auto Const

Keyword Property AnimArchetypeIrritated Auto Const
