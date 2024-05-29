;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_PerksQuest_0004A09E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
ScroungerPerkChance.SetValue(60)
ScroungerPerkChanceSmall.SetValue(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
ScroungerPerkChance.SetValue(30)
ScroungerPerkChanceSmall.SetValue(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
ScroungerPerkChance.SetValue(0)
ScroungerPerkChanceSmall.SetValue(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
FortuneFinderPerkChance.SetValue(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
FortuneFinderPerkChance.SetValue(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
FortuneFinderPerkChance.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(BloodyMess, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Game.GetPlayer().AddToFaction(AnimalFriend01Faction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
Game.GetPlayer().AddToFaction(AnimalFriend02Faction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
abPerkAbsorbRadiation.Cast(game.GetPlayer(), game.getplayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Strength, Game.Getplayer().GetBaseValue(Strength)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Perception, Game.Getplayer().GetBaseValue(Perception)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Endurance, Game.Getplayer().GetBaseValue(Endurance)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Charisma, Game.Getplayer().GetBaseValue(Charisma)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Intelligence, Game.Getplayer().GetBaseValue(Intelligence)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Agility, Game.Getplayer().GetBaseValue(Agility)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Luck, Game.Getplayer().GetBaseValue(Luck)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
BobbleheadSpeech.SetValue(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
; Set scrapping globals
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Strength, Game.Getplayer().GetBaseValue(Strength)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Perception, Game.Getplayer().GetBaseValue(Perception)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Endurance, Game.Getplayer().GetBaseValue(Endurance)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Charisma, Game.Getplayer().GetBaseValue(Charisma)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Intelligence, Game.Getplayer().GetBaseValue(Intelligence)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0770_Item_00
Function Fragment_Stage_0770_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Agility, Game.Getplayer().GetBaseValue(Agility)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0780_Item_00
Function Fragment_Stage_0780_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(Luck, Game.Getplayer().GetBaseValue(Luck)+1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
game.GetPlayer().SetValue(FastTravelOverEncumbered, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
game.ShowAllMapMarkers()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
game.GetPlayer().Additem(AtomicCommand_HolotapeGame)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
game.GetPlayer().Additem(Grognak_HolotapeGame)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1030_Item_00
Function Fragment_Stage_1030_Item_00()
;BEGIN CODE
game.GetPlayer().Additem(Pipfall_HolotapeGame)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1040_Item_00
Function Fragment_Stage_1040_Item_00()
;BEGIN CODE
game.GetPlayer().Additem(RedMenace_HolotapeGame)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
game.GetPlayer().Additem(ZetaInvaders_HolotapeGame)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1070_Item_00
Function Fragment_Stage_1070_Item_00()
;BEGIN CODE
DiamondCityMapMarkerRef.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
game.GetPlayer().Additem(HackerHolotapeProtectron)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
game.GetPlayer().Additem(HackerHolotapeSpotlight)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1120_Item_00
Function Fragment_Stage_1120_Item_00()
;BEGIN CODE
game.GetPlayer().Additem(HackerHolotapeTurret)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
VATSStrangerOdds.SetValue(0.12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
VATSStrangerOdds.SetValue(0.14)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1610_Item_00
Function Fragment_Stage_1610_Item_00()
;BEGIN CODE
; Make it so you can scrap uncommon components
pModScrapScalar_Uncommon.SetValue(0.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1620_Item_00
Function Fragment_Stage_1620_Item_00()
;BEGIN CODE
; Make it so you can scrap uncommon components
pModScrapScalar_Rare.SetValue(0.5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property ScroungerPerkChance Auto Const

GlobalVariable Property FortuneFinderPerkChance Auto Const


Faction Property AnimalFriend01Faction Auto Const

Faction Property AnimalFriend02Faction Auto Const

SPELL Property AbPerkAbsorbRadiation Auto Const

ActorValue Property BloodyMess Auto Const

ActorValue Property Strength Auto Const

ActorValue Property Perception Auto Const

ActorValue Property Endurance Auto Const

ActorValue Property Charisma Auto Const

ActorValue Property Intelligence Auto Const

ActorValue Property Agility Auto Const

ActorValue Property Luck Auto Const

ActorValue Property FastTravelOverEncumbered Auto Const

GlobalVariable Property ScroungerPerkChanceSmall Auto Const

Holotape Property AtomicCommand_HolotapeGame Auto Const

Holotape Property Grognak_HolotapeGame Auto Const

Holotape Property Pipfall_HolotapeGame Auto Const

Holotape Property RedMenace_HolotapeGame Auto Const

Holotape Property ZetaInvaders_HolotapeGame Auto Const

Holotape Property hackerHolotapeProtectron Auto Const

Holotape Property hackerHolotapeSpotlight Auto Const

Holotape Property hackerHolotapeTurret Auto Const

ObjectReference Property DiamondCityMapMarkerRef Auto Const

GlobalVariable Property VATSStrangerOdds Auto Const

GlobalVariable Property BobbleheadSpeech Auto Const

GlobalVariable Property pModScrapScalar_Uncommon Auto Const

GlobalVariable Property pModScrapScalar_Rare Auto Const
