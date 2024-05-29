Scriptname DN123_SkylanesSecretCompartmentScript extends ObjectReference Hidden
{Script for the Skylanes Secret Compartment.}
;
;All Skylanes Secret Compartments are no-reset containers. When a compartment first loads and resolves its contents, this script uses OnItemAdded events to compile a list of those contents,
;then uses that list to populate a note (the 'cargo manifest') using text replacement. It then places the manifest into the compartment.
;This script has a limit of ten unique items per container, enforced by the leveled list that generates the container's contents.

Group Required_Properties 
	ReferenceAlias property SecretCompartmentManifest auto const mandatory
	{The cargo manifest note associated with this container.}

	GlobalVariable[] property SkylanesSecretCompartmentGlobals auto const mandatory
	{Array of 10 globals to store the counts of the items in this container. Required for text replacement.}
EndGroup

Group Auto_Properties
	ObjectReference property SkylanesTransferContainer auto const mandatory
	{An empty container in a holding cell that we can transfer our items to temporarily.}

	MiscObject property PrewarMoney auto const mandatory
	{The Prewar Money misc item.}

	Message property SkylanesMoneyMessage auto const mandatory
	{A fixed message for the Prewar Money in the container, since we can't call it "Prewar Money" in this context.}

	Message property SkylanesDashMessage auto const mandatory
	{A message containing " - ", to produce nicer output.}

	Message property BlankMessage auto const mandatory
	{A blank/empty message.}

	int property ItemLimit = 10 auto const
	{The maximum number of distinct items supported by the book.}
EndGroup

Form[] itemArray 	;Array of forms in the container. Limit 10.
int itemIndex 		;Next free index into items.


Auto State Waiting

	;On first load, process the contents to generate the cargo manifest.
	Event OnLoad()
		;Debug.Trace("Skylanes Compartment: Loaded")
		;Set up the item array.
		itemArray = new Form[ItemLimit]
		;Transfer all of the items in the secret compartment to the holding container.
		Self.RemoveAllItems(SkylanesTransferContainer)
		;Set up an inventory event filter so we can receive OnItemAdded events.
		Self.AddInventoryEventFilter(None)
		;Transfer all of the items back, triggering OnItemAdded events for each.
		SkylanesTransferContainer.RemoveAllItems(Self)
		;Wait to give all of the OnItemAdded events time to process, since we don't know how many to expect. This isn't ideal, but it seems to work.
		StartTimer(2, 1)
	EndEvent

	;As each item is returned to the container, record it for later reference.
	Event OnItemAdded(Form akBaseItem, int akItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		;Debug.Trace("OnItemAdded: " + akBaseItem)
		RecordItem(akBaseItem, akItemCount)
	EndEvent

	;When the timer expires, assemble the manifest.
	Event OnTimer(int timerID)
		if (timerID == 1)
			GenerateManifest()
		EndIf
	EndEvent
EndState

State Done
	;Do nothing.
EndState


;Store incoming items into the item arrays. Ignore and discard duplicates (which stack for the purposes of GetItemCount) and Prewar Money (which we handle seperately later).
Function RecordItem(Form akBaseItem, int akItemCount)
	if (akBaseItem != PrewarMoney)
		if ((itemIndex < ItemLimit) && (itemArray.Find(akBaseItem) < 0))
			;Debug.Trace("Skylanes Compartment: Recorded item " + akBaseItem + ", " + akItemCount)
			itemArray[itemIndex] = akBaseItem
			itemIndex = itemIndex + 1
			;Restart the timer.
			StartTimer(1, 1)
		EndIf
	EndIf
EndFunction


Function GenerateManifest()
	;Debug.Trace("Skylanes Compartment: Generating manifest.")

	;Ignore any further OnItemAdded or OnTimer events.
	GoToState("Done")
	
	;Remove the inventory filter, which we don't need anymore.
	Self.RemoveInventoryEventFilter(None)

	;Get the manifest ref.
	ObjectReference SecretCompartmentManifestObj = SecretCompartmentManifest.GetReference()

	;Replace the tokens in the manifest.
	int i = 0
	While (i < ItemLimit)
		if (i < itemIndex)
			;Replace the tokens at this index with the appropriate item.
			;Debug.Trace("REPL: " + Self.GetItemCount(itemArray[i]) + ", " + itemArray[i])
			SkylanesSecretCompartmentGlobals[i].SetValue(Self.GetItemCount(itemArray[i]))
			SecretCompartmentManifestObj.AddTextReplacementData("Count" + i, SkylanesSecretCompartmentGlobals[i])
			SecretCompartmentManifestObj.AddTextReplacementData("Dash" + i, SkylanesDashMessage)
			SecretCompartmentManifestObj.AddTextReplacementData("Item" + i, itemArray[i])
		ElseIf (i == itemIndex)
			;Replace the tokens at this index with the Prewar Money fixed message.
			SecretCompartmentManifestObj.AddTextReplacementData("Count" + i, SkylanesMoneyMessage)
			SecretCompartmentManifestObj.AddTextReplacementData("Dash" + i, BlankMessage)
			SecretCompartmentManifestObj.AddTextReplacementData("Item" + i, BlankMessage)
		Else
			;Otherwise, just replace the tokens with blanks.
			SecretCompartmentManifestObj.AddTextReplacementData("Count" + i, BlankMessage)
			SecretCompartmentManifestObj.AddTextReplacementData("Dash" + i, BlankMessage)
			SecretCompartmentManifestObj.AddTextReplacementData("Item" + i, BlankMessage)
		EndIf
		i = i + 1
	EndWhile

	;Move the manifest to this container.
	Self.AddItem(SecretCompartmentManifestObj)

	;Debug.Trace("Skylanes Compartment: Manifest complete.")
EndFunction