;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RadioSilverShroudQuest_Mu_000DED2E Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
; If the player is listening to the radio then toggle up the song count
if ( Game.GetPlayerRadioFrequency() == 89 )
  (GetOwningQuest() as RadioSilverShroudQuestScript).SongRepeats += 1
endif

Debug.Trace("Radio Silver Shroud is running...")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
; Start the scene
pQSTMS04RecordScratchNeedleUp.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
; Play some stuff
pQSTMS04RecordScratchNeedleDown.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN CODE
(GetOwningQuest() as RadioSilverShroudQuestScript).SongRepeats = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN CODE
; Start the scene
pQSTMS04RecordScratchNeedleUp.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_Begin
Function Fragment_Phase_08_Begin()
;BEGIN CODE
; Play some stuff
pQSTMS04RecordScratchNeedleDown.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_End
Function Fragment_Phase_08_End()
;BEGIN AUTOCAST TYPE RadioSilverShroudQuestScript
RadioSilverShroudQuestScript kmyQuest = GetOwningQuest() as RadioSilverShroudQuestScript
;END AUTOCAST
;BEGIN CODE
; Reset the counter - so every other play he says something
kmyQuest.SongRepeats = 0
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pMS04_Radio_KillWayne_0 Auto Const

Scene Property pMS04_Radio_DealWithRex Auto Const

Scene Property pMS04_Radio_KillCato Auto Const

Scene Property pMS04_Radio_Hancock Auto Const

Scene Property pMS04_Radio_KentKidnapping Auto Const

Location Property pGoodneighborLocation Auto Const

Scene Property pRadioSilverShroudQuest_Music Auto Const

Scene Property pMS04_Radio_2a_AJReactivity Auto Const

Scene Property pMS04_Radio_3a_KendraReactivity Auto Const

Sound Property pQSTMS04RecordScratchNeedleUp Auto Const

Sound Property pQSTMS04RecordScratchNeedleDown Auto Const
