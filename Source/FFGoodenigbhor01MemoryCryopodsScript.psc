Scriptname FFGoodenigbhor01MemoryCryopodsScript extends RefCollectionAlias

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	if VoiceoverScene
    		VoiceoverScene.Start()
    	endif
    endif
EndEvent

Scene Property VoiceoverScene const auto
{ optional - voiceover scene to play when activated }
