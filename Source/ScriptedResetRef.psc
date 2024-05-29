Scriptname ScriptedResetRef extends ObjectReference Hidden
{Script on references that will be reset by DNMasterQuestResetManager.}

DNMasterQuestResetManager Property DNMasterQuest Auto Const

Function RegisterForReset()
    if (DNMasterQuest != None)
        DNMasterQuest.RegisterForReset(Self, Self.GetCurrentLocation(), Utility.GetCurrentGameTime())
    EndIf
EndFunction

Function ScriptedReset()
    ;To be overridden by scripts extending this script.
EndFunction

Event OnReset()
    ScriptedReset()
EndEvent