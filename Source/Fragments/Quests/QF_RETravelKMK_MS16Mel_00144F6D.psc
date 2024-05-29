;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelKMK_MS16Mel_00144F6D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
actor mel = Alias_mel.GetActorRef()
actor robot = Alias_robot.GetActorRef()
actor companion = alias_companion.GetActorRef()

; move Mel to marker
mel.MoveTo(Alias_TravelMarkerA1.GetRef())
; make sure enabled
mel.Enable()

;Make Sonya Mk. II Radio
robot.MakeRadioReceiver( 98, 0.5, None, true)
; allow "Talk" rollover
robot.AllowPCDialogue(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; flag this quest to not run again
RETravelKMK_MS16Mel_OFF.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
; disable Mel
Alias_Mel.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_TravelMarkerA1 Auto Const

ReferenceAlias Property Alias_Mel Auto Const

GlobalVariable Property RETravelKMK_MS16Mel_OFF Auto Const

ReferenceAlias Property Alias_Robot Auto Const

ReferenceAlias Property Alias_Companion Auto Const
