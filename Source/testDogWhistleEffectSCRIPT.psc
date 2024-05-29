Scriptname testDogWhistleEffectSCRIPT extends ActiveMagicEffect

sound Property NPCHumanWhistleDog Auto Const
actor property DogmeatRef auto const
Potion Property DogWhistleItem Auto Const
GlobalVariable Property PlayerHasActiveDogmeatCompanion Auto Const
Message Property testDogWhistleDogmeatAbsentMSG Auto Const
Scene Property DogmeatGotoPlayerScene Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace("Dog Whistle: Effect Start")

	if PlayerHasActiveDogmeatCompanion.getValue() == 0
		testDogWhistleDogmeatAbsentMSG.show()
	else
	    DogmeatRef.setDoingFavor()
	 	DogmeatRef.FollowerFollow()
	 	DogmeatGotoPlayerScene.start()
	endif
	 	game.getPlayer().addItem(DogWhistleItem, 1, true)
	 	game.getplayer().markItemAsFavorite(DogWhistleItem)
	    Debug.trace("Dog Whistle: Done!")
EndEvent



