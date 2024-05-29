Scriptname CIS_ManagerScript extends Quest Const
{Script for having various story manager event quests pass their data through to a unified quest that starts a companion interaction scene.}


Group AutoFill

GlobalVariable Property CIS_Type_ChatWithNPC const auto
	Faction Property CIS_ChatWithNPCFaction_Cait const auto
	Faction Property CIS_ChatWithNPCFaction_Codsworth const auto
	Faction Property CIS_ChatWithNPCFaction_Curie const auto
	Faction Property CIS_ChatWithNPCFaction_Danse const auto
	Faction Property CIS_ChatWithNPCFaction_Deacon const auto
	Faction Property CIS_ChatWithNPCFaction_Hancock const auto
	Faction Property CIS_ChatWithNPCFaction_MacCready const auto
	Faction Property CIS_ChatWithNPCFaction_Piper const auto
	Faction Property CIS_ChatWithNPCFaction_Preston const auto
	Faction Property CIS_ChatWithNPCFaction_Strong const auto
	Faction Property CIS_ChatWithNPCFaction_Valentine const auto
	Faction Property CIS_ChatWithNPCFaction_X688 const auto

GlobalVariable Property CIS_Type_CurieScan const auto
	Faction Property CIS_CurieScanFaction const auto
	Activator Property AO_CurieScan_Object const auto

GlobalVariable Property CIS_Type_DeaconGiveInfo const auto
	Faction Property CIS_DeaconGiveInfoFaction const auto
	Activator Property AO_DeaconGiveInfo_Object const auto
	

GlobalVariable Property CIS_Type_EnterNewLocation const auto

GlobalVariable Property CIS_Type_PiperTakeNotes const auto
	Activator Property AO_PiperTakeNotes_Object const auto


GlobalVariable Property CIS_Type_RacialComments const auto
	Faction Property CIS_RacialCommentsFaction_Codsworth const auto
	Faction Property CIS_RacialCommentsFaction_Hancock const auto
	Faction Property CIS_RacialCommentsFaction_Strong const auto
	Faction Property CIS_RacialCommentsFaction_Valentine const auto
	Faction Property CIS_RacialCommentsFaction_X6 const auto

GlobalVariable Property CIS_Type_ValentineHackTerminalReminder const auto

location Property DiamondCityLocation const auto		
location Property BunkerHillLocation const auto		
location Property GoodneighborLocation const auto		

EndGroup

