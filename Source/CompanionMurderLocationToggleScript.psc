Scriptname CompanionMurderLocationToggleScript extends Quest Const
{Used to make companions not care about murders in locations after quests that send you to kill people there.}

Group AutoFillFollowersScript
FollowersScript Property Followers const auto	 mandatory

EndGroup

Group AutoFillLocations
location Property InstituteLocation const auto mandatory

location Property BostonAirportLocation const auto mandatory
location Property BostonAirportAliasCellLocation const auto mandatory
location Property BostonAirportRuinsLocation const auto mandatory
location Property PrydwenLocation const auto mandatory
location Property PrydwenQuartersLocation const auto mandatory

location Property RailroadHQLocation const auto mandatory

EndGroup

Function OkayToMurderInInstitute()
	Followers.SetLocationForCompanionsToIgnoreMurder(InstituteLocation)
EndFunction

Function OkayToMurderInBrotherhoodHQ()
	Followers.SetLocationForCompanionsToIgnoreMurder(BostonAirportLocation)
	Followers.SetLocationForCompanionsToIgnoreMurder(BostonAirportAliasCellLocation)
	Followers.SetLocationForCompanionsToIgnoreMurder(BostonAirportRuinsLocation)

	Followers.SetLocationForCompanionsToIgnoreMurder(PrydwenLocation)
	Followers.SetLocationForCompanionsToIgnoreMurder(PrydwenQuartersLocation)

EndFunction

Function OkayToMurderInRailroadHQ()
	Followers.SetLocationForCompanionsToIgnoreMurder(RailroadHQLocation)
EndFunction