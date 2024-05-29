;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ205_000229EB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

Alias_CITTrigger01.getReference().enable()
Alias_GreenetechTrigger01.getReference().enable()
MQ205_GreenetechExtDoor.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(15)
if(MQ205_InstituteRadio.getStageDone(10) == 0)
    MQ205_InstituteRadio.start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(15)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(15)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
MQ205_InstituteRadio.setStage(100)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; If Deacon is here he says something
pDialogueRailroad.SetStage(700)

SetObjectiveCompleted(40)

Game.AddAchievement(6)

;Update Global for Radio News
RadioDCMQ205Ready.SetValue((GameDaysPassed.GetValue() + 1))


;start the next quest, the shutdown happens there
pMQ206.SetStage(10)
;MQ206 stops this quest
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ205_InstituteRadio Auto Const

ReferenceAlias Property Alias_CITTrigger01 Auto Const

ReferenceAlias Property Alias_GreenetechTrigger01 Auto Const

Quest Property pMQ206 Auto Const

ReferenceAlias Property Alias_CorpseMarker01 Auto Const

ReferenceAlias Property Alias_PreQuestEnableMarker Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMQ205Ready Auto Const

Quest Property DN009_MQ205 Auto Const

Cell Property GreenetechGenetics01 Auto Const

ReferenceAlias Property Alias_DN009_MQ205_TriggersEnabler Auto Const

Cell Property GreenetechGenetics02 Auto Const

Location Property GreenetechGeneticsLocation Auto Const

Location Property GreenetechGeneticsLocationInterior Auto Const

ObjectReference Property MQ205_GreenetechExtDoor Auto Const

Quest Property pDialogueRailroad Auto Const
