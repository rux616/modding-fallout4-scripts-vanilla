Scriptname FFGoodneighbor01MemorySequenceScript extends Quest Conditional

InputEnableLayer Property EnableLayer Auto Hidden
ObjectReference Property MQ105MemoryDenMagicDoor Auto Const
ObjectReference Property MQ105MemoryDenPlayerMarker Auto Const

Sound Property QSTMQ105MemoryDenMemoryEnter Auto Const
Sound Property QSTMQ105MemoryDenMemoryExit Auto Const
ObjectReference Property MQ203AmbientLightsEnableMarker Auto Const
SoundCategorySnapshot Property CSKelloggsBrain auto const

ReferenceAlias Property MemoryDenInstantEnterLounger Auto Const
ObjectReference Property MQ105PlayerMovetoInsideMemoryMarker Auto const
ObjectReference Property MQ105MagicDoortoMemoryDen Auto Const
Quest Property FFGoodneighbor01 Auto Const

function StartQuest()
	EnableLayer = InputEnableLayer.Create()
	EnableLayer.DisablePlayerControls(abMovement = false, abFighting = true, abCamSwitch = true, abLooking = false, abSneaking = true, \
		abMenu = true, abActivate = false, abJournalTabs = true, abVATS = true, abFavorites = true)

	; turn off radio
	Game.TurnPlayerRadioOn(false)

	;force preloader if needed
	MQ105MemoryDenMagicDoor.PreloadTargetArea()

	MemoryLoungerEnterImod.Apply()
	
	;fade game out
	Game.FadeOutGame(abFadingOut=True, abBlackFade=False, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=True)

	;play the memory enter sounds
	QSTMQ105MemoryDenMemoryEnter.Play(Game.GetPlayer())

	; initialize Kellogg sequence before moving player so actors can load into position
	MQ101KelloggSequence.StartKelloggSequence(1)

	;wait a few seconds, then move player
	Utility.Wait(6.0)

	Game.GetPlayer().Moveto(MQ105MemoryDenPlayerMarker)
	Utility.Wait(1.0)
	MQ105MemoryDenMagicDoor.Activate(Game.GetPlayer())

	; make player invisible
	Game.GetPlayer().AddSpell(MQ203PlayerInvisibility, abVerbose=False)

	; sound category snapshot
	;CSKelloggsBrain.Push(0.0)

	; initialize spouse pod/primitive
	if Game.GetPlayer().GetActorBase().GetSex() == 1
		; player is female
		; put spouse pod/primitives into MALE named versions
		Alias_MemorySpousePodMale.ForceRefTo(Alias_MemorySpousePod.GetRef())
		Alias_MemorySpousePrimitiveMale.ForceRefTo(Alias_MemorySpousePrimitive.GetRef())
	else
		; player is male
		; put spouse pod/primitives into FEMALE named versions
		Alias_MemorySpousePodFemale.ForceRefTo(Alias_MemorySpousePod.GetRef())
		Alias_MemorySpousePrimitiveFemale.ForceRefTo(Alias_MemorySpousePrimitive.GetRef())
	endif

	; initialize alias scripts
	int i = 0
	while i < MemoryVoiceovers.Length
		MQ105ActivationBlockerScript theAlias = MemoryVoiceovers[i]
		if theAlias.GetRef()
			theAlias.Initialize()
		endif
		i += 1
	endWhile

		;start fading game in
	Game.FadeOutGame(abFadingOut=False, abBlackFade=False, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=False)

	;wait for fade-insqs 
	Utility.Wait(4.0)

	SetStage(15)

	; remove HUD
	game.SetInsideMemoryHUDMode(true)

endFunction

; pause v111 sequence
function PauseMemory(bool bPause)
	MQ101KelloggSequence.PauseSequence(bPause)
EndFunction


Function FinishQuest()
	MemoryLoungerEnterImod.Apply()
	;fade game out
	Game.FadeOutGame(abFadingOut=True, abBlackFade=False, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=True)

	;play memory transition sounds
	;these are now called in Amari's voiceover scene
	;QSTMQ105MemoryDenMemoryExit.Play(Game.GetPlayer())

	;wait a few seconds, then move player
	Utility.Wait(6.0)

	;remove invisibility
	Game.GetPlayer().RemoveSpell(MQ203PlayerInvisibility)

	; restore HUD
	game.SetInsideMemoryHUDMode(false)

	; move player
	;Game.GetPlayer().MoveTo(MQ105PlayerMovetoInsideMemoryMarker)

	MQ105MagicDoortoMemoryDen.Activate(Game.GetPlayer())

	Utility.Wait(0.1)

	;snap player to furniture
	MemoryDenInstantEnterLounger.GetRef().Activate(Game.GetPlayer(), True)
	;close the memory lounger
	MemoryDenInstantEnterLounger.GetRef().PlayAnimation("g_idleSitInstant")

	;remove invisibility
	Game.GetPlayer().RemoveSpell(MQ203PlayerInvisibility)

	;wait for player to be in furniture before fading in
	Utility.Wait(5.0)

	;start fading game in
	Game.FadeOutGame(abFadingOut=False, abBlackFade=False, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=False)

	;wait for fade-in
	Utility.Wait(3.0)

	FFGoodneighbor01.SetStage(60)

	;shutdown kellogg sequence
	MQ101KelloggSequence.Stop()
EndFunction

ObjectReference Property MQ105SceneStartMarker const auto
ObjectReference Property MQ105MemoryDenReturnMarker const auto
MQ101KelloggSequenceScript property MQ101KelloggSequence const auto

Spell Property MQ203PlayerInvisibility const auto
{ spell to prevent actors from headtracking player }

MQ105ActivationBlockerScript[] Property MemoryVoiceovers const auto
{ aliases which the player can interact with in the memory }

Message Property MQ105ActivationText const auto
{ activation text override }

; getting correct name on correct pod
ReferenceAlias Property Alias_MemorySpousePod const auto
ReferenceAlias Property Alias_MemorySpousePrimitive const auto
ReferenceAlias Property Alias_MemorySpousePodMale const auto
ReferenceAlias Property Alias_MemorySpousePodFemale const auto
ReferenceAlias Property Alias_MemorySpousePrimitiveMale const auto
ReferenceAlias Property Alias_MemorySpousePrimitiveFemale const auto
ImageSpaceModifier Property MemoryLoungerEnterImod Auto Const Mandatory
