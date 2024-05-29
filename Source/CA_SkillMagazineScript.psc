Scriptname CA_SkillMagazineScript extends ObjectReference Const

keyword Property CA_Event_ReadSkillBook const auto
{auto fill}

Event OnActivate(ObjectReference akActionRef)
    FollowersScript.SendAffinityEvent(self, CA_Event_ReadSkillBook)
EndEvent

