;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CIS_ChatWithNPC_Valentine_00183110 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE CIS_ChatWithNPC_ValentineScript
CIS_ChatWithNPC_ValentineScript kmyQuest = GetOwningQuest() as CIS_ChatWithNPC_ValentineScript
;END AUTOCAST
;BEGIN CODE
pChatWithNPCCount_Nick.SetValue(pChatWithNPCCount_Nick.GetValue() + 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pChatWithNPCCount_Nick Auto Const
