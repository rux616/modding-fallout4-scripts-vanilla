;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03Acadia_Institute_Ext_01036948 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
SynthSupport01.GetReference().Enable()
Utility.Wait(0.4)
SynthSupport02.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN CODE
(SynthSupport01 as TeleportReferenceAlias).TeleportOut()
Utility.Wait(0.5)
(InstMoseley as TeleportReferenceAlias).TeleportOut()
Utility.Wait(0.5)
(SynthSupport02 as TeleportReferenceAlias).TeleportOut()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SynthSupport01 Auto Const

ReferenceAlias Property SynthSupport02 Auto Const

ReferenceAlias Property InstMoseley Auto Const
