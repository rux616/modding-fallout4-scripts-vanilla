Scriptname FaceGenFullSurgeryScript extends ObjectReference

;does this chair have a surgeon? If so, everything related to the menu is handled in the SurgeonScript script on the Actor form for the Surgeon (except for CharGenSkeleton)
Bool Property HasSurgeon = False Auto 

Keyword Property AnimFaceArchetypePlayer Auto Const
{Store Player Face Archetype. We need to switch player to Neutral while in the menu.}

;when the chair loads, put the skeleton on the player
Event OnLoad()
	;84093 - do not set the chargen skeleton during OnLoad/OnUnload events, as the player might be in power armor and the skeletons are incompatible
	;Game.GetPlayer().SetHasCharGenSkeleton()
	If HasSurgeon == True
		;make sure we block activation if the surgeon isn't in the same loaded area
		Self.BlockActivation(True, True)
	EndIf
EndEvent

;84093 - do not set the chargen skeleton during OnLoad/OnUnload events, as the player might be in power armor and the skeletons are incompatible
;when the chair unloads, pull the skeleton off the player
;Event OnUnload()
	;Game.GetPlayer().SetHasCharGenSkeleton(False)
;EndEvent

;None of the following events do anything right now as the only FaceGen chair always has a Surgeon. 
;If we did want a standalone surgery chair, we'd have to import the additional scripting and safeguards that SurgeonScript.psc has

;when player activates furniture, wait until he sits, then open the face gen menu
Event OnActivate(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()
	If akActionRef == PlayerREF
		If hasSurgeon == True
			;do nothing
		Else
			RegisterForRemoteEvent(PlayerREF, "OnSit")
			RegisterForRemoteEvent(PlayerREF, "OnGetUp")		
		EndIf
	EndIf
EndEvent

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
	Actor PlayerREF = Game.GetPlayer()
	IF HasSurgeon == True
		;do nothing
	ElseIf akFurniture == Self
		;make sure player has CharGen Skeleton for editing
		PlayerREF.SetHasCharGenSkeleton()
		;make sure player face is Neutral
		PlayerREF.ChangeAnimFaceArchetype(None)
		Game.ShowRaceMenu(uimode = 3)
		RegisterForRemoteEvent(PlayerREF, "OnUnload")
		UnRegisterForRemoteEvent(PlayerREF, "OnSit")
	EndIf
EndEvent


Event Actor.OnGetUp(Actor akSender, ObjectReference akFurniture)
	Actor PlayerREF = Game.GetPlayer()
	IF HasSurgeon == True
		;do nothing
	ElseIf (akFurniture == Self) && (akSender == PlayerREF)	
		PlayerREF.SetHasCharGenSkeleton(False)
		;make sure player face is back to Player archetype
		PlayerREF.ChangeAnimFaceArchetype(AnimFaceArchetypePlayer)	
		;reset the surgery
		UnRegisterForRemoteEvent(PlayerREF, "OnGetUp")
	EndIf
EndEvent

;84093 - do not set the chargen skeleton during OnLoad/OnUnload events, as the player might be in power armor and the skeletons are incompatible
;Event ObjectReference.OnUnload(ObjectReference akSender)
	;if the player unloads, clear the chargenskeleton
;	Game.GetPlayer().SetHasCharGenSkeleton(False)
;EndEvent