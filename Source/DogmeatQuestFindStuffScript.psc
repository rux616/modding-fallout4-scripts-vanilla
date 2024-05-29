Scriptname DogmeatQuestFindStuffScript extends Quest Conditional

AOScript Property AO const auto
{Autofill}

bool FindQuestStoryManagerCallBack Conditional

message Property DogmeatQuestFindFailed const auto
message Property DogmeatQuestFindFailedNameUnknown const auto
globalvariable Property PlayerKnowsDogmeatName const auto

ReferenceAlias Property AO_Dogmeat_FindContainer_myObject const auto
ReferenceAlias Property AO_Dogmeat_FindHostile_myObject const auto
ReferenceAlias Property AO_Dogmeat_FindItem_myObject const auto

float BailoutTimerForFindQuestsToProcessCollection = 3.0 ;this should be the same as the bail out timer in the scene

;called from dialogue to have player command dogmeat to try to find something
Function DogmeatTryToFindContainer()

	FindQuestStoryManagerCallBack = false  ;scene checks for this

	;send story event, if a quest starts, wait for it to fill the proper alias after processing all the objects in it's ref collection

	if AO.SendDogmeatFindContainerStoryManagerEvent()
		;wait to make sure it processes it's collection and finds something valid
		float i = BailoutTimerForFindQuestsToProcessCollection
		while FindQuestStoryManagerCallBack == false && i > 0 
			utility.wait(0.1)
			i -= 0.1
			if AO_Dogmeat_FindContainer_myObject.GetReference()
				FindQuestStoryManagerCallBack = true
			endif
		endwhile
	endif


EndFunction

Function DogmeatTryToFindHostile()
	
	FindQuestStoryManagerCallBack = false  ;scene checks for this

	;send story event, if a quest starts, wait for it to fill the proper alias after processing all the objects in it's ref collection

	if AO.SendDogmeatFindHostileStoryManagerEvent()
		;wait to make sure it processes it's collection and finds something valid
		float i = BailoutTimerForFindQuestsToProcessCollection
		while FindQuestStoryManagerCallBack == false && i > 0 
			utility.wait(0.1)
			i -= 0.1
			if AO_Dogmeat_FindHostile_myObject.GetReference()
				FindQuestStoryManagerCallBack = true
			endif
		endwhile
	endif

EndFunction

Function DogmeatTryToFindItem()

	FindQuestStoryManagerCallBack = false  ;scene checks for this

	;send story event, if a quest starts, wait for it to fill the proper alias after processing all the objects in it's ref collection

	if AO.SendDogmeatFindItemStoryManagerEvent()
		;wait to make sure it processes it's collection and finds something valid
		float i = BailoutTimerForFindQuestsToProcessCollection
		while FindQuestStoryManagerCallBack == false && i > 0 
			utility.wait(0.1)
			i -= 0.1
			if AO_Dogmeat_FindItem_myObject.GetReference()
				FindQuestStoryManagerCallBack = true
			endif
		endwhile
	endif

EndFunction

Function ShowFailureMessage()
	if PlayerKnowsDogmeatName.GetValue() == 1
		DogmeatQuestFindFailed.show()
	else
		DogmeatQuestFindFailedNameUnknown.Show()
	endif
EndFunction

Function TraceCallbackValue()
	debug.trace(self + "FindQuestStoryManagerCallBack == " + FindQuestStoryManagerCallBack )
EndFunction