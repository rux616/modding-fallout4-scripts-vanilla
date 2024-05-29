Scriptname DefaultKillLinkRefChainOnLoad extends ObjectReference Default
{Kills all the actors linked ref chained to this reference (Optionally use Keyword)}

Keyword Property LinkKeyword const auto

Event OnLoad()
    int count = 0
    int countmax
    if LinkKeyword
		countmax = CountLinkedRefChain(LinkKeyword)
	else
		countmax = CountLinkedRefChain()
	endif
	while (count < countmax)
		count += 1
		if LinkKeyword
			(GetNthLinkedRef(count, LinkKeyword) as Actor).Kill()
		else
			(GetNthLinkedRef(count) as Actor).Kill()
		endif
	endwhile
EndEvent