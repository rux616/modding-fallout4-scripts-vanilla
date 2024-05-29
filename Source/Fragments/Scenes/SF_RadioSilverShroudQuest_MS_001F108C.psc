;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RadioSilverShroudQuest_MS_001F108C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
Debug.Trace("In MS04 Logic scene")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE RadioSilverShroudQuestScript
RadioSilverShroudQuestScript kmyQuest = GetOwningQuest() as RadioSilverShroudQuestScript
;END AUTOCAST
;BEGIN CODE
; Make sure this isn't started again
kmyQuest.bWayneInfo = 1

; Kill this scene first
pRadioSilverShroudQuest_Music.Stop()
Utility.Wait(0.1)

; Start the Wayne scene
pMS04_Radio_1_KillWayne.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE RadioSilverShroudQuestScript
RadioSilverShroudQuestScript kmyQuest = GetOwningQuest() as RadioSilverShroudQuestScript
;END AUTOCAST
;BEGIN CODE
; Make sure this isn't started again
kmyQuest.bAJInfo = 1

; Kill this scene first
pRadioSilverShroudQuest_Music.Stop()
Utility.Wait(0.1)

; Start the AJ scene
pMS04_Radio_2_DealWithAJ.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE RadioSilverShroudQuestScript
RadioSilverShroudQuestScript kmyQuest = GetOwningQuest() as RadioSilverShroudQuestScript
;END AUTOCAST
;BEGIN CODE
; Make sure this isn't started again
kmyQuest.bAJReactivity = 1

; Kill this scene first
pRadioSilverShroudQuest_Music.Stop()
Utility.Wait(0.1)

; Start the AJ reactivity scene
pMS04_Radio_2a_AJReactivity.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN AUTOCAST TYPE RadioSilverShroudQuestScript
RadioSilverShroudQuestScript kmyQuest = GetOwningQuest() as RadioSilverShroudQuestScript
;END AUTOCAST
;BEGIN CODE
; Make sure this isn't started again
kmyQuest.bKendraInfo = 1

; Kill this scene first
pRadioSilverShroudQuest_Music.Stop()
Utility.Wait(0.1)

; Start the Kendra scene
pMS04_Radio_3_KillKendra.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE RadioSilverShroudQuestScript
RadioSilverShroudQuestScript kmyQuest = GetOwningQuest() as RadioSilverShroudQuestScript
;END AUTOCAST
;BEGIN CODE
; Make sure this isn't started again
kmyQuest.bHancockInfo = 1

; Kill this scene first
pRadioSilverShroudQuest_Music.Stop()
Utility.Wait(0.1)

; Start the Meet Hancock scene
pMS04_Radio_4_Hancock.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN AUTOCAST TYPE RadioSilverShroudQuestScript
RadioSilverShroudQuestScript kmyQuest = GetOwningQuest() as RadioSilverShroudQuestScript
;END AUTOCAST
;BEGIN CODE
; Make sure this isn't started again
kmyQuest.bKendraReactivity = 1

; Kill this scene first
pRadioSilverShroudQuest_Music.Stop()
Utility.Wait(0.1)

; Start the Kendra reactivity scene
pMS04_Radio_3a_KendraReactivity.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_End
Function Fragment_Phase_08_End()
;BEGIN CODE
; Kill this scene first
pRadioSilverShroudQuest_Music.Stop()
pRadioSilverShroudQuest_MS04Logic.Stop()
Utility.Wait(0.1)

; Start the kidnapping scene
pMS04_Radio_4_KentKidnapping.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pRadioSilverShroudQuest_Music Auto Const

Scene Property pMS04_Radio_1_KillWayne Auto Const

Scene Property pMS04_Radio_2_DealWithAJ Auto Const

Scene Property pMS04_Radio_2a_AJReactivity Auto Const

Scene Property pMS04_Radio_3_KillKendra Auto Const

Scene Property pMS04_Radio_4_Hancock Auto Const

Scene Property pMS04_Radio_3a_KendraReactivity Auto Const

Scene Property pMS04_Radio_4_KentKidnapping Auto Const

Scene Property pRadioSilverShroudQuest_MS04Logic Auto Const
