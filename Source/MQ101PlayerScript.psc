Scriptname MQ101PlayerScript extends ReferenceAlias

ReferenceAlias Property	FaceGenSink Auto Const

ReferenceAlias Property CodsworthPrewar Auto Const
ReferenceAlias Property SpouseMale Auto Const
ReferenceAlias Property SpouseFemale Auto Const
ReferenceAlias Property BabyActivator Auto Const
ReferenceAlias Property TV Auto Const
ReferenceAlias Property ActiveSpouse Auto Const
ReferenceAlias Property SpouseNameMale Auto Const
ReferenceAlias Property SpouseNameFemale Auto Const

ObjectReference Property CharGenLightsEnableMarker Auto Const
ObjectReference Property CharGenMirrorFXEnableMarker Auto Const
ObjectReference Property CharGenMirrorEnableMarker Auto Const
ImageSpaceModifier Property CharGenCameraImod Auto Const

Keyword Property AnimFaceArchetypeFriendly Auto Const
Keyword Property AnimFaceArchetypePlayer Auto Const

Idle Property HandyEquipCoffeePot Auto Const

Quest Property Tutorial Auto Const

ObjectReference Property CharGenSingleSinkMarkerREF Auto Const

Auto State WaitingState
	Event OnGetUp(ObjectReference akFurniture)
		If akFurniture == FaceGenSink.GetRef()
			gotoState("doneState")
			MQ101QuestScript MyQuest = (GetOwningQuest() as MQ101QuestScript)
			Actor PlayerREF = Game.GetPlayer()
			Actor CodsworthREF = CodsworthPrewar.GetActorRef()
			Actor SpouseMaleREF = SpouseMale.GetActorRef()
			Actor SpouseFemaleREF = SpouseFemale.GetActorRef()
			ObjectReference BabyActivatorREF = BabyActivator.GetRef()
			ObjectReference TVREF = TV.GetRef()

			;remove skeletons
			;don't do this if we removed them already due to the player being female
			;WJS - only do this for the player, we need to disable the female skeleton later so we can snap her into furniture
			If PlayerREF.GetActorBase().GetSex() == 0
			  PlayerREF.SetHasCharGenSkeleton(False)
			  ;SpouseFemaleREF.SetHasCharGenSkeleton(False)
			EndIf

			;switch no collision variants of the sink/mirror
			CharGenMirrorEnableMarker.Disable()

			; set ActiveSpouse and name
			If (PlayerREF.GetBaseObject() as ActorBase).GetSex() == 1
			  ActiveSpouse.ForceRefTo(SpouseMaleREF)
			  SpouseNameMale.ForceRefTo(SpouseMaleREF)
			Else
			  SpouseMaleREF.DisableNoWait()
			  ActiveSpouse.ForceRefTo(SpouseFemaleREF)
			  SpouseNameFemale.ForceRefTo(SpouseFemaleREF)
			EndIf

			Actor ActiveSpouseREF = ActiveSpouse.GetActorRef()

			;spouse uses sink
			MyQuest.var_MirrorSequenceDone = 1
			ActiveSpouseREF.EvaluatePackage()
			ActiveSpouseRef.SnapIntoInteraction(CharGenSingleSinkMarkerREF)

			;disable and enable baby Shaun so he matches his parents
			BabyActivatorREF.Disable()
			BabyActivatorREF.Enable()

			;disable and enable the TV for texture
			TVREF.Disable()
			TVREF.Enable()

			;clear IMOD
			CharGenCameraImod.Remove()

			;disable lights
			CharGenLightsEnableMarker.Disable()

			
			;move Codsworth
			;CodsworthREF.Moveto(MQ101CodsworthStartMarker)
			CodsworthREF.PlayIdle(HandyEquipCoffeePot)
			CodsworthREF.EvaluatePackage()

			;make sure everyone has correct faces
			PlayerREF.ChangeAnimFaceArchetype(AnimFaceArchetypePlayer)
			ActiveSpouseREF.ChangeAnimFaceArchetype(AnimFaceArchetypeFriendly)

			;disable the mirror FX
			CharGenMirrorFXEnableMarker.Disable()

			;turn SSR, Godrays, and Directional Lighting back on
			debug.trace(self + " Cancel the SSR/Godray/DirLight timer")
			MyQuest.CancelTimer(50)
			debug.trace(self + " Turn SSR/Godray/DirLight back on")
			Game.ForceDisableSSRGodraysDirLight(False, False, False)

			Utility.Wait(0.25)

			;allows saving again
			Game.SetInCharGen(False, False, False)

			;autosave
			Game.RequestAutoSave()

			Utility.Wait(0.25)

			;delay switching to third person when female until the reset is finished inside MQ101QuestScript
			If PlayerREF.GetActorBase().GetSex() == 0
				MyQuest.MQ101EnableLayer.EnablePlayerControls(abMovement = True, abFighting = False, abCamSwitch = True, abLooking = True, abSneaking = False, abMenu = False, abActivate = True, abJournalTabs = False, abVATS = False, abFavorites = False)
			Else				
				MyQuest.MQ101EnableLayer.EnablePlayerControls(abMovement = True, abFighting = False, abCamSwitch = False, abLooking = True, abSneaking = False, abMenu = False, abActivate = True, abJournalTabs = False, abVATS = False, abFavorites = False)
			EndIf

			;stop playing spouse idle lines
			MyQuest.StopTrackingMirrorGenderSwitch()

			;Close out Facegen tutorial messages
			Tutorial.SetStage(2025)

			;no need for the precache data anymore
			Game.PrecacheCharGenClear()
		EndIf
	endEvent
EndState

State doneState
	Event OnGetUp(ObjectReference akFurniture)
		;do nothing
	endEvent
EndState
