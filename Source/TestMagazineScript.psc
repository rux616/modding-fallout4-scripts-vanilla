Scriptname TestMagazineScript extends ObjectReference Const

Perk Property MagazinePerk Auto Const

Event OnRead()
	game.GetPlayer().AddPerk(MagazinePerk)
EndEvent