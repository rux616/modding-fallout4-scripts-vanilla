Scriptname DN011OverdueBookDropbox extends ObjectReference Hidden Const

Message Property DN011OverdueBooksDropboxMessageNone Auto Const

Message Property DN011OverdueBookDropboxMessage Auto Const

Message Property DN011OverdueBooksDropboxMessage Auto Const

Quest Property DN011OverdueBooks Auto Const

MiscObject Property DN011OverdueBook Auto Const

GlobalVariable Property DN011OverdueBookXPRewardGlobal Auto Const

Quest Property FFGoodneighbor02 Auto Const

Event OnLoad()
    self.BlockActivation(TRUE)
EndEvent

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	int BooksInPlayersInventory = Game.GetPlayer().GetItemCount(DN011OverdueBook)
    	if BooksInPlayersInventory == 0
    		DN011OverdueBooksDropboxMessageNone.Show()
    	elseif BooksInPlayersInventory == 1
		    DN011OverdueBookDropboxMessage.Show(BooksInPlayersInventory)
		    RemoveBooks(BooksInPlayersInventory)
            ;WJS - update goodneighbor quest if it's running
            If (FFGoodneighbor02.IsRunning()) && (FFGoodneighbor02.GetStageDone(30) == 0) && (FFGoodneighbor02.GetStageDone(10) == 1)
                FFGoodneighbor02.SetStage(30)
            EndIf
		elseif BooksInPlayersInventory > 1
		    DN011OverdueBooksDropboxMessage.Show(BooksInPlayersInventory)
		    RemoveBooks(BooksInPlayersInventory)
            ;WJS - update goodneighbor quest if it's running
            If (FFGoodneighbor02.IsRunning()) && (FFGoodneighbor02.GetStageDone(30) == 0) && (FFGoodneighbor02.GetStageDone(10) == 1)
                FFGoodneighbor02.SetStage(30)
            EndIf
		endif
    endif
EndEvent

Function RemoveBooks(int AmountToRemove)
	self.SetOpen()
	(DN011OverdueBooks as DN011OverdueBooksQuest).RemoveFromOverdueBooks(AmountToRemove)
    Game.RewardPlayerXP((AmountToRemove * DN011OverdueBookXPRewardGlobal.GetValueInt()))
    Game.GetPlayer().RemoveItem(DN011OverdueBook, AmountToRemove)
	utility.Wait(0.5)
    self.SetOpen(FALSE)
EndFunction