;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Command_HackTerminal_Scen_001760E5 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Action_10
Function Fragment_Action_10(ReferenceAlias akAlias)
;BEGIN CODE
debug.trace(self + "BAIL OUT TIMER ENDED")

if IsActionComplete(9) == false
	debug.trace(self + "Action 9 (sit in terminal) isn't complete. STOPPING SCENE!")	
	stop()
else
	debug.trace(self + "Action 9 (sit in terminal) is complete. NOT stopping scene.")	
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE followersscript
followersscript kmyQuest = GetOwningQuest() as followersscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CommandUnlockStartNewAttempt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE followersscript
followersscript kmyQuest = GetOwningQuest() as followersscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CommandUnlockAttempt()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
