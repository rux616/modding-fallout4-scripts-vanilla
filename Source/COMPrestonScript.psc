Scriptname COMPrestonScript extends Quest Conditional

Group AffinityConversations
	bool property AdmirationPlayerCynical auto Conditional

	bool property DisdainPlayerApologized auto Conditional

	int property InfatuationPlayerResponse auto Conditional
	{ 1 = Mistake
	  2 = Have to think about it 
	  3 = Still love my spouse
	  }

endGroup

ReferenceAlias Property Alias_Preston Auto Const
