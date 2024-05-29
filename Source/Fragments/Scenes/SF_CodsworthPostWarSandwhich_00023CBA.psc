;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CodsworthPostWarSandwhich_00023CBA Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
(GetOwningQuest() as DialogueCodsworthPostWarScript).CodsworthForcegreet = 1
(GetOwningQuest() as DialogueCodsworthPostWarScript).CodsworthSandwhich = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
(GetOwningQuest() as DialogueCodsworthPostWarScript).CodsworthForcegreet = 1
(GetOwningQuest() as DialogueCodsworthPostWarScript).CodsworthSandwhich = 2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
