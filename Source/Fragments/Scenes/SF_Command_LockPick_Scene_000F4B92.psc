;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Command_LockPick_Scene_000F4B92 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Action_20
Function Fragment_Action_20(ReferenceAlias akAlias)
;BEGIN CODE
debug.trace(self + "BAIL OUT TIMER ENDED")

if IsActionComplete(12) == false
	debug.trace(self + "Action 12 (travel to lock) isn't complete. STOPPING SCENE!")	
	stop()
	followersScript fs = followersScript.GetScript()
	fs.CommandActor.GetActorReference().PlayIdle(fs.IdleStop)
else
	debug.trace(self + "Action 12 (travel to lock) is complete. NOT stopping scene.")	
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE followersscript
followersscript kmyQuest = GetOwningQuest() as followersscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CommandActor.GetActorReference().PlayIdle(kmyquest.IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE followersscript
followersscript kmyQuest = GetOwningQuest() as followersscript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "PHASE 2, calling kmyquest.CommandUnlockStartNewAttempt()")
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

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN AUTOCAST TYPE followersscript
followersscript kmyQuest = GetOwningQuest() as followersscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CommandActor.GetActorReference().PlayIdle(kmyquest.IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_End
Function Fragment_Phase_10_End()
;BEGIN AUTOCAST TYPE followersscript
followersscript kmyQuest = GetOwningQuest() as followersscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CommandActor.GetActorReference().PlayIdle(kmyquest.IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CommandTarget Auto Const
