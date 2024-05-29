Scriptname DN011OverdueBooksQuest extends Quest Hidden

GlobalVariable Property DN011TotalOverdueBooksGlobal Auto Const Mandatory
GlobalVariable Property DN011OverdueBooksPlayerTokenCount Auto Const Mandatory

	; Increase the Overdue Books count by one, and update the global for text replacement.
Function AddToOverdueBooks()
	 DN011TotalOverdueBooksGlobal.SetValue(DN011TotalOverdueBooksGlobal.GetValue() + 1)
	 UpdateCurrentInstanceGlobal(DN011TotalOverdueBooksGlobal)
EndFunction

	; Decrease the Overdue Books count by one, and update the global for text replacement.
Function RemoveFromOverdueBooks(Int BookAmount)
	 DN011TotalOverdueBooksGlobal.SetValue(DN011TotalOverdueBooksGlobal.GetValue() - BookAmount)
	 UpdateCurrentInstanceGlobal(DN011TotalOverdueBooksGlobal)
EndFunction

	; Update the globals for each item in the list.
Function UpdateVendingMachineGlobalsForReplacement(GlobalVariable[] ArrayOfGlobals)
	int count = 0
	while (count < ArrayOfGlobals.Length)
			UpdateCurrentInstanceGlobal(ArrayOfGlobals[count])
		count += 1
	endwhile

	UpdateCurrentInstanceGlobal(DN011OverdueBooksPlayerTokenCount)
EndFunction