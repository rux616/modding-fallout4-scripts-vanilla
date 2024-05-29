Scriptname MQ101PlayerCommentsScript extends Quest

ReferenceAlias[] Property PlayerCommentObjectArray Auto

;grab all the player comment objects and make sure the player can't activate them
Function ClearPlayerComments()
	int currentElement = 0
	while (currentElement < PlayerCommentObjectArray.length)
		PlayerCommentObjectArray[currentElement].GetRef().BlockActivation(True, True)
		currentElement += 1
	EndWhile
EndFunction