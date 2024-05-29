Scriptname DLC01:DLC01RadiantQuestScript extends Quest

DLC01:DLC01MQ00Script property DLC01MQ00 auto const mandatory

MiscObject property ItemToWatchFor auto const
{ optional - if this property exists, ItemToWatchForAddStage will be set when it is added to player inventory }

int property ItemToWatchForAddStage = -1 auto const
{ stage to set when item is added to player }

referenceAlias property ItemToWatchForAlias auto const
{ optional - create and put the ItemToWatchFor in this alias on quest start }

referenceAlias property ItemToWatchForContainerAlias auto const
{ optional - put the ItemToWatchFor in this container on quest start }

Event OnQuestInit()
	debug.trace(self + " OnQuestInit")
	DLC01MQ00.TrackRadiantQuest(self, bAddToList = true)
    if ItemToWatchFor
    	Actor player = Game.GetPlayer()
		debug.trace(self + " OnQuestInit: registering for OnItemAdded event for player")
   		AddInventoryEventFilter(ItemToWatchFor)
   		RegisterForRemoteEvent(player, "OnItemAdded")

    	if player.GetItemCount(ItemToWatchFor) > 0
    		if ItemToWatchForAddStage > 0
    			SetStage(ItemToWatchForAddStage)
    		endif
    	endif

   		ObjectReference itemContainer = ItemToWatchForContainerAlias.GetRef()
   		if itemContainer
        ; create item
        ObjectReference itemRef = itemContainer.PlaceAtMe(ItemToWatchFor, abInitiallyDisabled = true)
        ; put item into alias
        ItemToWatchForAlias.ForceRefTo(itemRef)
        ; put item into container
   			itemContainer.AddItem(itemRef)
        ; enable item
        itemRef.Enable()
   		endif
    endif
EndEvent

Event OnQuestShutdown()
	debug.trace(self + " OnQuestShutdown")
	DLC01MQ00.TrackRadiantQuest(self, bAddToList = false)
endEvent

event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.trace(self + " OnItemAdded " + akBaseItem)
	if akSource == Game.GetPlayer() && akBaseItem == ItemToWatchFor && ItemToWatchForAddStage > 0 && GetStageDone(ItemToWatchForAddStage) == false
		SetStage(ItemToWatchForAddStage)
	endif
endEvent

function RemoveItemFromPlayer()
	if ItemToWatchFor
		Game.GetPlayer().RemoveItem(ItemToWatchFor, 1)
	endif
endFunction

function CompleteQuest()
  DLC01MQ00.CompleteRadiantQuest(self)
endFunction