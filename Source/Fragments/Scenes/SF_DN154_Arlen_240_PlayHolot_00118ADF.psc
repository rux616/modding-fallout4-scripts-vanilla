;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN154_Arlen_240_PlayHolot_00118ADF Extends Scene Hidden Const

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
DN154_ArlenHolotapePlayerSoundMarker.Disable()

Arlen.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly)

;Release the activation block.
TheSlog_ArlensTerminal.GetReference().BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
DN154_ArlenHolotapePlayerSoundMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN154_ArlenHolotapePlayerSoundMarker Auto Const

ReferenceAlias Property TheSlog_ArlensTerminal Auto Const

ReferenceAlias Property Arlen Auto Const

Keyword Property AnimArchetypeFriendly Auto Const