;Reminder:
;This has it's roots in various story manager events:
;Script Event
;Change Location Event
;Actor Dialogue Event
;Actror Hello Event
;Attraction Object Event
;Look for "Companion" nodes in those to set timers and conditions.
Function StartCompanionInteractionScene(ReferenceAlias AliasCompanion, ReferenceAlias AliasTarget, LocationAlias AliasLocation, GlobalVariable ForceCISType = none)
	
	FollowersScript.Trace(self, "StartCompanionInteractionScene() AliasCompanion:" + AliasCompanion + ", AliasTarget:" + AliasTarget + ", AliasLocation:" + AliasLocation + ", ForceCISType" + ForceCISType)
	FollowersScript.Trace(self, "StartCompanionInteractionScene() AliasCompanion:" + AliasCompanion.GetReference() + AliasTarget.GetReference() + AliasLocation.GetLocation() + ForceCISType)

	Actor myCompanion = AliasCompanion.GetActorReference()
	objectreference myTarget = AliasTarget.GetReference()
	location myLocation = AliasLocation.GetLocation()

	CommonPropertiesScript CP = Game.GetCommonProperties()

	Actor CaitRef = CP.CaitRef
	Actor CodsworthRef = CP.CodsworthRef
	Actor CurieRef = CP.CurieRef
	Actor DanseRef = CP.DanseRef
	Actor DeaconRef = CP.DeaconRef
	Actor HancockRef = CP.HancockRef
	Actor MacCreadyRef = CP.MacCreadyRef
	Actor PiperRef = CP.PiperRef
	Actor PrestonRef = CP.PrestonRef
	Actor StrongRef = CP.StrongRef
	Actor ValentineRef = CP.ValentineRef
	Actor X688Ref = CP.X688Ref

	;CURIE SCANS
	if myCompanion == CurieRef && ( myTarget.GetBaseObject() == AO_CurieScan_Object || (myTarget AS actor).IsInfaction(CIS_CurieScanFaction) )
		FollowersScript.StartCompanionInteractionScene(CIS_Type_CurieScan, myTarget, myLocation, myCompanion)
	endif

	;PIPER TAKES NOTES
	if myCompanion == PiperRef && myTarget.GetBaseObject() == AO_PiperTakeNotes_Object
		FollowersScript.StartCompanionInteractionScene(CIS_Type_PiperTakeNotes, myTarget, myLocation, myCompanion)
	endif 

	;DEACON GIVES INFO
	if myCompanion == DeaconRef && ( myTarget.GetBaseObject() == AO_DeaconGiveInfo_Object || (myTarget AS actor).IsInfaction(CIS_DeaconGiveInfoFaction) )
		FollowersScript.StartCompanionInteractionScene(CIS_Type_DeaconGiveInfo, myTarget, myLocation, myCompanion)
	endif

	;CHAT WITH NPCs
	tryToChatWithNPCs(CaitRef, CIS_ChatWithNPCFaction_Cait, myTarget, myLocation)
	tryToChatWithNPCs(CodsworthRef, CIS_ChatWithNPCFaction_Codsworth, myTarget, myLocation)
	tryToChatWithNPCs(CurieRef, CIS_ChatWithNPCFaction_Curie, myTarget, myLocation)
	tryToChatWithNPCs(DanseRef, CIS_ChatWithNPCFaction_Danse, myTarget, myLocation)
	tryToChatWithNPCs(DeaconRef, CIS_ChatWithNPCFaction_Deacon, myTarget, myLocation)
	tryToChatWithNPCs(HancockRef, CIS_ChatWithNPCFaction_Hancock, myTarget, myLocation)
	tryToChatWithNPCs(MacCreadyRef, CIS_ChatWithNPCFaction_MacCready, myTarget, myLocation)
	tryToChatWithNPCs(PiperRef, CIS_ChatWithNPCFaction_Piper, myTarget, myLocation)
	tryToChatWithNPCs(PrestonRef, CIS_ChatWithNPCFaction_Preston, myTarget, myLocation)
	tryToChatWithNPCs(StrongRef, CIS_ChatWithNPCFaction_Strong, myTarget, myLocation)
	tryToChatWithNPCs(ValentineRef, CIS_ChatWithNPCFaction_Valentine, myTarget, myLocation)
	tryToChatWithNPCs(X688Ref, CIS_ChatWithNPCFaction_X688, myTarget, myLocation)

	;Racial Comments
	tryToChatWithNPCs(CodsworthRef, CIS_RacialCommentsFaction_Codsworth, myTarget, myLocation, isRacialComment = true)
	tryToChatWithNPCs(HancockRef, CIS_RacialCommentsFaction_Hancock, myTarget, myLocation, isRacialComment = true)
	tryToChatWithNPCs(StrongRef, CIS_RacialCommentsFaction_Strong, myTarget, myLocation, isRacialComment = true)
	tryToChatWithNPCs(ValentineRef, CIS_RacialCommentsFaction_Valentine, myTarget, myLocation, isRacialComment = true)
	tryToChatWithNPCs(X688Ref, CIS_RacialCommentsFaction_X6, myTarget, myLocation, isRacialComment = true)


EndFunction

function tryToChatWithNPCs(Actor myCompanion, Faction factionToCheck,  objectreference myTarget, location myLocation, bool isRacialComment = false)
	
	Actor myTargetActor = myTarget as Actor

	if myTargetActor && myTargetActor.IsInfaction(factionToCheck) && myCompanion == myCompanion
		
		if isRacialComment == false
			FollowersScript.StartCompanionInteractionScene(CIS_Type_ChatWithNPC, myTarget, myLocation, myCompanion)

		else ;is racial comment
			FollowersScript.StartCompanionInteractionScene(CIS_Type_RacialComments, myTarget, myLocation, myCompanion)

		endif
	endif


EndFunction

	
