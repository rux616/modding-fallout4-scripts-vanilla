Scriptname InstituteHiggsLokenKickoutScript extends ReferenceAlias Conditional

Quest Property InstituteKickOut Auto Const
Faction Property InstM03RebelFaction Auto

Event OnDying(Actor Killer)
;if we're in first arrival, don't run kickout, just update MQ207

	if MQ207.IsRunning()

		if MQ207.GetStageDone(180)== False
			MQ207.SetStage(180)
		endif
;make sure proper objectives are displayed
		if MQ207.IsObjectiveDisplayed(150)
			MQ207.SetObjectiveDisplayed(150,0)
		endif
		if MQ207.IsObjectiveCompleted(160)==False
			MQ207.SetObjectiveDisplayed(160)
		endif
		MQ207.SetObjectiveDisplayed(180)

;set joined global to 0 if it was at 1
		if PlayerInstitute_Joined.GetValue() == 1
			PlayerInstitute_Joined.SetValue(0)
		endif

		
;if MQ302 isn't running, run kickout quest
	elseif MQ302.IsRunning()==False && GetActorRef().IsInFaction(InstM03RebelFaction) == False && Inst307.GetStage()<30
		if Killer== Game.GetPlayer()
			InstituteKickOut.Start()
		endif




;but if it IS, and we haven't hit the point where it turns over, update MQ302RR

	elseif MQ302RR.IsRunning()==True && MQ302RR.GetStage() < 325
		If Killer==Game.GetPlayer()
			MQ302RR.SetStage(325)
		endif
	endif


EndEvent

Quest Property MQ302 Auto Const

Quest Property MQ207 Auto Const

Quest Property Inst308 Auto Const
GlobalVariable Property PlayerInstitute_Joined Auto Const

Quest Property MQ302RR Auto Const Mandatory

Quest Property Inst307 Auto Const Mandatory
