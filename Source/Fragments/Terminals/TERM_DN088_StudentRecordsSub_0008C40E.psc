;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN088_StudentRecordsSub_0008C40E Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if DN088_CanFindPassword.GetValue() >= 1
	if Game.GetPlayer().GetItemCount(DN088_SafePassword) < 1
		;DN088_SafePasswordMessage.Show()
		Game.GetPlayer().AddItem(DN088_SafePassword)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DN088_CanFindPassword Auto Const

Key Property DN088_SafePassword Auto Const

Message Property DN088_SafePasswordMessage Auto Const
