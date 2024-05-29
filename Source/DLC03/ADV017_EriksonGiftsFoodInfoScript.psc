Scriptname DLC03:ADV017_EriksonGiftsFoodInfoScript extends TopicInfo Const


LeveledItem Property ADV017_EriksonFoodGift Auto Mandatory Const

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	game.getplayer().additem(ADV017_EriksonFoodGift)

EndEvent