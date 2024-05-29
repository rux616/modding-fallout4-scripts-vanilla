;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101KelloggSceneMain_000D3CAF Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE mq101kelloggsequencescript
mq101kelloggsequencescript kmyQuest = GetOwningQuest() as mq101kelloggsequencescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AmariVoiceoverBeginning()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_End
Function Fragment_Phase_10_End()
;BEGIN AUTOCAST TYPE mq101kelloggsequencescript
mq101kelloggsequencescript kmyQuest = GetOwningQuest() as mq101kelloggsequencescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.OpenSpousePod()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_12_Begin
Function Fragment_Phase_12_Begin()
;BEGIN CODE
QSTPlayerCryopodBreathingC.Play(PlayerPodSoundMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_18_Begin
Function Fragment_Phase_18_Begin()
;BEGIN CODE
QSTPlayerCryopodBreathingE.Play(PlayerPodSoundMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_18_End
Function Fragment_Phase_18_End()
;BEGIN AUTOCAST TYPE mq101kelloggsequencescript
mq101kelloggsequencescript kmyQuest = GetOwningQuest() as mq101kelloggsequencescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpouseDies()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_19_End
Function Fragment_Phase_19_End()
;BEGIN AUTOCAST TYPE mq101kelloggsequencescript
mq101kelloggsequencescript kmyQuest = GetOwningQuest() as mq101kelloggsequencescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CloseSpousePod()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_22_Begin
Function Fragment_Phase_22_Begin()
;BEGIN AUTOCAST TYPE mq101kelloggsequencescript
mq101kelloggsequencescript kmyQuest = GetOwningQuest() as mq101kelloggsequencescript
;END AUTOCAST
;BEGIN CODE
kmyquest.MQ101Imod()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_22_End
Function Fragment_Phase_22_End()
;BEGIN AUTOCAST TYPE mq101kelloggsequencescript
mq101kelloggsequencescript kmyQuest = GetOwningQuest() as mq101kelloggsequencescript
;END AUTOCAST
;BEGIN CODE
QSTPlayerCryopodGasB.Play(Game.Getplayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_26_End
Function Fragment_Phase_26_End()
;BEGIN AUTOCAST TYPE mq101kelloggsequencescript
mq101kelloggsequencescript kmyQuest = GetOwningQuest() as mq101kelloggsequencescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.HearKelloggName()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_27_End
Function Fragment_Phase_27_End()
;BEGIN AUTOCAST TYPE mq101kelloggsequencescript
mq101kelloggsequencescript kmyQuest = GetOwningQuest() as mq101kelloggsequencescript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndKelloggSequence()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_29_Begin
Function Fragment_Phase_29_Begin()
;BEGIN CODE
debug.trace(self + " phase 29 START")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_30_Begin
Function Fragment_Phase_30_Begin()
;BEGIN CODE
debug.trace(self + " phase 30 START")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_30_End
Function Fragment_Phase_30_End()
;BEGIN CODE
debug.trace(self + " phase 30 END")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_31_End
Function Fragment_Phase_31_End()
;BEGIN AUTOCAST TYPE mq101kelloggsequencescript
mq101kelloggsequencescript kmyQuest = GetOwningQuest() as mq101kelloggsequencescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RestartKelloggSequence()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

sound Property QSTPlayerCryopodGasB Auto Const

sound Property QSTPlayerCryopodBreathingC Auto Const

ObjectReference Property PlayerPodSoundMarker Auto Const

sound Property QSTPlayerCryopodBreathingE Auto Const
