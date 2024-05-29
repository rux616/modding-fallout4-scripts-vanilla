Scriptname FaceGenBarberChairScript extends ObjectReference 

;does this chair have a barber? If so, everything is handled in the HairCut script on the Actor form for the Barber
Bool Property HasBarber = False Auto 

Keyword Property AnimFaceArchetypePlayer Auto Const
{Store Player Face Archetype. We need to switch player to Neutral while in the menu.}

Event OnLoad()
	If HasBarber == True
		;make sure we block activation if the barber isn't in the same loaded area
		Self.BlockActivation(True, True)
	EndIf
EndEvent

;when player activates furniture, wait until he sits, then open the face gen menu
Event OnActivate(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()
	If akActionRef == PlayerREF
		If HasBarber == True
			;do nothing
		Else
			RegisterForRemoteEvent(PlayerREF, "OnSit")
			RegisterForRemoteEvent(PlayerREF, "OnGetUp")
		EndIf
	EndIf
EndEvent

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
	If HasBarber == True
		;do nothing
	ElseIf akFurniture == Self
		;make sure player has CharGen Skeleton for editing
		;Game.GetPlayer().SetHasCharGenSkeleton()
		Game.ShowRaceMenu(uimode = 2)
		UnRegisterForRemoteEvent(Game.GetPlayer(), "OnSit")
	EndIf
EndEvent

Event Actor.OnGetUp(Actor akSender, ObjectReference akFurniture)
	Actor PlayerREF = Game.GetPlayer()
	IF HasBarber == True
		;do nothing
	ElseIf (akFurniture == Self) && (akSender == PlayerREF)	
		;make sure player face is back to Player archetype
		PlayerREF.ChangeAnimFaceArchetype(AnimFaceArchetypePlayer)	
		;reset the surgery
		UnRegisterForRemoteEvent(PlayerREF, "OnGetUp")
	EndIf
EndEvent