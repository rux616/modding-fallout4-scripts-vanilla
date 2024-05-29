;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ106Investigations_00134297 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;close out MQ105 and start MQ106
MQ105.SetStage(1000)
MQ106.setStage(10)

;add Dogmeat
DogmeatQuest.SetStage(1)
Alias_Dogmeat.GetActorRef().EvaluatePackage()
Alias_Dogmeat.GetActorRef().Moveto(DmndCityExteriorMarker)

;move player
Game.GetPlayer().MoveTo(DmndCityExteriorMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
debug.trace("MQ106: Investigations Sub-Quest Started (stage 1)")
CluesEnableMarker.enable()

; specific take-able clues need individual enabling.
site01clue.enable()
site02clue.enable()
site03clue.enable()
site04clue.enable()
site05clue.enable()

; set up the nextClue as first clue
alias_nextClue.forceRefTo(site01Clue)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN AUTOCAST TYPE MQ106InvestigationsScript
Quest __temp = self as Quest
MQ106InvestigationsScript kmyQuest = __temp as MQ106InvestigationsScript
;END AUTOCAST
;BEGIN CODE
MQ106.SetObjectiveDisplayed(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MQ106InvestigationsScript
Quest __temp = self as Quest
MQ106InvestigationsScript kmyQuest = __temp as MQ106InvestigationsScript
;END AUTOCAST
;BEGIN CODE
MQ106.SetObjectiveCompleted(11)
MQ106.SetObjectiveDisplayed(11, false)
MQ106.SetObjectiveDisplayed(10)
alias_site01Trigger.getReference().disable()
kmyQuest.bAnySiteActive = FALSE ; clear the flag, allowing Dogmeat to move ahead.
DogmeatFindsClue.stop()
Alias_Dogmeat.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
MQ106.SetObjectiveDisplayed(12)
MQ106.SetObjectiveDisplayed(11, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MQ106InvestigationsScript
Quest __temp = self as Quest
MQ106InvestigationsScript kmyQuest = __temp as MQ106InvestigationsScript
;END AUTOCAST
;BEGIN CODE
MQ106.SetObjectiveCompleted(12)
MQ106.SetObjectiveDisplayed(12, false)
MQ106.SetObjectiveDisplayed(10)
alias_site02Trigger.getReference().disable()
kmyQuest.bAnySiteActive = FALSE ; clear the flag, allowing Dogmeat to move ahead.
DogmeatFindsClue.stop()
Alias_Dogmeat.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0029_Item_00
Function Fragment_Stage_0029_Item_00()
;BEGIN CODE
MQ106.SetObjectiveDisplayed(13)
MQ106.SetObjectiveDisplayed(12, false)
MQ106.SetObjectiveDisplayed(11, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE MQ106InvestigationsScript
Quest __temp = self as Quest
MQ106InvestigationsScript kmyQuest = __temp as MQ106InvestigationsScript
;END AUTOCAST
;BEGIN CODE
MQ106.SetObjectiveCompleted(13)
MQ106.SetObjectiveDisplayed(13, false)
MQ106.SetObjectiveDisplayed(10)
alias_site03Trigger.getReference().disable()
kmyQuest.bAnySiteActive = FALSE ; clear the flag, allowing Dogmeat to move ahead.
DogmeatFindsClue.stop()
Alias_Dogmeat.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0039_Item_00
Function Fragment_Stage_0039_Item_00()
;BEGIN CODE
MQ106.SetObjectiveDisplayed(14)
MQ106.SetObjectiveDisplayed(13, false)
MQ106.SetObjectiveDisplayed(12, false)
MQ106.SetObjectiveDisplayed(11, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE MQ106InvestigationsScript
Quest __temp = self as Quest
MQ106InvestigationsScript kmyQuest = __temp as MQ106InvestigationsScript
;END AUTOCAST
;BEGIN CODE
MQ106.SetObjectiveCompleted(14)
MQ106.SetObjectiveDisplayed(14, false)
MQ106.SetObjectiveDisplayed(10)
alias_site04Trigger.getReference().disable()
kmyQuest.bAnySiteActive = FALSE ; clear the flag, allowing Dogmeat to move ahead.
DogmeatFindsClue.stop()
Site04_RobotConversation.stop()
alias_jabberbot.getReference().setDestroyed()
Alias_Dogmeat.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0049_Item_00
Function Fragment_Stage_0049_Item_00()
;BEGIN CODE
MQ106.SetObjectiveDisplayed(15)
MQ106.SetObjectiveDisplayed(14, false)
MQ106.SetObjectiveDisplayed(13, false)
MQ106.SetObjectiveDisplayed(12, false)
MQ106.SetObjectiveDisplayed(11, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE MQ106InvestigationsScript
Quest __temp = self as Quest
MQ106InvestigationsScript kmyQuest = __temp as MQ106InvestigationsScript
;END AUTOCAST
;BEGIN CODE
MQ106.SetObjectiveCompleted(15)
MQ106.SetObjectiveDisplayed(15, false)
MQ106.SetObjectiveDisplayed(10)
alias_site05Trigger.getReference().disable()
kmyQuest.bAnySiteActive = FALSE ; clear the flag, allowing Dogmeat to move ahead.
DogmeatFindsClue.stop()
Alias_Dogmeat.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
MQ106.SetObjectiveDisplayed(11, false)
MQ106.SetObjectiveDisplayed(12, false)
MQ106.SetObjectiveDisplayed(13, false)
MQ106.SetObjectiveDisplayed(14, false)
MQ106.SetObjectiveDisplayed(15, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property CluesEnableMarker Auto Const

ReferenceAlias Property Alias_Dogmeat Auto Const

ObjectReference Property DmndCityExteriorMarker Auto Const

Quest Property MQ105 Auto Const

Quest Property MQ106 Auto Const

Quest Property DogmeatQuest Auto Const

Scene Property DogmeatFindsClue Auto Const

ReferenceAlias Property Alias_site01Trigger Auto Const

ReferenceAlias Property Alias_site02Trigger Auto Const

ReferenceAlias Property Alias_site03Marker Auto Const

ReferenceAlias Property Alias_site03Trigger Auto Const

ReferenceAlias Property Alias_site04Trigger Auto Const

ReferenceAlias Property Alias_site05Trigger Auto Const

Scene Property Site04_RobotConversation Auto Const

ObjectReference Property Site01Clue Auto Const

ObjectReference Property site02clue Auto Const

ObjectReference Property site03clue Auto Const

ObjectReference Property Site04Clue Auto Const

ObjectReference Property site05clue Auto Const

ReferenceAlias Property Alias_nextClue Auto Const

ReferenceAlias Property Alias_Jabberbot Auto Const Mandatory
