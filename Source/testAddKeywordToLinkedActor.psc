Scriptname testAddKeywordToLinkedActor extends ObjectReference Const
{Add a dynamic keyword to the linkedRef on activation.  Optionally scrubs selected other keywords}

Keyword[] Property keywordsToScrub Auto Const
keyword[] Property keywordsToAdd auto const
bool property bArchetypeChange = FALSE auto const

Event OnActivate(ObjectReference akActionRef)

	debug.trace("=====================================================")
	debug.trace("== script: testAddKeywordToLinkedActor debug block ")
	
	if bArchetypeChange
		if keywordsToAdd;[0] != NONE
			(getLinkedRef() as actor).ChangeAnimArchetype(keywordsToAdd[0])
			debug.trace("== Changed anim Archetype to "+keywordsToAdd[0])
		else
			(getLinkedRef() as actor).ChangeAnimArchetype()
			debug.trace("== Changed anim Archetype to Neutral/none")
		endif
	else
	   	if keywordsToAdd.length > 0
		   	int index = 0
		   	while index < keywordsToAdd.length
		   		if !(getLinkedRef() as actor).hasKeyword(keywordsToAdd[index])
		   			(getLinkedRef() as actor).addKeyword(keywordsToAdd[index])
		   			debug.trace("== added keyword "+keywordsToAdd[index]+" to "+getLinkedRef()+".  Index: "+index)
		   			endif
		   		index += 1
		   	endwhile
	  	endif

	  	debug.trace("== This is in between the add/scrub blocks.")

		if keywordsToScrub.length > 0
			int index = 0
			while index < keywordsToScrub.length
				if (getLinkedRef() as actor).hasKeyword(keywordsToScrub[index])
					(getLinkedRef() as actor).removeKeyword(keywordsToScrub[index])
					debug.trace("== removed keyword "+(keywordsToScrub[index])+" from "+getLinkedRef()+".  Index: "+index)
				endif
				index += 1
			endwhile
		endif
   	endif

	debug.trace("=====================================================")

EndEvent

