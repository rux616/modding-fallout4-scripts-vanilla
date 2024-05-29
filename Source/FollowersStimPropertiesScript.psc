Scriptname FollowersStimPropertiesScript extends Quest
{Temporary script to hold properties common to StimSenseObject system}
;****OBSOLETE see AOScript***

formlist Property TestStimObjectsList const auto
{list of Objects that would be flagged as "Is Stim Object" in the real system}

keyword Property TestStimObjectStart const auto
{keyword story manager is looking for}

keyword[] Property StimTypeKeywords const auto
{List of "known" StimTypeXXX keywords... assists this script in checking if actor and object have matching keywords}

keyword Property StimTypeUsedForLockDoors const auto
{Set to: StimTypeLockPick -- needed because doors don't have keywords (yet), we will assume if actor has this keyword, he will be interested in doors}