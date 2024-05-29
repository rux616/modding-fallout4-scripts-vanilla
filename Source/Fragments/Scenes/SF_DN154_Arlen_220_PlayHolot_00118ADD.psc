;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN154_Arlen_220_PlayHolot_00118ADD Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
;Block activation on Arlen's terminal.
TheSlog_ArlensTerminal.GetReference().BlockActivation(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;Disable Arlen's holotape player sfx.
DN154_ArlenHolotapePlayerSoundMarker.Disable()

;Remove the activation block.
TheSlog_ArlensTerminal.GetReference().BlockActivation(False)

;Set dialogue flag.
GetOwningQuest().SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
DN154_ArlenHolotapePlayerSoundMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
Arlen.GetActorRef().ChangeAnimArchetype(AnimArchetypeShocked)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN CODE
Arlen.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_13_End
Function Fragment_Phase_13_End()
;BEGIN CODE
DN154_ArlenHolotapePlayerSoundMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN154_ArlenHolotapePlayerSoundMarker Auto Const

ReferenceAlias Property TheSlog_ArlensTerminal Auto Const

ReferenceAlias Property Arlen Auto Const

Keyword Property AnimArchetypeShocked Auto Const

Keyword Property AnimArchetypeDepressed Auto Const

Keyword Property AnimArchetypeFriendly Auto Const
