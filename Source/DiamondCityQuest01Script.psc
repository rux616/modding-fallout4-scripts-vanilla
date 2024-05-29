Scriptname DiamondCityQuest01Script extends Quest  Conditional

Int Property AbbotFirstTalk = 0 Auto Conditional
{1 = Positive, 2 = Negative, 3 = Neutral, 4 = Question, 5 = Speech Challenge}

Int Property AbbotQuestTalk = 0 Auto Conditional
{1 = Positive, 2 = Negative, 3 = Neutral, 4 = Question}

;track if the player wins the info on Hardware Town
Int Property AbbotHardwareTown = 0 Auto Conditional

;track player's rewards for speech challenges
Int Property AbbotReward = 0 Auto Conditional

;track the player's bonus for getting Green Paint
Int Property AbbotGreenBonus = 0 Auto Conditional