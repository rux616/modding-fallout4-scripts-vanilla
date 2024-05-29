;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN088_MayorsSubTerminal_001D83A6 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Actor Player = game.getPlayer()
if Player.GetItemCount(DN088_VaultPassword) < 1
	Player.AddItem(DN088_VaultPassword)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property DN088_VaultPassword Auto Const
